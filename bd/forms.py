from django.forms import ModelForm
from bd.models import Carro
from bd.models import Classe
from bd.models import Modificado
from bd.models import Normal
from bd.models import Acessorios

# Create the form class.
class CarroForm(ModelForm):
   class Meta:
       model = Carro
       fields = ['placa', 'cor', 'ano_fabricacao', 'modelo', 'ano_modelo', 'classe', 'acessorios']


class ClasseForm(ModelForm):
   class Meta:
       model = Classe
       fields = ['idclasse', 'nome']


class ModificadoForm(ModelForm):
   class Meta:
       model = Modificado
       fields = ['com_acessorios', 'nome_veiculo']


class NormalForm(ModelForm):
   class Meta:
       model = Normal
       fields = ['sem_acessorios', 'nome_veiculo']


class AcessoriosForm(ModelForm):
   class Meta:
       model = Acessorios
       fields = ['codigo_acessorio', 'volante', 'para_choque', 'plotagem', 'estilo_roda', 'tipo_mola', 'tamanho_roda', 'tipo_suspensao', 'escapamento']
