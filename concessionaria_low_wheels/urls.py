"""concessionaria_low_wheels URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from bd.views import home

from django.contrib import admin
from django.urls import path
from bd.views import home, form, clienteform, create, clientecreate, view, clienteview, edit, clienteedit, update, clienteupdate

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home, name='home'),
    path('form/', form, name='form'),
    path('cliente/', clienteform, name='clienteform'),
    path('create/', create, name='create'),
    path('clientecreate/', clientecreate, name='clientecreate'),
    path('view/<str:pk>/', view, name='view'),
    path('clienteview/<str:pk>/', clienteview, name='clienteview'),
    path('edit/<str:pk>/', edit, name='edit'),
    path('clienteedit/<str:pk>/', clienteedit, name='clienteedit'),
    path('update/<str:pk>/', update, name='update'),
    path('clienteupdate/<str:pk>/', clienteupdate, name='clienteupdate'),
]
