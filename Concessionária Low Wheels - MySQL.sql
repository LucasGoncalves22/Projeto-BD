create database concessionaria_low_wheels;
use concessionaria_low_wheels;

create table cliente(
rg varchar(15) primary key,
endereco varchar(100) not null,
data_nascimento DATE not null,
estado_civil varchar(20) not null,
idade int not null,
sexo varchar(45) not null,
nome_completo varchar(65) not null,
cep varchar(15) not null,
foto Blob
);

create table carro(
placa varchar(8) primary key,
cor varchar(45) not null,
ano_fabricacao int not null,
modelo varchar(20) not null,
ano_modelo int not null,
Rg varchar(15) not null,
foreign key (Rg) references cliente (rg)
);


create table telefone(
telefone varchar(15) not null,
Rg varchar(15) not null,
foreign key (Rg) references cliente (rg)
);

create view cliente_da_view as select * from telefone ;
alter view  cliente_da_view as select * from telefone order by telefone;

create table orcamento(
servico_efetuado varchar(500) not null,
descricao varchar(500) not null,
quantidade int not null,
formas_de_pagamento varchar(45) not null,
valor_pecas varchar(20) not null,
valor_mao_de_obra varchar(20) not null,
valor_total varchar(20) not null
);

create table classe(
idclasse int primary key,
nome varchar(45) not null
);

create view classe_da_view as select * from classe where nome = 'modificado';
Select * from classe_da_view; 

create table modificado(
registro_veiculo_modificado int primary key,
com_acessorios varchar(45),
nome_veiculo varchar(45) not null
);

create table normal(
registro_veiculo_normal int primary key,
sem_acessorios varchar(45) ,
nome_veiculo varchar(45) not null
);

create table pecas(
numero_de_serie varchar(45) primary key,
fabricacao DATE not null,
origem varchar(45) not null,
quantidade int not null,
oem varchar(45) not null,
dimensoes varchar(100) not null,
marca varchar(45) not null,
outras_caracteristicas varchar(500) not null
);

create table acessorios(
codigo_acessorio int primary key,
nome_acessorio varchar (300) not null
);

create view acessorios_da_view as select * from acessorios;
 
create table recall(
chassi varchar(17) primary key,
itens_de_seguranca varchar(45) not null,
itens_de_mecanica varchar(45) not null
);

create table nivel_de_urgencia(
codigo int primary key,
nao_imediato varchar(1),
imediato varchar(1),
imprescindivel varchar(1)
);

create table carro_has_recall(
Placa varchar(8) not null,
Chassi varchar(17) not null,
foreign key (Placa) references carro (placa),
foreign key (Chassi) references recall (chassi)
);

create table carro_has_acessorios(
Placa varchar(8) not null,
Idclasse int not null,
Codigo_acessorio int not null,
foreign key (Placa) references carro (placa),
foreign key (Idclasse) references classe (idclasse),
foreign key (Codigo_acessorio) references acessorios (codigo_acessorio)
);

create table recall_has_nivel_de_urgencia(
Chassi varchar(17) not null,
Codigo int not null,
foreign key (Chassi) references recall (chassi),
foreign key (Codigo) references nivel_de_urgencia (codigo)
);

create table carro_has_pecas(
Placa varchar(8) not null,
Idclasse int not null,
Numero_de_serie varchar(45) not null,
foreign key (Placa) references carro (placa),
foreign key (Idclasse) references classe (idclasse),
foreign key (Numero_de_serie) references pecas (numero_de_serie)
);

create table acessorios_has_modificado(
Codigo_acessorio int not null,
Registro_veiculo_modificado  int not null,
foreign key (Codigo_acessorio) references acessorios (codigo_acessorio),
foreign key (Registro_veiculo_modificado) references modificado (registro_veiculo_modificado)
);


DELIMITER //
create procedure proc_modificacao_ano_especifico (in ano_modelo_ent int, IN nome_acessorio_ent varchar(300))
begin
	SELECT * FROM carro
	INNER JOIN acessorios ace ON ace.nome_acessorio = nome_acessorio_ent
	WHERE carro.ano_modelo = ano_modelo_ent;
end //
DELIMITER ;
call proc_modificacao_ano_especifico(2021, 'Escapamento')


DELIMITER //
create procedure proc_pecas(in marca varchar(45))
begin 
delete from pecas
where marca = 'fiat';
end //
DELIMITER ;


DELIMITER //
create procedure proc_carros_precisam_recall(in modelo varchar(20), chassi varchar(17))
begin 
insert into recall values (modelo);
end //
DELIMITER ;



insert into cliente (rg, endereco, data_nascimento, estado_civil, idade, sexo, nome_completo, cep) values('1.258.978', 'Samambaia quadra 505, conjunto 9 casa 1, brasilia distrito federal', '1973-05-25', 'solteiro ', '48', 'Masculino','Alex do Santos', '7251984');
insert into cliente (rg, endereco, data_nascimento, estado_civil, idade, sexo, nome_completo, cep) values('1.258.974', 'Lago sul quadra 505, conjunto 9 casa 1, brasilia distrito federal', '1972-06-20', 'solteiro ', '49', 'Masculino','Zezinho Pereira', '7351985');
insert into cliente (rg, endereco, data_nascimento, estado_civil, idade, sexo, nome_completo, cep) values('1.258.984', 'São paulo', '2001-06-20', 'casada', '20', 'Masculino','Maria Joana', '7351985');
insert into cliente (rg, endereco, data_nascimento, estado_civil, idade, sexo, nome_completo, cep) values('2.258.984', 'Londrina', '2003-01-01','solteiro ', '18', 'Masculino','João', '7351978');
insert into cliente (rg, endereco, data_nascimento, estado_civil, idade, sexo, nome_completo, cep) values('5.258.974', 'Rio de Janeiro', '1994-02-20', 'casado', '27', 'Masculino','Gustavo silva', '8351985');
Select * FROM cliente;


insert into carro(placa, cor, ano_fabricacao, modelo, ano_modelo, Rg) values('jkl8596', 'Branco',2017, 'Civic Touring 1.5 ', 2018, '1.258.978');
insert into carro(placa, cor, ano_fabricacao, modelo, ano_modelo, Rg) values('jkl9875', 'Cinza',2001, 'GTR R34 ', 2001, '1.258.974');
insert into carro(placa, cor, ano_fabricacao, modelo, ano_modelo, Rg) values('BRA2E19', 'Preto',2020, 'Jetta GLI ', 2021, '1.258.984');
insert into carro(placa, cor, ano_fabricacao, modelo, ano_modelo, Rg) values('PAI-8596', 'Branco',2010, 'Linea 1.4 T-JET', 2010, '2.258.984');
insert into carro(placa, cor, ano_fabricacao, modelo, ano_modelo, Rg) values('lpw9364', 'vermelho',2012, 'GTR R35', 2013, '5.258.974');
Select * FROM carro;


insert into telefone (telefone, Rg) values('(61) 9999-999','1.258.978');
insert into telefone (telefone, Rg) values('(62) 9999-999','1.258.974');
insert into telefone (telefone, Rg) values('(61) 9999-899','1.258.984');
insert into telefone (telefone, Rg) values('(63) 9899-999','2.258.984');
insert into telefone (telefone, Rg) values('(77) 9845-39','5.258.974');
Select * FROM telefone;


insert into orcamento (servico_efetuado, descricao, quantidade, formas_de_pagamento, valor_pecas, valor_mao_de_obra, valor_total) values('Troca de velas de ignição','verificado desgaste de velas e oxidação','6', 'Débito','100 R$', '300 R$', '400 R$');
insert into orcamento (servico_efetuado, descricao, quantidade, formas_de_pagamento, valor_pecas, valor_mao_de_obra, valor_total) values('Troca de mola esportiva','Verificado desgate em duas molas','2', 'Débito','80 R$', '200 R$', '280 R$');
insert into orcamento (servico_efetuado, descricao, quantidade, formas_de_pagamento, valor_pecas, valor_mao_de_obra, valor_total) values('Alinhamento e Balanceamento das rodas','Manutenção preventiva','4', 'Cartão de Crédito','0 R$', '200 R$', '200 R$');
insert into orcamento (servico_efetuado, descricao, quantidade, formas_de_pagamento, valor_pecas, valor_mao_de_obra, valor_total) values('Colocação de plotagem e volante sparko','Inserção de Modificação','2', 'Débito','1000 R$', '800 R$', '1800 R$');
insert into orcamento (servico_efetuado, descricao, quantidade, formas_de_pagamento, valor_pecas, valor_mao_de_obra, valor_total) values('Recall','recall do abs','1', 'Débito','0 R$', ' 0 R$', '0 R$');
Select * from orcamento;


insert into classe (idclasse, nome) values (1, 'modificado');
insert into classe (idclasse, nome) values (2, 'normal');
Select * from classe;


insert into modificado (registro_veiculo_modificado, com_acessorios, nome_veiculo) values (1, 'Sim: volante sparko', 'Nissan 350z');
insert into modificado (registro_veiculo_modificado, com_acessorios, nome_veiculo) values (2, 'Sim: mola esportiva', 'Linea T-jet');
insert into modificado (registro_veiculo_modificado, com_acessorios, nome_veiculo) values (3, 'Sim: Plotagem', 'GTR R34');
insert into modificado (registro_veiculo_modificado, com_acessorios, nome_veiculo) values (4, 'Sim: escapamento', 'Azera 2015');
insert into modificado (registro_veiculo_modificado, com_acessorios, nome_veiculo) values (5, 'Sim: Roda aro 20', 'Nissan 350z');
Select * from modificado;


insert into normal (registro_veiculo_normal, sem_acessorios, nome_veiculo) values (1, 'Não possui', 'Onix 1.0 Turbo');
insert into normal (registro_veiculo_normal, sem_acessorios, nome_veiculo) values (2, 'Não tem', 'Corolla XLS');
insert into normal (registro_veiculo_normal, sem_acessorios, nome_veiculo) values (3, 'Nenhuma', 'Voyage 1.6 2015');
insert into normal (registro_veiculo_normal, sem_acessorios, nome_veiculo) values (4, 'Nenhuma até onde sei', 'GTR R35');
insert into normal (registro_veiculo_normal, sem_acessorios, nome_veiculo) values (5, 'Não possui', 'Linea 1.4 T-jet');
Select * from normal;


insert into pecas (numero_de_serie, fabricacao, origem, quantidade, oem, dimensoes, marca, outras_caracteristicas) values (87123, '2020-06-20', 'Brasil',1,'CM5Z9E926Ds','30 x 75 cm','fiat',' TBI e inclui atuador de marcha lenta
Inclui sensor de posição');
insert into pecas (numero_de_serie, fabricacao, origem, quantidade, oem, dimensoes, marca, outras_caracteristicas) values (5553378, '2021-10-20', 'Europa',1,'LM5Z9E926Ds','20 x 20 cm','Bosch','Bomba de combustível Completa Linea T-Jet');
insert into pecas (numero_de_serie, fabricacao, origem, quantidade, oem, dimensoes, marca, outras_caracteristicas) values (354791, '2021-01-01', 'Brasil',1,'kl5Z9E926Ds','10 x 10 cm','fiat','Bieleta estabilizadora');
insert into pecas (numero_de_serie, fabricacao, origem, quantidade, oem, dimensoes, marca, outras_caracteristicas) values (578920, '2019-06-20', 'Itália',4,'lDZ9E926Ds','10 x 20 cm','Nakata','Amortecedor');
insert into pecas (numero_de_serie, fabricacao, origem, quantidade, oem, dimensoes, marca, outras_caracteristicas) values (871258, '2020-06-20', 'Brasil',4,'CM5Z9E926Ds','Altura:63,19 cm Largura:20,5 cm Profundidade: 63,19 cm','Michelin','Pneu aro 15');
Select * from pecas;


insert into  acessorios (codigo_acessorio, nome_acessorio) values (1, 'Volante');
insert into  acessorios (codigo_acessorio, nome_acessorio) values (2, 'Escapamento');
insert into  acessorios (codigo_acessorio, nome_acessorio) values (3, 'Plotagem');
insert into  acessorios (codigo_acessorio, nome_acessorio) values (4, 'Body kit');
insert into  acessorios (codigo_acessorio, nome_acessorio) values (5, 'Mola esportiva');
Select * from acessorios;


insert into  recall (chassi, itens_de_seguranca, itens_de_mecanica) values ('kdadadada4qq44', 'Abs','nenhum');
insert into  recall (chassi, itens_de_seguranca, itens_de_mecanica) values ('*4457da4qq44', 'nenhum','encaixe da porta');
insert into  recall (chassi, itens_de_seguranca, itens_de_mecanica) values ('k777sqsdq4', 'nenhum','compressor do ar condicionado');
insert into  recall (chassi, itens_de_seguranca, itens_de_mecanica) values ('ldaddqdq54', 'nenhum','sensor buzina');
insert into  recall (chassi, itens_de_seguranca, itens_de_mecanica) values ('k8qdwdqa204', 'Pneu','nenhum');
Select * from recall;


insert into nivel_de_urgencia (codigo, nao_imediato, imediato, imprescindivel) values ('134', '', 'x','x');
insert into nivel_de_urgencia (codigo, nao_imediato, imediato, imprescindivel) values ('129', 'x', '','');
insert into nivel_de_urgencia (codigo, nao_imediato, imediato, imprescindivel) values ('592', 'x', '','');
insert into nivel_de_urgencia (codigo, nao_imediato, imediato, imprescindivel) values ('103', 'x', '','');
insert into nivel_de_urgencia (codigo, nao_imediato, imediato, imprescindivel) values ('78', '', 'x','x');
Select * from nivel_de_urgencia;



DROP table telefone;
DROP table orcamento;
DROP table normal;
DROP table carro_has_recall;
DROP table carro_has_acessorios;
DROP table acessorios_has_modificado;
DROP table recall_has_nivel_de_urgencia;
DROP table carro_has_pecas;
DROP table modificado;
DROP table classe;
DROP table carro;
DROP table cliente;
DROP table pecas;
DROP table acessorios;
DROP table recall;
DROP table nivel_de_urgencia;
DROP view classe_da_view;
DROP view acessorios_da_view;
DROP view cliente_da_view;
DROP procedure proc_modificacao_ano_especifico;
DROP procedure proc_pecas;
DROP procedure proc_carros_precisam_recall;