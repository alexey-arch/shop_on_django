from django.db import models
from django.contrib.auth import get_user_model
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from django.utils import timezone
from django.db.models import Count
from PIL import Image
from django.urls import reverse
from django.db.models import Q

User = get_user_model()

def get_product_url(obj, viewname ):
    ct_model = obj.__class__._meta.model_name
    return reverse(viewname, kwargs={'ct_model': ct_model, 'slug': obj.slug})


class CategoryManager(models.Manager):

    CATEGORY_NAME_COUNT_NAME = {
        'Ноутбуки': 'laptops__count',
        'Смартфоны': 'smartphones__count',
        'Планшеты': 'tablet__count',
        'Системные блоки': 'pc__count',
        'Телевизоры': 'tv__count',
        'Проекторы и экраны': 'projector__count',
    }
    
    def get_queryset(self):
        return super().get_queryset()

    def get_models_for_count(self, *model_names):
        return [models.Count(model_name) for model_name in model_names]

    def get_categories_for_left_sidebar(self):
        models = self.get_models_for_count('laptops', 'smartphones','tablet', 'pc', 'tv', 'projector')
        qs = list(self.get_queryset().annotate(*models))
        data = [
            dict(name=c.name, url=c.get_url(), count=getattr(c, self.CATEGORY_NAME_COUNT_NAME[c.name]))
            for c in qs
        ]
        return data


class Main_Category(models.Model):
    """
    Модель Главная категория
    """
    name = models.CharField(max_length=250, unique=True, verbose_name='Название')
    slug = models.SlugField(max_length=100, unique=True)
    objects = CategoryManager()

    class Meta:
        verbose_name = 'Главная категория'
        verbose_name_plural = 'Главные категории'

    def __str__(self):
        return self.name


class Category(models.Model):
    """
    Модель Категория
    """
    category = models.ForeignKey(Main_Category, null=True, verbose_name='Категория', on_delete=models.CASCADE)
    name = models.CharField(max_length=250, unique=True, verbose_name='Название')
    slug = models.SlugField(max_length=100, unique=True)
    objects = CategoryManager()

    class Meta:
        verbose_name = 'категория'
        verbose_name_plural = 'Категории'

    def __str__(self):
        return self.name
    
    def get_url(self):
        return reverse('category_detail', kwargs={'slug': self.slug})


class Product(models.Model):
    """
    Абстрактный класс Profuct
    """
    MIN_RESOLUTION = (400, 400)
    MAX_RESOLUTION = (1000, 1000)
    MAX_IMAGE_SIZE = 3145728

    category = models.ForeignKey(Category, null=True, verbose_name='Категория', on_delete=models.CASCADE)
    slug = models.SlugField(max_length=100, unique=True)
    title = models.CharField(max_length=250, verbose_name='Название')
    image = models.ImageField(verbose_name='Картинка', upload_to='media/')
    description = models.TextField(verbose_name='Описание', null=True)
    price = models.DecimalField(max_digits=9, decimal_places=2, verbose_name='Цена')
    stock = models.IntegerField(verbose_name='Количество единиц товара на складе')

    class Meta:
        abstract = True

    def __str__(self):
        return self.title
    
    def save(self):
        super().save()
        img = Image.open(self.image.path)

        if img.height > 300 or img.width > 300:
            output_size = (300, 300)
            img.thumbnail(output_size)
            img.save(self.image.path)
    
    def get_url(self):
        return get_product_url(self, 'product_detail')

    def get_model_name(self):
        return self.__class__._meta.model_name.lower()


class SmartphonesManager(models.Manager):
    use_for_related_fields = True
 
    def search(self, query=None):
        qs = self.get_queryset()
        if query:
            or_lookup = (Q(title__icontains=query) | Q(description__icontains=query))
            qs = qs.filter(or_lookup)
 
        return qs


class Smartphones(Product):
    """
    Модель Смартфоны
    """
    objects = SmartphonesManager()
    diagonal = models.CharField(max_length=200, verbose_name='Диагональ дисплея ')
    screen_resolution = models.CharField(max_length=200, verbose_name='Разрешение экрана')
    system = models.CharField(max_length=200, verbose_name='Операционная система')
    sim_quantity = models.DecimalField(max_digits=2, decimal_places=0, verbose_name='Количество SIM')
    memory_size = models.DecimalField(max_digits=4, decimal_places=0, verbose_name='Обьем встроенной паняти')
    main_camera = models.CharField(max_length=200, verbose_name='Основная камера')
    front_camera = models.CharField(max_length=200, verbose_name='Фрональная камера')
    features = models.CharField(max_length=200, verbose_name='Особености')
    
    class Meta:
        verbose_name = 'Смартфон'
        verbose_name_plural = 'Смартфоны'

    def __str__(self):
        return self.title


class TabletManager(models.Manager):
    use_for_related_fields = True
 
    def search(self, query=None):
        qs = self.get_queryset()
        if query:
            or_lookup = (Q(title__icontains=query) | Q(description__icontains=query))
            qs = qs.filter(or_lookup)
 
        return qs


class Tablet(Product):
    """
    Модель Планшеты
    """
    objects = TabletManager()
    diagonal = models.CharField(max_length=200, verbose_name='Диагональ дисплея ')
    screen_resolution = models.CharField(max_length=200, verbose_name='Разрешение экрана')
    system = models.CharField(max_length=200, verbose_name='Операционная система')
    memory_size = models.DecimalField(max_digits=4, decimal_places=0, verbose_name='Обьем встроенной  паняти')
    main_camera = models.CharField(max_length=200, verbose_name='Основная камера')
    front_camera = models.CharField(max_length=200, verbose_name='Фрональная камера')
    features = models.CharField(max_length=200, verbose_name='Особености')
    
    class Meta:
        verbose_name = 'Планшет'
        verbose_name_plural = 'Планшеты'

    def __str__(self):
        return self.title


class NotebookManager(models.Manager):
    use_for_related_fields = True
 
    def search(self, query=None):
        qs = self.get_queryset()
        if query:
            or_lookup = (Q(title__icontains=query) | Q(description__icontains=query))
            qs = qs.filter(or_lookup)
 
        return qs


class Laptops(Product):
    """
    Модель Планшеты
    """
    objects = NotebookManager()
    class Meta:
        verbose_name = 'Ноутбук'
        verbose_name_plural = 'Ноутбуки'

    diagonal = models.CharField(max_length=200, verbose_name='Диагональ дисплея ')
    screen_resolution = models.CharField(max_length=200, verbose_name='Разрешение экрана')
    videoadapter = models.CharField(max_length=200, verbose_name='Видеоадаптер')
    system = models.CharField(max_length=200, verbose_name='Операционная система')
    cpu = models.CharField(max_length=200, verbose_name='Модель процессора')
    frequency_cpu = models.CharField(max_length=200, verbose_name='Чистота процессора')
    ozu = models.DecimalField(max_digits=5, decimal_places=0, verbose_name='Обьем оперативной памяти')
    disk_type = models.CharField(max_length=200, verbose_name='Тип жесткого диска')
    drive_volume = models.DecimalField(max_digits=5, decimal_places=0, verbose_name='Обьем накопителя')
    video_adapter_chipset = models.DecimalField(max_digits=5, decimal_places=0, verbose_name='Чипсет видеоадаптера')
    video_memory = models.DecimalField(max_digits=5, decimal_places=1, verbose_name='Обьем видеоадаптера')
    features = models.CharField(max_length=200, verbose_name='Особености')
    

    def __str__(self):
        return self.title


class PcManager(models.Manager):
    use_for_related_fields = True
 
    def search(self, query=None):
        qs = self.get_queryset()
        if query:
            or_lookup = (Q(title__icontains=query) | Q(description__icontains=query))
            qs = qs.filter(or_lookup)
 
        return qs


class Pc(Product):
    """
    Модель ПК
    """
    objects = PcManager()
    cpu = models.CharField(max_length=200, verbose_name='Модель процессора')
    number_of_cores = models.DecimalField(max_digits=3, decimal_places=0, verbose_name='Количество ядер')
    frequency_cpu = models.CharField(max_length=200, verbose_name='Чистота процессора')
    ozu = models.DecimalField(max_digits=5, decimal_places=0, verbose_name='Обьем оперативной памяти')
    drive_volume = models.DecimalField(max_digits=5, decimal_places=0, verbose_name='Обьем жесткого диска')
    system = models.CharField(max_length=200, verbose_name='Операционная система')
    video_adapter_chipset = models.DecimalField(max_digits=5, decimal_places=0, verbose_name='Чипсет видеоадаптера')
    videoadapter = models.CharField(max_length=200, verbose_name='Видеоадаптер')
    video_memory = models.DecimalField(max_digits=5, decimal_places=0, verbose_name='Обьем видеоадаптера')
    features = models.CharField(max_length=200, verbose_name='Особености')
    
    class Meta:
        verbose_name = 'Персональный компьютер'
        verbose_name_plural = 'Персональные компьютеры'

    def __str__(self):
        return self.title


class TvManager(models.Manager):
    use_for_related_fields = True
 
    def search(self, query=None):
        qs = self.get_queryset()
        if query:
            or_lookup = (Q(title__icontains=query) | Q(description__icontains=query))
            qs = qs.filter(or_lookup)
 
        return qs


class Tv(Product):
    """
    Модель ТВ
    """
    objects = TvManager()
    class Meta:
        verbose_name = 'Телевизор'
        verbose_name_plural = 'Телевизоры'

    diagonal = models.CharField(max_length=200, verbose_name='Диагональ дисплея ')
    screen_resolution = models.CharField(max_length=200, verbose_name='Разрешение экрана')
    technology = models.CharField(max_length=250, verbose_name='Технология')
    features = models.CharField(max_length=200, verbose_name='Особености')
    smart_tv = models.BooleanField(default=False, verbose_name='Smart TV') 
    hdr = models.BooleanField(default=False, verbose_name='HDR') 
    wi_fi = models.BooleanField(default=False, verbose_name='WI_FI') 

    def __str__(self):
        return self.title


class ProjectorManager(models.Manager):
    use_for_related_fields = True
 
    def search(self, query=None):
        qs = self.get_queryset()
        if query:
            or_lookup = (Q(title__icontains=query) | Q(description__icontains=query))
            qs = qs.filter(or_lookup)
 
        return qs


class Projector(Product):
    """
    Модель Проекторы
    """
    objects = ProjectorManager()
    class Meta:
        verbose_name = 'Проектор'
        verbose_name_plural = 'Проекторы'

    screen_resolution = models.CharField(max_length=200, verbose_name='Разрешение экрана')
    max_screen_resolution = models.CharField(max_length=200, verbose_name='Максимальное разрешение экрана ')
    three_d = models.BooleanField(default=False, verbose_name='Поддержка 3D')
    Max_projection_distance = models.DecimalField(max_digits=3, decimal_places=0, verbose_name='Максимальное проекционное расстояние') 
    min_projection_distance = models.DecimalField(max_digits=3, decimal_places=0, verbose_name='Минимальное проекционное расстояние')  
    features = models.CharField(max_length=200, verbose_name='Особености')

    def __str__(self):
        return self.title



class Cart(models.Model):
    class Meta:
        verbose_name = 'корзина'
        verbose_name_plural = 'Корзины'

    owner = models.ForeignKey('Customer', verbose_name='Покупатель', on_delete=models.CASCADE, null=True)
    products = models.ManyToManyField('CartProduct', blank=True)
    total_products = models.PositiveIntegerField(default=0)
    in_order = models.BooleanField(default=False)
    for_anonymoys_user= models.BooleanField(verbose_name = 'сделать заказ анонимно', default=False)
    final_price = models.DecimalField(max_digits=9, decimal_places=2, verbose_name='Цена', default=0)

    def __str__(self):
        return str(self.id)  


class CartProduct(models.Model):
    class Meta:
        verbose_name = 'продукт корзины'
        verbose_name_plural = 'Продукты корзин'

    user = models.ForeignKey('Customer', verbose_name='Покупатель', on_delete=models.CASCADE)
    cart_fk = models.ForeignKey('Cart', verbose_name='Корзина', on_delete=models.CASCADE)
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')
    quantity = models.PositiveIntegerField(default=1, verbose_name='Количество')
    price = models.DecimalField(max_digits=9, decimal_places=2, verbose_name='Цена', default=0)

    def __str__(self):
        return "Продукт: {} (для корзины)".format(self.content_object.title)

    def save(self, *args, **kwargs):
        self.price = self.quantity * self.content_object.price
        super().save(*args, **kwargs)


class Customer(models.Model):
    class Meta:
        verbose_name = 'пользователь'
        verbose_name_plural = 'Пользователи'
    
    user = models.ForeignKey(User, verbose_name='Пользователь', on_delete=models.CASCADE )
    phone = models.CharField(max_length=20, verbose_name='Номер телефона', null=True, blank=True)
    address = models.CharField(max_length=255, verbose_name='Адрес',null=True, blank=True)
    orders = models.ManyToManyField('Order', verbose_name='Заказы пользователя', related_name='orders', blank=True)

    def __str__(self):
        return 'Покупатель %s %s' % (self.user.first_name, self.user.last_name)


class Order(models.Model):
    class Meta:
        verbose_name = 'заказ'
        verbose_name_plural = 'Заказы'

    STATUS_DEFAULT = 'new'
    STATUS_IN_PROGRESS = 'in_progress'
    STATUS_READY = 'ready'
    STATUS_COMPLETED = 'completed'

    BUYING_TYPE_SELF= 'self'
    BUYING_TYPE_DELIVERY = 'delivery'

    STATUS_CHOICES = (
        (STATUS_DEFAULT, 'Новый'),
        (STATUS_IN_PROGRESS, 'В обработке'),
        (STATUS_READY, 'В пути'),
        (STATUS_COMPLETED, 'Выполнен')
    )

    DELIVERY_TYPE_DEFAULT = 'self'
    DELIVERY_TYPE_DELIVERY = 'delivery'

    DELIVERY_TYPE_CHOICES = (
        (DELIVERY_TYPE_DEFAULT, 'Самовывоз'), 
        (DELIVERY_TYPE_DELIVERY, 'Доставка'), 
    )

    customer = models.ForeignKey('Customer', verbose_name='Покупатель', on_delete=models.CASCADE)

    first_name = models.CharField(max_length=255, verbose_name='Имя')
    last_name = models.CharField(max_length=255, verbose_name='Фамилия')
    phone = models.CharField(max_length=20, verbose_name='Номер телефона', null=True, blank=True)
    address = models.CharField(max_length=255, verbose_name='Адрес', null=True, blank=True)

    cart = models.ForeignKey(Cart, verbose_name='Корзина', on_delete=models.CASCADE, null=True, blank=True)
    coment = models.TextField(verbose_name='коментарий', blank=True)

    cart = models.ForeignKey('Cart', verbose_name='Корзина', on_delete=models.CASCADE, null=True, blank=True)
    status = models.CharField(max_length=150, verbose_name='Статус заказа', choices=STATUS_CHOICES, default=STATUS_DEFAULT)
    buying_type = models.CharField(max_length=100, verbose_name='Тип доставки', choices=DELIVERY_TYPE_CHOICES, default=DELIVERY_TYPE_DEFAULT)

    creation_date = models.DateTimeField(auto_now=True, verbose_name='Дата создания')
    order_date = models.DateTimeField(default=timezone.now, verbose_name='Дата получения')

    def __str__(self):
        return 'Заказ №%d' % (self.id)


class LatestProductsManager:

    @staticmethod
    def get_products_for_main_page(*args, **kwargs):
        with_respect_to = kwargs.get('with_respect_to')
        count = kwargs.get('with_respect_to')

        products = list()

        ct_models = ContentType.objects.filter(model__in=args)

        for ct_model in ct_models:

            model_products = ct_model.model_class()._base_manager.all().order_by('-id')
            products.extend(model_products)

        if with_respect_to and with_respect_to in args:
            ct_models = ContentType.objects.filter(model=with_respect_to)
            if ct_models.exists():
                products = sorted(
                    products, 
                    key=lambda x: x.__class__._meta.model_name.startswith(with_respect_to), reverse=True
                )

        return products


class LatestProducts:
    objects = LatestProductsManager()