CREATE DATABASE IF NOT EXISTS cinema;

USE cinema;
SET SQL_SAFE_UPDATES=0;

CREATE TABLE IF NOT EXISTS Filme (
id INT NOT NULL,
titulo VARCHAR(100) NOT NULL,
genero VARCHAR(50) NOT NULL,
tempo INT NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Ator (
id INT NOT NULL,
nome VARCHAR(100) NOT NULL,
dataNasc VARCHAR(40) NOT NULL,
sexo VARCHAR(20) NOT NULL,
idFilme INT,
PRIMARY KEY(id),
CONSTRAINT fk_Ator_filme
FOREIGN KEY(idFilme)
REFERENCES filme(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS PC(
id INT NOT NULL auto_increment,
modelo VARCHAR(100) NOT NULL,
PRIMARY KEY(id)
);

alter table Ator add pais varchar(50);
alter table Ator add idioma varchar(50);

alter table Ator change dataNasc idade int not null;

alter table Ator drop column sexo;

insert into filme(id,titulo,genero,tempo) values (1,'Jogos Vorazes', 'ação', 143);
insert into filme(id,titulo,genero,tempo) values (2,'O destino de Júpiter', 'ficção científica', 127);

insert into Ator(id,nome,idade,idFilme,pais,idioma) values (1,'Jannifer Lawrence',30,1,'EUA','ingles');
insert into Ator(id,nome,idade,idFilme,pais,idioma) values (2,'Josh Hutcherson',28,1,'EUA','ingles');
insert into Ator(id,nome,idade,idFilme,pais,idioma) values (3,'Bae Doona',41,2,'Coréia do Sul','coreano');
insert into Ator(id,nome,idade,idFilme,pais,idioma) values (4,'Mila Kunis',35,2,'Ucrânia','ucraniano');
insert into Ator(id,nome,idade,idFilme,pais,idioma) values (5,'Eddie Redmayne',38,2,'Reino Unido','ingles');

update Ator set idade=37 where nome='Mila Kunis';

delete from Ator where id=5;

update filme set id=43 where id=1;

delete from filme where id=2;

alter table Ator change pais paisDeOrigem varchar(50) not null;

alter table Ator drop column idade;
