CREATE DATABASE  IF NOT EXISTS `SistemaUniversitario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `SistemaUniversitario`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: SistemaUniversitario
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Aluno`
--

DROP TABLE IF EXISTS `Aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aluno` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `ra` int NOT NULL,
  `matricula` int NOT NULL,
  `curso` varchar(100) DEFAULT NULL,
  `fk_pf` int DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  UNIQUE KEY `ra` (`ra`),
  KEY `fk_pf` (`fk_pf`),
  CONSTRAINT `Aluno_ibfk_1` FOREIGN KEY (`fk_pf`) REFERENCES `PessoaFisica` (`id_pf`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aluno`
--

LOCK TABLES `Aluno` WRITE;
/*!40000 ALTER TABLE `Aluno` DISABLE KEYS */;
INSERT INTO `Aluno` VALUES (1,2025001,1010,'Análise e Desenvolvimento de Sistemas',1),(2,205001,1010,'Análise e Desenvolvimento de Sistemas',1);
/*!40000 ALTER TABLE `Aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Docente`
--

DROP TABLE IF EXISTS `Docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Docente` (
  `id_docente` int NOT NULL AUTO_INCREMENT,
  `registro_funcional` int NOT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `titulacao` varchar(50) DEFAULT NULL,
  `fk_pf` int DEFAULT NULL,
  PRIMARY KEY (`id_docente`),
  UNIQUE KEY `registro_funcional` (`registro_funcional`),
  KEY `fk_pf` (`fk_pf`),
  CONSTRAINT `Docente_ibfk_1` FOREIGN KEY (`fk_pf`) REFERENCES `PessoaFisica` (`id_pf`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Docente`
--

LOCK TABLES `Docente` WRITE;
/*!40000 ALTER TABLE `Docente` DISABLE KEYS */;
INSERT INTO `Docente` VALUES (1,10050,'Ciência de Dados','Mestrado',1),(2,5001,'Sistemas de Informação','Doutorado',1);
/*!40000 ALTER TABLE `Docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PessoaFisica`
--

DROP TABLE IF EXISTS `PessoaFisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PessoaFisica` (
  `id_pf` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  PRIMARY KEY (`id_pf`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PessoaFisica`
--

LOCK TABLES `PessoaFisica` WRITE;
/*!40000 ALTER TABLE `PessoaFisica` DISABLE KEYS */;
INSERT INTO `PessoaFisica` VALUES (1,'Victor Araujo Correa','victor@ead.senac.br','São Paulo, SP','395.055.268-57'),(2,'Dr. Augusto Santos',NULL,NULL,'123.456.789-00');
/*!40000 ALTER TABLE `PessoaFisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PessoaJuridica`
--

DROP TABLE IF EXISTS `PessoaJuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PessoaJuridica` (
  `id_pj` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  PRIMARY KEY (`id_pj`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PessoaJuridica`
--

LOCK TABLES `PessoaJuridica` WRITE;
/*!40000 ALTER TABLE `PessoaJuridica` DISABLE KEYS */;
INSERT INTO `PessoaJuridica` VALUES (1,'Escola de Tecnologia LTDA','12.345.678/0001-99'),(3,'Escola de Tecnologia LTDA','12.315.678/0001-99');
/*!40000 ALTER TABLE `PessoaJuridica` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-11 11:37:00
