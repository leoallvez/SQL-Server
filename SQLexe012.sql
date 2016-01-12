CREATE DATABASE  locadora;
USE locadora; 
CREATE TABLE clientes
(
          cli_codigo 	INT,
          cli_nome  	VARCHAR(30),
          cli_cpf    	CHAR(12),
          cli_data_nasc DATE,
          cli_sexo   	CHAR(1),
          cli_email  	VARCHAR(50)                
);
CREATE TABLE filmes
(
          fil_codigo   INT,
          fil_titulo   VARCHAR(40),
          fil_genero   VARCHAR(15),
          fil_duracao  TIME,
          fil_situacao VARCHAR(12),
          fil_preco    NUMERIC(3,2) 
	); 
INSERT INTO clientes (cli_codigo, cli_nome, cli_cpf, cli_data_nasc, cli_sexo, cli_email)
VALUES (1, 'José da Silva', '123456789-10', '1980-12-10', 'M', 'joseSilva@cursoSQL.com'); 
INSERT INTO clientes (cli_codigo, cli_email, cli_nome, cli_cpf, cli_data_nasc, cli_sexo)
VALUES (2, 'mariaSilva@cursoSQL.com' , 'Maria da Silva', '012345678-99', '1982-02-28', 'F'); 
INSERT INTO clientes VALUES (3, 'Francisco da Silva', '109876543-21', '1990-01-01', 'M', 'franciscoSilva@cursoSQL.com'); 
INSERT INTO clientes (cli_codigo, cli_nome, cli_sexo, cli_email) 
VALUES (4, 'Francisca da Silva', 'F', 'franciscaSilva@cursoSQL.com'); 

INSERT INTO filmes(fil_codigo, fil_titulo, fil_genero, fil_duracao, fil_situacao, fil_preco) VALUES (1, 'E o vento Levou', 'romance', '0:02:00', 'alugado', 5.00);
INSERT INTO filmes(fil_codigo, fil_titulo, fil_genero, fil_duracao, fil_situacao, fil_preco) VALUES (2, 'O silêncio dos inocentes', 'policial', '0:02:00', 'disponível', 02.50);
INSERT INTO filmes VALUES (3, 'Procurando Nemo', 'animacao', '0:01:40', 'alugado', 02.50); 
INSERT INTO filmes(fil_codigo, fil_titulo, fil_genero, fil_situacao, fil_duracao) VALUES (4, 'Cidade de Deus', 'ação', 'disponível', '0:02:10');

select * from filmes;

select cli_nome as Nome,cli_email as 'E-mail'
from clientes
where cli_nome like '%a%'
order by cli_nome;

select COUNT(cli_nome) as 'Total de Clientes'
from clientes;


select MIN(fil_preco) as 'Menor preço', AVG(fil_preco) as 'Media de preço',MAX(fil_preco) as 'Maior preço'
from filmes;