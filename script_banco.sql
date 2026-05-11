CREATE DATABASE IF NOT EXISTS SistemaUniversitario;
USE SistemaUniversitario;

-- Tabela Pessoa Física
CREATE TABLE PessoaFisica (
    id_pf INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- tabela PessoaJuridica.
CREATE TABLE PessoaJuridica (
  id_pj INT PRIMARY KEY AUTO_INCREMENT,
  razao_social VARCHAR(100) NOT NULL,
  cnpj VARCHAR(18) UNIQUE NOT NULL,
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela Aluno (Herança de Pessoa Física)
CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    ra INT UNIQUE NOT NULL,
    matricula INT NOT NULL,
    curso VARCHAR(100) NOT NULL,
    fk_cpf VARCHAR(14) UNIQUE NOT NULL,
    KEY aluno_fk_cpf (fk_cpf),
    CONSTRAINT Aluno_cpffk_1 FOREIGN KEY (fk_cpf) REFERENCES PessoaFisica(cpf) ON DELETE CASCADE  
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- tabela Docente (Herança de Pessoa Física).
CREATE TABLE Docente (
  id_docente  INT PRIMARY KEY AUTO_INCREMENT,
  registro_funcional INT UNIQUE NOT NULL,
  especialidade VARCHAR(100) NOT NULL,
  titulacao VARCHAR(50) NOT NULL,
  fk_cpf VARCHAR(14) UNIQUE NOT NULL,
  KEY docente_fk_cpf (fk_cpf),
  CONSTRAINT Docente_cpffk_1 FOREIGN KEY (fk_cpf) REFERENCES PessoaFisica (cpf) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- tabela Fornecedor (Herança de PessoaJurídica).
CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(100) NOT NULL,
    produto VARCHAR(50) NOT NULL,
    contrato INT NOT NULL,
    serviço VARCHAR(50) NOT NULL,
    prazo_entrega VARCHAR(10) NOT NULL
    fk_cnpj VARCHAR(18) UNIQUE NOT NULL,
    KEY fornecedor_fk_cnpj (fk_cnpj),
    CONSTRAINT Fornecedor_cnpjfk_1 FOREIGN KEY (fk_cnpj) REFERENCES PessoaJuridica (cnpj) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Inserção de Teste.
INSERT INTO PessoaFisica (nome, endereco, cpf) 
VALUES ('Victor Augusto','Rua São José', '397.055.268-57');

INSERT INTO Aluno (ra, matricula, curso, fk_cpf)
VALUES (205001, 1010, 'Análise e Desenvolvimento de Sistemas','397.055.268-57');

INSERT INTO PessoaFisica (nome, endereco, cpf) 
VALUES ('Dr. Augusto Santos','Rua 18 de Março' '123.456.789-00');

INSERT INTO Docente (registro_funcional, especialidade, titulacao, fk_cpf) 
VALUES (10050, 'Ciência de Dados', 'Mestrado', '123.456.789-00');

INSERT INTO PessoaJuridica (razao_social, cnpj) 
VALUES ('Laranjas e Associados LTDA', '12.315.678/0001-99');

INSERT INTO Fornecedor (nome_empresa, produto, contrato, serviço, prazo_entrega, fk_cnpj)
VALUES ('Tiáo da Laranja', 'Suco de Laranja', 1001, 'Vender Suco de Laranja', '18/05/2026', '12.315.678/0001-99');
