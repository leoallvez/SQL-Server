create database RH;

use RH;

create table funcionario
(
	matricula int primary key,
	nome varchar(20),
	superintendencia varchar(5),
	departamento varchar(3),
	salario numeric(7,2)
);

create table ex_funcionario
(
	matricula int primary key,
	nome varchar(20),
	superintendencia varchar(5),
	departamento varchar(3),
	salario numeric(7,2)
);

create trigger aviso_insert
on funcionario
for insert
as
print'Funcinário Adcionado'


insert into Funcionario values(123,'João','Sup A','TI',8000.00);
insert into Funcionario values(124,'José','Sup A','TI',3500.00);
insert into Funcionario values(125,'Manuel','Sup A','TI',3500.00);
insert into Funcionario values(126,'Alfredo','Sup A','TI',8000.00);
insert into Funcionario values(127,'Alberto','Sup A','TI',10500.00);
insert into Funcionario values(128,'Leonardo','Sup A','TI',12000.00);
insert into Funcionario values(129,'Fernando','Sup A','TI',10000.00);
insert into Funcionario values(130,'Maria','Sup A','FIN',4000.00);
insert into Funcionario values(131,'Liberia','Sup A','FIN',4400.00);
insert into Funcionario values(132,'Joana','Sup B','RH',2000.00);
insert into Funcionario values(133,'Julio','Sup B','RH',3000.00);
insert into Funcionario values(134,'Andre','Sup B','RH',5000.00);
insert into Funcionario values(135,'Marieta','Sup B','DP',5000.00);
insert into Funcionario values(136,'Juan','Sup B','DP',3000.00);
insert into Funcionario values(137,'Marcelo','Sup B','DP',11000.00);
insert into Funcionario values(138,'Roberto','Sup B','DP',5800.00);

select * from funcionario;

select matricula, nome from funcionario where matricula = 123;
select matricula, nome from funcionario where departamento = 'TI' and salario > 10000.00
select matricula, nome from funcionario where departamento = 'TI' or salario > 10000.00
select matricula, nome from funcionario where departamento in('TI','RH','FIN');
select matricula, nome from funcionario where departamento = 'TI'
select matricula, nome from funcionario where departamento = 'TI' order by nome;
select nome,departamento,salario from funcionario order by salario
select distinct departamento from funcionario
select distinct salario from funcionario where departamento = 'TI'
select SUM(salario) as Soma,departamento from funcionario group by departamento
select SUM(salario) as Soma, MAX(salario) as Maior, MIN(salario) as Menor,AVG(salario) as Media, departamento from funcionario group by departamento;
select COUNT(nome) from funcionario
select COUNT(nome), departamento from funcionario group by departamento
select COUNT(distinct departamento) as NrDeptos,
       SUM(salario) as Soma,
       AVG(salario) as Media,
       MAX(salario) as Maior,
       MIN(salario) as Menor, 
       superintendencia 
       from funcionario 
       group by superintendencia;

select departamento, 
       SUM(salario) as Soma,
       AVG(salario) as Media 
       from funcionario
       group by departamento having departamento in(select departamento from funcionario group by departamento having SUM(salario) > 10000.00);
