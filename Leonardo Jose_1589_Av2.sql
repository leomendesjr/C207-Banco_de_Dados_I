DROP DATABASE IF EXISTS DBLinguagens;

CREATE DATABASE DBLinguagens;

USE DBLinguagens;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Linguagem(
 idLing INT NOT NULL auto_increment,
 nome VARCHAR(45) NOT NULL,
 ano INT NOT NULL,
 idealizador VARCHAR(45) NOT NULL,
 PRIMARY KEY (idLing)
);

CREATE TABLE Empresa(
 idEmp INT NOT NULL auto_increment,
 nome VARCHAR(45) NOT NULL,
 idLing_Linguagem INT NOT NULL,
 valorAcao FLOAT NOT NULL,
 PRIMARY KEY (idEmp),
 CONSTRAINT fk1
 FOREIGN KEY (idLing_Linguagem)
 REFERENCES Linguagem(idLing)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);

CREATE TABLE Area(
 idArea INT NOT NULL auto_increment,
 nome VARCHAR(45) NOT NULL,
 PRIMARY KEY (idArea)
);

CREATE TABLE Usada(
 idLA INT NOT NULL auto_increment,
 idLing_Linguagem INT NOT NULL,
 idArea_Area INT NOT NULL,
 PRIMARY KEY (idLA),
 CONSTRAINT fk2
 FOREIGN KEY (idLing_Linguagem)
 REFERENCES Linguagem(idLing)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 CONSTRAINT fk3
 FOREIGN KEY (idArea_Area)
 REFERENCES Area(idArea)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);

insert into Linguagem(nome,ano,idealizador) values
('Ruby',1995,'Yukihito Matsumoto'),
('JavaScript',1995,'Brendan Eich'),
('Java',1995,'James Gosling'),
('Python',1990,'Guido Van Rossum'),
('C#',2000,'Microsoft');

insert into Area(nome) values
('Web Front-end'),
('Web Back-end'),
('Mobile'),
('Desktop');

insert into Usada(idLing_Linguagem, idArea_Area) values
('1','2'),
('2','1'),
('2','3'),
('3','2'),
('3','3'),
('2','2'),
('3','4'),
('4','2'),
('5','2'),
('5','3'),
('2','4'),
('5','4');

insert into empresa(nome,idLing_Linguagem,valorAcao) values
('Netflix',2,2147),
('Amazon',4,6544),
('Microsoft',5,973),
('Uber',3,175),
('AirBnB',1,95),
('eBay',3,121),
('Instagram',4,450);

#a
alter table Empresa add tipoEmpresa varchar(30);

#b
update Empresa set tipoEmpresa = 'privada';

#c
select * from Linguagem where ano<2000 and nome like 'J%';

#d
select distinct ano from Linguagem order by ano DESC;

#e
select e.nome,l.nome from Empresa as e
inner join Linguagem as l
on e.idLing_Linguagem = l.idLing;

#f
select e.nome,e.valorAcao,(e.valorAcao * 0.83) as Acaonova from Empresa as e
inner join Linguagem as l
on e.idLing_Linguagem = l.idLing where l.nome like 'Ruby';

#g
select min(valorAcao) as MinimaAcao, max(valorAcao) as MaximaAcao from Empresa where valorAcao < 1000;

#h
select l.nome,a.nome from Linguagem as l
inner join Usada as u on u.idLing_Linguagem = l.idLing
inner join Area as a on a.idArea = u.idArea_Area;

#i
select l.idealizador from Linguagem as l
inner join Usada as u on u.idLing_Linguagem = l.idLing
inner join Area as a on a.idArea = u.idArea_Area where idArea = 3;

#j
insert into Linguagem(nome,ano,idealizador) values
('Kotlin',2016,'JetBrains');

select * from Linguagem;