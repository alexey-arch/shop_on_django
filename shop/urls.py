from django.urls import path
from .views import *
urlpatterns = [
    path('', index),
    path('pc_notebook/', pc_notebook, name='notebook.html'),
    path('smartphones/', smartphones, name='smartphones.html'),
    path('tv/', tv, name='tv.html'),
]