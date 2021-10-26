from django.shortcuts import render, redirect
from bd.forms import CarroForm
from bd.forms import ClienteForm
from bd.models import Carro
from bd.models import Cliente
from django.forms import DateField
from django.http import HttpResponse
from django.http import HttpResponseRedirect

# Create your views here.
def home(request):
    data = {}
    search = request.GET.get('search')
    if search:
        data['carro'] = Carro.objects.filter(placa__icontains=search)
        data['cliente'] = Cliente.objects.filter(rg__icontains=search)
    else:
        data['carro'] = Carro.objects.all()
        data['cliente'] = Cliente.objects.all()
    return render(request, 'index.html', data)


def form(request):
    data = {}
    data['form'] = CarroForm()
    return render(request, 'form.html', data)


def clienteform(request):
    data = {}
    data['form'] = ClienteForm()
    return render(request, 'formcliente.html', data)


def create(request):
    form = CarroForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('home')


def handle_uploaded_file(f):
    with open('/Projeto_BD/bd/upload' + f.name, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)



def clientecreate(request):
    #clienteform = ClienteForm(request.POST, request.FILES['foto'] or None)
    #print('*', clienteform.errors)

    print('*', request.FILES['foto'].name)
    if request.method == 'POST':
        clienteform = ClienteForm(request.POST, request.FILES or None)
        if clienteform.is_valid():
            handle_uploaded_file(request.FILES['foto'])
            clienteform = clienteform.save(commit=False)
            clienteform.save()
            return HttpResponseRedirect('')
    else:
        clienteform = ClienteForm()
    return render(request, 'index.html', {'clienteform': clienteform})




    #if clienteform.is_valid(): Código Original Rodando
    #    clienteform.save()
    #    return redirect('home')


def view(request, pk):
    data = {}
    data['carro'] = Carro.objects.get(pk=pk)
    return render(request, 'view.html', data)


def clienteview(request, pk):
    data = {}
    data['cliente'] = Cliente.objects.get(pk=pk)
    return render(request, 'clienteview.html', data)


def edit(request, pk):
    data = {}
    data['carro'] = Carro.objects.get(pk=pk)
    data['form'] = CarroForm(instance=data['carro'])
    return render(request, 'form.html', data)


def clienteedit(request, pk):
    data = {}
    data['cliente'] = Cliente.objects.get(pk=pk)
    data['form'] = ClienteForm(instance=data['cliente'])
    return render(request, 'formcliente.html', data)


def update(request, pk):
    data = {}
    data['carro'] = Carro.objects.get(pk=pk)
    form = CarroForm(request.POST or None, instance=data['carro'])
    if request.POST and form.is_valid():
        form.save()
        #print("Saving car", pk)
        return redirect('home')


def clienteupdate(request, pk):
    data = {}
    data['cliente'] = Cliente.objects.get(pk=pk)
    clienteform = ClienteForm(request.POST or None, instance=data['cliente'])
    #print('*', clienteform.errors)
    if request.POST and clienteform.is_valid():
        clienteform.save()
        #print("Saving cliente", pk)
        return redirect('home')


def delete(request, pk):
    carro = Carro.objects.get(pk=pk)
    carro.delete()
    return redirect('home')


def clientedelete(request, pk):
    cliente = Cliente.objects.get(pk=pk)
    cliente.delete()
    return redirect('home')

