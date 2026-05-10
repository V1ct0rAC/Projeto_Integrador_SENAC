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

-- Inserção de Teste (Exatamente o que aparece no teu print)
INSERT INTO PessoaFisica (nome, cpf) VALUES ('Victor Araujo Correa', '395.055.268-57');
INSERT INTO Aluno (ra, matricula, curso, fk_pf) VALUES (2025001, 1010, 'Análise e Desenvolvimento de Sistemas', 1);
