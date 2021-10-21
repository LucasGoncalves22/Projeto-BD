from django.contrib import admin

# Register your models here.
from bd.models import Carro, Cliente, Acessorio

admin.site.register(Carro)
admin.site.register(Cliente)
admin.site.register(Acessorio)