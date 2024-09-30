-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

create database consulta;
use consulta;

CREATE TABLE PACIENTE (
	numPaciente int PRIMARY KEY not null auto_increment,
	nome 		varchar(50) not null,
	endereco 	varchar(50) not null,
	telefone 	varchar(15) not null,
	dataNasc 	date		not null,
	RG 			varchar(15) not null,
	sexo 		char		not null,
	estadoCivil varchar(20) not null,
	convenio 	varchar(100)
);

-- consultar/selecionar todos os pacientes cadastrados
select * from paciente;
-- descreve ou exibe a estrutura da tabela
describe paciente;

CREATE TABLE MEDICO (
    crmMedico INT PRIMARY KEY not null AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) not null
);

describe medico;
select * from medico;

CREATE TABLE EXAME (
	idExame 	int PRIMARY KEY not null auto_increment,
	nome 		varchar(100) not null,
	descricao 	varchar(255) not null
);


CREATE TABLE CONSULTA (
	numConsulta 	int PRIMARY KEY not null auto_increment,
	dataConsulta 	date not null,
	diagnostico 	varchar(255) not null,
	numPaciente 	int not null,	-- chave estrangeira
	crmMedico 		int not null,	-- chave estrangeira
	FOREIGN KEY(numPaciente) REFERENCES PACIENTE (numPaciente),
	FOREIGN KEY(crmMedico)   REFERENCES MEDICO (crmMedico)
);

CREATE TABLE proceder (
	idListaExames 	int PRIMARY KEY not null auto_increment,
	dataExame 		date not null,
	idExame 		int not null,  	-- chave estrangeira
	numConsulta 	int not null,	-- chave estrangeira
	FOREIGN KEY(idExame) REFERENCES EXAME (idExame),
	FOREIGN KEY(numConsulta) REFERENCES CONSULTA (numConsulta)
);



