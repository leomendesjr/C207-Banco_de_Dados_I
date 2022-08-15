drop database if exists AV1;
create database AV1;
use AV1;

SET SQL_SAFE_UPDATES=0;

create table if not exists pessoa(
	id int not null auto_increment primary key,
    nome varchar(45),
    idade varchar(45),
    cpf varchar(14),
    sexo varchar(45),
    endereco varchar(45)
);

create table animais (
	id_animal int not null auto_increment primary key,
    nome varchar(45),
    pelo  varchar(45),
    patas int,
    som varchar(45),
    cor varchar(45)
);

create table instrumentos(
	id int primary key,
    nome varchar(45),
    cordas int,
    cor  varchar(45),
    peso varchar(45)
);


#1)
#a)
#A chave primária é uma informação de um registro que é única,
#então a chave primaria nunca vai ser igual , portanto conseguimos
#buscar exatamente qual o registro sem interferência.

#b)
# Chave estrangeira permite a referência de registros de uma outra tabela.

#c)
#Os dados são a matéria-prima que deve ser 
#processada para obter informações ou para coleta de detalhes. 

#d)
#Implementação de um sistema de estoque de uma loja ou mercado.
#Implementação em jogos eletrônicos para armazenamento de dados do jogador.
#Implementação em sistemas de cadastro público do governo.
#Implementação em sites para armazenas dados como vídeos. 

#2
#a
insert into pessoa(nome,idade,cpf,sexo,endereco) values ('Drin', '15', '212.324.435-89', 'Masculino', 'Major Jose Feliciano');
insert into pessoa(nome,idade,cpf,sexo,endereco) values ('Anderson', '23', '222.222.222-22', 'Masculino', 'Plinio Cunha');
insert into pessoa(nome,idade,cpf,sexo,endereco) values ('Nathalia', '19', '123.004.766-22', 'Feminino', 'Pedro Sancho Vilela');
#select * from pessoa;

#b
insert into animais() values (default, 'Cachorro', 'liso', '4', 'AUAU','branco');
insert into animais() values (default, 'Gato', 'liso', '4', 'MIAU','preto');
insert into animais() values (default, 'Vaca', 'enrolado', '4', 'MUUUUUU','preto');
insert into animais() values (default, 'Galinha', 'liso', '2', 'POPO','caramelo');
#select * from animais;
#c
insert into instrumentos() values ('1', 'Violao', '4','marrom','2kg');
insert into instrumentos() values ('2', 'Guitarra', '4','vermelha','1kg');
insert into instrumentos() values ('3', 'Gaita', '0','prata','2kg');
insert into instrumentos() values ('4', 'Saxfone', '0','dourado','4kg');
insert into instrumentos() values ('5', 'Piano', '0','amarelo','9kg');
select * from instrumentos;

#d
insert into pessoa(nome,idade,cpf,sexo,endereco) values ('Afonso', '84', '212.324.438-12', 'Masculino', 'Feliciano Teles');
insert into pessoa(nome,idade,cpf,sexo,endereco) values ('Maria', '83', '123.678.222-22', 'Feminino', 'Antonio Moreira');

#3
#a
update instrumentos set cor = 'verde' where cordas = 4;

#b
update pessoa set endereco = 'Rua da Flores 76' where idade > 80;

#c
update animais set cor = 'vermelho' where patas = 4 and cor = 'branco';

#4
# Alternativa D

#5
#a
select * from pessoa where nome like 'A_%';

#b
select * from animais where cor = 'preto' and not patas = 2;

#c
select id,nome,cordas,cor,max(peso) from instrumentos;

#d
select * from pessoa where nome like 'D_%' and not idade > 70 ;

#e
select nome,cor,min(peso) from instrumentos;

#f
select distinct nome from animais;