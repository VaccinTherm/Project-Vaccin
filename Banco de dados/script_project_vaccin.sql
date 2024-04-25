CREATE DATABASE vaccinTherm;
USE vaccinTherm;

CREATE TABLE EMPRESA (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
cnpj char(14) NOT NULL,
telefone char(12),
mensagem VARCHAR(300)
);

-- INSERIR OS VALORES DA EMPRESA 

INSERT INTO EMPRESA VALUES
();

CREATE TABLE USUARIO (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
fkEmpresa INT,
CONSTRAINT fkempresa_usuario FOREIGN KEY (fkEmpresa) REFERENCES EMPRESA(idEmpresa)
);

-- INSERIR OS VALORES DO USUÁRIO

INSERT INTO USUARIO VALUES
();


CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
especialidade VARCHAR(45),
status VARCHAR(30),
CONSTRAINT chk_sensor CHECK (status in ('Habiitado', 'Desabilitado'))
);

-- INSERIR OS VALORES DO SENSOR

INSERT INTO SENSOR VALUES
();

CREATE TABLE VACINA (
idVacina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
tipo VARCHAR(45),
temperatura_maxima_suportada DECIMAL(4,2),
temperatura_minima_suportada DECIMAL(4,2),
umidade_maxima_suportada INT,
umidade_minima_suportada INT
);

-- INSERIR OS VALORES VACINA

INSERT INTO VACINA VALUES
();

CREATE TABLE VEICULO (
idVeiculo INT NOT NULL,
data_entrega INT NOT NULL,
CONSTRAINT pkComposta PRIMARY KEY (idVeiculo, data_entrega),
placa VARCHAR(45) NOT NULL,
modelo_veiculo VARCHAR(45),
responsavel VARCHAR(45) NOT NULL,
fkEmpresa INT,
CONSTRAINT fkempresa_veiculo FOREIGN KEY (fkEmpresa) REFERENCES EMPRESA(idEmpresa),
fkSensor INT,
CONSTRAINT fkSensor FOREIGN KEY (fkSensor) REFERENCES SENSOR(idSensor),
fkVacina INT,
CONSTRAINT vacina_veiculo FOREIGN KEY (fkVacina) REFERENCES Vacina(idVacina)
);

-- INSERIR OS VALORES VEICULOS

INSERT INTO VEICULOS VALUES
();

CREATE TABLE REGISTRO (
idRegistro INT NOT NULL,
dataHora DATETIME,
dht11_umidade INT,
dht11_temperatura DECIMAL (4,2),
fkSensor_registro INT,
CONSTRAINT fksensor_registro FOREIGN KEY (fkSensor_registro) REFERENCES SENSOR(idSensor),
fkVacina_registro INT,
CONSTRAINT vacina_registro FOREIGN KEY (fkVacina_registro) REFERENCES Vacina(idVacina),
fkUsuario_representante INT,
CONSTRAINT usuario_representante FOREIGN KEY (fkUsuario_representante) REFERENCES USUARIO (idUsuario)
);

-- INSERIR OS VALORES VEICULOS

INSERT INTO REGISTRO VALUES
();


-- EXIBIR CADA TABELA SEPARADAMENTE 
SELECT * FROM EMPRESA;
SELECT * FROM USUARIO;
SELECT * FROM SENSOR;
SELECT * FROM VACINA;
SELECT * FROM VEICULO;
SELECT * FROM REGISTRO;

-- FAZER O SELECT SIMPLES

<<<<<<< HEAD
-- EXIBIR APENAS O NOME DA EMPRESA E A DESCRICAO COM O SEU DETERMINADO REPRESENTANTE, EXIBIR NA CONSULTA A HORA DA ENTREGA
-- O TIPO DE VACINA E O VEICULO CORRESPONDENTE CITANDO  O  NOME DO RESPONSÁVEL, E OS REGISTROS EM TEMPO REAL
=======
INSERT INTO Veiculo (idVeiculo, data_entrega, placa, modeloVeiculo, motorista, fkEmpresa, fkSensor) 
VALUES 
(1, '2024-04-20', 'ABC1234', 'Ford Transit', 'Pedro Souza', 1, 1),
(2, '2024-04-21', 'DEF5678', 'Fiat Fiorino', 'Ana Oliveira', 2, 2),
(3, '2024-04-22', 'GHI9012', 'Volkswagen Kombi', 'Marcos Santos', 3, 1);

INSERT INTO Registro (idRegistro, data_hora, dht11_temperatura, dht11_umidade, fkSensor, fkVacina_registro) 
VALUES 
(1, '2024-04-20 08:00:00', 6.50, 75, 1, 1),
(2, '2024-04-21 09:30:00', 7.20, 70, 2, 2);

select * from Registro;
>>>>>>> 91aa91968c8d6e6360620b787d16538813ee923c
