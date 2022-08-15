DROP DATABASE IF EXISTS confeitaria;

CREATE DATABASE confeitaria;

USE confeitaria;

SET GLOBAL log_bin_trust_function_creators = 1;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Cliente(
 cpf VARCHAR(14) NOT NULL,
 nome VARCHAR(45) NOT NULL,
 telefone VARCHAR(45) NOT NULL,
 PRIMARY KEY (cpf)
);

CREATE TABLE Produto(
 codigo INT NOT NULL,
 nome VARCHAR(45) NOT NULL,
 tipo VARCHAR(45) NOT NULL,
 preco INT NOT NULL,
 qtd_estoque INT NOT NULL,
 PRIMARY KEY (codigo)
);

CREATE TABLE Compra(
 Cliente_cpf VARCHAR(14) NOT NULL,
 Produto_codigo INT NOT NULL,
 data_compra DATE NOT NULL,
 qtd_comprada INT NOT NULL,
 taxa_entrega FLOAT NOT NULL,
 PRIMARY KEY (Cliente_cpf,Produto_codigo),
 CONSTRAINT Cliente_cpf_fk
 FOREIGN KEY (Cliente_cpf)
 REFERENCES Cliente(cpf)
 ON DELETE NO ACTION
 ON UPDATE CASCADE,
 CONSTRAINT Produto_codigo_fk
 FOREIGN KEY (Produto_codigo)
 REFERENCES Produto(codigo)
 ON DELETE NO ACTION
 ON UPDATE CASCADE
);

#1
#a)
alter table Cliente add cep varchar(9);

#b
alter table Produto change preco preco float;

#c
alter table Compra drop column taxa_entrega;

insert into Cliente(cpf,nome,telefone) values ('492.441.760-25','Marines','(35)99875-5572');
insert into Cliente(cpf,nome,telefone) values ('456.841.862-03','Luiz','(35)3473-8562');
insert into Cliente(cpf,nome,telefone) values ('796.705.940-90','Bruno','(11)99230-7812');
insert into Cliente(cpf,nome,telefone) values ('743.214.230-07','Giulia','(35)98706-4558');
insert into Cliente(cpf,nome,telefone) values ('852.963.920-00','Carlos','(11)99529-7557');
insert into Cliente(cpf,nome,telefone) values ('192.041.526-14','Rebeca','(35)3471-1519');
insert into Cliente(cpf,nome,telefone) values ('556.851.862-88','Iara','(11)99822-9639');

insert into Produto() values (0300,'Bolo temático','Colorido',40,5);
insert into Produto() values (0301,'Cupcake','Chocolate',6.90,10);
insert into Produto() values (0400,'Brigadeirão','Chocolate',30,5);
insert into Produto() values (0500,'Pudim','Leite',15,3);
insert into Produto() values (0501,'Coxinha','Frango',3.7,6);
insert into Produto() values (0502,'Cookie','Tradicional',1.5,15);
insert into Produto() values (0503,'Biscoito','Polvilho',2,20);
insert into Produto() values (0504,'Torta','Limão',28.90,2);
insert into Produto() values (0505,'Sanduiche ','Peru',4.90,5);
insert into Produto() values (0800,'Café','tradicional',1.70,25);

#2
#a
update Cliente set cep='32470-153' where cpf='743.214.230-07';
#b
update Cliente set telefone='(35)98034-4676' where cpf='492.441.760-25';
#c
update Produto set nome='Torta e banana' where codigo=0504;
update Produto set preco=15.90 where codigo=0504;
update Produto set qtd_estoque=12 where codigo=0504;
#3
#a
update Cliente set nome='Marina' where nome='Giulia';
#b
delete from Produto where codigo=0301;

#4
#a
select distinct nome from Produto;
#b
select nome,cep from Cliente where telefone like '(35)%';
#c
select avg(preco) from Produto;

#5
#a
#Foi dado o privilégio para Marines deletar para que pudesse retirar este privilégio
create user 'Marines' identified by '1234';
grant delete on Cliente to 'Marines';
revoke delete on Cliente from 'Marines';
#b
grant insert, update on Produto to 'Marines';

