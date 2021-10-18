from django.db import models

# Create your models here.
class Carro(models.Model):
    placa = models.CharField(primary_key=True, max_length=7)
    cor = models.CharField(max_length=45)
    ano_fabricacao = models.IntegerField()
    modelo = models.CharField(max_length=20)
    ano_modelo = models.IntegerField()
    classe = models.ForeignKey('Classe', on_delete=models.CASCADE)
    acessorios = models.ForeignKey('Acessorios', on_delete=models.CASCADE)

class Classe(models.Model):
    idclasse = models.IntegerField(primary_key=True)
    nome = models.CharField(max_length=45)

    def __str__(self):
        return self.nome

class Modificado(models.Model):
    com_acessorios = models.CharField(primary_key=True, max_length=45)
    nome_veiculo = models.CharField(max_length=45)


class Normal(models.Model):
    sem_acessorios = models.CharField(primary_key=True, max_length=45)
    nome_veiculo = models.CharField(max_length=45)


class Acessorios(models.Model):
    codigo_acessorio = models.IntegerField(primary_key=True)
    volante = models.CharField(max_length=45)
    para_choque = models.CharField(max_length=45)
    plotagem = models.CharField(max_length=45)
    estilo_roda = models.CharField(max_length=45)
    tipo_mola = models.CharField(max_length=45)
    tamanho_roda = models.CharField(max_length=45)
    tipo_suspensao = models.CharField(max_length=45)
    escapamento = models.CharField(max_length=45)

    def __str__(self):
        return self.codigo_acessorio


