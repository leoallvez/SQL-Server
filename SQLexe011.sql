create database exe11;

use exe11;

create table cadastro
(
	id int identity(1,1) primary key,
	nome varchar(45),
	data datetime
);

create procedure teste
as
begin
	declare @n varchar(40)
	set @n = (select USER)
	insert cadastro values (@n,GETDATE())
end;

exec teste;

drop procedure teste

drop table cadastro

delete from cadastro where nome = 'dbo'

select * from cadastro
