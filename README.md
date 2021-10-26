# Projeto-BD

# Concessionária Low Wheels
O Python tem que estar na versão 3.9.7 ou na versão 3.9.6 para rodar o Projeto de BD que é a Concessionária Low Wheels onde tem carros normais e modificados!!

O link para fazer o download do Python 3.9.7 é https://www.python.org/downloads/release/python-397/

O link para fazer o download do Python 3.9.6 é https://www.python.org/downloads/release/python-396/


# Execução do Projeto

Abrir o prompt de comando do seu sistema operacional e digitar **python manage.py runserver**, logo após, vai aparecer para instalar o pip install django, mas também, o prompt vai apresentar o comando que você vai ter que digitar para dar prosseguimento a execução do projeto de bd, digite o mesmo e aperte enter. Ademais, vai aparecer o **warning** dizendo a versão que você está do django!


**WAMPSERVER 64**

O **WampServer 64** é onde o banco de dados está hospedado!!


O link para o download confiável do próprio site do **Wampserver 64**: https://wampserver.br.uptodown.com/windows 


Caso tenha dúvidas na instalação do **WampServer 64** acompanha um tutorial, **Lembre-se para rodar o projeto a versão do MYSQL tem que ser a 8.0.21** : https://www.youtube.com/watch?v=QXVyCunZN2s


Após a instalação do **WampServer 64** tem que verificar se todos os serviços estão funcionando o ícone ficará **VERDE**.


Acesse o browser é coloque o seguinte link: http://localhost/phpmyadmin/  depois, no utilizador deve estar escrito como **"root"** para dar prosseguimento a execução do projeto e assim você aperta em executar. Além disso, vai aparcer a tela do **phpmyadmin** onde contém os bancos de dados nesse caso, só precisa importar o arquivo, mas, antes disso (tem que clicar em importar no site e selecionar o **arquivo MYSQL do projeto "Concessionária Low Wheels - MySQL"**) que já está no seu diretório do projeto.

# Já na parte da execução propriamente dita, você tem que abrir o prompt de comando na pasta do projeto para rodar o mesmo, e digitar pip install  mysqlclient-1.4.6-cp39-cp39-win_amd64.whl para fazer a instalação do mysqlcliente que integra o phpmyadmin ao CRUD.

Depois do passo acima você irá executar o comando **python manage.py makemigrations** para importar da **camada de persistência as tabelas Cliente, Acessório e Carro** integrando-se tanto ao CRUD quanto ao WampServer 64, o principal comando vem agora **python manage.py migrate** onde aplica as migrações das tabelas **CRUD** ao banco de dados
**phpmyadmin**.

**Por fim você executa novamente o comando python manage.py runserver e digita no browser o link gerado desse comando para ter acesso a interface do sistema CRUD onde liga a camada de persistência ao Banco de Dados hospedado no WampServer, e dentro desse link do runserver você consegue fazer todas as operações do CRUD**.

# Pontos Importantes


Os acessórios só podem ser colocados pelos administradores, por conta que um cliente pode colocar acessórios o qual não são considerados modificações em um carro.

**Para você adicionar no phpmyadmin vai precisar executar esse comando SQL, selecionando o banco de dados (concessionaria_low_wheels e depois bd_acessorios o último passo é clicar em SQL e rodar esse insert pronto **INSERT INTO bd_acessorio (codigo_acessorio, nome_acessorio) VALUES ('1', 'Volante'), ('2', 'Para-Choque'), ('3', 'Plotagem'), ('4', 'Body Kit'), ('5', 'Mola Esportiva');** ) e depois disso clica no últomo  executar que tiver na tela, por fim, os acessórios vão estar inseridos no **CRUD** para a realização do **Cadastro de Veículos****.
