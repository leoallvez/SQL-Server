create database apostila;

use apostila;

create table cliente
(
	codigo_cliente int primary key,
	nome_cliente varchar(20) not null,
	endereco varchar(30),
	cidade varchar(15),
	cep numeric(8),
	uf char(2),
	cgc varchar(20),
	ie varchar(20)
);

create table vendedor
(
	codigo_vendedor int primary key,
	nome_vendedor varchar(20) not null,
	salario_fixo numeric(6,2),
	faixa_comissao char(1),
);

create table pedido
(
	num_pedido int primary key,
	prazo_entrega date not null,
	codigo_cliente int not null references cliente(codigo_cliente),
	codigo_vendedor int not null references vendedor(codigo_vendedor),	
);

create table produto
(
	codigo_produto int primary key,
	unidade varchar(3),
	decricao_produto varchar(30),
	val_unit numeric(6,2),
 );
 
 create table item_do_pedido
 (
	num_pedido int not null references pedido(num_pedido),
	codigo_produto int not null references produto(codigo_produto),
	quantidade int,
	primary key(num_pedido,codigo_produto)
 );
 
 create trigger cad_cliente
 on cliente
 for insert
 as
 print'Cliente cadastrado com sucesso!'
 
insert into cliente values(100,'Beto','Rua da Rosa','São Paulo',12345678,'SP','123456789','01');
insert into cliente values(101,'Mara','Rua do Vida','São Paulo',12345679,'SP','123456790','01');
insert into cliente values(102,'Caio','Rua da Hora','São Paulo',12345680,'SP','123456791','01');
insert into cliente values(103,'Lili','Rua da Bela','Minas Gerais',12345681,'MG','123456792','02');
insert into cliente values(104,'Sara','Rua do Caju','Minas Gerais',12345682,'MG','123456800','02');
insert into cliente values(105,'Luis','Rua do Gato','Minas Gerais',12345683,'MG','123456801','02');
insert into cliente values(106,'Iona','Rua da Bota','Rio de Janeiro',12345684,'RJ','123456802','03');
insert into cliente values(107,'João','Rua do Mato','Rio de Janeiro',12345685,'RJ','123456803','03');
insert into cliente values(108,'Rosa','Rua da Mina','Rio de Janeiro',12345686,'RJ','123456804','03');
insert into cliente values(109,'Belo','Rua do Feio','Rio de Janeiro',12345670,'RJ','123456805','03');

create view clientes(Codigo,Nome,Endereço,Cidade,CEP,UF)
as
select codigo_cliente, nome_cliente, endereco, 
	   cidade,cep,uf 
from cliente;

create trigger cad_vendedor
on vendedor
for insert
as
print'Vendedor cadastrado com sucesso'

insert into vendedor values(100,'Maria',2500.00,'A');
insert into vendedor values(101,'Thais',2500.00,'A');
insert into vendedor values(102,'Jorge',1500.00,'B');
insert into vendedor values(103,'Fabio',1500.00,'B');
insert into vendedor values(104,'Zelia',1000.00,'C');
insert into vendedor values(105,'Bruno',1000.00,'C');


create view vendedores(Codigo,Nome,Salario,Faixa) as
select * from vendedor;

select * from vendedores;

select distinct salario,faixa from vendedores order by faixa
