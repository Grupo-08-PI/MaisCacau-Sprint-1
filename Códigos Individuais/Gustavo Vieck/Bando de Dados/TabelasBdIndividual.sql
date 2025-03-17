CREATE DATABASE TabelasIndividuais;
USE TabelasIndividuais;

CREATE TABLE cadastro(
idCadastro int primary key auto_increment,
cpf char(11) unique not null,
cnpj char(14) unique,
usuario VARCHAR(40) not null,
senha VARCHAR(40) not null,
email VARCHAR (50)not null,
sexo varchar (40),
constraint chkSexo check(sexo in ('Masculino','Feminino','Prefiro não comentar')),
cidade varchar(40),
ufEstado char(2)
);

insert into cadastro(cpf,cnpj,usuario,senha,email,sexo,cidade,ufEstado) values
('63452314567','12345676543526','Matheus_Silva_Souza','batatinha123','matheus.souza@yahoo.com','Prefiro não comentar','Cariacica','ES'),		
('46246642112','42345376543426','Flavio_Robert','minhasenha10','flavio.souza@gmail.com','Masculino','São Paulo','SP'),		
('53246823451','75983028485013','Marilia_Donato','1234567MD','mari.donato@gmail.com','Feminino','Rio de Janeiro','RJ'),
('48947397293','95638273804982','Gustavo_Vieck','G8902','vieck.dores@hotmal.com','Masculino','Santo André','SP'),
('46824359639','28504829487017','Aline_Silva','Line123','aline.silva@gmail.com','Feminino','Salvador','BA'),		
('43532729355','85958509331982','Sandro_Guedes','SS4653','sandro.guedes@hotmail.com','Masculino','Belo Horizonte','MG');

SELECT idCadastro as 'ID', 
cpf as 'CPF',
cnpj as 'CNPJ',
usuario as 'Usuário',
senha as 'Senha',
email as 'Email',
sexo as 'Sexo',
cidade 'Cidade',
ufEstado 'UF' from cadastro;

-- SELECT para mostrar os dados dos usuários que moram em SP
SELECT * FROM cadastro WHERE ufEstado ='SP';

-- SELECT para mostrar os dados dos usuários que usam gmail
SELECT * FROM cadastro WHERE email LIKE "%gmail%";




CREATE TABLE sensores(
idSensor int primary key auto_increment,
nomeSensor varchar(40),
funcao varchar(40),
umidade DECIMAL(5,2),
statusSensor VARCHAR(40),
constraint chkSensor check(statusSensor in ('Ligado','Desligado')),
manutencao VARCHAR(40),
constraint chkManutencao check(manutencao in('Necessita de manutenção','Não necessita de manutenção'))
);

insert into sensores (nomeSensor,funcao,umidade,statusSensor,manutencao) values
('Sensor de Umidade de Solo Capacitivo','Medir o nível de umidade do solo','60','Ligado','Não necessita de manutenção'),
('Sensor de Umidade de Solo Capacitivo','Medir o nível de umidade do solo',null,'Desligado','Necessita de manutenção'),
('Sensor de Umidade de Solo Capacitivo','Medir o nível de umidade do solo','60','Ligado','Não necessita de manutenção'),
('Sensor de Umidade de Solo Capacitivo','Medir o nível de umidade do solo',null,'Desligado','Necessita de manutenção');


SELECT idSensor as 'ID', 
nomeSensor as 'Nome do Sensor',
 funcao as 'Função do Sensor',
 umidade as 'Umidade Percentual',
 statusSensor as 'Situação do Sensor',
 manutencao as 'Manutenção' from sensores;
 
 -- SELECT para mostrar os IDs dos sensores que precisam de manutenção
SELECT idSensor FROM sensores where manutencao = 'Necessita de manutenção';











CREATE TABLE plantacao(
idPlantacao int primary key auto_increment,
nomePlant varchar(40),
quantHectare int,
gastos DECIMAL(8,2),
qualidadeSolo varchar(20),
constraint chkSolo check(qualidadeSolo in ('Degradado','Conservado')),
tipoCacau varchar(20),
constraint chkCacau check(tipoCacau in ('Forasteiro','Crioulo','Trinitário')),
localPlant CHAR(2));

insert into plantacao(nomePlant,quantHectare,gastos,qualidadeSolo,tipoCacau,localPlant) values
('Rancho do pica-pau',14,10000,'Conservado','Crioulo','BA'),
('Fazendo do Tio Zé',20,40000,'Conservado','Trinitário','PA'),
('Sitio da Felicidade',15,50000,'Degradado','Crioulo','BA'),
('Fazenda do Sandro',30,300000,'Conservado','Forasteiro','MG');

SELECT idPlantacao as 'ID', 
nomePlant as 'Nome da Fazenda',
 quantHectare as 'Quantidade de Hectaes',
 gastos as  'Gastos',
 qualidadeSolo as 'Estado do Solo',
 tipoCacau as 'Tipo do Cacau Plantado',
 localPlant as 'UF da Plantação' from plantacao;

-- SELECT para mostrar os dados das fazendas com o solo conservado
SELECT * FROM plantacao where qualidadeSolo = 'Conservado';