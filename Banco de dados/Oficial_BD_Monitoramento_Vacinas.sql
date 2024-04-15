CREATE DATABASE vaccinTherm;
USE vaccinTherm;

CREATE TABLE Veiculo (
idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
placa VARCHAR(45),
modeloVeiculo VARCHAR(45),
responsavel VARCHAR(45)
);

CREATE TABLE Endereco (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
cep CHAR(9),
numero VARCHAR(45),
complemento VARCHAR(45)
);

CREATE TABLE Cliente (
idCliente INT,
nome VARCHAR(45),
email VARCHAR(45),
senha VARCHAR(45),
cnpj CHAR(14),
telefone CHAR(12),
Mensagem VARCHAR(300),
fkEndereco INT,
CONSTRAINT endereco_cliente FOREIGN KEY (fkEndereco) REFERENCES Endereco (idEndereco),
CONSTRAINT pkCliente PRIMARY KEY (idCliente,fkEndereco)
);

CREATE TABLE Sensor (
idSensor INT, 
nome VARCHAR(45),
status VARCHAR(45),
CONSTRAINT chkSensor CHECK (status in ('ativo', 'inativo')),
fkVeiculo INT,
CONSTRAINT veiculo_sensor FOREIGN KEY (fkVeiculo) REFERENCES Veiculo (idVeiculo),
CONSTRAINT pkSensor PRIMARY KEY (idSensor, fkVeiculo)
);



CREATE TABLE Vacina (
idVacina INT,
nome VARCHAR(45),
tipo VARCHAR(45),
temperatura_maxima_suportada DECIMAL (4,2),
temperatura_minima_suportada DECIMAL (4,2),
umidade_maxima_suportada INT,
umidade_minima_suportada INT,
fkVeiculo INT,
CONSTRAINT veiculo FOREIGN KEY (fkVeiculo) REFERENCES Veiculo (idVeiculo),
fkEndereco_vacina INT,
CONSTRAINT endereco_vacina FOREIGN KEY (fkEndereco_vacina) REFERENCES Endereco (idEndereco),
fkVeiculo_vacina INT,
CONSTRAINT Veiculo_vacina FOREIGN KEY (fkVeiculo_vacina) REFERENCES Veiculo (idVeiculo),
CONSTRAINT pk_vacina PRIMARY KEY (idVacina, fkEndereco_vacina,fkVeiculo_vacina)
);

CREATE TABLE Registro(
idRegistro INT,
data_hora DATE,
dht11_temperatura DECIMAL (4,2),
dht11_umidade INT,
fkCliente INT,
CONSTRAINT registroCliente FOREIGN KEY (fkCliente) REFERENCES Cliente (idCliente),
fkSensor INT, 
CONSTRAINT registro_sensor FOREIGN KEY  (fkSensor) REFERENCES Sensor (idSensor),
fkVacina INT, 
CONSTRAINT registro_Vacina FOREIGN KEY  (fkVacina) REFERENCES Vacina (idVacina),
CONSTRAINT pkRegistro PRIMARY KEY (idRegistro, fkCliente, fkSensor) 
);