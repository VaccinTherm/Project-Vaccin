-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE vaccinTherm;
USE vaccinTherm;

CREATE TABLE EMPRESA (
cnpj char(14) PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
mensagem VARCHAR(300)
);


CREATE TABLE USUARIO (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
celular char(11),
fkEmpresa char(14),
CONSTRAINT fkempresa_usuario FOREIGN KEY (fkEmpresa) REFERENCES EMPRESA(cnpj)
);

-- INSERIR OS VALORES DO USUÁRIO

INSERT INTO USUARIO VALUES
(DEFAULT, 'Fernanda', 'caramico@outlook.com', 'sptech.schol123', 11976543562, '12345678912345');


select * from usuario;
select * from empresa;

select * from usuario join empresa on usuario.fkempresa = empresa.cnpj;
