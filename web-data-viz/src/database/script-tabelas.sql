-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE vaccinTherm;
USE vaccinTherm;

CREATE TABLE CADASTRO (
idCadastro int primary key auto_increment,
empresa varchar(45),
celular varchar(45),
representante varchar(45),
senha varchar(45),
email varchar(255),
cnpj varchar(100));

INSERT INTO CADASTRO (empresa, celular, representante, senha, email, cnpj) 
VALUES ('Minha Empresa', '99999999999', 'Representante', 'senha123', 'exemplo@email.com', '12345678901234');

select * from CADASTRO;