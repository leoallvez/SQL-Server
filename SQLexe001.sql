create database exe01;

use exe01;

create table funcionario
(
	matricula int primary key,
	nome_func varchar(50) not null,
	cpf numeric(11) unique not null,
	sexo_func char(1) check(sexo_func in('M','F')),
	nasc_func date not null,
	fone varchar(12)
);


create table dependente
(
	cod_dependente int primary key,
	nome_dep varchar(50) not null,
	sexo_dep char(1) check(sexo_dep in('M','F')),
	nasc_dep date not null,
	matricula int references funcionario(matricula) not null
);

insert into funcionario values(001,'Leonardo Pereira Alves',37090548856,'M','1982/09/05','11988109642');
insert into funcionario values(002,'Caio Miranda de Almeida',12345678901,'M','1995/10/02','11999774455');
insert into funcionario values(003,'Maria da Dores Gomes',00011122234,'F','1983/02/01','119034455667');

select * from funcionario;

insert into dependente values(001,'Lucas de Almeida Alves','M','2007/10/17',001);
insert into dependente values(002,'Stefhany Vitória Almeida Alves','F','2011/08/02',001);
insert into dependente values(003,'Claúdia de Almeida Alves','F','1983/09/10',001);
insert into dependente values(004,'João de Silva','M','2000/09/01',002);
insert into dependente values(005,'Marina da Dores Gomes','F','2009/05/09',002);
insert into dependente values(006,'Thiago Santiago','M','2010/08/01',003);
insert into dependente values(007,'Zelia Pereira','F','1970/09/01',003);
insert into dependente values(008,'Mario Ferreira','M','2015/03/01',003);

/*Selecione o Nome, cpf dos funcionarios*/
select nome_func as Nome ,cpf as CPF
from funcionario;

/*Selecionar todos os depentendes do sexo feminino*/
select nome_dep
from dependente
where sexo_dep = 'F';

/*Selecionar os nomes dos dependentes menores de 1 ano */
select nome_dep
from dependente
where nasc_dep > '2014/10/04'

/*Formatar saida: | Nome do dependente | Nascimento | Responsável |*/
select dependente.nome_dep as 'Nome do dependente',
	   dependente.nasc_dep as 'Nascimento',
	   funcionario.nome_func as 'Responsável'
from funcionario, dependente
where funcionario.matricula = dependente.matricula;

/*Selecionar o nome do funcionario mais velho*/
select nome_func as 'Fucionario mais Velho'
from funcionario
where nasc_func =(select MIN(nasc_func)from funcionario);

/*Criando uma view*/
create view dep_func (Nome,Nascimento,Responsável) as
		select dependente.nome_dep,
				dependente.nasc_dep,
				funcionario.nome_func
		from funcionario, dependente
		where funcionario.matricula = dependente.matricula;
		
/*Selecionando uma view*/		
select * from dep_func;



				  