from django.db import models


def recalc_cart(cart):
    cart_data = cart.products.aggregate(models.Sum('price'), models.Count('id'))
    if cart_data.get('price__sum'):
        cart.final_price = cart_data['price__sum']
    else:
        cart.final_price = 0
    cart.total_products = cart_data['id__count']
    cart.save()
