from django.db import transaction
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render
from django.contrib.contenttypes.models import ContentType
from django.http import HttpResponseRedirect
from django.views.generic import DetailView, View
from .models import *
from .mixins import CategoryDetailMixin, CartMixin
from django.contrib import messages
from .forms import OrderForms
from .utils import recalc_cart
from itertools import chain

class IndexView(CartMixin, View):
    def get(self, request, *args, **kwargs):
        context = {
            'categories': Category.objects.get_categories_for_left_sidebar(), 
            'products': LatestProducts.objects.get_products_for_main_page('tables', 'laptops', 'smartphones', 'pc', 'tv', 'projectors', with_respect_to='notebook'),
            'cart': self.cart
        }
        return render(request, 'base.html', context)


class ProductDetailViews(CartMixin, CategoryDetailMixin, DetailView):
    CT_MODEL_MODEL_CLASS = {
        'laptops': Laptops,
        'smartphones': Smartphones,
        'tablet': Tablet,
        'pc': Pc,
        'tv': Tv,
        'projector': Projector
    }

    def dispatch(self, request, *args, **kwargs):
        self.model = self.CT_MODEL_MODEL_CLASS[kwargs['ct_model']]
        self.queryset = self.model._base_manager.all()
        return super().dispatch(request, *args, **kwargs)


    context_object_name = 'product'
    template_name = 'product_detail.html'
    slug_url_kwarg = 'slug'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['ct_model'] = self.model._meta.model_name
        context['cart'] = self.cart
        return context


class CategoryDetailView(CartMixin, CategoryDetailMixin, DetailView):

    model = Category
    queryset = Category.objects.all()
    context_object_name = 'category'
    template_name = 'category_detail.html'
    slug_url_kwarg = 'slug'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['cart'] = self.cart
        return context


class CartViews(CartMixin, View):

    def get(self, request, *args, **kwargs):
        categories = Category.objects.get_categories_for_left_sidebar()
        context = {
            'cart': self.cart,
            'categories': categories
        }
        return render(request, 'cart.html', context)


class AddToCart(CartMixin, View):
    def get(self, request, *args, **kwargs):
        ct_model, product_slug = kwargs.get('ct_model'), kwargs.get('slug')
        customer = Customer.objects.get(user=request.user)
        cart = Cart.objects.get(owner=customer, in_order=False)
        content_type = ContentType.objects.get(model=ct_model)
        product = content_type.model_class().objects.get(slug=product_slug)
        product_id = product.id

        cart_product, created = CartProduct.objects.get_or_create(
            user=self.cart.owner, cart_fk=self.cart, content_type=content_type, object_id=product.id
        )
        if created:
            self.cart.products.add(cart_product)

        recalc_cart(self.cart)

        messages.add_message(request, messages.INFO, 'Товар успешно добавлен!')
        return HttpResponseRedirect ('/cart/')


class DeleteFromCartView(CartMixin, View):
    def get(self, request, *args, **kwargs):
        ct_model, product_slug = kwargs.get('ct_model'), kwargs.get('slug')
        content_type = ContentType.objects.get(model=ct_model)
        product = content_type.model_class().objects.get(slug=product_slug)
        cart_product = CartProduct.objects.get(
            user=self.cart.owner, cart_fk=self.cart, content_type=content_type, object_id=product.id
        )
        self.cart.products.remove(cart_product)
        cart_product.delete()
        recalc_cart(self.cart)
        messages.add_message(request, messages.INFO, 'Товар успешно удален!')
        return HttpResponseRedirect ('/cart/')


class ChangeQuantityView(CartMixin, View):
    def post(self, request, *args, **kwargs):
        ct_model, product_slug = kwargs.get('ct_model'), kwargs.get('slug')
        content_type = ContentType.objects.get(model=ct_model)
        product = content_type.model_class().objects.get(slug=product_slug)
        cart_product = CartProduct.objects.get(
            user=self.cart.owner, cart_fk=self.cart, content_type=content_type, object_id=product.id
        )
        qty = int(request.POST.get('qty'))
        cart_product.quantity = qty
        cart_product.save()
        recalc_cart(self.cart)
        messages.add_message(request, messages.INFO, 'Количество товара успешно изменено!')
        return HttpResponseRedirect ('/cart/')

class CheckoutView(CartMixin, View):
    
    def get(self, request, *args, **kwargs):
        categories = Category.objects.get_categories_for_left_sidebar()
        form = OrderForms(request.POST or None)
        context = {
            'cart':  self.cart,
            'categories': categories,
            'form': form
        }
        return render(request, 'checkout.html', context)


class MakeOrderView(CartMixin, View):

    @transaction.atomic
    def post(self, request, *args, **kwargs):
        form = OrderForms(request.POST or None)
        customer = Customer.objects.get(user=request.user)
        if form.is_valid():
            new_order = form.save(commit=False)
            new_order.customer = customer
            new_order.first_name = form.cleaned_data['first_name']
            new_order.last_name = form.cleaned_data['last_name']
            new_order.phone = form.cleaned_data['phone']
            new_order.address = form.cleaned_data['address']
            new_order.buying_type = form.cleaned_data['buying_type']
            new_order.order_date = form.cleaned_data['order_date']
            new_order.coment = form.cleaned_data['coment']
            new_order.save()
            self.cart.in_order = True
            self.cart.save()
            new_order.cart = self.cart
            new_order.save()
            customer.orders.add(new_order)
            messages.add_message(request, messages.INFO, "Спасибо за заказ!")
            return HttpResponseRedirect('/')

        return HttpResponseRedirect('/checkout/')


class SearchView(CartMixin, CategoryDetailMixin, View):
    
    def get(self, request, *args, **kwargs):
        
        categories = Category.objects.get_categories_for_left_sidebar()

        search_query = request.GET.get('search')
        
        context = {}
        if search_query:
            query_sets = []

            query_sets.append(Smartphones.objects.search(query=search_query))
            query_sets.append(Laptops.objects.search(query=search_query))
            query_sets.append(Pc.objects.search(query=search_query))
            query_sets.append(Tv.objects.search(query=search_query))
            query_sets.append(Tablet.objects.search(query=search_query))
            query_sets.append(Projector.objects.search(query=search_query))

            final_set = list(chain(*query_sets))
            final_set.sort(key=lambda x: x.id, reverse=True)
            
            context['categories'] = categories
            context['last_question'] =  search_query

            current_page = Paginator(final_set,10)

            page = request.GET.get('')
            context['object_list'] = search_query
            try:
                context['object_list'] = current_page.page(page)
            except PageNotAnInteger:
                context['object_list'] = current_page.page(1)
            except EmptyPage:
                context['object_list'] = current_page.page(current_page.num_pages)
        categories = Category.objects.get_categories_for_left_sidebar()
        
        return render(request, 'search.html', context)