from django.shortcuts import render
from django.http import HttpResponse
from django.views.generic import DetailView
from .models import *



def index(request):
    laptops = Laptops.objects.all()[0]
    smartphone = Smartphones.objects.all()[0]
    acer_nitro_rgn = Laptops.objects.all()[1]
    oledlg = Tv.objects.all()[0]
    pc_acer_nitro = Pc.objects.all()[0]
    table_samsung = Tablet.objects.all()[0]

    return render(request, 'base.html', {
        'product': laptops,
        'smartphone': smartphone,
        'acer_nitro_rgn': acer_nitro_rgn,
        'oled_lg': oledlg,
        'pc_acer_nitro': pc_acer_nitro,
        'table_samsung': table_samsung
    })

class ProductDetailViews(DetailView):
    CT_MODEL_MODEL_CLASS = {
        'notebook': Laptops,
        'smartphone': Smartphones,
        'tables': Tablet,
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