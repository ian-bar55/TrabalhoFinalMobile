-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: appdatabase
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `autenticacao`
--

DROP TABLE IF EXISTS `autenticacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autenticacao` (
  `ID_Auth` bigint NOT NULL AUTO_INCREMENT,
  `ID_Usuario` bigint DEFAULT NULL,
  `Login` varchar(255) DEFAULT NULL,
  `Password_Hash` longtext,
  `Password_Salt` longtext,
  PRIMARY KEY (`ID_Auth`),
  KEY `fk_UsuarioAuth` (`ID_Usuario`),
  CONSTRAINT `fk_UsuarioAuth` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticacao`
--

LOCK TABLES `autenticacao` WRITE;
/*!40000 ALTER TABLE `autenticacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `autenticacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao`
--

DROP TABLE IF EXISTS `cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartao` (
  `Numero` varchar(255) NOT NULL,
  `Tipo` int DEFAULT NULL,
  `Cvv` int DEFAULT NULL,
  `Documento` varchar(255) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Validade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao`
--

LOCK TABLES `cartao` WRITE;
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigo`
--

DROP TABLE IF EXISTS `codigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigo` (
  `Id_Codigo` bigint NOT NULL AUTO_INCREMENT,
  `Chave` varchar(255) DEFAULT NULL,
  `DataGeracao` datetime DEFAULT NULL,
  `ID_Curso` bigint DEFAULT NULL,
  PRIMARY KEY (`Id_Codigo`),
  KEY `fk_CursoCodigo` (`ID_Curso`),
  CONSTRAINT `fk_CursoCodigo` FOREIGN KEY (`ID_Curso`) REFERENCES `curso` (`Id_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigo`
--

LOCK TABLES `codigo` WRITE;
/*!40000 ALTER TABLE `codigo` DISABLE KEYS */;
/*!40000 ALTER TABLE `codigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom`
--

DROP TABLE IF EXISTS `cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom` (
  `Codigo` varchar(255) NOT NULL,
  `Porcentagem` int DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom`
--

LOCK TABLES `cupom` WRITE;
/*!40000 ALTER TABLE `cupom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `Id_Curso` bigint NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL,
  `Duracao` varchar(255) DEFAULT NULL,
  `Autor` varchar(255) DEFAULT NULL,
  `Descricao` longtext,
  `Imagem` longtext,
  `Imagem2` longtext,
  `Imagem3` longtext,
  `Imagem4` longtext,
  `Valor` float DEFAULT NULL,
  `Observacoes` longtext,
  `PalavrasChave` longtext,
  `Link` longtext,
  `Idioma` varchar(255) DEFAULT NULL,
  `Tecnologias` varchar(255) DEFAULT NULL,
  `Avaliacao` tinyint DEFAULT NULL,
  `NumAvaliadores` bigint DEFAULT NULL,
  PRIMARY KEY (`Id_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacao`
--

DROP TABLE IF EXISTS `transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacao` (
  `ID_Transacao` bigint NOT NULL AUTO_INCREMENT,
  `ID_Usuario` bigint DEFAULT NULL,
  `Numero_Cartao` varchar(255) DEFAULT NULL,
  `ID_Curso` bigint DEFAULT NULL,
  `Codigo_Cupom` varchar(255) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `Data` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Transacao`),
  KEY `fk_TraUsuario` (`ID_Usuario`),
  KEY `fk_TraCartao` (`Numero_Cartao`),
  KEY `fk_TraCurso` (`ID_Curso`),
  KEY `fk_TraCupom` (`Codigo_Cupom`),
  CONSTRAINT `fk_TraCartao` FOREIGN KEY (`Numero_Cartao`) REFERENCES `cartao` (`Numero`),
  CONSTRAINT `fk_TraCupom` FOREIGN KEY (`Codigo_Cupom`) REFERENCES `cupom` (`Codigo`),
  CONSTRAINT `fk_TraCurso` FOREIGN KEY (`ID_Curso`) REFERENCES `curso` (`Id_Curso`),
  CONSTRAINT `fk_TraUsuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacao`
--

LOCK TABLES `transacao` WRITE;
/*!40000 ALTER TABLE `transacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_Usuario` bigint NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL,
  `Telefone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DataRegistro` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_cartao`
--

DROP TABLE IF EXISTS `usuario_cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_cartao` (
  `ID_UsuarioCartao` bigint NOT NULL AUTO_INCREMENT,
  `ID_Usuario` bigint DEFAULT NULL,
  `Numero_Cartao` varchar(255) DEFAULT NULL,
  `Padrao` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_UsuarioCartao`),
  KEY `fk_UCUsuario` (`ID_Usuario`),
  KEY `fk_UCCartao` (`Numero_Cartao`),
  CONSTRAINT `fk_UCCartao` FOREIGN KEY (`Numero_Cartao`) REFERENCES `cartao` (`Numero`),
  CONSTRAINT `fk_UCUsuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_cartao`
--

LOCK TABLES `usuario_cartao` WRITE;
/*!40000 ALTER TABLE `usuario_cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'appdatabase'
--

--
-- Dumping routines for database 'appdatabase'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-24 23:53:38
