from django import template
from django.utils.safestring import mark_safe
from shop.models import *

register = template.Library()

TABLE_HEAD = """<table class="table">
    <tbody>"""

TABLE_ITEM = """        <tr>
            <td>{name}</td>
            <td>{value}</td>
        </tr>"""

TABLE_TAIL = """    </tbody>
</table>"""

PRODUCT_SPEC = {
    'laptops': {
        'Диагональ': 'diagonal',
        'Разрешение экрана': 'screen_resolution',
        'Видеоадаптер': 'videoadapter',
        'Операционная система': 'system',
        'Модель процессора': 'cpu',
        'Чистота процессора': 'frequency_cpu',
        'Обьем оперативной памяти': 'ozu',
        'Тип жесткого диска': 'disk_type',
        'Обьем накопителя': 'drive_volume',
        'Чипсет видеоадаптера': 'video_adapter_chipset',
        'Обьем видеоадаптера': 'video_memory',
        'Особености': 'features'
    },
    'pc': {
        'Модель процессора': 'cpu',
        'Количество ядер': 'number_of_cores',
        'Чистота процессора': 'frequency_cpu',
        'Обьем оперативной памяти': 'ozu',
        'Обьем жесткого диска': 'drive_volume',
        'Операционная система': 'system',
        'Чипсет видеоадаптера': 'video_adapter_chipset',
        'Видеоадаптер': 'videoadapter',
        'Обьем видеоадаптера': 'video_memory',
        'Особености': 'features'
    },
    'smartphones': {
        'Диагональ дисплея': 'diagonal',
        'Разрешение экрана': 'screen_resolution',
        'Операционная система': 'system',
        'Оперативная память': 'sim_quantity',
        'Обьем встроенной паняти': 'memory_size',
        'Основная камера': 'main_camera',
        'Фрональная камера': 'front_camera',
        'Особености': 'features' 
    },
    'tablet': {
        'Диагональ дисплея': 'diagonal',
        'Разрешение экрана': 'screen_resolution',
        'Операционная система': 'system',
        'Обьем встроенной паняти': 'memory_size',
        'Основная камера': 'main_camera',
        'Фрональная камера': 'front_camera',
        'Особености': 'features' 
    },
    'tv': {
        'Диагональ дисплея': 'diagonal',
        'Разрешение экрана': 'screen_resolution',
        'Технология': 'technology',
        'Особености': 'features',
        'Smart TV': 'smart_tv',
        'HDR': 'hdr',
        'WI_FI': 'wi_fi'
    },
    'projector': {
        'Разрешение экрана': 'screen_resolution',
        'Максимальное разрешение экрана': 'max_screen_resolution',
        'Поддержка 3D': 'three_d',
        'Максимальное проекционное расстояние': 'Max_projection_distance',
        'Минимальное проекционное расстояние': 'min_projection_distance',
        'Особености': 'features'
    }
}

@register.filter
def product_specifications(product):
    model_name = product.__class__._meta.model_name


    table_content = ''

    for name, value in PRODUCT_SPEC[model_name].items():
        table_content += TABLE_ITEM.format(name=name, value=getattr(product, value))

    return mark_safe(TABLE_HEAD + table_content + TABLE_TAIL)