create database exe006;

use exe06;

create table funcionario
(
	matricula int primary key,
	nome varchar(50) not null,
	cpf numeric(11) not null,
	data_contratacao date default getdate(),
	data_demicao date default null
	
);


create table ex_funcionario
(
	matricula int primary key,
	nome varchar(50) not null,
	cpf numeric(11) not null,
	data_contratacao date not null,
	data_demicao date default getdate()	
);

insert into funcionario values(100,'Leonardo Pereira Alves',37090548856,default,default);

/*Criar uma trigger que sempre que um funcionario for demitido ser adicionado na
  tabela ex_funcionario automaticamente.*/
  
  create trigger ex
  on funcionario
  for delete
  as
  begin
	declare 
	@mat int,
	@nome varchar(45),
	@cpf numeric(11),
	@cont date
  
	set @mat = (select matricula from deleted)
	set @nome = (select nome from deleted)
	set @cpf = (select cpf from deleted)
	set @cont = (select data_contratacao from deleted)
 
	insert into ex_funcionario values(@mat,@nome,@cpf,@cont,DEFAULT)
	print'Dados salvos na tabela Ex Funcionario'
  end 
  
  delete 
  from funcionario 
  where matricula = 100
  
  
  create view ex_func as
  select matricula as Matricula, 
         nome as Nome, 
         cpf as CPF, 
         data_contratacao as Contratação,
         data_demicao as Demição
  from ex_funcionario;
  
  select * from ex_func;
  

