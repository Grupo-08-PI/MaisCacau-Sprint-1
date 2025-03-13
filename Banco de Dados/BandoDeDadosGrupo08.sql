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


-- Criação das tabelas
create table cliente(
idCliente int primary key auto_increment, 
cpf char(11),
cnpj char(14),
nome varchar(100),
email varchar(80),
senha varchar(15),
telefone char(11),
cidade varchar(60),
estadoUf char(2)
);

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

create table plantacao(
idPlant int primary key auto_increment,
nomeFazenda varchar(100),
hectaresPlant varchar(50),
tipoPlant varchar(50),
constraint chkTipoPlant check(tipoPlant in('Sombreado','Pleno Sol','Extra-Tivista')),
tipoCacau varchar(50),
constraint chkTipoCacau check(tipoCacau in('Criollo','Forasteiro','Trinitário')),
tipoClima varchar(50),
dtPlantio date,
dtColheita date,
cidadePlant varchar(50),
tipoAdubo varchar(50)
);

-- Inserção de dados nas tabelas
insert into cliente (cpf, cnpj, nome, email, senha, telefone, cidade, estadoUf) values
('02551289084','36742727000191','Jorge Cauã Freitas','jorginholeandro@gmail.com','jorge123','27983793113','Colatina','ES'),
('67209940189','','Filipe Paulo Drumond','filipepaulo@outlook.com','filipe321','63997950824','Gurupi','TO'),
('00331470195','','Ryan Alexandre Novaes','ryannovaes@yahoo.com.br','novaesryan','31998795436','Belo Horizonte','MG'),
('82936716888','','Nicolas Felipe Manuel Brito','nicolasmanuel@outlook.com','nicolas111222','51996296359','Porto Alegre','RS');

insert into dados (nomeSensor, funcaoSensor, dadoUmidade, monitoramento, situacao) values
('Sensor de Umidade do Solo Capacitivo','Monitorar a umidade do solo','','Não Monitorando','Necessita reparo'),
('Sensor de Umidade do Solo Capacitivo','Monitorar a umidade do solo','56%','Monitorando','Operando normalmente'),
('Sensor de Umidade do Solo Capacitivo','Monitorar a umidade do solo','70%','Monitorando','Necessita reparo'),
('Sensor de Umidade do Solo Capacitivo','Monitorar a umidade do solo','','Não Monitorando','Operando normalmente');

insert into plantacao (nomeFazenda, hectaresPlant, tipoPlant, tipoCacau, tipoClima, dtPlantio, dtColheita, cidadePlant, tipoAdubo) values
('Fazenda Feliz','105 Hectares','Sombreado','Criollo','Tropical Semi-Árido','2024-01-23','2024-06-12','Bahia','Orgânico'),
('Rancho Choco','70 Hectares','Extra-Tivista','Trinitário','Tropical Semi-Úmido','2025-02-15',null,'Mato-Grosso','Mineral'),
('Fazenda Santa Origem','87 Hectares','Sombreado','Forasteiro','Equatorial','2024-12-01',null,'Pará','Orgânico'),
('Fazenda do Titio','129 Hectares','Pleno Sol','Trinitário','Tropical Úmido','2024-06-04','2025-01-26','Espirito Santo','Mineral');



SELECT cpf AS 'CPF',
	cnpj AS 'CNPJ',
    nome AS 'Nome',
    email AS 'Email',
    senha AS 'Senha',
    telefone AS 'Telefone',
    cidade AS 'Cidade',
    estadoUf AS 'Estado'
		FROM cliente;
        

SELECT nomeSensor AS 'Nome do Sensor',
		funcaoSensor AS 'Função do Sensor',
        dadoUmidade AS 'Dados Monitorados',
        monitoramento AS 'Monitoramento',
        situacao AS 'Situação do Sensor'
			FROM dados;


SELECT nomeFazenda AS 'Nome da Fazenda',
	hectaresPlant AS 'Quantidade de Hectares',
    tipoPlant AS 'Tipo de Plantação',
    tipoCacau AS 'Tipo de Cacau Plantado',
    tipoClima AS 'Tipo de Clima',
    dtPlantio AS 'Data do Plantio',
    dtColheita AS 'Data da Colheita',
    cidadePlant AS 'Localização',
    tipoAdubo AS 'Tipo de Adubo' 
			FROM plantacao;
            
select * from cliente, dados, plantacao;