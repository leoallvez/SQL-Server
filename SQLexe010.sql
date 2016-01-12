create database exe10;

use exe10;

create table setores
(
	cod_setor int primary key,
	descricao varchar(45) not null,
);

create table funcionario
(
	matricula int identity(1000,1) primary key,/*identity icrementa o valor de um atributo automaticamente*/
	nome varchar(50) not null,
	sexo char(1) check(sexo in('M','F')),
	cpf numeric(11) unique not null,
	endereco varchar(45) not null,
	cidade varchar(45) not null,
	estado char(2) not null,
	fone varchar(8) not null,
	cargo varchar(45) not null,
	setor int not null references setores(cod_setor)
);

create table dependente
(
	cod_dependente int primary key,
	nome varchar(45) not null,
	idade int not null,
	sexo char(1) check (sexo in('M','F')),
	matricula int not null references funcionario(matricula)
	
);

create table ex_funcionarios
(
	matricula int primary key,
	nome varchar(50) not null,
	sexo char(1) check(sexo in('M','F')),
	cpf numeric(11) unique not null,
	endereco varchar(45) not null,
	cidade varchar(45) not null,
	estado char(2) not null,
	fone varchar(8) not null,
	cargo varchar(45) not null,
	setor int not null references setores(cod_setor)
);

insert into setores values(100,'Qualidade');
insert into setores values(101,'Financeiro');
insert into setores values(102,'Vendas');
insert into setores values(103,'Produção');
insert into setores values(104,'Administrativo');
insert into setores values(105,'Logistica');

select * from setores;

insert into funcionario values('Lulu','F','37090548851','Rua dos Sonhos','São Paulo','SP','12345671','Analista',100);
insert into funcionario values('Mara','F','37090548852','Rua das Cincos','São Paulo','SP','12345672','Analista',101);
insert into funcionario values('Luis','M','37090548853','Rua dos Ventos','São Paulo','SP','12345673','Assistente',102);
insert into funcionario values('Bete','F','37090548854','Rua dos Trezes','São Paulo','SP','12345674','Assistente',103);
insert into funcionario values('Sara','F','37090548855','Rua das Filhas','São Paulo','SP','12345675','Assistente',104);
insert into funcionario values('Caio','M','37090548856','Rua dos Trezes','São Paulo','SP','12345676','Assistente',100);
insert into funcionario values('Goku','M','37090548857','Rua das Filhas','São Paulo','SP','12345677','Assistente',100);
insert into funcionario values('Vivi','F','37090548858','Rua das Filhas','São Paulo','SP','12345678','Assistente',100);
insert into funcionario values('Lola','F','37090548859','Rua das Filhas','São Paulo','SP','12345679','Assistente',100);

select * from funcionario;
delete from funcionario where matricula = 1000;
drop table funcionario;

insert into dependente values(100,'Lucas',8,'M',1000);
insert into dependente values(101,'Sadra',7,'M',1001);
insert into dependente values(102,'Thais',6,'M',1002);
insert into dependente values(103,'Maria',5,'M',1003);
insert into dependente values(104,'Carla',4,'M',1004);

select * from dependente;
delete from dependente where matricula = 1000;
drop table dependente;

/*Criar uma trigger que indique a mensagem "Funcionario Cadastrado!" quando ocorrer a
inserção de um funcionário */ 
create trigger cadastro
on funcionario
for insert
as 
print'Funcionario Cadastrado com sucesso!';

/*Criar uma trigger que indique a mensagem "Dependente removido!" quando ocorrer a
remoção de um dependente*/
create trigger deletado
on dependente
for delete
as
print 'Dependente removido!'

/*Criar uma trigger que copie os dados de um funcionário removido para uma tabela
de backup (Ex_funcionario) dentro do próprio banco de dados*/
create trigger tap_backup
on funcionario
for delete
as
insert into ex_funcionarios select * from deleted

/*Crie uma procedure que receba a matricula de um funcionário como parâmetro e indica o(s)
nome(s) de seu(s) dependen(s). Se não houver dependente(s), deve indicar a mensagem:
"Esse funcionario não possui dependentes!"*/
create procedure n_dependente
@n int
as
if exists(select matricula from funcionario where matricula = @n)
	begin
		if exists(select nome from dependente where matricula = @n)
			begin
				select nome from dependente where matricula = @n
			end
		else
			print'Esse funcionario não possui dependentes!'
	end
else
	print'Esse funcionario não existe!'
	
/*Executanto procedure*/
exec n_dependente 1001

/*Criar uma procedure que recebe o nome de um setor como parametro e indica quantos funcionario estão
associado a esse setor. Se não houver funcionário, deve indicar a mensagem: "Esse setor não possui funcionario!"
e se não existir o setor deve indica "Setor inexistente!"*/
create procedure quant_func
@setor varchar(50)
as
if exists(select descricao from setores where descricao = @setor)
	begin
		declare @n int, @x int 
		set @x =(select cod_setor from setores where descricao = @setor)
		if exists(select matricula from funcionario inner join setores on setor = @x)
			begin
				select COUNT(matricula) as 'Quant' from funcionario where setor =  @x
			end
		else
			print'Esse setor não possui funcionario!'
	end
else
	print'Setor inexitente!'
	
/*Executanto procedure*/	
exec quant_func 'Logistica'








