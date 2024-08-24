CREATE DATABASE HospitalVet;
USE HospitalVet;

CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

CREATE TABLE Animais (
    idAnimal INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    especie VARCHAR(50),
    raca VARCHAR(50),
    idade INT,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

CREATE TABLE Veterinários (
    idVeterinario INT PRIMARY KEY AUTO_INCREMENT,
    nomeVeterinario VARCHAR(100),
    especialidade VARCHAR(50),
    telefone VARCHAR(20)
);

CREATE TABLE Consultas (
    idConsulta INT PRIMARY KEY AUTO_INCREMENT,
    idAnimal INT,
    idVeterinario INT,
    dataConsulta DATE,
    diagnostico VARCHAR(255),
    FOREIGN KEY (idAnimal) REFERENCES Animais(idAnimal),
    FOREIGN KEY (idVeterinario) REFERENCES Veterinários(idVeterinario)
);

CREATE TABLE Tratamentos (
    idTratamento INT PRIMARY KEY AUTO_INCREMENT,
    idConsulta INT,
    descricao VARCHAR(255),
    dataTratamento DATE,
    custo INT,
    FOREIGN KEY (idConsulta) REFERENCES Consultas(idConsulta)
);

ALTER TABLE Animais ADD COLUMN peso INT;

INSERT INTO Clientes (nomeCliente, telefone, endereco)
VALUES ('Iloir', '1111-1111', 'Rua X'),
('Neto', '2222-2222', 'Avenida Y'),
('Cecilia', '3333-3333', 'Rua Z');

INSERT INTO Animais (nome, especie, raca, idade, peso, idCliente)
VALUES ('Noah', 'Cachorro', 'Border Colie', 5, 30, 1),
('Fibo', 'Gato', 'Vira Lata', 3, 4, 2),
('Mel', 'Cachorro', 'Coton de Tulear', 2, 10, 3);

INSERT INTO Veterinários (nomeVeterinario, especialidade, telefone)
VALUES ('Leticia', 'Clínico Geral', '9999-9999'),
('Larissa', 'Cirurgia', '8888-8888'),
('Maria', 'Dermatologia', '7777-7777');

INSERT INTO Consultas (idAnimal, idVeterinario, dataConsulta, diagnostico)
VALUES (1, 1, '2024-08-21', 'Dor na orelha'),
(2, 2, '2024-08-22', 'Castração'),
(3, 3, '2024-08-23', 'Alergia');

INSERT INTO Tratamentos (idConsulta, descricao, dataTratamento, custo)
VALUES (1, 'Limpeza', '2024-08-21', 150),
(2, 'Cirurgia', '2024-08-22', 500),
(3, 'Aplicação de pomada', '2024-08-23', 80);

SELECT * FROM Clientes;
SELECT * FROM Animais;
SELECT * FROM Veterinários;
SELECT * FROM Consultas;
SELECT * FROM Tratamentos;
