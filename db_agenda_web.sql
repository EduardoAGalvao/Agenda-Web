-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: db_agenda_web
-- ------------------------------------------------------
-- Server version	10.1.29-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_compromissos`
--

DROP TABLE IF EXISTS `tbl_compromissos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_compromissos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `local` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `horario` varchar(30) NOT NULL,
  `observacoes` varchar(255) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `concluido` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compromissos`
--

LOCK TABLES `tbl_compromissos` WRITE;
/*!40000 ALTER TABLE `tbl_compromissos` DISABLE KEYS */;
INSERT INTO `tbl_compromissos` VALUES (3,'Outro teste','Casa2','2019-05-11','10:00','',5,'false'),(4,'Outro','Casa3','2019-06-03','03:00','',5,'false'),(5,'Teste 1','Casa3','2019-06-12','07:30','',3,'false');
/*!40000 ALTER TABLE `tbl_compromissos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contato`
--

DROP TABLE IF EXISTS `tbl_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_contato` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contato`
--

LOCK TABLES `tbl_contato` WRITE;
/*!40000 ALTER TABLE `tbl_contato` DISABLE KEYS */;
INSERT INTO `tbl_contato` VALUES (1,'Juan Duarte','1996-06-18','ana@terra.com.br','(11)85369-1589','Rua Fernando Teste, 522 - Itapevi','AMIGO',2),(2,'Ronald McDonald','1997-05-06','ronald@mcdonald.com','(11)4002-8922','Rua Teste da Teste, 666','PROFISSIONAL',0),(3,'TEst','2019-05-20','TEst@test.com','(11)4002-8922','Rua testando, 666','FAMILIA',0),(4,'TEst','2019-05-20','TEst@test.com','(11)4002-8922','Rua testando, 666','FAMILIA',0),(5,'Novo contact','2019-05-20','novo@test.com','(11)4002-8922','Rua teste de teste testando, 656','AMIGO',0),(6,'Ronaldo Silva','2019-06-05','ronaldo@contato.com','(11)4002-8922','Rua ronaldo, 666','PROFISSIONAL',5),(7,'Antonio','2019-06-12','antoniao@teste.com','(11)4002-8922','Rua Antonio','AMIGO',5);
/*!40000 ALTER TABLE `tbl_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varbinary(50) NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (1,'UsuÃ¡rio Teste','CðÆŒ³ºqo£Î‰','usuario@teste.com.br'),(2,'Alessandro','CðÆŒ³ºqo£Î‰','alessandro@teste.com.br'),(3,'Ronaldo','CðÆŒ³ºqo£Î‰','ronaldo@teste.com.br'),(4,'NovoCadastro Junior','CðÆŒ³ºqo£Î‰','novocadastro@junior.com.br'),(5,'Eduardo GalvÃƒÂ£o','bØó”{~ß¯Ü—CÜå<','eduardo@teste4.com'),(6,'Luiz Henrique GalvÃƒÂ£o','’V¶c±X°ü¥ÉíÃ','luiz@teste.com.br');
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-14 13:22:17
