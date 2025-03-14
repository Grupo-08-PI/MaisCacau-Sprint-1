create database projeto;
use projeto;

/*
Integrantes do Grupo:
André Boer
Enzo de Freitas
Flavio Roberti
Gustavo Vieck
Luis Fernando
Sandro Guedes
*/



-- Criação da tabela Cliente cadastrados
create table cliente(
idCliente int primary key auto_increment, 
cpf char(11) unique not null,
cnpj char(14) unique,
nome varchar(100) not null,
email varchar(80) unique not null,
senha varchar(15) not null,
telefone char(11),
cidade varchar(60),
estadoUf char(2)
);

-- Inserindo dados dos clientes cadastrados
insert into cliente (cpf, cnpj, nome, email, senha, telefone, cidade, estadoUf) values
('02551289084','36742727000191','Jorge Cauã Freitas','jorginholeandro@gmail.com','jorge123','27983793113','Colatina','ES'),
('67209940189',null,'Filipe Paulo Drumond','filipepaulo@outlook.com','filipe321','63997950824','Gurupi','TO'),
('00331470195',null,'Ryan Alexandre Novaes','ryannovaes@yahoo.com.br','novaesryan','31998795436','Belo Horizonte','MG'),
('82936716888',null,'Nicolas Felipe Manuel Brito','nicolasmanuel@outlook.com','nicolas111222','51996296359','Porto Alegre','RS');

ALTER TABLE cliente ADD COLUMN rg CHAR(9);
UPDATE cliente SET rg = '26959551X' WHERE idCliente = 1;
UPDATE cliente SET rg = '411843588' WHERE idCliente = 2;
UPDATE cliente SET rg = '463045361' WHERE idCliente = 3;

-- Selecionando os dados dos clientes com apelidos para melhor visualização
SELECT cpf AS 'CPF',
	ifnull(cnpj, 'Não informado') AS 'CNPJ',
    nome AS 'Nome',
    email AS 'Email',
    senha AS 'Senha',
    telefone AS 'Telefone',
    cidade AS 'Cidade',
    estadoUf AS 'Estado',
    ifnull(rg, 'Não informado') as 'Rg'
		FROM cliente;



-- Criação da tabela dos dados recebidos dos sensores
create table dados(
idDados int primary key auto_increment,
nomeSensor varchar(50),
funcaoSensor varchar(50),
dadoUmidade varchar(4),
monitoramento varchar(50),
constraint chkMonit check(monitoramento in('Monitorando','Não Monitorando')),
situacao varchar(100),
constraint chkSituac check(situacao in('Operando normalmente','Necessita reparo')),
dtRegistro datetime default current_timestamp
);

insert into dados (nomeSensor, funcaoSensor, dadoUmidade, monitoramento, situacao) values
('Sensor de Umidade do Solo Capacitivo','Monitorar a umidade do solo','','Não Monitorando','Necessita reparo'),
('Sensor de Umidade do Solo Capacitivo','Monitorar a umidade do solo','56%','Monitorando','Operando normalmente'),
('Sensor de Umidade do Solo Capacitivo','Monitorar a umidade do solo','70%','Monitorando','Necessita reparo'),
('Sensor de Umidade do Solo Capacitivo','Monitorar a umidade do solo','','Não Monitorando','Operando normalmente');

update dados set dadoUmidade = null where idDados = 1;
update dados set dadoUmidade = null where idDados = 4;

-- Selecionando dados captados dos sensores com apelidos para melhor visualização
SELECT nomeSensor AS 'Nome do Sensor',
		funcaoSensor AS 'Função do Sensor',
        ifnull(dadoUmidade, 'Sem monitoramento') AS 'Dados Monitorados',
        monitoramento AS 'Monitoramento',
        situacao AS 'Situação do Sensor'
			FROM dados;



-- Criação da tabela das plantações
create table plantacao(
idPlant int primary key auto_increment,
nomeFazenda varchar(100) not null,
hectaresPlant varchar(50) not null,
tipoPlant varchar(50) not null,
constraint chkTipoPlant check(tipoPlant in('Sombreado','Pleno Sol','Extra-Tivista')),
tipoCacau varchar(50) not null,
constraint chkTipoCacau check(tipoCacau in('Criollo','Forasteiro','Trinitário')),
tipoClima varchar(50) not null,
dtPlantio date not null,
dtColheita date not null,
cidadePlant varchar(50) not null,
tipoAdubo varchar(50) not null
);

insert into plantacao (nomeFazenda, hectaresPlant, tipoPlant, tipoCacau, tipoClima, dtPlantio, dtColheita, cidadePlant, tipoAdubo) values
('Fazenda Feliz','105 Hectares','Sombreado','Criollo','Tropical Semi-Árido','2024-01-23','2024-06-12','Bahia','Orgânico'),
('Rancho Choco','70 Hectares','Extra-Tivista','Trinitário','Tropical Semi-Úmido','2025-02-15',null,'Mato-Grosso','Mineral'),
('Fazenda Santa Origem','87 Hectares','Sombreado','Forasteiro','Equatorial','2024-12-01',null,'Pará','Orgânico'),
('Fazenda do Titio','129 Hectares','Pleno Sol','Trinitário','Tropical Úmido','2024-06-04','2025-01-26','Espirito Santo','Mineral');

SELECT nomeFazenda AS 'Nome da Fazenda',
	hectaresPlant AS 'Quantidade de Hectares',
    tipoPlant AS 'Tipo de Plantação',
    tipoCacau AS 'Tipo de Cacau Plantado',
    tipoClima AS 'Tipo de Clima',
    dtPlantio AS 'Data do Plantio',
    ifnull(dtColheita, 'Não colhido') AS 'Data da Colheita',
    cidadePlant AS 'Localização',
    tipoAdubo AS 'Tipo de Adubo' 
			FROM plantacao;