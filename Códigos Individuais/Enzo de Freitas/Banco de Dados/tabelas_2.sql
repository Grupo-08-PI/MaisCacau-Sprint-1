CREATE DATABASE projeto;
USE projeto;

CREATE Table cadastroCpf (
id INT PRIMARY KEY AUTO_INCREMENT,
cpf char (11) unique,
rg char (11) unique,
nome varchar (50),
cep char (8),
endereco varchar (50),
email varchar (30),
senha varchar (30),
dtNasc date,
sexo varchar(30),
telefone varchar (15)
);

INSERT INTO cadastroCpf (cpf, rg, nome, cep, endereco, email, senha, dtNasc, sexo, telefone)
VALUES 
('12345678901', '123456789', 'João Silva', '12345678', 'Rua A, 123', 'joao.silva@gmail.com', 'bananinha123', '1990-05-10', 'Masculino', '11987654321'),
('23456789012', '234567890', 'Maria Oliveira', '23456789', 'Avenida B, 456', 'maria.oliveira@gmail.com', 'abacaxizinho321', '1985-08-22', 'Feminino', '11976543210'),
('34567890123', '345678901', 'Carlos Pereira', '34567890', 'Travessa C, 789', 'carlos.pereira@gmail.com', 'doidera123', '2000-02-15', 'Masculino', '11965432109'),
('45678901234', '456789012', 'Ana Costa', '45678901', 'Rua D, 101', 'ana.costa@gmail.com', 'doiderademais1234', '1995-12-30', 'Feminino', '11954321098');

UPDATE cadastroCpf SET nome = 'Breno de Assis'
	WHERE id = 1;

SELECT nome FROM cadastroCpf;


ALTER TABLE cadastroCPF RENAME COLUMN id TO idCad;

	

CREATE TABLE cadastrpoCnpj (
id INT PRIMARY KEY AUTO_INCREMENT,
cnpj char (14), 
cep char (8),
endereco varchar (50),
email varchar (30),
senha varchar (30),
razaoSocial varchar (50) unique,
nomeFantasia varchar (50) unique,
ativPrimaria varchar (50),
ativSecundaria varchar (50),
telefone INT,
responsavel varchar (50),
dataAbertura date
);

RENAME TABLE cadastrpoCnpj TO cadastroCnpj;

INSERT INTO cadastroCnpj (cnpj, cep, endereco, email, senha, razaoSocial, nomeFantasia, ativPrimaria, ativSecundaria, telefone, responsavel, dataAbertura)
VALUES 
('12345678000199', '12345678', 'Rua A, 100', 'empresa1@gmail.com', 'loucura12', 'Empresa Exemplo Ltda', 'Exemplo Soluções', 'Agrícola', 'Consultoria Empresarial', 1123456789, 'João Silva', '2010-03-15'),
('23456789000123', '23456789', 'Avenida B, 200', 'empresa2@gmail.com', 'livrinho123', 'Soluções Criativas S/A', 'Soluções Criativas', 'Agrícola', null, 1123456790, 'Maria Oliveira', '2015-06-20'),
('34567890000145', '34567890', 'Travessa C, 300', 'empresa3@gmail.com', 'tamandua123', 'Supermercados ABC Ltda', 'SuperABC', 'Agrícola', 'Distribuição de Produtos Alimentícios', 1134567891, 'Carlos Pereira', '2012-08-10'),
('45678901234567', '45678901', 'Rua D, 400', 'empresa4@gmail.com', 'pinguim1234', 'Consultoria Tech Ltda', 'Tech Consultoria', 'Agrícola', null, 1145678901, 'Ana Costa', '2018-11-05');

select * from cadastroCnpj;

CREATE TABLE sensor (
id INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR (30),
modelo VARCHAR (20),
unid_medida VARCHAR (10),
dtInstalacao DATE,
dtManutencao DATE,
statusSensor VARCHAR(30),
CONSTRAINT chkStatus 
CHECK (statusSensor IN ('Ativo', 'Inativo', 'Em manutenção', 'Danificado')),
valor  INT,
comentario VARCHAR (100)
);


INSERT INTO sensor (tipo, modelo, unid_medida, dtInstalacao, dtManutencao, statusSensor, valor, comentario)
VALUES 
('Umidade de Solo Capacitivo', 'Modelo 123', '%', '2023-03-15', '2024-03-15', 'Ativo', 45, 'Sensor instalado no campo A para monitoramento de umidade do solo'),
('Umidade de Solo Capacitivo', 'Modelo 123', '%', '2023-06-20', '2024-06-20', 'Em manutenção', 50, 'Sensor precisa de calibragem devido a falha na leitura'),
('Umidade de Solo Capacitivo', 'Modelo 123', '°C', '2023-08-10', '2024-08-10', 'Ativo', 27, 'Sensor instalado para medir a temperatura ambiente do laboratório'),
('Umidade de Solo Capacitivo', 'Modelo 123', '°C', '222-12-05', '2024-12-05', 'Inativo', 0, 'Sensor desativado devido à substituição por outro modelo');

ALTER TABLE sensor RENAME COLUMN valor TO medicao;

SELECT * FROM sensor WHERE dtInstalacao LIKE '%5';

SELECT
concat ('O tipo ', tipo, ' ', modelo, ' foi instalado em ', dtInstalacao, ', tendo por última manutenção ', 
dtManutencao, ' com status ', statusSensor, ' e medição de ', medicao) AS 'VISUALIZACÃO DOS VALORES'FROM sensor;



