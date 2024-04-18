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
idRegistro INT NOT NULL,
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
