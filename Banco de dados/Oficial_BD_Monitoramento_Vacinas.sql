CREATE DATABASE vaccinTherm;
USE vaccinTherm;

CREATE TABLE Veiculo (
idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
placa VARCHAR(45),
modeloVeiculo VARCHAR(45),
corVeicuo VARCHAR(45),
responsavel VARCHAR(45)
);

CREATE TABLE Endereco (
idDestino INT PRIMARY KEY AUTO_INCREMENT,
estado VARCHAR(45),
cidade VARCHAR(45),
logradouro VARCHAR(45),
numero VARCHAR(45),
complemento VARCHAR(45),
fkVeiculo INT,
CONSTRAINT endereco_veiculo FOREIGN KEY (fkVeiculo) REFERENCES Veiculo (idVeiculo)
);

CREATE TABLE Cliente (
idCliente INT,
nome VARCHAR(45),
email VARCHAR(45),
senha VARCHAR(45),
cnpj VARCHAR(45),
telefone CHAR(12),
Mensagem VARCHAR(300),
fkVeiculo_entrega INT,
CONSTRAINT endereco_veiculo_entrega FOREIGN KEY (fkVeiculo_entrega) REFERENCES Veiculo (idVeiculo),
fkEndereco INT,
CONSTRAINT endereco_cliente FOREIGN KEY (fkEndereco) REFERENCES Endereco (idEndereco)

);

CREATE TABLE Sensor (
idSensor INT, 
nome VARCHAR(45),
status VARCHAR(45),
CONSTRAINT chkSensor CHECK (status in ('ativo', 'inativo')),
fkIdentificacao_veiculo INT

);

CREATE TABLE Vacina (
idVacina INT,
nome VARCHAR(45),
tipo VARCHAR(45),
temperatura_maxima_suportada DECIMAL (4,2),
temperatura_minima_suportada DECIMAL (4,2),
umidade_maxima_suportada DECIMAL (4,2),
umidade_maxima_suportada DECIMAL (4,2),
fkendereco_destino INT,
CONSTRAINT endereco_destino FOREIGN KEY (fkendereco_destino) REFERENCES endereco (idEndereco),
fkSensor INT,
CONSTRAINT sensor_vacina FOREIGN KEY (fkSensor) REFERENCES Sensor (idSensor)

);