from .models import *
from django.views.generic.detail import SingleObjectMixin
from django.views.generic import View


class CategoryDetailMixin(SingleObjectMixin):

    CATEGORY_SLUG_TO_PRODUCT_MODEL = {
        'laptops': Laptops, 
        'smartphones': Smartphones,
        'tv': Tv,
        'tables': Tablet,
        'pc': Pc,
        'projectors': Projector
    }

    def get_context_data(self, **kwargs):
        if isinstance(self.get_object(), Category):
            model = self.CATEGORY_SLUG_TO_PRODUCT_MODEL[self.get_object().slug]
            context = super().get_context_data(**kwargs)
            context['categories'] = Category.objects.get_categories_for_left_sidebar()
            context['category_products'] = model.objects.all()
            return context
        else:
            context = super().get_context_data(**kwargs)
            context['categories'] = Category.objects.get_categories_for_left_sidebar()
            return context


class CartMixin(View):

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            customer = Customer.objects.filter(user=request.user).first()
            if not customer:
                customer = Customer.objects.create(user=request.user)

            self.cart = Cart.objects.filter(owner=customer, in_order=False).first()
            if not self.cart:
                self.cart = Cart.objects.create(owner=customer)
        else:
            self.cart = Cart.objects.filter(for_anonymoys_user=True).first()
            if not self.cart:
                self.cart = Cart.objects.create(for_anonymouys_user=True)
                
        return super().dispatch(request, *args, **kwargs)
