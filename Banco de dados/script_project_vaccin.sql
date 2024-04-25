CREATE DATABASE vaccinTherm;
USE vaccinTherm;

CREATE TABLE EMPRESA (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
cnpj char(14) NOT NULL,
telefone char(13),
mensagem VARCHAR(300)
);

-- INSERIR OS VALORES DA EMPRESA 

INSERT INTO EMPRESA VALUES
(DEFAULT, 'Transporte Hospitalar', 'hospitalar@outlook.com', 'moreira1234', '12345432121315', '11 96255-5803', 'requisição de novos sensores' ),
(DEFAULT, 'transporte Vaccin', 'transporte_vaccin@outlook.com', 'capao1234', '1234543212131', '11 96255-5804', 'requisição de novos sensores' ),
(DEFAULT, 'transporte amorim', 'transporteamorim@outlook.com', 'amorim1234', '12345432121317', '11 96255-5801', 'requisição de novos sensores' ),
(DEFAULT, 'transporte ama', 'transporteama@outlook.com', 'ama1234', '12345432121319', '11 96255-5800','requisição de novos sensores' );


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
(DEFAULT, 'Fernanda', 'caramico@outlook.com', 'sptech.schol123', 1),
(DEFAULT, 'Regina', 'regina@outlook.com', 'regina123', 2),
(DEFAULT, 'Jeferson', 'jeferson@outlook.com', 'jeferson123', 3),
(DEFAULT, 'Dagoberto', 'dago@outlook.com', 'dago123', 4);


CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
especialidade VARCHAR(45),
status VARCHAR(30),
CONSTRAINT chk_sensor CHECK (status in ('Habiitado', 'Desabilitado'))
);

-- INSERIR OS VALORES DO SENSOR

INSERT INTO SENSOR VALUES
(DEFAULT, 'DHT11', 'Temperatura e umidade', 'Habiitado'),
(DEFAULT, 'DHT11', 'Temperatura e umidade', 'Desabilitado');

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
(DEFAULT, 'Gripe', 'Refrigeração padrão','8', 2, 20, 80),
(DEFAULT, 'Sarampo', 'Congelamento', '15.1', -50, null, 20),
(DEFAULT, 'COVID-19', 'Ultracongelamento', '-60', '-80', null, 20);


CREATE TABLE VEICULO (
idVeiculo INT NOT NULL,
data_entrega date NOT NULL,
CONSTRAINT pkComposta PRIMARY KEY (idVeiculo, data_entrega),
placa VARCHAR(45) NOT NULL,
modelo_veiculo VARCHAR(45),
responsavel VARCHAR(45) NOT NULL,
fkEmpresa_veiculo INT,
CONSTRAINT fkempresa_veiculo FOREIGN KEY (fkEmpresa_veiculo) REFERENCES EMPRESA(idEmpresa),
fkSensor INT,
CONSTRAINT fkSensor FOREIGN KEY (fkSensor) REFERENCES SENSOR(idSensor),
fkVacina INT,
CONSTRAINT vacina_veiculo FOREIGN KEY (fkVacina) REFERENCES Vacina(idVacina)
);

-- INSERIR OS VALORES VEICULOS

INSERT INTO VEICULO VALUES
(1, '2024-01-02', 'ABC1234', 'Refrigerated Box Truck', 'Mariano', 1, 1, 1),
(2, '2024-04-02', 'ABC1235', 'Refrigerated Box Truck', 'Murilo', 2, 1, 2),
(3, '2024-03-22', 'ABC1236', 'Refrigerated Box Truck', 'Sandro', 3, 1, 3),
(4, '2024-01-12', 'ABC1244', 'Refrigerated Box Truck', 'Evandro', 1, 1, 2),
(5, '2024-03-20', 'ABC1777', 'Refrigerated Box Truck', 'Ronaldo', 2, 1, 3);

CREATE TABLE REGISTRO (
idRegistro INT NOT NULL,
dataHora DATETIME,
dht11_umidade DECIMAL (4,2),
dht11_temperatura DECIMAL (4,2),
fkSensor_registro INT,
CONSTRAINT fksensor_registro FOREIGN KEY (fkSensor_registro) REFERENCES SENSOR(idSensor),
fkVacina_registro INT,
CONSTRAINT vacina_registro FOREIGN KEY (fkVacina_registro) REFERENCES Vacina(idVacina),
fkUsuario_representante INT,
CONSTRAINT usuario_representante FOREIGN KEY (fkUsuario_representante) REFERENCES USUARIO (idUsuario)
);

-- INSERIR OS VALORES REGISTRO

INSERT INTO REGISTRO VALUES
(1, '2024-01-02 08:30:00', 30, 3, 1, 1, 1 ),
(2, '2024-02-03 09:30:00', 31, 4, 2, 2, 2),
(3, '2024-03-04 10:30:00', 32, 5, 1, 3, 3),
(4, '2024-04-05 11:30:00', 33, 6, 2, 1, 4);







-- EXIBIR CADA TABELA SEPARADAMENTE 
SELECT * FROM EMPRESA;
SELECT * FROM USUARIO;
SELECT * FROM SENSOR;
SELECT * FROM VACINA;
SELECT * FROM VEICULO;
SELECT * FROM REGISTRO;

-- FAZER O SELECT SIMPLES

-- EXIBIR APENAS O NOME DA EMPRESA E A DESCRICAO COM O SEU DETERMINADO REPRESENTANTE, EXIBIR NA CONSULTA A HORA DA ENTREGA
-- O TIPO DE VACINA E O VEICULO CORRESPONDENTE CITANDO  O  NOME DO RESPONSÁVEL, E OS REGISTROS EM TEMPO REAL


-- SELECT COM JOIN ENTRE TODAS AS TABELAS 

SELECT EMPRESA.nome AS 'Nome da empresa',
       EMPRESA.email AS 'Email da empresa',
       EMPRESA.cnpj AS 'CNPJ',
       EMPRESA.telefone AS 'Telefone da empresa',
       USUARIO.nome AS 'Nome do usuário',
       USUARIO.email AS 'Email do usuário',
       SENSOR.nome AS 'Nome do sensor',
       SENSOR.status AS 'Status do sensor',
       VACINA.nome AS 'Nome da vacina',
       VACINA.tipo AS 'Tipo da vacina', -- colocar check com os tipos
       VACINA.temperatura_maxima_suportada AS 'Temperatura máxima suportada', -- adicionar a coluna unidade de medida 
       VACINA.temperatura_minima_suportada AS 'Temperatura mínima suportada',
       VACINA.umidade_maxima_suportada AS 'Umidade máxima suportada',
       VACINA.umidade_minima_suportada AS 'Umidade mínima suportada',
       VEICULO.data_entrega AS 'Data da entrega',
       VEICULO.placa AS 'Placa do veículo', 
       VEICULO.responsavel AS 'Responsável pelo veículo',
       REGISTRO.dataHora AS 'Data e Hora do registro',
       REGISTRO.dht11_umidade AS 'Umidade capturada',
       REGISTRO.dht11_temperatura AS 'Temperatura capturada'
       FROM USUARIO JOIN EMPRESA ON USUARIO.fkEmpresa = EMPRESA.idEmpresa
                    JOIN VEICULO ON  EMPRESA.IDEMPRESA = VEICULO.FKEMPRESA_VEICULO
                    JOIN SENSOR ON SENSOR.IDSENSOR = VEICULO.FKSENSOR
                    JOIN VACINA ON VACINA.IDVACINA = VEICULO.FKVACINA
                    JOIN REGISTRO ON REGISTRO.fkVacina_registro = VACINA.idVacina where idRegistro = 1;
                    

                    

        



