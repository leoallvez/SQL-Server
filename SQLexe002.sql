CREATE DATABASE escola;

USE escola;

CREATE TABLE aluno
(
    rgm INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cpf NUMERIC(11) UNIQUE NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M','F')),
    nascimento DATE NOT NULL
);

CREATE TABLE curso
(
    cod_curso INT PRIMARY KEY,
    descricao VARCHAR(45) NOT NULL
);

CREATE TABLE professor
(
    matricula INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cpf NUMERIC (11) UNIQUE NOT NULL,
    telefone VARCHAR(11) UNIQUE,
    sexo CHAR(1) CHECK (SEXO IN ('M','F')),
    nascimento DATE NOT NULL
);

CREATE TABLE disciplina
(
    cod_disciplina INT PRIMARY KEY,
    descricao VARCHAR(45) NOT NULL

);

CREATE TABLE turma
(
    cod_turma INT PRIMARY KEY,
    cod_curso iNT NOT NULL,
    turmas CHAR(2) NOT NULL,
    ano NUMERIC(4) CHECK (ano BETWEEN 1990 AND 2090),
    periodo VARCHAR(20) NOT NULL,
    num_alunos INT NOT NULL,
    FOREIGN KEY (cod_curso) REFERENCES curso (cod_curso)
);

CREATE TABLE atribuicao
(
    cod_atrib INT PRIMARY KEY,
    matricula INT NOT NULL,
    cod_turma INT NOT NULL,
    cod_diciplina INT NOT NULL,
    FOREIGN KEY (matricula) REFERENCES professor (matricula),
    FOREIGN KEY (cod_turma) REFERENCES turma (cod_turma),
    FOREIGN KEY (cod_diciplina) REFERENCES disciplina (cod_disciplina)
);

CREATE TABLE alunoxturma
(
    cod_ligacao INT NOT NULL,
    rgm INT NOT NULL,
    cod_turma INT NOT NULL,
    FOREIGN KEY (rgm) REFERENCES aluno (rgm),
    FOREIGN KEY (cod_turma) REFERENCES turma (cod_turma)
);

INSERT INTO aluno VALUES(001,'Leonardo Pereira Alves',37090548856,988109642,'M','1982/09/05');
INSERT INTO aluno VALUES(002,'Lucas de Almeida Alves',12345678901,889944332,'M','2007/10/17');
INSERT INTO aluno VALUES(003,'Claudia de Almeida Alves',88908822222,666665555,'F','2011/08/02');
INSERT INTO aluno VALUES(004,'Stefhany Almeida Alves',66093548854,988109642,'F','1982/09/05');
INSERT INTO aluno VALUES(005,'Fernando da Silva',37090547856,988109765,'M','1950/12/25');
INSERT INTO aluno VALUES(006,'Silvia de Ferreira ',47190568856,178179649,'F','1997/05/01');
INSERT INTO aluno VALUES(007,'José Geraldo da Bahia',33367578856,988189642,'M','1930/03/30');
INSERT INTO aluno VALUES(008,'Janaina da Glória',88090048877,977179345,'F','1990/07/05');
INSERT INTO aluno VALUES(009,'Luciana Belinda Natalina',99990448856,788109646,'F','1991/03/30');
INSERT INTO aluno VALUES(010,'Estela Maria ',17690568350,911109688,'F','1970/07/06');

INSERT INTO curso VALUES(001,'Sistema de Informação');
INSERT INTO curso VALUES(002,'Direito');
INSERT INTO curso VALUES(003,'Medicina');
INSERT INTO curso VALUES(004,'Educação Fisica');
INSERT INTO curSo VALUES(005,'Psicologia');
INSERT INTO curso VALUES(006,'Cinema');
INSERT INTO curso VALUES(007,'Engenharia de Produção');
INSERT INTO curso VALUES(008,'Designer Gráfico');
INSERT INTO curso VALUES(009,'História');
INSERT INTO curso VALUES(010,'Letras');
INSERT INTO curso VALUES(011,'Filosofia');
INSERT INTO curso VALUES(012,'Enfermagem');
INSERT INTO curso VALUES(013,'Ciencia da Computação');
INSERT INTO curso VALUES(014,'Biblioteconomia');
INSERT INTO curso VALUES(015,'Jornalismo');
INSERT INTO curso VALUES(016,'Administração de Empresas');
INSERT INTO curso VALUES(017,'Arquitetura');
INSERT INTO curso VALUES(018,'Agronomia');
INSERT INTO curso VALUES(019,'Veterinaria');
INSERT INTO curso VALUES(020,'Teologia');
INSERT INTO curso VALUES(021,'Zoologia');

INSERT INTO professor VALUES(001,'Bene',11111111111,'22222222222','M','1930/01/01');
INSERT INTO professor VALUES(002,'Lima',22222222222,'33333333333','M','1950/02/02');
INSERT INTO professor VALUES(003,'Marcos',33333333333,'44444444444','M','1980/03/03');
INSERT INTO professor VALUES(004,'Panda',44444444444,'55555555555','M','1966/06/08');
INSERT INTO professor VALUES(005,'Felisbino',55555555555,'66666666666','M','1972/09/07');

INSERT INTO disciplina VALUES(001,'Arquitetura e Organização de Computadores');
INSERT INTO disciplina VALUES(002,'Ética');
INSERT INTO disciplina VALUES(003,'Lógica de Programação');
INSERT INTO disciplina VALUES(004,'Redes');
INSERT INTO disciplina VALUES(005,'Sistema de Informação');
INSERT INTO disciplina VALUES(006,'Técnicas de Programação I');
INSERT INTO disciplina VALUES(007,'Analise Estruturada de Sistemas');
INSERT INTO disciplina VALUES(008,'Estatíticas');
INSERT INTO disciplina VALUES(009,'Sistemas Operacionais');
INSERT INTO disciplina VALUES(010,'Técnicas de Programação II');
INSERT INTO disciplina VALUES(011,'Ambientes Visuais');
INSERT INTO disciplina VALUES(012,'Analise Orientada a Objeto');
INSERT INTO disciplina VALUES(013,'Banco de Dados');
INSERT INTO disciplina VALUES(014,'Estrutura denLineares de Dados');
INSERT INTO disciplina VALUES(015,'Implementação Orientada a objetos');
INSERT INTO disciplina VALUES(016,'Projeto Lógico Estruturado de Software');
INSERT INTO disciplina VALUES(017,'Seguraça da Informação');
INSERT INTO disciplina VALUES(018,'Projeto Orientado a Objeto');
INSERT INTO disciplina VALUES(019,'Programação de Banco de Dados');
INSERT INTO disciplina VALUES(020,'Estrutura e Complexidade de Algoritmo');
INSERT INTO disciplina VALUES(021,'Aplicativo para Internet');

INSERT INTO turma VALUES (001,001,'A',2015,'Primeiro Semestre',30);
INSERT INTO turma VALUES (002,001,'A',2015,'Segundo Semestre',70);
INSERT INTO turma VALUES (003,001,'A',2015,'Terceiro Semestre',23);
INSERT INTO turma VALUES (004,001,'A',2015,'Quarto Semestre',54);
INSERT INTO turma VALUES (005,001,'A',2015,'Quinto Semestre', 22);
INSERT INTO turma VALUES (006,001,'A',2015,'Sexto Semestre', 19);
INSERT INTO turma VALUES (007,001,'A',2015,'Setimo Semestre',17);
INSERT INTO turma VALUES (008,001,'A',2015,'Oitavo Semestre',15);
INSERT INTO turma VALUES (009,002,'B',2014,'Primeiro Semestre',38);
INSERT INTO turma VALUES (010,002,'B',2014,'Segundo Semestre',66);
INSERT INTO turma VALUES (011,002,'B',2014,'Terceiro Semestre',55);
INSERT INTO turma VALUES (012,002,'B',2014,'Quarto Semestre',56);
INSERT INTO turma VALUES (013,002,'B',2014,'Quinto Semestre', 34);
INSERT INTO turma VALUES (014,002,'B',2014,'Sexto Semestre', 33);
INSERT INTO turma VALUES (015,002,'B',2014,'Setimo Semestre',20);
INSERT INTO turma VALUES (016,002,'B',2014,'Oitavo Semestre',10);

INSERT INTO turma VALUES (017,003,'C',2014,'Primeiro Semestre',31);
INSERT INTO turma VALUES (018,003,'C',2014,'Segundo Semestre',56);
INSERT INTO turma VALUES (019,003,'C',2014,'Terceiro Semestre',45);
INSERT INTO turma VALUES (020,003,'C',2014,'Quarto Semestre',46);
INSERT INTO turma VALUES (021,003,'C',2014,'Quinto Semestre',33);
INSERT INTO turma VALUES (022,003,'C',2014,'Sexto Semestre', 23);
INSERT INTO turma VALUES (023,003,'C',2014,'Setimo Semestre',29);
INSERT INTO turma VALUES (024,003,'C',2014,'Oitavo Semestre',70);

INSERT INTO turma VALUES (025,003,'C',2014,'Primeiro Semestre',31);
INSERT INTO turma VALUES (026,003,'C',2014,'Segundo Semestre',54);
INSERT INTO turma VALUES (027,003,'C',2014,'Terceiro Semestre',25);
INSERT INTO turma VALUES (028,003,'C',2014,'Quarto Semestre',36);
INSERT INTO turma VALUES (029,003,'C',2014,'Quinto Semestre',13);
INSERT INTO turma VALUES (030,003,'C',2014,'Sexto Semestre', 33);
INSERT INTO turma VALUES (031,003,'C',2014,'Setimo Semestre',29);
INSERT INTO turma VALUES (032,003,'C',2014,'Oitavo Semestre',20);

INSERT INTO turma VALUES (033,003,'D',2013,'Primeiro Semestre',32);
INSERT INTO turma VALUES (034,003,'D',2013,'Segundo Semestre',16);
INSERT INTO turma VALUES (035,003,'D',2013,'Terceiro Semestre',25);
INSERT INTO turma VALUES (036,003,'D',2013,'Quarto Semestre',26);
INSERT INTO turma VALUES (037,003,'D',2013,'Quinto Semestre',13);
INSERT INTO turma VALUES (038,003,'D',2013,'Sexto Semestre', 33);
INSERT INTO turma VALUES (039,003,'D',2013,'Setimo Semestre',39);
INSERT INTO turma VALUES (040,003,'D',2013,'Oitavo Semestre',76);

INSERT INTO atribuicao VALUES (001,001,001,003);
INSERT INTO atribuicao VALUES (002,002,002,002);
INSERT INTO atribuicao VALUES (003,003,003,003);
INSERT INTO atribuicao VALUES (004,004,004,004);
INSERT INTO atribuicao VALUES (005,005,005,005);

INSERT INTO alunoxturma VALUES (001,001,001);
INSERT INTO alunoxturma VALUES (002,002,002);
INSERT INTO alunoxturma VALUES (003,003,003);
INSERT INTO alunoxturma VALUES (004,004,004);
INSERT INTO alunoxturma VALUES (005,005,005);

/*Selecionar a turma que possui mais alunos.*/
SELECT MAX(num_alunos) AS "Maior turma"
FROM turma;

/*Selecionar o professor mais velho*/
SELECT nome
FROM professor                                                                         
WHERE nascimento = (SELECT MAX(nascimento) FROM professor);

/*Criar uma view com a seguinte saída: | RGM  | Nome do Aluno | Curso | Turma |*/
CREATE VIEW view_letraf AS
SELECT aluno.rgm as RGM, aluno.nome as 'Nome do Aluno', curso.descricao as Curso, turma.turmas as Turma 
FROM turma 
inner join curso       ON turma.cod_curso = curso.cod_curso
inner join atribuicao  ON turma.cod_turma = atribuicao.cod_turma
inner join alunoxturma ON turma.cod_turma = alunoxturma.cod_turma
inner join aluno       ON aluno.rgm = alunoxturma.rgm;

/*Selecionar view*/
SELECT * FROM view_letraf

drop view view_letraf

/*Selecionar os nomes dos professores, suas disciplinas e as turmas em que estão alocados.*/
SELECT professor.nome AS Professor, disciplina.descricao AS Disciplina, turma.turmas AS Turma
FROM professor 
INNER JOIN atribuicao ON atribuicao.matricula = professor.matricula
INNER JOIN disciplina ON disciplina.cod_disciplina = atribuicao.cod_diciplina
INNER JOIN turma ON turma.cod_turma = atribuicao.cod_turma
ORDER BY professor.nome;


