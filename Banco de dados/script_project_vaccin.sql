CREATE DATABASE vaccinTherm;

USE vaccinTherm;


CREATE TABLE Empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
cnpj CHAR(14) NOT NULL,
telefone CHAR(12) NOT NULL,
Mensagem VARCHAR(300) NOT NULL,
fkRepresentante INT,
CONSTRAINT representante_empresa FOREIGN KEY (fkRepresentante) REFERENCES Empresa(idEmpresa)
);

INSERT INTO Empresa VALUES 
(DEFAULT, 'AMIL', 'AmbulatorioAmil@outlook.com', 'socorre123', '12365478547458', '11 9652-5824', 'Requisição de sensores dht11', null),
(DEFAULT, 'AMA CAPÃO', 'amacapaoredondo@outlook.com', 'prontoAtendimento123', '12367548796213', '11 9528-5822','Implantação da dashboard em nosso sistema ', null),
(DEFAULT, 'SUS', 'sistemaunicodesaude@outlook.com', 'atendimento123', '12367745125478', '11 9628-5826', 'Gostaria de saber mais sobre dados', 2),
(DEFAULT, 'Ambulatorio', 'AmbulatorioAmil@outlook.com', 'socorre123', '12365478547458', '11 9528-5824','Requisição de sensores dht11', 1);

SELECT * FROM Empresa;

CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(45) NOT NULL,
especialidade VARCHAR(45) NOT NULL,
status VARCHAR(45) NOT NULL,
CONSTRAINT chkSensor CHECK (status in ('ativo', 'inativo'))
);

INSERT INTO Sensor VALUE
(DEFAULT, 'DHT11', 'Temperatura e umidade', 'ativo'),
(DEFAULT, 'DHT11', 'Temperatura e umidade', 'inativo');

CREATE TABLE Vacina (
idVacina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
tipo VARCHAR(45) NOT NULL,
temperatura_maxima_suportada DECIMAL (4,2) NOT NULL,
temperatura_minima_suportada DECIMAL (4,2) NOT NULL,
umidade_maxima_suportada INT NOT NULL,
umidade_minima_suportada INT NOT NULL
);

-- INSERIR VALORES DAS VACINAS 


CREATE TABLE Veiculo (
idVeiculo INT AUTO_INCREMENT,
data_entrega DATE,
placa VARCHAR(45) NOT NULL,
modeloVeiculo VARCHAR(45),
motorista VARCHAR(45) NOT NULL,
fkEmpresa INT,
CONSTRAINT veiculo_empresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
fkSensor INT,
CONSTRAINT sensor_veiculo FOREIGN KEY (fkSensor) REFERENCES Sensor (idSensor),
CONSTRAINT pkComposta PRIMARY KEY (idVeiculo,data_entrega)
);

-- INSERIR VALORES DOS VEICULOS

CREATE TABLE Registro(
idRegistro INT auto_increment,
data_hora DATETIME NOT NULL,
dht11_temperatura DECIMAL (4,2) NOT NULL,
dht11_umidade INT NOT NULL,
fkSensor INT NOT NULL, 
CONSTRAINT registro_sensor FOREIGN KEY  (fkSensor) REFERENCES Sensor (idSensor),
fkVacina_registro INT NOT NULL, 
CONSTRAINT registro_Vacina FOREIGN KEY  (fkVacina_registro) REFERENCES Vacina (idVacina),
CONSTRAINT pkRegistro PRIMARY KEY (idRegistro,fkSensor)
);

-- INSERIR VALORES DOS REGISTROS


INSERT INTO Vacina (nome, tipo, temperatura_maxima_suportada, temperatura_minima_suportada, umidade_maxima_suportada, umidade_minima_suportada) 
VALUES 
('Vacina COVID-19', 'Injeção', 8.00, 2.00, 80, 50),
('Vacina Gripe', 'Injeção', 10.00, 5.00, 85, 60),
('Vacina TetraViral', 'Injeção', 5.00, -5.00, 90, 40);


INSERT INTO Veiculo (idVeiculo, data_entrega, placa, modeloVeiculo, motorista, fkEmpresa, fkSensor) 
VALUES 
(1, '2024-04-20', 'ABC1234', 'Ford Transit', 'Pedro Souza', 1, 1),
(2, '2024-04-21', 'DEF5678', 'Fiat Fiorino', 'Ana Oliveira', 2, 2),
(3, '2024-04-22', 'GHI9012', 'Volkswagen Kombi', 'Marcos Santos', 3, 1);

INSERT INTO Registro (idRegistro, data_hora, dht11_temperatura, dht11_umidade, fkSensor, fkVacina_registro) 
VALUES 
(1, '2024-04-20 08:00:00', 6.50, 75, 1, 1),
(2, '2024-04-21 09:30:00', 7.20, 70, 2, 2);

