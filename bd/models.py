from django.db import models

# Create your models here.
class Cliente(models.Model):
    rg = models.CharField(primary_key=True, max_length=15)
    endereco = models.CharField(max_length=100)
    data_nascimento = models.DateField()
    estado_civil = models.CharField(max_length=20)
    idade = models.IntegerField()
    sexo = models.CharField(max_length=45)
    nome_completo = models.CharField(max_length=65)
    cep = models.CharField(max_length=15)
    foto = models.FileField()

    def __str__(self):
        return self.nome_completo


class Acessorio(models.Model):
    codigo_acessorio = models.IntegerField(primary_key=True)
    nome_acessorio = models.CharField(max_length=300)

    def __str__(self):
        return self.nome_acessorio

class Carro(models.Model):
    placa = models.CharField(primary_key=True, max_length=8)
    cor = models.CharField(max_length=45)
    ano_fabricacao = models.IntegerField()
    modelo = models.CharField(max_length=20)
    ano_modelo = models.IntegerField()
    cliente = models.ForeignKey('Cliente', on_delete=models.CASCADE)
    acessorios = models.ManyToManyField(Acessorio)



