from django.shortcuts import render
from bd.forms import CarroForm
from bd.forms import ClasseForm
from bd.forms import ModificadoForm
from bd.forms import NormalForm
from bd.forms import AcessoriosForm

# Create your views here.
def home(request):
    return render(request, 'index.html')


def form(request):
    data = {}
    data['form'] = CarroForm()
    return render(request, 'form.html', data)
