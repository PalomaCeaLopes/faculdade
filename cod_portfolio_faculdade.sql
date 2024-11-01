#criação do database
create database db_faculdade;
#ativação do database
use db_faculdade;
#criação da tabela de cadastro de alunos
create table tbl_alunos (
id_aluno INT auto_increment primary key,
nome varchar(100) not null,
cpf varchar(14) not null, 
data_nascimento date not null,
endereco varchar(255) not null,
telefone varchar(20) not null,
email varchar(100) not null
);
#criação da tabela de cadastro de professores
create table tbl_professores (
id_professor INT auto_increment primary key,
nome varchar(100) not null,
cpf varchar(14) not null,
data_nascimento date not null,
endereco varchar(255) not null,
telefone varchar(20) not null,
email varchar(100) not null
);
#criação da tabela de cadastro de cursos
create table tbl_cursos (
id_curso INT auto_increment primary key,
nome_curso varchar(100) not null,
descricao text not null
);
#criação da tabela de cadastro de matérias
create table tbl_materias (
id_materia INT auto_increment primary key,
nome_materia varchar(100) not null,
descricao text not null,
id_curso INT not null,
foreign key (id_curso) references tbl_cursos(id_curso)
);
#criação da tabela de cadastro de turmas
create table tbl_turmas (
id_turma INT auto_increment primary key,
id_curso INT not null,
id_materia INT not null, 
id_professor INT not null,
horario varchar(50) not null,
foreign key (id_curso) references tbl_cursos(id_curso),
foreign key (id_materia) references tbl_materias(id_materia),
foreign key (id_professor) references tbl_professores(id_professor)
);
#criação da tabela de cadastro de notas
create table tbl_notas (
id_nota INT auto_increment primary key,
id_aluno INT not null,
id_materia INT not null,
nota decimal(5,2) not null,
foreign key (id_aluno) references tbl_alunos(id_aluno),
foreign key (id_materia) references tbl_materias(id_materia)
);

#inserindo alguns alunos no banco de dados
insert into tbl_alunos (nome, cpf, data_nascimento, endereco, telefone, email) VALUES
('Pedro Moles', '121.451.736-10', '1995-11-05', 'Rua Penido Burnier, 1785', '11987658720', 'pedromoles@gmail.com'),
('Regina Silva Santos', '013.842.223-00', '1960-02-10', 'Rua Bravo Cavalcanti Costa, 157', '11984730533', 'regina@hotmail.com'),
('Maite Souza', '368.045.391-15', '1998-10-08', 'Avenida Comendador Brasileiro, 45', '11996187201', 'maite_souza@uol.com.br');

#inserindo alguns professores no banco de dados
insert into tbl_professores (nome, cpf, data_nascimento, endereco, telefone, email) VALUES
('Leonor Silva', '036.485.402-80', '1970-03-20', 'Rua Nova Esperança, 01', '11991274538', 'leonor.silva@hotmail.com'),
('Marisa Pegau', '035.482.014-54', '1960-04-13', 'Rua Praia Grande, 19', '11996145201', 'marisa_pegau1@outlook.com'),
('Paulo Henrique Fernandes', '468.000.166-48', '1978-12-11', 'Avenida Vida Nova, 548', '11985143030', 'paulohfernandes@uol.com.br');

#inserindo alguns cursos no banco de dados
insert into tbl_cursos (nome_curso, descricao) VALUES
('Letras', 'Curso de Letras com ênfase em português e espanhol.'),
('Administração', 'Curso de Administração com foco em gestão de empresas e desenvolvimento.'),
('Design Digital', 'Curso de Design Digital com ênfase em animações e programações.');

#inserindo algumas matérias no banco de dados
insert into tbl_materias (nome_materia, descricao, id_curso) VALUES
('Português', 'Introdução à Língua Portuguesa.', 1),
('Administração Financeira', 'Fundamentos da administração financeira.', 2),
('Adobe Animate', 'Recursos e Exportações de animações.', 3);

#inserindo algumas turmas no banco de dados
insert into tbl_turmas (id_curso, id_materia, id_professor, horario) VALUES
(1, 1, 1, 'Segunda e Quarta 8:00-10:00'),
(2, 2, 2, 'Terça e Quinta 10:00-12:00'),
(3, 3, 3, 'Sexta 14:00-16:00');

#inserindo algumas notas no banco de dados
insert into tbl_notas (id_aluno, id_materia, nota) VALUES
(1, 1, 8.5),
(2, 2, 7.0),
(3, 3, 9.2),
(1, 2, 6.5),
(2, 3, 8.0);






