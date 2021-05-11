from django.urls import path
from .views import *

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('products/<str:ct_model>/<str:slug>/', ProductDetailViews.as_view(), name='product_detail'),
    path('category/<str:slug>/', CategoryDetailView.as_view(), name='category_detail'),
    path('cart/', CartViews.as_view(), name='cart'),
    path('add-to-cart/<str:ct_model>/<str:slug>/', AddToCart.as_view(), name='add_to_cart' )
]