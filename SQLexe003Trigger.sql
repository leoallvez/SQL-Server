create database exeTrigre; /*Criando Banco de Dados*/

use exeTrigre; /*Usando Banco de Dados*/

/*Criando tabelas*/
create table professor
(
	matricula int primary key,			  /*Declarando chave primaria*/
	nome varchar(50)not null,			  /*Atributo não nulo*/
	cpf char(11) unique not null,		  /*Atribulo único não nulo*/
	sexo char(1) check(sexo in('F','M')), /*Valor do atribulo sexo deve ser 'F' ou 'M')*/
	titulacao varchar(40) not null,
	nroturma int
);

create table turma
(
	cod_turma int primary key,
	curso varchar(50) not null,
	periodo numeric(1) not null,
	turma char(1) not null,
	ano numeric(4) not null
);

create table professor_por_turma
(
	cod_ligacao int primary key,
	matricula int references professor(matricula) not null,  /*Criando chave estrageira*/
	cod_turma int references turma(cod_turma) not null		
	
);

/*Inserindo valores nas tabelas*/
insert into professor values(100,'Panda',11111111111,'M','Mestre',0);
insert into professor values(200,'Lima',22222222222,'M','Mestre',0);
insert into professor values(300,'Peruano',33333333333,'M','Doutor',0);
insert into professor values(400,'Luis Gustavo',44444444444,'M','Mestre',0);

insert into turma values(111,'Sistema de Informação',4,'A',2);
insert into turma values(112,'Direito',8,'B',4);
insert into turma values(113,'Analise e Desenvolvimento de Sistemas',1,'A',1);

/*Selecionar todos os atributos da tabela professor*/
select * from professor;

/*Selecionar todos os atributos da tabela turma*/
select * from turma;

/*Criando uma trigger para avisar quando um dado for inserido 
 ou alterado na tabela professor*/
 create trigger insertprof
 on professor
 for insert, update
 as print ('Tabela professor alterada com sucesso!');
 
 /*Testando trigger insertprof*/
 insert into professor values(500,'Bene',55555555555,'M','Lenda',0);
 
 update professor 
 set titulacao = 'Mestre'
 where matricula = 500;
 
 /*Criando uma trigeer para avisar quando uma linha for deletada na tabela professor*/
 create trigger removeprof
 on professor
 for delete
 as print('Professor removido com sucesso');
 
 /*Testando a trigger removeprof*/
 delete
 from professor
 where matricula = 500;
/*Criando tabela e trigger para gravar que manipulou a tabela Prpfessor*/
create table log
(
	quando datetime,
	quem varchar(50),
);

create trigger proflog
on professor
for delete, insert, update
as print ('Registrado!')
insert into log values(getdate(),suser_name());

select * from log;






 



