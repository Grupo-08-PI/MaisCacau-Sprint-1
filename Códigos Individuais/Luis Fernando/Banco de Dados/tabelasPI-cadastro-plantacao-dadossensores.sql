-- Criando o banco de dados pi.
CREATE DATABASE pi;

-- Usando o banco de dados.
USE pi;

-- PRIMEIRA TABELA
CREATE TABLE cadastro ( -- Criando a tabela cadastro no banco de dados pi.
idCadastro INT PRIMARY KEY auto_increment,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
telefone CHAR(11),
senha CHAR(10) NOT NULL,	
cidade VARCHAR(100),
estado VARCHAR(50),
cpf_cnpj VARCHAR(20) UNIQUE NOT NULL, -- único/não ser repetido e não deve ser nulo.
statusCadastro VARCHAR(15),
CONSTRAINT chkStatus CHECK( statusCadastro in('ativado', 'desativado')), -- Checar se apenas o status de cadastro está ativado ou desativado.
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
) auto_increment = 1;

-- Inserindo dados na tabela cadastro.
INSERT INTO cadastro (nome, email, telefone, senha, cidade, estado, cpf_cnpj, statusCadastro) VALUES 
('João Silva', 'joao.silva@gmail.com', '11987654321', '12345678', 'São Bernardo do Campo', 'SP', '123.456.789-00', 'ativado'),
('Maria Oliveira', 'maria.oliveira@hotmail.com', '11976543210', 'abcdef01', 'Belford Roxo', 'RJ', '987.654.321-00', 'desativado'),
('Carlos Pereira', 'carlos.pereira@gmail.com', '21987654321', 'password', 'Belo Horizonte', 'MG', '321.654.987-00', 'desativado'),
('Fernanda Souza', 'fernanda.souza@hotmail.com', '31976543210', 'qwerty12', 'Curitiba', 'PR', '456.789.123-00', 'ativado'),
('Roberto Santos', 'roberto.santos@gmail.com', '41987654321', '123qwert', 'Porto Alegre', 'RS', '654.987.321-00', 'ativado');

-- Exibindo dados da tabela cadastro.
SELECT * FROM cadastro;

-- Exibir todos os dados das pessoas cujo o nome começa com a letra "C".
SELECT * FROM cadastro WHERE nome LIKE 'C%';

-- Exibir estado, data de cadastro, cpf e cnpj da tabela cadastro onde o status do cadastro está ativado.
SELECT estado, dtCadastro, cpf_cnpj FROM cadastro WHERE statusCadastro = 'ativado';

-- Adicionando coluna 'RG' na tabela cadastro.
ALTER TABLE cadastro ADD COLUMN rg CHAR(9);

-- Atualizar RG da tabela cadastro.
UPDATE cadastro SET rg = '217103194' WHERE idCadastro = 1;
UPDATE cadastro SET rg = '231095910' WHERE idCadastro = 2;
UPDATE cadastro SET rg = '205171680' WHERE idCadastro = 3;
UPDATE cadastro SET rg = '469741466' WHERE idCadastro = 4;
UPDATE cadastro SET rg = '361828664' WHERE idCadastro = 5;

-- Usando o concat para ver quem fez o cadastro, e quando o realizou.
SELECT concat(nome, ' fez o cadastro em', date_format(dtCadastro, ' %d/%m/%Y %H:%m')) 
AS 'Quem fez e quando fez o cadastro' 
FROM cadastro;

-- Apelidando colunas.
SELECT nome AS 'Nome dos Clientes', 
rg AS 'Registro Geral (RG)', 
cpf_cnpj AS 'CPF ou CNPJ', 
cidade AS 'Cidade', 
estado AS 'Estado' FROM cadastro; 




-- SEGUNDA TABELA
CREATE TABLE plantacao ( -- Criando a tabela plantacao no banco de dados pi
idPlantacao INT PRIMARY KEY auto_increment,
nomedaFazenda VARCHAR(100),
cidade VARCHAR(100),
estado VARCHAR(100),
tipoCacau VARCHAR(50),
areaEmHectares DECIMAL (10,2),
dtPlantio DATE,
quantidadePlantas INT,
dtColheita DATE
)auto_increment = 1; -- id automático a partir do número 1, ou seja, a cada dado novo, soma 1 id novo.

-- Inserindo dados.
INSERT INTO plantacao (nomedaFazenda, cidade, estado, tipoCacau, areaEmHectares, dtPlantio, quantidadePlantas, dtColheita) VALUES 
('Fazenda Santa Rita', 'Ilhéus', 'Bahia', 'Forastero', 50.25, '2020-08-15', 50000, '2023-07-10'),
('Fazenda Cachoeira', 'Teixeira de Freitas', 'Bahia', 'Criollo', 30.50, '2019-05-20', 25000, '2022-06-05'),
('Fazenda Rio Branco', 'Vitória da Conquista', 'Bahia', 'Trinitario', 100.00, '2018-11-12', 100000, '2023-09-15'),
('Fazenda Boa Vista', 'Barreiras', 'Bahia', 'Forastero', 75.75, '2021-02-10', 75000, '2023-08-01'),
('Fazenda Pimenta', 'Guanambi', 'Bahia', 'Criollo', 40.00, '2022-03-30', 40000, '2024-01-15');

-- Exibindo dados da tabela.
SELECT * FROM plantacao;

-- Alterando nome da coluna quantidadePlantas para qtdMediaPlantas.
ALTER TABLE plantacao RENAME COLUMN quantidadePlantas TO qtdMediaPlantas;

-- Apelidando colunas  da tabela plantacao.
SELECT nomedaFazenda AS 'Nome da Fazenda', 
cidade AS 'Cidade', 
estado AS 'Estado', 
tipoCacau AS 'Tipo do Cacau', 
areaEmHectares AS 'Área em Hectares', 
dtPlantio AS 'Data de quando palntou', 
qtdMediaPlantas AS 'Quantidade de Plantas em Média',
dtColheita AS 'Data de Colheita' FROM plantacao;


-- TERCEIRA TABELA
CREATE TABLE dadosSensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR(100),
funcaoSensor VARCHAR(50),
localizacao VARCHAR(100),
umidadeSolo DECIMAL(5,2),
dataLeitura DATETIME DEFAULT CURRENT_TIMESTAMP,
statusSensor VARCHAR(10),
CONSTRAINT chkSensor CHECK(statusSensor in('Ativo', 'Inativo'))
) auto_increment = 1;

INSERT INTO dadosSensor (nomeSensor, funcaoSensor, localizacao, umidadeSolo, dataLeitura, statusSensor) VALUES 
('Sensor Umidade 1', 'Medir o solo', 'Plantação de Cacau, Setor 1', 65.50, '2025-03-01 08:00:00', 'Ativo'),
('Sensor Umidade 2', 'Medir o solo', 'Plantação de Cacau, Setor 2', 72.10, '2025-03-01 09:00:00', 'Ativo'),
('Sensor Umidade 3', 'Medir o solo', 'Plantação de Cacau, Setor A', 58.30, '2025-03-01 10:00:00', 'Inativo'),
('Sensor Umidade 4', 'Medir o solo', 'Plantação de Cacau, Setor 3', 45.75, '2025-03-01 11:00:00', 'Ativo'),
('Sensor Umidade 5', 'Medir o solo', 'Plantação de Cacau, Setor B', 80.00, '2025-03-01 12:00:00', 'Ativo');

SELECT * FROM dadosSensor;

-- Alterando nome da coluna umidadeSolo para valorUmidadeSolo na tabela dadosSensor.
ALTER TABLE dadosSensor RENAME COLUMN umidadeSolo TO valorUmidadeSolo;

-- Apelidando colunas da tabela dadosSensor.
SELECT nomeSensor AS 'Nome do Sensor', 
funcaoSensor AS 'Função do Sensor', 
localizacao AS 'Localização', 
valorUmidadeSolo AS 'Dados Captados pelo sensor', 
dataLeitura AS 'Data de Leitura do Sensor', 
statusSensor AS 'Status do Sensor' 
FROM dadosSensor;

-- Exibir apenas valor captado pelo sensor onde a localização é 'Plantação de Cacau, Setor 3.'
SELECT valorUmidadeSolo FROM dadosSensor WHERE localizacao = 'Plantação de Cacau, Setor 3';
