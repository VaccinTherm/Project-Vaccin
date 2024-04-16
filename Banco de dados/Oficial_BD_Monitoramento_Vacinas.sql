CREATE DATABASE vaccinTherm;
USE vaccinTherm;

CREATE TABLE Veiculo (
idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
placa VARCHAR(45) NOT NULL,
modeloVeiculo VARCHAR(45),
responsavel VARCHAR(45) NOT NULL
);

INSERT INTO Veiculo VALUES 
(DEFAULT, 'AAAA123', NULL, 'Henrique'),
(DEFAULT, 'AAAI124', NULL, 'Vinicius'),
(DEFAULT, 'AABA125', NULL, 'Miguel');

SELECT * FROM Veiculo;

CREATE TABLE Endereco (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
cep CHAR(9) NOT NULL,
numero VARCHAR(45) NOT NULL,
complemento VARCHAR(45)
);

INSERT INTO Endereco VALUES 
(DEFAULT, '05883-260', '331', 'Pronto socorro 2'),
(DEFAULT, '05883-230', '12', 'posto sul'),
(DEFAULT, '05883-250', '10', 'Ambulatório 2');

select * from endereco;


CREATE TABLE Cliente (
idCliente INT,
nome VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
cnpj CHAR(14) NOT NULL,
telefone CHAR(12) NOT NULL,
Mensagem VARCHAR(300) NOT NULL,
fkEndereco INT,
CONSTRAINT endereco_cliente FOREIGN KEY (fkEndereco) REFERENCES Endereco (idEndereco),
CONSTRAINT pkCliente PRIMARY KEY (idCliente,fkEndereco)
);

INSERT INTO Cliente VALUES 
(1, 'Hospital pedreira', 'pedreira@outlook.com', 'pedreira123', '12365478754784', '11 5515-2910', 'Desejo fazer uma requisição', 1),
(2, 'Hospital Mboi mirim', 'mboi@outlook.com', 'mboi123', '12361147542634', '11 5514-2206', 'Desejo monitorar o meu caminhão de transporte de vacinas ', 2),
(3, 'Hospital campo limpo', 'campoLimpo@outlook.com', 'campo123', '12968352712035', '11 5515-2910', 'Desejo fazer uma requisição', 3);

select * from cliente;


CREATE TABLE Sensor (
idSensor INT NOT NULL, 
nome VARCHAR(45) NOT NULL,
status VARCHAR(45) NOT NULL,
CONSTRAINT chkSensor CHECK (status in ('ativo', 'inativo')),
fkVeiculo INT NOT NULL,
CONSTRAINT veiculo_sensor FOREIGN KEY (fkVeiculo) REFERENCES Veiculo (idVeiculo),
CONSTRAINT pkSensor PRIMARY KEY (idSensor, fkVeiculo)
);

INSERT INTO Sensor VALUES
(1, 'DHT11', 'Ativo', 1),
(2, 'DHT11', 'inativo', 2),
(3, 'DHT11', 'Ativo', 3);



CREATE TABLE Vacina (
idVacina INT NOT NULL,
nome VARCHAR(45) NOT NULL,
tipo VARCHAR(45) NOT NULL,
temperatura_maxima_suportada DECIMAL (4,2) NOT NULL,
temperatura_minima_suportada DECIMAL (4,2) NOT NULL,
umidade_maxima_suportada INT NOT NULL,
umidade_minima_suportada INT NOT NULL,
fkVeiculo INT NOT NULL,
CONSTRAINT veiculo FOREIGN KEY (fkVeiculo) REFERENCES Veiculo (idVeiculo),
fkEndereco_vacina INT NOT NULL,
CONSTRAINT endereco_vacina FOREIGN KEY (fkEndereco_vacina) REFERENCES Endereco (idEndereco),
fkVeiculo_vacina INT NOT NULL,
CONSTRAINT Veiculo_vacina FOREIGN KEY (fkVeiculo_vacina) REFERENCES Veiculo (idVeiculo),
CONSTRAINT pk_vacina PRIMARY KEY (idVacina, fkEndereco_vacina,fkVeiculo_vacina)
);

INSERT INTO Vacina VALUES 
(1, 'pFizer', 'Ultra-congelamento', '-90', '-60', '50', '30', 1, 1, 1);


INSERT INTO Vacina VALUES 
(2, 'Covid', 'Refrigeração padrão', '8', '2', '50', 30, 2,2,2 ),
(3, 'Covid', 'Refrigeração padrão', '-15', '-50', '50', 30, 3, 3, 3 );

select * from Vacina;

CREATE TABLE Registro(
idRegistro INT NOT NULL,
data_hora DATETIME NOT NULL,
dht11_temperatura DECIMAL (4,2) NOT NULL,
dht11_umidade INT NOT NULL,
fkCliente INT NOT NULL,
CONSTRAINT registroCliente FOREIGN KEY (fkCliente) REFERENCES Cliente (idCliente),
fkSensor INT NOT NULL, 
CONSTRAINT registro_sensor FOREIGN KEY  (fkSensor) REFERENCES Sensor (idSensor),
fkVacina INT NOT NULL, 
CONSTRAINT registro_Vacina FOREIGN KEY  (fkVacina) REFERENCES Vacina (idVacina),
CONSTRAINT pkRegistro PRIMARY KEY (idRegistro, fkCliente, fkSensor,fkVacina)
);


INSERT INTO Registro VALUES
(1, '2020-09-12 08:30:00', '-70', '40', 1, 1, 1),
(2, '2021-09-12 09:30:00', '7', '44', 2, 2, 2),
(3, '2024-02-12 01:30:00', '-20', '30', 3, 3, 3);

SELECT * FROM Registro;

