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
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `ID_Curso` bigint NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL,
  `Duracao` varchar(255) DEFAULT NULL,
  `Autor` varchar(255) DEFAULT NULL,
  `Descricao` longtext,
  `Valor` float DEFAULT NULL,
  `Observacoes` longtext,
  `PalavrasChave` longtext,
  `Link` longtext,
  `Idioma` varchar(255) DEFAULT NULL,
  `Tecnologias` varchar(255) DEFAULT NULL,
  `Avaliacao` tinyint DEFAULT NULL,
  `NumAvaliadores` bigint DEFAULT NULL,
  `ID_Distribuidora` bigint NOT NULL,
  PRIMARY KEY (`ID_Curso`),
  KEY `fk_curso_dist` (`ID_Distribuidora`),
  CONSTRAINT `fk_curso_dist` FOREIGN KEY (`ID_Distribuidora`) REFERENCES `distribuidora` (`ID_Distribuidora`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Power BI Completo - Do Básico ao Avançado','9.5 horas','João Paulo de Lira','Aprenda o passo a passo exato para criar dashboards e relatórios dinâmicos usando Business Intelligence',19.99,'O curso completo de Power BI, do básico ao avançado em vídeo aulas passo a passo. Aqui você vai aprender as principais ferramentas do Power BI para não só criar dashboards e relatórios dinâmicos, mas também conseguir analisar milhares de informações de forma simples e intuitiva. Nesse curso vamos começar do zero, desde a instalação do Power BI no seu computador e te levar passo a passo ao nível avançado, ensinando todas as ferramentas que você precisa para usar todo o potencial do Business Intelligence para criar relatórios intuitivos e impressionantes, com gráficos, indicadores, mapas e muito mais! Esse curso é 100% prático, o que significa que você vai estar o tempo todo aplicando e exercitando em cada aula, para você aprender como fazer exatamente o que desenvolvemos no curso no seu computador e em qualquer caso que tenha que resolver na sua vida profissional. O Power BI está se tornando uma das ferramentas mais importantes do mercado de trabalho e se você quer se destacar, esse pode ser um grande diferencial na sua carreira.','Power BI, Business Intelligence, Análise de Dados','https://www.udemy.com/course/power-bi-completo-do-basico-ao-avancado/','Português','Power BI',NULL,NULL,1),(2,'Gestão Ágil com Scrum COMPLETO + 3 Cursos EXTRAS','7 horas','Gustavo Farias','Indiscutivelmente o mais completo: gestão ágil de projetos com SCRUM Agile, Liderança, Negociação e Produtividade.',21.99,'Scrum Agile / Agile Management: \"A arte de fazer o dobro do trabalho na metade do tempo\". Você dominará não apenas o método agile para gerenciamento de projetos, mas também tudo o que precisa para ser alguém diferenciado, reconhecido e capaz de conquistar grandes oportunidades no mercado de trabalho. Este é um curso extremamente inovador, prático e 100% online que vai ensinar passo a passo como planejar e gerenciar projetos de forma profissional e bem sucedida utilizando a melhor metodologia ágil do mundo: SCRUM (Scrum Agile). É ainda o único curso que vai além do técnico e oferece gratuitamente vários cursos extras para sua formação complementar em habilidades interpessoais que potencialização seus resultados (confira mais abaixo). Níveis acima dos cursos (superficiais e teóricos, feitos para quem busca mais um certificado) que encontramos hoje pela internet, este curso foca na aplicação de técnicas ágeis para solucionar as principais deficiências das empresas atualmente no mercado, ensinando o passo-a-passo para planejar e gerenciar projetos com precisão, aumentar a produtividade, reduzir custos, eliminar horas extras e, como resultado natural, aumentar o lucro dos negócios. Resultado de anos de consultorias em empresas de diversas áreas que apresentam problemas e dificuldades comuns e que, facilmente, podem ser solucionadas através da aplicação de técnicas de gerenciamento de projetos, mesmo que você não saiba nada sobre o assunto hoje.','Scrum, Ágil, Gerenciamento de projetos','https://www.udemy.com/course/gestao-projetos-agile-scrum-completo/#instructor-1','Português','Scrum',NULL,NULL,1),(3,'Testes Automáticos + Curso COMPLETO de Teste de Software','5 horas','Gustavo Farias','Indiscutivelmente o mais completo: Automação de Testes + Fundamentos e Técnicas do Teste de Software, tudo em um curso!',16.99,'Dominar os fundamentos do teste e do teste automático de software, as técnicas envolvidas, os tipos e níveis de teste. Receber ferramentas gratuitas para que possam aplicar o que foi aprendido de imediato em seus projetos Receber orientações detalhadas sobre como se tornar um testador de alto nível e, principalmente, sobre como, de diversas formas, transformar isto em oportunidades imediatas e concretas no mercados de trabalho. Aprender claramente e receber orientações diretas sobre como o aprendizado deste curso irá te tornar alguém diferenciado por toda a sua carreira profissional, de programador/testador a líder, gerente e executivo','Testes Automatizados, Testes, JUnit','https://www.udemy.com/course/teste-software-completo-testes-automaticos/','Português','Testes, Automação de testes, JUnit',NULL,NULL,1),(4,'Java Programming Masterclass for Software Developers','80 hours','Tim Buchalka, Goran Lochert','Learn Java In This Course And Become a Computer Programmer. Obtain valuable Core Java Skills And Java Certification',18.99,'Learn the core Java skills needed to apply for Java developer positions in just 14 hours. Be able to sit for and pass the Oracle Java Certificate exam if you choose. Be able to demonstrate your understanding of Java to future employers. Learn industry \"best practices\" in Java software development from a professional Java developer who has worked in the language for 18 years. Acquire essential java basics for transitioning to the Spring Framework, Java EE, Android development and more. Obtain proficiency in Java 8 and Java 11.','Java, Certification','https://www.udemy.com/course/java-the-complete-java-developer-course/','English','Java',NULL,NULL,1),(5,'Modern Android App Development Bootcamp With Kotlin 2020','35,5 hours','Abd Alwahab','Learn Android App Development With Kotlin From the Beginning All the Way to Advanced Topic With the Most Easy',29.99,'We are going to Talk About Basics topics Like Kotlin and Design then we are going to Talk About Android Studio Functionality From Basics Like Adding a Text then Image then We are going to Talk About The intermediate Topics Like Animations and Play an Audios and Videos ListViews ,RecyclerView and also we are going to build 6 android apps and throw these two sections we are going to talk about the Android Views then we are going to talk about the advanced android Topics Like The Sqlite Database then Firebase Database  and also we are going to build 5 Advanced Android Apps','Kotlin, Android Studio, Mobile, Android','https://www.udemy.com/course/the-android-development-bootcamp-2019/','English','Kotlin, Android Studio',NULL,NULL,1),(6,'AZ-900 - Microsoft Azure Fundamentals Training Bootcamp 2020','9 hours','XaaS Technologies','Pass Azure AZ-900 Microsoft Fundamentals Exam. Complete Microsoft Certified Azure Fundamentals AZ-900 Certification!',27.99,'Beginners welcome: no need to know anything about Microsoft Azure!\n\nThis is going to be a 9 hours long journey, but passing the AZ-900 Microsoft Azure Fundamentals exam will be worth it!Simply put, here\'s what we\'ll learn to PASS the Microsoft Azure AZ-900 Fundamentals exam:\n\nAzure Cloud Fundamentals: cloud deployment and computing models, Azure global infrastructure with regions and availability zones\n\nAzure Core Compute Services: VMs, NSGs, LBs, Containers, Azure App Service, Azure Function, Azure Logic Apps\n\nAzure Core Storage Services: Storage Accounts, Managed Disks, Azure Blob Storage, Azure Files Storage, Azure Queues Storage, Azure Tables\n\nAzure Core Databases Services: Cosmos DB, SQL DB, MySQL DB, PostgreSQL DB\n\nAzure Miscellaneous Services: IoT, Big Data and Analytics, AI & ML, DevOps in Azure\n\nAzure Resource Manager: ARM and ARM templates, Tags, Policies and Locks\n\nMonitoring and Compliance: Azure Blueprints, Advisor, Azure Monitor, Azure Service Health\n\nSecurity Services Fundamentals: Cloud Shared Responsibility Model, Azure Security Center, Azure Active Directory, MFA, RBAC, Firewall & DDoS, Azure Key Vault, AIP, ATP\n\nPricing and Support: TCO Calculator, Azure Advisor, Azure Cost Management, Azure Support Plans, Azure Service Level Agreements (SLAs).','Microsoft Azure, Azure AZ-900 Microsoft Fundamentals Exam','https://www.udemy.com/course/microsoft-azure-fundamentals-training-bootcamp/','English with captions in portuguese','Microsoft Azure',NULL,NULL,1),(7,'Mini Faculdade PI','700 horas','Let\'s Code Academy','Aprenda as principais ferramentas e técnicas para tomar melhores decisões com seus dados.',6600,'ESTUDOU 4 ANOS\nE NÃO SE SENTE\nPREPARADO\nPARA TRABALHAR?\nNÓS TAMBÉM. Com essa preocupação, criamos o Pi, um curso de média duração para garantir sua alocação no mercado de trabalho em programação. Ao longo de 1 ano, de maneira extremamente prática, você desenvolverá projetos e raciocínio lógico para ingressar nas melhores vagas que existem no mercado.','Presencial, Data Science','https://letscode-academy.com/pi_ds.html','Português','AWS, Banco de dados, Firebase, Scrum, Kanban, Machine Learning, Redes Neurais, Big Data',NULL,NULL,6),(8,'Cloud Architect','Extenso','Digital House','Curso com elaboração do planejamento estratégico para nuvem privada, pública ou híbrida.',8990.99,'Você vai aprender: No curso, você aprenderá, projetará e construirá arquiteturas eficientes e escalonáveis ​​na AWS, seguindo as melhores práticas do mercado. Você irá configurar um data lake, criar APIs, fazer entradas de informações em tempo real e usar ETLs no Spark.','AWS, Sistemas distribuídos, Arquitetura de ambientes de nuvem','https://www.digitalhouse.com/br/curso/cloud-architect','Português','AWS, Docker, Computação em Nuvem',NULL,NULL,4);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuidora`
--

DROP TABLE IF EXISTS `distribuidora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribuidora` (
  `ID_Distribuidora` bigint NOT NULL AUTO_INCREMENT,
  `Nome_Distribuidora` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Distribuidora`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuidora`
--

LOCK TABLES `distribuidora` WRITE;
/*!40000 ALTER TABLE `distribuidora` DISABLE KEYS */;
INSERT INTO `distribuidora` VALUES (1,'Udemy'),(4,'Digital House'),(6,'Let\'s Code Academy');
/*!40000 ALTER TABLE `distribuidora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacao`
--

DROP TABLE IF EXISTS `transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacao` (
  `ID_Transacao` bigint NOT NULL AUTO_INCREMENT,
  `ID_Curso` bigint DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `Data` datetime DEFAULT NULL,
  `Email_Usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Transacao`),
  KEY `fk_TraCurso` (`ID_Curso`),
  CONSTRAINT `fk_TraCurso` FOREIGN KEY (`ID_Curso`) REFERENCES `curso` (`ID_Curso`)
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
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
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

-- Dump completed on 2020-07-01 23:54:29
