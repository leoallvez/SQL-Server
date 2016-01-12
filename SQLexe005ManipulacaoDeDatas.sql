create database datas;

use datas;
/*Criar uma tabela com campos nome e nascimento, e inserir cinco registro.*/
create table pessoa
(
	nome varchar(50) not null,
	nascimento date not null,
);


insert into pessoa values('Leonardo Pereira Alves','1982/09/05');
insert into pessoa values('Claudia de Almeida Alves','1983/09/10');
insert into pessoa values('Lucas de Almeida Alves','2007/10/17');
insert into pessoa values('Stefhany Almeida Alves','2011/08/02');

/*Seleciona nome e formatar datas com anos, meses dias e horas*/
select nome,
	datediff(yy,nascimento,getdate()) as Anos,
	datediff(mm,nascimento,getdate()) as Meses,
	datediff(dd,nascimento,getdate()) as Dias,
	datediff(hh,nascimento,getdate()) as Horas
from pessoa;

/*Selecionar idades e verificar se a pessoa já fez aniversário*/
select nome, (YEAR(GETDATE()) -YEAR (nascimento)) -
	case when(MONTH(GETDATE()) < MONTH(nascimento)) then '1'
	else
		case when((MONTH(GETDATE()) = MONTH(nascimento)) and
		(DAY(GETDATE()) < DAY(nascimento))) then '1'
		else
			case when(DAY(GETDATE()) = DAY(nascimento)) then '0'
			else
				'0'
			end
		end
	end
as Idades from pessoa;
	
/*DATEADD() altera uma data de acordo com os valores passados como parametro*/
select DATEADD(yy,1,getdate());
select DATEADD(yy,-1,getdate());
select DATEADD(yy,45,getdate());
select DATEADD(yy,3,getdate());

/*Criar uma procedure que idica quantas pessoas possuem 25 anos
  ou mais, em caso negativo deve idicar "Não existem alunos com
  25 anos ou mais*/
  create procedure verifica
  as
  declare @quant varchar(10)
  if exists(select(nascimento) from pessoa where nascimento <=
     (select DATEADD(yy,-25,getdate())))
     begin
	     set @quant =(select COUNT(nascimento) from pessoa where
	     nascimento <= (select DATEADD(yy,-25,getdate())))
	     print 'Existem '+@quant+' maior(es) de 25 anos!'
	 end
  else
     begin
		print'Não existem alunos com 25 anos ou mais'
	 end
/*Executando procedimento verifca*/
exec verifica;



