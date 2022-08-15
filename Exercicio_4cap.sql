# SQL DDL TABELA DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
  DNOME varchar(45) NOT NULL,
  DNUMERO integer NOT NULL,
  DATAINICIO date,
  PRIMARY KEY (`DNumero`)
) ;

# SQL DDL TABELA EMPREGADO
CREATE TABLE EMPREGADO (
  PNOME varchar(15) NOT NULL,
  MINICIAL char,
  UNOME varchar(15) NOT NULL,
  SSN bigint NOT NULL,
  DATANASC date,
  ENDERECO varchar(80),
  SEXO bit,
  SALARIO decimal(10,2),
  SSN_SUPERVISOR bigint,
  DNUMERO_DEPARTAMENTO integer NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `fk1` 
  FOREIGN KEY (SSN_SUPERVISOR) REFERENCES EMPREGADO (SSN),
  CONSTRAINT `fk2` 
  FOREIGN KEY (DNUMERO_DEPARTAMENTO) REFERENCES DEPARTAMENTO (DNUMERO)
) ;

CREATE TABLE PROJETO(
	PNOME varchar(15) NOT NULL,
    PNUMERO integer NOT NULL,
    PLOCALIZACAO varchar(40),
    DNUMERO_DEPARTAMENTO integer,
    PRIMARY KEY(`PNOME`),
    PRIMARY KEY(`PNUMERO`)
) ;

CREATE TABLE DEPENDENTE (
	SSN_EMPREGADO integer NOT NULL,
    NOME_DEPENDENTE varchar(40) NOT NULL,
    SEXO varchar(1),
    DATANASC date,
    PARENTESCO varchar(15),
	PRIMARY KEY(`SSN_EMPREGADO`),
    PRIMARY KEY(`NOME_DEPENDENTE`)
);