from django.shortcuts import render
from django.http import HttpResponse
from .models import *



def index(request):
    laptops = Laptops.objects.all()[0]
    smartphone = Smartphones.objects.all()[0]
    acer_nitro_rgn = Laptops.objects.all()[1]
    oledlg = Tv.objects.all()[0]

    return render(request, 'base.html', {
        'product': laptops,
        'smartphone': smartphone,
        'acer_nitro_rgn': acer_nitro_rgn,
        'oled_lg': oledlg
    })

def pc_notebook(request):
    laptops = Laptops.objects.all()
    pc = Pc.objects.all()

    return render(request, 'notebook.html', {
        'product': laptops,
        'pc': pc
    })

def smartphones(request):
    smartphone = Smartphones.objects.all()
    tablet = Tablet.objects.all()

    return render(request, 'smartphones.html', {
        'smartphone': smartphone,
        'tablet': tablet
    })

def tv(request):
    tv = Tv.objects.all()
    projector =  Projector.objects.all()

    return render(request, 'tv.html', {
        'tv': tv,
        'projector': projector
    })