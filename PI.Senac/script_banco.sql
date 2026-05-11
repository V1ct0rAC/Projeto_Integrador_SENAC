CREATE DATABASE IF NOT EXISTS SistemaUniversitario;
USE SistemaUniversitario;

-- Tabela Base: Pessoa Física
CREATE TABLE PessoaFisica (
    id_pf INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(255),
    cpf VARCHAR(14) UNIQUE NOT NULL
);

-- Tabela Aluno (Herança de Pessoa Física)
CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    ra INT UNIQUE NOT NULL,
    matricula INT NOT NULL,
    curso VARCHAR(100),
    fk_pf INT,
    FOREIGN KEY (fk_pf) REFERENCES PessoaFisica(id_pf) ON DELETE CASCADE
);
-- Criando a tabela Docente
CREATE TABLE Docente (
  id_docente  INT NOT NULL AUTO_INCREMENT,
  registro_funcional int NOT NULL,
  especialidade varchar(100) DEFAULT NULL,
  titulacao varchar(50) DEFAULT NULL,
  fk_pf int DEFAULT NULL,
  PRIMARY KEY (id_docente),
  UNIQUE KEY registro_funcional (registro_funcional),
  KEY fk_pf (fk_pf),
  CONSTRAINT Docente_ibfk_1 FOREIGN KEY (fk_pf) REFERENCES PessoaFisica (id_pf) ON DELETE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Criando a tabela PessoaJuridica
CREATE TABLE PessoaJuridica (
  id_pj int NOT NULL AUTO_INCREMENT,
  razao_social varchar(100) NOT NULL,
  cnpj varchar(18) NOT NULL,
  PRIMARY KEY (id_pj),
  UNIQUE KEY cnpj (cnpj)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Inserção de Teste (Exatamente o que aparece no teu print)
INSERT INTO PessoaFisica (nome, cpf) VALUES ('Victor Araujo Correa', '395.055.268-57');
INSERT INTO Aluno (ra, matricula, curso, fk_pf) VALUES (2025001, 1010, 'Análise e Desenvolvimento de Sistemas', 1);


Inserção de Teste (Exatamente o que aparece no teu print)
INSERT INTO PessoaFisica (nome, cpf) VALUES ('Victor Augusto', '397.055.268-57');
INSERT INTO Aluno (ra, matricula, curso, fk_pf) VALUES (205001, 1010, 'Análise e Desenvolvimento de Sistemas', 1);

INSERT INTO PessoaFisica (nome, cpf) 
VALUES ('Dr. Augusto Santos', '123.456.789-00');
INSERT INTO Docente (registro_funcional, especialidade, titulacao, fk_pf) 
VALUES (10050, 'Ciência de Dados', 'Mestrado', 1);

INSERT INTO PessoaJuridica (razao_social, cnpj) 
VALUES ('Escola de Tecnologia LTDA', '12.315.678/0001-99');