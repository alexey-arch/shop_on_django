from django.contrib import admin
from shop.models import *
from django.forms import ModelChoiceField, ModelForm, ValidationError
from PIL import Image

class SmartphonesAdminFrom(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['image'].help_text = 'Минимальное разрешение {}x{}px'.format(*Product.MIN_RESOLUTION)

    def clean_image(self):
        image = Image.open(self.cleaned_data['image'])
        
        min_height, min_width = Product.MIN_RESOLUTION
        max_height, max_width = Product.MAX_RESOLUTION

        if self.cleaned_data['image'].size > Product.MAX_IMAGE_SIZE:
            raise ValidationError('Размер изображения превышает 3 МБ!')

        if image.height < min_height or image.width < min_width:
            raise ValidationError('Разрешение изображения меньше минимального!')
        
        if image.height > max_height or image.width > max_width:
            raise ValidationError('Разрешение изображения больше максимального!')
        
        return self.cleaned_data['image']


class SmartphonesAdmin(admin.ModelAdmin):
    """
    Поиск смартфонов
    """
    list_display = ("title", "category", 'price')
    list_display_links = ('title', 'price')
    search_fields = ('title', 'price')
    
    form = SmartphonesAdminFrom

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        print(db_field)
        if db_field.name == 'category':
            return ModelChoiceField(Category.objects.filter(slug='smartphones'), label='Категория') 
        return super().formfield_for_foreignkey(db_field, request, **kwargs)


class LaptopsAdminFrom(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['image'].help_text = 'Минимальное разрешение {}x{}px'.format(*Product.MIN_RESOLUTION)

    def clean_image(self):
        image = Image.open(self.cleaned_data['image'])
        
        min_height, min_width = Product.MIN_RESOLUTION
        max_height, max_width = Product.MAX_RESOLUTION

        if self.cleaned_data['image'].size > Product.MAX_IMAGE_SIZE:
            raise ValidationError('Размер изображения превышает 3 МБ!')

        if image.height < min_height or image.width < min_width:
            raise ValidationError('Разрешение изображения меньше минимального!')
        
        if image.height > max_height or image.width > max_width:
            raise ValidationError('Разрешение изображения больше максимального!')
        
        return self.cleaned_data['image']



class LaptopsAdmin(admin.ModelAdmin):
    """
    Поиск Ноутбуков
    """
    list_display = ("title", "category", 'price')
    list_display_links = ('title', 'price')
    search_fields = ('title', 'price')

    form = LaptopsAdminFrom

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        print(db_field)
        if db_field.name == 'category':
            return ModelChoiceField(Category.objects.filter(slug='laptops'), label='Категория') 
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

class PcAdmin(admin.ModelAdmin):
    """
    Поиск Компьютеров
    """
    list_display = ("title", "category", 'price')
    list_display_links = ('title', 'price')
    search_fields = ('title', 'price')
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        print(db_field)
        if db_field.name == 'category':
            return ModelChoiceField(Category.objects.filter(slug='pc'), label='Категория') 
        return super().formfield_for_foreignkey(db_field, request, **kwargs)


class TabletAdmin(admin.ModelAdmin):
    """
    Поиск Планшетов
    """
    list_display = ("title", "category", 'price')
    list_display_links = ('title', 'price')
    search_fields = ('title', 'price')
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        print(db_field)
        if db_field.name == 'category':
            return ModelChoiceField(Category.objects.filter(slug='tables'), label='Категория') 
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

class TvAdmin(admin.ModelAdmin):
    """
    Поиск ТВ
    """
    list_display = ("title", "category", 'price')
    list_display_links = ('title', 'price')
    search_fields = ('title', 'price')
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        print(db_field)
        if db_field.name == 'category':
            return ModelChoiceField(Category.objects.filter(slug='tv'), label='Категория') 
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

class ProjectorAdmin(admin.ModelAdmin):
    """
    Поиск Проекторов
    """
    list_display = ("title", "category", 'price')
    list_display_links = ('title', 'price')
    search_fields = ('title', 'price')
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        print(db_field)
        if db_field.name == 'category':
            return ModelChoiceField(Category.objects.filter(slug='projectors'), label='Категория') 
        return super().formfield_for_foreignkey(db_field, request, **kwargs)


admin.site.register(Main_Category)
admin.site.register(Category)

admin.site.register(Smartphones, SmartphonesAdmin)
admin.site.register(Laptops, LaptopsAdmin)
admin.site.register(Pc, PcAdmin)
admin.site.register(Tablet, TabletAdmin)
admin.site.register(Tv, TvAdmin)
admin.site.register(Projector, ProjectorAdmin)

admin.site.register(Cart)
admin.site.register(CartProduct)
admin.site.register(Order)
admin.site.register(Customer)