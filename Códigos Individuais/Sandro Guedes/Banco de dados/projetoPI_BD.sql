create database projetoPI;

use projetoPI;

create table CadastroPI(
idCadastro int primary key auto_increment,
nome varchar(50),
cpf decimal(11),
cnpj decimal(14),
usuario char(18)
);

create table sensoresPI(
idSensor int primary key auto_increment,
nomeSensor varchar(30),
statusSensor varchar(15),
saudeSensor decimal(5,2)
);

create table cacauPI (
id int primary key auto_increment,
quantidade int,
perdas int,
statusSolo decimal(5,2),
avisoSolo varchar(30)
);

alter table sensoresPI add constraint chkstatusSensor check (statusSensor in('ativado', 'desativado'));

