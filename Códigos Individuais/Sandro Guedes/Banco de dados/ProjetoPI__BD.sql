create database projetoPI;

use projetoPI;

create table cadastro(
idCadastro int primary key auto_increment,
nome varchar(50) not null,
cpf char(11) unique not null,
cnpj char(14) unique,
cidade varchar(30),
estado char(2),
email varchar(35)
);

insert into cadastro (nome, cpf, cnpj, cidade, estado, email) values
('Sandro da Silva', '71354042034', '95560400000168', 'Muribeca', 'BA', 'sandro2314912348silva@hotmail.com'),
('Andre Guimaraes', '03847384007', '97100616000176', 'Belém', 'PA', 'andre123121414514guimaraes@hotmail.com'),
('Pedro Alesandro', '71973212048', '83350002000138', 'Moita Bonita', 'SE', 'pedro3412234112alesandro@hotmail.com'),
('Gustavo Pereira', '46863370034', '22716732000115', 'Abaiara', 'CE', 'gustavo3412423123pereira@hotmail.com'),
('Luis Fernando Lopes', '00740478095', '53898275000150', 'Ibitiré', 'MG', 'luis3454232345fernando@hotmail.com'),
('Enzo Henrique', '65212792037', '81284998000103', 'São Paulo', 'SP', 'enzo1231245henrique@hotmail.com'),
('Flavio Palmares', '65379799132', '07299695000101', 'Itabaianinha', 'SE', 'flavio6663442palmares@hotmail.com');

select idCadastro as 'ID do cadastro',
       nome as 'Nome do usuário',
       cpf as 'CPF do usuário',
       cnpj as 'CNPJ do usuário',
       cidade as 'Cidade do usuário',
       estado as 'Estado do usuário',
       email as 'Email do usuário'
       from cadastro;

create table dados(
idSensor int primary key auto_increment,
nomeSensor varchar(50),
funcaoSensor varchar(50),
statusSensor varchar(15),
constraint chkstatusSensor check(statusSensor in('ativo', 'inativo')),
saudeSensor decimal(5,2),
statusSolo varchar(30),
constraint chkstatusSolo check(statusSolo in('fértil', 'infértil'))
);

insert into dados (nomeSensor, funcaoSensor, statusSensor, saudeSensor, statusSolo) values
('Sensor de Umidade do Solo Capacitivo', 'Medir umidade do solo', 'ativo', '95%', 'fértil'),
('Sensor de Umidade do Solo Capacitivo', 'Medir umidade do solo', 'ativo', '100%', 'fértil'),
('Sensor de Umidade do Solo Capacitivo', 'Medir umidade do solo', 'ativo', '99%', 'fértil'),
('Sensor de Umidade do Solo Capacitivo', 'Medir umidade do solo', 'ativo', '77%', 'fértil'),
('Sensor de Umidade do Solo Capacitivo', 'Medir umidade do solo', 'ativo', '82%', 'fértil'),
('Sensor de Umidade do Solo Capacitivo', 'Medir umidade do solo', 'inativo',' ', 'infértil');

select idSensor as 'ID do sensor',
	   nomeSensor as 'Nome do sensor',
       funcaoSensor as 'Função do sensor',
       statusSensor as 'Status de funcionamento do sensor',
       saudeSensor as 'Saúde do sensor (dispositivo)',
       statusSolo as 'Situação do solo'
       from dados;



create table plantacao (
id int primary key auto_increment,
nomeFazenda varchar(30),
quantidade int,
dataPlantacao date,
dataColheita date
);

insert into plantacao (nomeFazenda, quantidade, dataPlantacao, dataColheita) values
('Rancho da Alegria', 9500 , '2024-04-15', '2024-10-18'),
('Fazenda do Cacau', 10600 , '2024-06-12', '2024-12-19'),
('Fazenda Feliz', 10200 , '2024-08-01', '2025-02-04'),
('Rancho Cacaueiro', 7600 , '2024-07-27', '2025-01-20'),
('Rancho dos Amigos', 8600 , '2024-08-15', '2024-02-01'),
('Stardew Valley', 2100 , '2024-09-02', '2025-03-03');

select  id as 'ID da plantação',
	   nomeFazenda as 'Nome da fazenda',
	   quantidade as 'Quantidade da colheita',
       dataPlantacao as 'Data da plantação',
       dataColheita as 'Data da colheita'
       from plantacao;



