from django.forms import ModelForm
from django import forms
from bd.models import Carro
from bd.models import Cliente
from bd.models import Acessorio
from django.forms import DateField

# Create the form class.
class CarroForm(ModelForm):
   class Meta:
       model = Carro
       fields = ['placa', 'cor', 'ano_fabricacao', 'modelo', 'ano_modelo', 'cliente', 'acessorios']

   acessorios = forms.ModelMultipleChoiceField(
        queryset=Acessorio.objects.all(),
        widget=forms.CheckboxSelectMultiple
   )

class ClienteForm(ModelForm):
    data_nascimento = DateField(input_formats=['%Y-%m-%d'])
    class Meta:
       model = Cliente
       fields = '__all__'

class AcessorioForm(ModelForm):
   class Meta:
       model = Acessorio
       fields = '__all__'







