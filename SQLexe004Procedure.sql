create database proce;

use proce;

/*Criar uma procedure que imprime uma mensagem 'Helo World !' na tela*/
create procedure hello
as
begin
	print('Hello World!')
end

/*Executando a procedure hello'*/
exec hello;


/*Criando uma procedure com parametro*/
create procedure parametro
@x varchar(50) /*Definido parametro do procedimento*/
as
begin
	print(@x)
end

/*Executando uma procedure com paramento*/
exec parametro 'Banco de Dados SQL';

/*Definindo tabelas*/
create table aluno
(
	matricula int primary key,		/*Chave primaria*/
	nome varchar(50) not null,		/*Atributo não nulo*/
	cpf numeric(11) unique not null,/*Atributo unico não nulo*/
	sexo char(1) check(sexo in('F','M')) not null, /*checar se o atributo equivale a 'F' ou 'M' antes de atribuir*/
	endereco varchar(70) not null,
	cep varchar(9) not null
);

insert into aluno values(111,'Luis',37090548850,'M','Rua das Pedras','02952-230');
insert into aluno values(112,'Mara',47090543851,'F','Rua 45','02952-123');
insert into aluno values(113,'Dora',17090542851,'F','Rua das Vitória','12345-230');
insert into aluno values(114,'Bete',77090541851,'F','Rua das Dores','43210-230');
insert into aluno values(115,'Sara',47090540859,'F','Rua dos Pedras','02952-230');


/*Criar uma procedure da qual você passa o nome da pessoa como
  parametro e ela retorna uma tabela com o nome e o cpf*/
 create procedure busca
 @nome varchar(50) /*Definido parametro do procedimento*/
 as
 select nome as Nome, cpf as CPF
 from aluno
 where nome = @nome;
 
 /*Executando procedure busca*/
 exec busca 'Dora';
 
 /*Criar uma procedure que recebe um cep como parametro 
   e altera o mesmo para zero*/
create procedure zeracep
@cep varchar(9)/*Definido parametro do procedimento*/ 
as
update aluno
set cep = '0'
where cep = @cep;

/*Executando procedure zerarcep*/
exec zeracep '02952-230';
   
/*Verificando se a tabela foi alterada*/
select * from aluno;
   
/*Criar um procedimento que verifica se existe ou não cep zerados na tabela*/
create procedure cepzerado
as
	if exists(select cep from aluno where cep = '0') /*Teste lógico*/
		begin
			print('Existe CEP zerados na tabela!')
		end
	else
		begin
			print('A tabela esta OK!')
		end
     
/*Executando a procedure cepzerado*/
exec cepzerado;
   
/*Criar uma procedure que retorna a quantidade de ceps zerados
     caso não possua mostra mensagem*/
create procedure contacep
as
	if exists(select cep from aluno where cep ='0') /*Teste condicional*/
		begin
			declare @var varchar(50)/*Declarando váriavel local */
			set @var = (select COUNT(cep) from aluno where cep = '0') /*Inserindo valor na váriavel local*/
			print('Existem '+@var+' CEP zerado')
		end
	else
	    begin
			print('Nenhum CEP esta zerado')
	    end
	    
/*executanto a procedure contacep*/
execute contacep;

/*Criar uma procedure para trocar o sexo dos alunos*/

create procedure trocasexo
@var1 char(1),
@var2 char(1)
as
begin
	update aluno 
	set sexo = @var2
	where sexo = @var1
end

/*Executando procedure trocasexo*/
exec trocasexo 'M','F'
   
   
select * from aluno

update aluno 
set sexo = 'M'
where matricula = 111

/*Criando uma tabela chamada soma*/
create table soma(numero int, soma int);

/*Criando uma procedure da qual você passa um valor como
  parametro e ela vai inserindo linha por linha na tabela
  soma de forma crescente até chegar no valor passado como parametro */
create procedure while_insert
@numero int
as
declare @x int
set @x = 1
while (@x <= @numero)
begin
	insert into soma values (@x,@numero)
	set @x = @x + 1
	continue;
end
/*Executando procedure while_insert*/
exec while_insert 10

/*Visualizando tabela soma*/
select * from soma;

/*Criar um procedimento que indica a quantidade de aluno do sexo feminino e
  se não houver nehum, indicar "Não existem alunos do sexo feminino"*/
  create procedure verificaaluna
  as
  if exists (select sexo from aluno where sexo = 'F')
  begin
      declare @n varchar(4)
      set @n = (select COUNT(sexo) from aluno where sexo = 'F')
      print'Existem '+@n+' alunos do sexo feminino'
  end
  else
  begin
      print'Não existem alunos do sexo femininos'
  end;
 
  
  /*Executando procedimentos verificaaluna*/
  exec verificaaluna;
  
  /*Criar uma procedure que indica o nome do aluno a partir da sua
  matricula, que deve ser passada como parametro. se a matricula não
  existir deve indicar a mensagem "matricula não encontrada"*/
  create procedure pesquisa
  @mat varchar(45)
  as
  if exists(select matricula from aluno where matricula  = @mat)
	  begin
          declare @nome varchar(50)
          set @nome = (select nome from aluno where matricula = @mat)
	      print'Nome do aluno: '+@nome
      end
  else
      begin 
          print'Matricula não encontrada'
      end

/*Executando procedure pesquisa*/
exec pesquisa 111;

  



 