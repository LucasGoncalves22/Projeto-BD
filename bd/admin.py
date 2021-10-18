from django.contrib import admin

# Register your models here.
from bd.models import Carro, Classe, Modificado, Normal, Acessorios

admin.site.register(Carro)
admin.site.register(Classe)
admin.site.register(Modificado)
admin.site.register(Normal)
admin.site.register(Acessorios)