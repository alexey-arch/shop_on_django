from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.views.generic import DetailView, View
from .models import *
from .mixins import CategoryDetailMixin

class IndexView(View):
    def get(self, request, *args, **kwargs):

        context = {
            'categories': Category.objects.get_categories_for_left_sidebar(), 
            'products': LatestProducts.objects.get_products_for_main_page('tables', 'laptops', 'smartphones', 'pc', 'tv', 'projectors', with_respect_to='notebook'),
        }
        return render(request, 'base.html', context)


class ProductDetailViews(CategoryDetailMixin, DetailView):
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


class CategoryDetailView(CategoryDetailMixin, DetailView):

    model = Category
    queryset = Category.objects.all()
    context_object_name = 'category'
    template_name = 'category_detail.html'
    slug_url_kwarg = 'slug'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


class CartViews(View):
    
    def get(self, request, *args, **kwargs):
        customer = Customer.objects.get(user=request.user)
        cart = Cart.objects.get(owner=customer)
        categories = Category.objects.get_categories_for_left_sidebar()
        context = {
            'cart': cart,
            'categories': categories
        }
        
        return render(request, 'cart.html', context)

