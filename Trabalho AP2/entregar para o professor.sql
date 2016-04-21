--Criar Banco e Tabelas

--DDL
-- criar Banco
create database DB_LocaçãoDVD

--criar tabelas
-- 1° tabela
create table tb_Categoria( 
IDCategoria integer not null primary key,
Nome varchar(100) not null
);

-- 2° tabela
-- tabela filme
create table tb_Filme(
CodFilme integer not null primary key,
IDCategoria integer not null,
Titulo varchar(100) not null,
Anodelançamento char(4) not null
CONSTRAINT fk_Filme FOREIGN KEY(IDCategoria)
           REFERENCES tb_Categoria(IDCategoria)
);

-- 3° tabela
-- tabela clientes
 create table tb_cliente(
Codigo integer not null primary key,
Nome varchar(100) not null,
Idade integer not null,
Cidade varchar(50) not null,
Bairro varchar(50) not null,
Rua varchar(50) not null,
CPF char(11) not null,
Telefone char(11),
);

-- 4° tabela
-- tabela funcionario
create table tb_Funcionario(
Matricula integer not null primary key,
Nome varchar(100) not null,
Cidade varchar(50) not null,
Bairro varchar(50) not null,
Rua varchar(50) not null,
CPF char(11),
Telefone varchar(11),
Salario float
);
-- 5° tabela
-- tabela representantes
create table tb_Representante(
NID integer not null primary key,
Nome varchar(100) not null,
Cidade varchar(50) not null,
Bairro varchar(50) not null,
Rua varchar(50) not null,
CPF char(11) not null,
Telefone char(11),
);
-- 6° tabela 
-- tabela distribuidora
create table tb_Distribuidora(
Nregistro integer not null primary key,
NID integer not null,
Nome varchar(100) not null,
Cidade varchar(50) not null,
Bairro varchar(50) not null,
Rua varchar(50) not null,
Telefone char(11) not null,
CONSTRAINT fk_Distribuidora FOREIGN KEY(NID)
 REFERENCES tb_Representante(NID)
); 

-- 7° tabela
-- tabela locadora
create table tb_Locadora(
NLocadora integer not null primary key,
Nome varchar(100) not null,
Cidade varchar(50) not null,
Bairro varchar(50) not null,
Rua varchar(50) not null,
Telefone char(11) not null,
Matricula integer not null,
Codigo integer not null,
CodFilme integer not null,
CONSTRAINT fk_Locadora FOREIGN KEY(Matricula)
REFERENCES tb_Funcionario(Matricula),
CONSTRAINT fk_Locadora3 FOREIGN KEY(Codigo)
REFERENCES tb_cliente(Codigo),
CONSTRAINT fk_Locadora4 FOREIGN KEY(CodFilme)
REFERENCES tb_Filme(CodFilme)            
);

--8° tabela
--tabela Locação
create table tb_locaçao(
Numero integer not null primary key,
DataAluguel date,
DataRetorno date,
ValorPago float,
Codigo integer not null, 
Matricula integer not null,
NLocadora integer not null, 
CodFilme integer not null,
CONSTRAINT fk_locaçao FOREIGN KEY(Matricula)
REFERENCES tb_Funcionario(Matricula),
CONSTRAINT fk_locaçao1 FOREIGN KEY(NLocadora)
REFERENCES tb_Locadora(NLocadora),
CONSTRAINT fk_locaçao2 FOREIGN KEY(CodFilme)
REFERENCES tb_Filme(CodFilme)
);            

--DROP

drop table tb_Locaçao

--ALTER

alter table tb_Cliente ADD Sexo char(1) not null;

alter table tb_Cliente drop column Sexo;

alter table tb_Funcionario 
alter column Telefone varchar(11) not null;


--------------------------------------------
-DML
------------------------------------------------------------------------------
 
-- Inserir dados na tabela Categoria
insert into tb_Categoria(IDCategoria,Nome)
values (1,'Ação');

insert into tb_Categoria(IDCategoria,Nome)
values (2,'Terror');

insert into tb_Categoria(IDCategoria,Nome)
values (3,'Comédia');

insert into tb_Categoria(IDCategoria,Nome)
values (4,'Suspense');

insert into tb_Categoria(IDCategoria,Nome)
values (5,'Romance');
 
------------------------------------------------------------------------------
 
--Inserir dados na tabela filme

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (01,1,'Matrix',1999);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (02,1,'Parque dos Dinossauros',2013);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (03,2,'O Exocismo de Emily Rose',2005);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (04,2,'Jogos Mortais - O Final',2010);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (05,3,'Sim Senhor',2008);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (06,3,'Inatividade Paranormal',2013);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (07,5,'Meu Namorado é Um Zumbi',2013);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (08,4,'Premonição 4',2009);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (09,2,'A Entidade',2012);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (010,2,'Apartamento 143',2013);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (011,3,'Um Tira da Pesada',1984);


insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (012,3,'Os Penetras',2012);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (013,2,'A Morte do Demônio',2013);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (014,4,'O Abrigo',2013);

insert into tb_Filme(CodFilme,IDCategoria,Titulo,Anodelançamento)
values (015,4,'REC 3 Genesis',2012) 

------------------------------------------------------------------------------
 
--inserir na tabela cliente
insert into tb_cliente(Codigo,Nome,Idade,Cidade,Bairro,Rua,CPF,Telefone)
values (1,'Cláudio','25','Fortaleza','Aldeota','Cel. Linhares',25872569365,08589963656);

insert into tb_cliente(Codigo,Nome,Idade,Cidade,Bairro,Rua,CPF,Telefone)
values (2,'Carlos','43','Fortaleza','Centro','Guarani',25236987452,08587986532);

insert into tb_cliente(Codigo,Nome,Idade,Cidade,Bairro,Rua,CPF,Telefone)
values (3,'Maria',30,'Fortaleza','Fátima','Lauro Maia',85963215236,08596857412);

insert into tb_cliente(Codigo,Nome,Idade,Cidade,Bairro,Rua,CPF,Telefone)
values (4,'Marcos','19','Fortaleza','Aldeota','Capitão Antônio Aguiar',85963214563,08596966523);

insert into tb_cliente(Codigo,Nome,Idade,Cidade,Bairro,Rua,CPF,Telefone)
values (5,'Ana','20','Caucaia','Araturi','A',25885693266,08589968596);

 
------------------------------------------------------------------------------
 
--inserir na tabela Funcionário
insert into tb_Funcionario(Matricula,Nome,Cidade,Bairro,Rua,CPF,Telefone,Salario)
values (12345,'Samuel','Fortaleza','Centro','Antônio Botelho',25326985742,08596986598,800);

insert into tb_Funcionario(Matricula,Nome,Cidade,Bairro,Rua,CPF,Telefone,Salario)
values (12341,'Pedro','Fortaleza','Montese','Pré Nove',32659621521,08587968574,1.000);

insert into tb_Funcionario(Matricula,Nome,Cidade,Bairro,Rua,CPF,Telefone,Salario)
values (12342,'Marta','Caucaia','Centro','Manuel Ferreira',02582133651,08589966511,800);

insert into tb_Funcionario(Matricula,Nome,Cidade,Bairro,Rua,CPF,Telefone,Salario)
values (12343,'Luis','Fortaleza','Meireles','José Lourenço',01235201231,08588223351,650);

insert into tb_Funcionario(Matricula,Nome,Cidade,Bairro,Rua,CPF,Telefone,Salario)
values (12344,'Ana Cristina','Maracanaú','Pajuçara','João conrado',01432531452,08589652531,650)

 
------------------------------------------------------------------------------

 


~~inserir na tabela Representante

insert into tb_Representante(NID,Nome,Cidade,Bairro,Rua,CPF,Telefone)
values (1112,'Lucas de Azevedo','Fortaleza','Jockey Club','Senador fernandes Távora',03256912412,08585521002);

insert into tb_Representante(NID,Nome,Cidade,Bairro,Rua,CPF,Telefone)
values (1113,'Mario Silva','Caucaia','Nova Metropole','113',12523612000,0858552100);

insert into tb_Representante(NID,Nome,Cidade,Bairro,Rua,CPF,Telefone)
values (1114,'Fernando Alves','Fortaleza','Aldeota','Rui Barbosa',12014011221,08587878587);

insert into tb_Representante(NID,Nome,Cidade,Bairro,Rua,CPF,Telefone)
values (1115,'Marta de Alencar','Maranguape','Centro','Guilherme de Oliveira',22115201010,08587989689);

insert into tb_Representante(NID,Nome,Cidade,Bairro,Rua,CPF,Telefone)
values (1116,'Diogo Castro','Fortaleza','Centro','Braga Torres',45128596784,08585855232); 
 ----------------------------------------------------------------------------- 
--inserir na tabela Distribuidora
insert into tb_Distribuidora(Nregistro,NID,Nome,Cidade,Bairro,Rua,Telefone)
values (12,1112,'DistVideo S.A.','Fortaleza','Centro','Santo Inácio',08588996665);

insert into tb_Distribuidora(Nregistro,NID,Nome,Cidade,Bairro,Rua,Telefone)
values (13,1113,'BestLoc Videos','Maracanaú','Jereisati 1','A',08589965645);

insert into tb_Distribuidora(Nregistro,NID,Nome,Cidade,Bairro,Rua,Telefone)
values (14,1114,'BestLoc Videos','Maracanaú','Jereisati 1','A',08589965645);

insert into tb_Distribuidora(Nregistro,NID,Nome,Cidade,Bairro,Rua,Telefone)
values (15,1115,'DistVideo S.A.','Fortaleza','Centro','Santo Inácio',08588996665);

insert into tb_Distribuidora(Nregistro,NID,Nome,Cidade,Bairro,Rua,Telefone)
values (16,1116,'DistVideo S.A.','Fortaleza','Centro','Santo Inácio',08588996665);

insert into tb_Distribuidora(Nregistro,NID,Nome,Cidade,Bairro,Rua,Telefone)
values (17,1112,'DistVideo S.A.','Fortaleza','Centro','Santo Inácio',08588996665);

 
------------------------------------------------------------------------------
 
--inserir na tabela Locadora
insert into tb_Locadora(NLocadora,Nome,Cidade,Bairro,Rua,Telefone,Matricula,Codigo,CodFilme)
values (100,'Rei dos Filmes','Fortaleza','Centro','Pe. Valdevino',08589964563,12345,1,1)

insert into tb_Locadora(NLocadora,Nome,Cidade,Bairro,Rua,Telefone,Matricula,Codigo,CodFilme)
values (200,'Rei dos Filmes','Fortaleza','Centro','Pe. Valdevino',08589964563,12341,2,02)

insert into tb_Locadora(NLocadora,Nome,Cidade,Bairro,Rua,Telefone,Matricula,Codigo,CodFilme)
values (300,'Rei dos Filmes','Fortaleza','Centro','Pe. Valdevino',08589964563,12342,3,03)

insert into tb_Locadora(NLocadora,Nome,Cidade,Bairro,Rua,Telefone,Matricula,Codigo,CodFilme)
values (400,'Rei dos Filmes','Fortaleza','Centro','Pe. Valdevino',08589964563,12343,4,04)

insert into tb_Locadora(NLocadora,Nome,Cidade,Bairro,Rua,Telefone,Matricula,Codigo,CodFilme)
values (500,'Rei dos Filmes','Fortaleza','Centro','Pe. Valdevino',08589964563,12344,5,05)

 
------------------------------------------------------------------------------------------------------------------------------
--inserindo na tabela locação
insert into tb_Locaçao(Numero,DataAluguel,DataRetorno,ValorPago,Codigo,Matricula,NLocadora,CodFilme)
values (321,30-11-2012,03-12-2012,3.00,1,12345,100,01)

insert into tb_Locaçao(Numero,DataAluguel,DataRetorno,ValorPago,Codigo,Matricula,NLocadora,CodFilme)
values (322,25-02-2013 ,28-02-203,3.00,2,12341,200,02)

insert into tb_Locaçao(Numero,DataAluguel,DataRetorno,ValorPago,Codigo,Matricula,NLocadora,CodFilme)
values (322,25-02-2013 ,28-02-203,3.00,3,12342,400,03)

insert into tb_Locaçao(Numero,DataAluguel,DataRetorno,ValorPago,Codigo,Matricula,NLocadora,CodFilme)
values (322,25-02-2013 ,28-02-203,3.00,4,12343,300,013)

insert into tb_Locaçao(Numero,DataAluguel,DataRetorno,ValorPago,Codigo,Matricula,NLocadora,CodFilme)
values (322,25-02-2013 ,28-02-203,3.00,5,12344,100,012)

insert into tb_Locaçao(Numero,DataAluguel,DataRetorno,ValorPago,Codigo,Matricula,NLocadora,CodFilme)
values (322,25-02-2013 ,28-02-203,3.00,2,12342,400,05)

insert into tb_Locaçao(Numero,DataAluguel,DataRetorno,ValorPago,Codigo,Matricula,NLocadora,CodFilme)
values (322,25-02-2013 ,28-02-203,3.00,1,12345,200,06)

----------------------------------------------------------------------------------

SELECT


select * from tb_Distribuidora;
----------------------------
select nome from tb_Cliente;
----------------------------
select Matricula from tb_Funcionario 
where CPF=25326985742;
----------------------------
select count (*) from tb_Filme;
----------------------------
select  avg  (Salario) as media from  tb_Funcionario;
-------------------------------------------------
select MAX (Matricula) FROM tb_Funcionario

Update

Update tb_Funcionario
set Nome = 'Ricardo'
WHERE Matricula = 12345
