from .models import *
from django.views.generic.detail import SingleObjectMixin


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


