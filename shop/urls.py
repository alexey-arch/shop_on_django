from django.urls import path
from .views import *

urlpatterns = [
    path('', index, name='index'),
    path('products/<str:ct_model>/<str:slug>/', ProductDetailViews.as_view(), name='product_detail')
]