create database provam2;

use provam2;

create table pessoa
(
	id int primary key,
	nome varchar(30)
);

insert into pessoa values(1,'Beto');
insert into pessoa values(2,'Mara');
insert into pessoa values(3,'Luis');
insert into pessoa values(4,'Tais');
insert into pessoa values(5,'Sara');
insert into pessoa values(6,'Caio');
insert into pessoa values(7,'Kaka');
insert into pessoa values(8,'Zeus');
insert into pessoa values(9,'Dani');
insert into pessoa values(10,'Nana');

create index xpto on pessoa(id);

create login teste with password = '1234';

create user teste for login teste;
