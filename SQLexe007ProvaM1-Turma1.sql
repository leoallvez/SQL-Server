create database prova_m1;

use prova_m1;

/*A prova começa mostrando um diagrama de um banco de dados e pedindo para se criar um script que gere o mesmo.*/
create table cliente
(
	cod_cliente int primary key,
	nome varchar(45) not null,
	cpf numeric(11) not null unique,
	sexo char(1) check(sexo in('M','F')),
	endereco varchar(45),
	cep numeric(8),
	cidade varchar(45),
	estado char(2),
	fone numeric(11)
);

create table quarto
(
	cod_quarto int primary key,
	tipo varchar(45)
);

create table reserva
(
	cod_reserva int primary key,
	cod_cliente int references cliente(cod_cliente),
	cod_quarto int references quarto(cod_quarto),
	data_entrada date,
	data_saida date
);
/*Essa tabela só será usada na no final da prova e será povoada automaticamente*/
create table reserva_cancelada
(
	cod_reserva int primary key,
	cod_cliente int references cliente(cod_cliente),
	cod_quarto int references quarto(cod_quarto),
	data_entrada date,
	data_saida date
);
/*b)Criar uma trigger que mostra a mensagem 'Cliente cadastrado com sucesso! 
    quando adicionamos um registro na tabela cliente*/
create trigger registra
on cliente
for insert
as
print'Cliente cadastrado com sucesso!'

insert into cliente values(100,'Bete','37090548851','F','Rua das Flores','01234510','São Paulo','SP','12345671');
insert into cliente values(101,'Mara','37090548852','F','Rua dos Ventos','01234520','Minas Gerais','MG','12345672');
insert into cliente values(102,'Luis','37090548853','M','Rua das Cincos','01234530','Rio de Janeiro','RJ','12345673');
insert into cliente values(103,'Beto','37090548854','M','Rua dos Raios','01234540','São Paulo','SP','12345674');
insert into cliente values(104,'Zeze','37090548855','M','Rua dos Arcos','01234550','São Paulo','SP','12345675');

select * from cliente;

insert into quarto values(100,'Suite');
insert into quarto values(101,'Suite');
insert into quarto values(102,'Simples');
insert into quarto values(103,'Simples');
insert into quarto values(104,'Simples');


select distinct tipo from quarto;


insert into reserva values(100,100,100,'2015/10/01','2015/10/17');
insert into reserva values(101,101,101,'2014/10/01','2014/10/17');
insert into reserva values(102,102,102,'2013/10/01','2013/10/17');
insert into reserva values(103,103,103,'2012/10/01','2012/10/17');
insert into reserva values(104,104,104,'2011/10/01','2011/10/17');
insert into reserva values(105,100,100,'2016/10/01','2016/10/17');
insert into reserva values(106,100,100,'2017/10/01','2017/10/17');
insert into reserva values(107,100,100,'2018/10/01','2018/10/17');
insert into reserva values(108,100,104,'2018/10/01','2018/10/17');
insert into reserva values(109,100,100,'2014/10/20','2015/10/21');
insert into reserva values(110,100,100,'2014/10/19','2014/10/20');
insert into reserva values(111,100,100,'2015/10/20','2015/10/22');

select * from reserva;
/*a)Criar uma view que apresenta a seguinte saida: 
| Nome do Cliente |   CEP    | Tipo de Quarto| Data de Entrada | Data de Saida |*/
create view mostra
as
select nome as 'Nome do Cliente',
       cep as CEP,
       tipo as 'Tipo de Quarto',
       data_entrada as 'Data de Entrada',
       data_saida as 'Data de Saida'
from cliente
inner join reserva  on cliente.cod_cliente = reserva.cod_cliente
inner join quarto on quarto.cod_quarto =  reserva.cod_quarto

/*Executando a view mostra*/
select * from mostra;

/*c)Criar uma Stored Procedure que lista os nomes e telefone dos clientes onde a data de saida
na reserva ocorreu a mais de um ano*/
create procedure mais_de_um_ano /* sp_nomeprocedure */
as
begin
	if exists (select cod_cliente from reserva where data_saida < dateadd(yy,-1,GETDATE()))
		begin
			select nome, fone from cliente  where cod_cliente in(select cod_cliente from reserva where data_saida < dateadd(yy,-1,GETDATE()))
		end
    else
		begin
			print'Não existem reservas com mais de um ano'
		end 
end;
/*Executando a procedure*/
exec mais_de_um_ano;

/*d)Criar uma Stored Procedure que recebe o cpf do cliente como parâmetro e lista o tipo de quarto, 
data de entrada e saida das reservas futuras deste clinte*/
create procedure reservas_futuras
@cpf numeric(11)
as
if exists (select cpf from cliente where cpf = @cpf)
	begin
	    declare @n int 
	    set @n = (select cod_cliente from cliente where cpf = @cpf)
		if exists(select cod_reserva from reserva where data_entrada > GETDATE() and cod_cliente = @n)
			begin
				select tipo, data_entrada, data_saida
				from reserva 
				inner join quarto on reserva.cod_quarto = quarto.cod_quarto
				inner join cliente on cpf = @cpf
				where cod_reserva in (select cod_reserva from reserva where data_entrada > GETDATE())
			end
		else
			begin
				print 'Não existem reservas futuras para esse cliente'
			end
	end
else
    begin
		print'CPF não cadastrado'
    end
/*Executanto o procedimento*/
exec reservas_futuras '37090548851'

/*e)Criar uma Stored Procedure chamada Cancela_reserva 
 que recebe o codigo da reserva como parametro, copia 
 esse registro para uma tabela chamada 'Reservas_canceladas'
 que possui os mesmos atributos da tabela Reserva, e depois o remove.*/
create procedure cancela_reservas
@cod int
as
if exists (select cod_reserva from reserva where cod_reserva = @cod)
	begin
		declare
		@cod_cliente int,@cod_quarto int,@data_entrada date,@data_saida date
		set @cod_cliente  = (select cod_cliente  from reserva where cod_reserva = @cod)
		set @cod_quarto   = (select cod_quarto   from reserva where cod_reserva = @cod)
		set @data_entrada = (select data_entrada from reserva where cod_reserva = @cod)
		set @data_saida   = (select data_saida   from reserva where cod_reserva = @cod)
		
		insert into reserva_cancelada values(@cod,@cod_cliente,@cod_quarto,@data_entrada,@data_saida)
		delete from reserva where cod_reserva = @cod
	end
else
   begin
		print'Reserva não existe'
   end
/*Executando o procedimento*/
exec cancela_reservas 100

/*Testando o procedimento*/
select * from reserva

select * from reserva_cancelada



