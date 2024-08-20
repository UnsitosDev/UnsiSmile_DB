-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: unsis_smile
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.24-MariaDB-1:10.5.24+maria~ubu2004

drop database if exists unsis_smile;
create database unsis_smile;

use unsis_smile;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id_address` bigint(20) NOT NULL AUTO_INCREMENT,
  `interior_number` varchar(4) DEFAULT NULL,
  `street_number` varchar(4) DEFAULT NULL,
  `fk_housing` varchar(2) NOT NULL,
  `fk_street` bigint(20) NOT NULL,
  PRIMARY KEY (`id_address`),
  KEY `FK6fwewbrpniyik837vms60g5rs` (`fk_housing`),
  KEY `FKtax4ewp3txydyls0fn7rfuk5s` (`fk_street`),
  CONSTRAINT `FK6fwewbrpniyik837vms60g5rs` FOREIGN KEY (`fk_housing`) REFERENCES `housings` (`id_housing`),
  CONSTRAINT `FKtax4ewp3txydyls0fn7rfuk5s` FOREIGN KEY (`fk_street`) REFERENCES `streets` (`id_street`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'10','10','1',3),(2,'st','st','1',1);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrators` (
  `employee_number` varchar(15) NOT NULL,
  `fk_person` varchar(20) NOT NULL,
  `fk_user` binary(16) NOT NULL,
  PRIMARY KEY (`employee_number`),
  KEY `FKjmnrfhqnt7buorudjcerj9407` (`fk_person`),
  KEY `FKcpp242h13a6kwot6td2pa8p3r` (`fk_user`),
  CONSTRAINT `FKcpp242h13a6kwot6td2pa8p3r` FOREIGN KEY (`fk_user`) REFERENCES `user_app` (`id`),
  CONSTRAINT `FKjmnrfhqnt7buorudjcerj9407` FOREIGN KEY (`fk_person`) REFERENCES `people` (`curp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers` (
  `id_career` bigint(20) NOT NULL AUTO_INCREMENT,
  `career` varchar(255) NOT NULL,
  PRIMARY KEY (`id_career`),
  UNIQUE KEY `UK_3xcttqoi3by1tt59sj2jqkxik` (`career`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `closed_answers_non_pathological`
--

DROP TABLE IF EXISTS `closed_answers_non_pathological`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `closed_answers_non_pathological` (
  `id_closed_answer_non_pathological` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` text DEFAULT NULL,
  `fk_closed_questions_id` bigint(20) DEFAULT NULL,
  `fk_medical_histories` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_closed_answer_non_pathological`),
  KEY `FK1b22vil67aatd7jkulitokdpa` (`fk_closed_questions_id`),
  KEY `FKlaemie09ph4y5ps9cyl58mhqc` (`fk_medical_histories`),
  CONSTRAINT `FK1b22vil67aatd7jkulitokdpa` FOREIGN KEY (`fk_closed_questions_id`) REFERENCES `closed_questions_pathological_antecedents` (`id_closed_question`),
  CONSTRAINT `FKlaemie09ph4y5ps9cyl58mhqc` FOREIGN KEY (`fk_medical_histories`) REFERENCES `medical_histories` (`id_medical_history`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closed_answers_non_pathological`
--

LOCK TABLES `closed_answers_non_pathological` WRITE;
/*!40000 ALTER TABLE `closed_answers_non_pathological` DISABLE KEYS */;
/*!40000 ALTER TABLE `closed_answers_non_pathological` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `closed_questions_pathological_antecedents`
--

DROP TABLE IF EXISTS `closed_questions_pathological_antecedents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `closed_questions_pathological_antecedents` (
  `id_closed_question` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  PRIMARY KEY (`id_closed_question`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closed_questions_pathological_antecedents`
--

LOCK TABLES `closed_questions_pathological_antecedents` WRITE;
/*!40000 ALTER TABLE `closed_questions_pathological_antecedents` DISABLE KEYS */;
INSERT INTO `closed_questions_pathological_antecedents` VALUES (1,'Tabaquismo'),(2,'Alcoholismo'),(3,'Otras sustancias psicoactivas o recreativas'),(4,'Perforaciones (Aretes, en mujeres además de los 2 aretes en cada oreja)'),(5,'Tatuajes'),(6,'Neoplasia (Cáncer)'),(7,'Diabetes'),(8,'Obesidad diagnosticada'),(9,'Padecimientos hematológicos/hemorrágicos/anemia/leucemia'),(10,'Malformaciones congénitas/Síndromes'),(11,'Problemas cardiacos/angina de pecho/infarto/tromboembolia/marcapasos/bypass'),(12,'Radioterapia/Quimioterapia'),(13,'Padecimientos reumatológicos/artritis/osteoporosis'),(14,'Enfermedades del riñón'),(15,'Enfermedades hepáticas/Hepatitis'),(16,'Enfermedades de transmisión sexual'),(17,'Hipertiroidismo/Hipotiroidismo'),(18,'Enfermedades de vías aéreas/asma'),(19,'Problemas oculares'),(20,'Enfermedades digestivas'),(21,'Tuberculosis o vive con persona(s) con este padecimiento'),(22,'Enfermedades de la piel'),(23,'Trasplantes de órganos'),(24,'Hipertensión Arterial'),(25,'Padecimientos mentales/convulsiones/desmayos/migraña/neuralgia');
/*!40000 ALTER TABLE `closed_questions_pathological_antecedents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cycles`
--

DROP TABLE IF EXISTS `cycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycles` (
  `id_cycle` bigint(20) NOT NULL AUTO_INCREMENT,
  `cycle_name` varchar(255) NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id_cycle`),
  UNIQUE KEY `UK_a25l70ifwyh0blql4041ckiwq` (`cycle_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cycles`
--

LOCK TABLES `cycles` WRITE;
/*!40000 ALTER TABLE `cycles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dental_code`
--

DROP TABLE IF EXISTS `dental_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dental_code` (
  `id_dental_code` bigint(20) NOT NULL AUTO_INCREMENT,
  `adult` bit(1) NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY (`id_dental_code`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dental_code`
--

LOCK TABLES `dental_code` WRITE;
/*!40000 ALTER TABLE `dental_code` DISABLE KEYS */;
INSERT INTO `dental_code` VALUES (1,_binary '','18'),(2,_binary '','17'),(3,_binary '','16'),(4,_binary '','15'),(5,_binary '','14'),(6,_binary '','13'),(7,_binary '','12'),(8,_binary '','11'),(9,_binary '','28'),(10,_binary '','27'),(11,_binary '','26'),(12,_binary '','25'),(13,_binary '','24'),(14,_binary '','23'),(15,_binary '','22'),(16,_binary '','21'),(17,_binary '','38'),(18,_binary '','37'),(19,_binary '','36'),(20,_binary '','35'),(21,_binary '','34'),(22,_binary '','33'),(23,_binary '','32'),(24,_binary '','31'),(25,_binary '','48'),(26,_binary '','47'),(27,_binary '','46'),(28,_binary '','45'),(29,_binary '','44'),(30,_binary '','43'),(31,_binary '','42'),(32,_binary '','41'),(33,_binary '\0','55'),(34,_binary '\0','54'),(35,_binary '\0','53'),(36,_binary '\0','52'),(37,_binary '\0','51'),(38,_binary '\0','65'),(39,_binary '\0','64'),(40,_binary '\0','63'),(41,_binary '\0','62'),(42,_binary '\0','61'),(43,_binary '\0','75'),(44,_binary '\0','74'),(45,_binary '\0','73'),(46,_binary '\0','72'),(47,_binary '\0','71'),(48,_binary '\0','85'),(49,_binary '\0','84'),(50,_binary '\0','83'),(51,_binary '\0','82'),(52,_binary '\0','81');
/*!40000 ALTER TABLE `dental_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educational_degree`
--

DROP TABLE IF EXISTS `educational_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educational_degree` (
  `id_educational_degree` bigint(20) NOT NULL AUTO_INCREMENT,
  `degree_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_educational_degree`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educational_degree`
--

LOCK TABLES `educational_degree` WRITE;
/*!40000 ALTER TABLE `educational_degree` DISABLE KEYS */;
/*!40000 ALTER TABLE `educational_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ethnic_groups`
--

DROP TABLE IF EXISTS `ethnic_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ethnic_groups` (
  `id_ethnic_group` bigint(20) NOT NULL,
  `ethnic_group` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_ethnic_group`),
  UNIQUE KEY `UK_bjgrghisvu03pru7u2m1lds75` (`ethnic_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ethnic_groups`
--

LOCK TABLES `ethnic_groups` WRITE;
/*!40000 ALTER TABLE `ethnic_groups` DISABLE KEYS */;
INSERT INTO `ethnic_groups` VALUES (65,'Aguacateco'),(24,'Amuzgo'),(55,'Cakchiquel'),(23,'Chatino'),(39,'Chichimeca Jonaz'),(15,'Chinanteco'),(43,'Chocho'),(12,'Chol'),(36,'Chontal de Oaxaca'),(21,'Chontal de Tabasco'),(42,'Chuj'),(62,'Cochimí'),(30,'Cora'),(59,'Cucapá'),(33,'Cuicateco'),(41,'Guarijío'),(11,'Huasteco'),(34,'Huave'),(26,'Huichol'),(51,'Ixcateco'),(63,'Ixil'),(47,'Jacalteco'),(37,'Kanjobal'),(48,'Kekchi'),(61,'Kikapú'),(64,'Kiliwa'),(60,'Kumiai'),(50,'Lacandón'),(31,'Mame'),(40,'Matlatzinca'),(2,'Maya'),(19,'Mayo'),(9,'Mazahua'),(10,'Mazateco'),(16,'Mixe'),(4,'Mixteco'),(54,'Motocintleco'),(1,'Náhuatl'),(14,'No especificada'),(45,'Ocuilteco'),(5,'Otomí'),(49,'Otras lenguas indígenas de América'),(52,'Otras lenguas indígenas de México'),(57,'Paipai'),(38,'Pame'),(58,'Papago'),(46,'Pima'),(29,'Popoloca'),(22,'Popoluca'),(13,'Purépecha'),(56,'Quiche'),(53,'Seri'),(44,'Tacuate'),(18,'Tarahumara'),(35,'Tepehua'),(27,'Tepehuan'),(17,'Tlapaneco'),(25,'Tojolabal'),(6,'Totonaca'),(28,'Triqui'),(8,'Tzeltal'),(7,'Tzotzil'),(32,'Yaqui'),(3,'Zapoteco'),(20,'Zoque');
/*!40000 ALTER TABLE `ethnic_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facial_exam`
--

DROP TABLE IF EXISTS `facial_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facial_exam` (
  `id_facial_exam` bigint(20) NOT NULL AUTO_INCREMENT,
  `distinguishing_features` text DEFAULT NULL,
  `fk_front` bigint(20) NOT NULL,
  `fk_profile` bigint(20) NOT NULL,
  PRIMARY KEY (`id_facial_exam`),
  KEY `FK2p7qr0ifl0hh3is5wx7bawgph` (`fk_front`),
  KEY `FK56fj7jfigix26bpxb7m0yrof2` (`fk_profile`),
  CONSTRAINT `FK2p7qr0ifl0hh3is5wx7bawgph` FOREIGN KEY (`fk_front`) REFERENCES `facial_front` (`id_facial_front`),
  CONSTRAINT `FK56fj7jfigix26bpxb7m0yrof2` FOREIGN KEY (`fk_profile`) REFERENCES `facial_profile` (`id_facial_profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facial_exam`
--

LOCK TABLES `facial_exam` WRITE;
/*!40000 ALTER TABLE `facial_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `facial_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facial_front`
--

DROP TABLE IF EXISTS `facial_front`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facial_front` (
  `id_facial_front` bigint(20) NOT NULL AUTO_INCREMENT,
  `facial_front` varchar(50) NOT NULL,
  PRIMARY KEY (`id_facial_front`),
  UNIQUE KEY `UK_95ato13i2a0dt7a43r1hf8q6x` (`facial_front`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facial_front`
--

LOCK TABLES `facial_front` WRITE;
/*!40000 ALTER TABLE `facial_front` DISABLE KEYS */;
INSERT INTO `facial_front` VALUES (1,'Branquifacial'),(3,'Dolicofacial'),(2,'Normofacial');
/*!40000 ALTER TABLE `facial_front` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facial_profile`
--

DROP TABLE IF EXISTS `facial_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facial_profile` (
  `id_facial_profile` bigint(20) NOT NULL AUTO_INCREMENT,
  `facial_profile` varchar(50) NOT NULL,
  PRIMARY KEY (`id_facial_profile`),
  UNIQUE KEY `UK_95s2blu4ra1gvwwe185m6fi9h` (`facial_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facial_profile`
--

LOCK TABLES `facial_profile` WRITE;
/*!40000 ALTER TABLE `facial_profile` DISABLE KEYS */;
INSERT INTO `facial_profile` VALUES (2,'Cóncavo'),(3,'Convexo'),(1,'Recto');
/*!40000 ALTER TABLE `facial_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `id_gender` bigint(20) NOT NULL AUTO_INCREMENT,
  `gender` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_gender`),
  UNIQUE KEY `UK_k38wg3gipsif7ipes44cf5ak5` (`gender`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` VALUES (2,'Femenino'),(1,'Masculino'),(99,'No binario');
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id_group` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `fk_career` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_group`),
  UNIQUE KEY `UK_7o859iyhxd19rv4hywgdvu2v4` (`group_name`),
  KEY `FK2r3h2ds7hdwal6t2gdwbs7xq9` (`fk_career`),
  CONSTRAINT `FK2r3h2ds7hdwal6t2gdwbs7xq9` FOREIGN KEY (`fk_career`) REFERENCES `careers` (`id_career`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardians`
--

DROP TABLE IF EXISTS `guardians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardians` (
  `id_guardian` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_guardian`),
  UNIQUE KEY `UK_c4gd8eub8nnr1e5nhvuapmasm` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardians`
--

LOCK TABLES `guardians` WRITE;
/*!40000 ALTER TABLE `guardians` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hereditary_family_history`
--

DROP TABLE IF EXISTS `hereditary_family_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hereditary_family_history` (
  `id_family_history` bigint(20) NOT NULL AUTO_INCREMENT,
  `main_response` enum('SI','NO') NOT NULL,
  `response_detail` text DEFAULT NULL,
  `fk_question` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_family_history`),
  KEY `FKssc4smwdhbp5cy5i0l7ewpk7n` (`fk_question`),
  CONSTRAINT `FKssc4smwdhbp5cy5i0l7ewpk7n` FOREIGN KEY (`fk_question`) REFERENCES `hereditary_family_history_questions` (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hereditary_family_history`
--

LOCK TABLES `hereditary_family_history` WRITE;
/*!40000 ALTER TABLE `hereditary_family_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `hereditary_family_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hereditary_family_history_questions`
--

DROP TABLE IF EXISTS `hereditary_family_history_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hereditary_family_history_questions` (
  `id_question` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_question`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hereditary_family_history_questions`
--

LOCK TABLES `hereditary_family_history_questions` WRITE;
/*!40000 ALTER TABLE `hereditary_family_history_questions` DISABLE KEYS */;
INSERT INTO `hereditary_family_history_questions` VALUES (1,'Neoplasia (Cáncer)'),(2,'Diabetes'),(3,'Hipertensión Arterial'),(4,'Padecimientos mentales/neurológicos'),(5,'Obesidad'),(6,'Padecimientos hematológicos'),(7,'Malformaciones congénitas'),(8,'Problemas cardiacos');
/*!40000 ALTER TABLE `hereditary_family_history_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_material`
--

DROP TABLE IF EXISTS `housing_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_material` (
  `housing_material_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `material` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`housing_material_id`),
  UNIQUE KEY `UK_4u47e64c9yx4qwivw3xrmk1c2` (`material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_material`
--

LOCK TABLES `housing_material` WRITE;
/*!40000 ALTER TABLE `housing_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `housing_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housings`
--

DROP TABLE IF EXISTS `housings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housings` (
  `id_housing` varchar(2) NOT NULL,
  `category` text DEFAULT NULL,
  PRIMARY KEY (`id_housing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housings`
--

LOCK TABLES `housings` WRITE;
/*!40000 ALTER TABLE `housings` DISABLE KEYS */;
INSERT INTO `housings` VALUES ('1','Casa única en el terreno'),('10','Viviendas colectivas'),('2','Casa que comparte terreno con otra(s)'),('3','Casa dúplex'),('4','Departamento en edificio'),('5','Vivienda en vecindad o cuartería'),('6','Vivienda en cuarto de azotea de un edificio'),('7','Local no construido para habitación'),('8','Vivienda móvil'),('9','Refugio'),('99','No especificado de vivienda particular');
/*!40000 ALTER TABLE `housings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localities`
--

DROP TABLE IF EXISTS `localities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localities` (
  `id_locality` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `postal_code` varchar(5) DEFAULT NULL,
  `fk_municipality` varchar(4) NOT NULL,
  PRIMARY KEY (`id_locality`),
  KEY `FKgecd32as33bbo2yh06etek0rp` (`fk_municipality`),
  CONSTRAINT `FKgecd32as33bbo2yh06etek0rp` FOREIGN KEY (`fk_municipality`) REFERENCES `municipalities` (`id_municipality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localities`
--

LOCK TABLES `localities` WRITE;
/*!40000 ALTER TABLE `localities` DISABLE KEYS */;
INSERT INTO `localities` VALUES ('01010','Miahuatlan','70805','2067');
/*!40000 ALTER TABLE `localities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marital_statuses`
--

DROP TABLE IF EXISTS `marital_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marital_statuses` (
  `id_marital_status` bigint(20) NOT NULL,
  `marital_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_marital_status`),
  UNIQUE KEY `UK_95a7iwl5gxn6hu82lvenflrjb` (`marital_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marital_statuses`
--

LOCK TABLES `marital_statuses` WRITE;
/*!40000 ALTER TABLE `marital_statuses` DISABLE KEYS */;
INSERT INTO `marital_statuses` VALUES (2,'Casado'),(3,'Divorciado'),(1,'Soltero');
/*!40000 ALTER TABLE `marital_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_histories`
--

DROP TABLE IF EXISTS `medical_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_histories` (
  `id_medical_history` bigint(20) NOT NULL AUTO_INCREMENT,
  `fk_facial_exam` bigint(20) DEFAULT NULL,
  `fk_final_odontogram` bigint(20) DEFAULT NULL,
  `fk_initial_odontogram` bigint(20) DEFAULT NULL,
  `fk_non_pathological_personal_antecedents` bigint(20) DEFAULT NULL,
  `fk_vital_signs` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_medical_history`),
  UNIQUE KEY `UK_9ps2xp750fcj3f9pa216fie2b` (`fk_vital_signs`),
  KEY `FKhdu4a46cif3nqcc5s68r0w7bn` (`fk_facial_exam`),
  KEY `FKgo8hepew1xjgf8saygcxios6c` (`fk_final_odontogram`),
  KEY `FKrhhi1yjakls4yd90dwdrwrjl8` (`fk_initial_odontogram`),
  KEY `FKpsuybpkd2wlp514s7dsfqmdtu` (`fk_non_pathological_personal_antecedents`),
  CONSTRAINT `FK96gliu18alyh4wjf0xee48cwf` FOREIGN KEY (`fk_vital_signs`) REFERENCES `vital_signs` (`id_vital_signs`),
  CONSTRAINT `FKgo8hepew1xjgf8saygcxios6c` FOREIGN KEY (`fk_final_odontogram`) REFERENCES `odontogram` (`id_odontogram`),
  CONSTRAINT `FKhdu4a46cif3nqcc5s68r0w7bn` FOREIGN KEY (`fk_facial_exam`) REFERENCES `facial_exam` (`id_facial_exam`),
  CONSTRAINT `FKpsuybpkd2wlp514s7dsfqmdtu` FOREIGN KEY (`fk_non_pathological_personal_antecedents`) REFERENCES `non_pathological_personal_antecedents` (`id_non_pathological_personal_antecedents`),
  CONSTRAINT `FKrhhi1yjakls4yd90dwdrwrjl8` FOREIGN KEY (`fk_initial_odontogram`) REFERENCES `odontogram` (`id_odontogram`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_histories`
--

LOCK TABLES `medical_histories` WRITE;
/*!40000 ALTER TABLE `medical_histories` DISABLE KEYS */;
INSERT INTO `medical_histories` VALUES (1,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `medical_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipalities`
--

DROP TABLE IF EXISTS `municipalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipalities` (
  `id_municipality` varchar(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fk_state` varchar(2) NOT NULL,
  PRIMARY KEY (`id_municipality`),
  KEY `FKglgwbymcj9rjapun2otyp4n1w` (`fk_state`),
  CONSTRAINT `FKglgwbymcj9rjapun2otyp4n1w` FOREIGN KEY (`fk_state`) REFERENCES `states` (`id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipalities`
--

LOCK TABLES `municipalities` WRITE;
/*!40000 ALTER TABLE `municipalities` DISABLE KEYS */;
INSERT INTO `municipalities` VALUES ('2001','Abejones','20'),('2002','Acatlan de Perez Figueroa','20'),('2003','Animas Trujano','20'),('2004','Asuncion Cacalotepec','20'),('2005','Asuncion Cuyotepeji','20'),('2006','Asuncion Ixtaltepec','20'),('2007','Asuncion Nochixtlan','20'),('2008','Asuncion Ocotlan','20'),('2009','Asuncion Tlacolulita','20'),('2010','Ayoquezco de Aldama','20'),('2011','Ayotzintepec','20'),('2012','Calihuala','20'),('2013','Candelaria Loxicha','20'),('2014','Capulalpam de Mendez','20'),('2015','Chahuites','20'),('2016','Chalcatongo de Hidalgo','20'),('2017','Chiquihuitlan de Benito Juarez','20'),('2018','Cienega de Zimatlan','20'),('2019','Ciudad Ixtepec','20'),('2020','Coatecas Altas','20'),('2021','Coicoyan de las Flores','20'),('2022','Concepcion Buenavista','20'),('2023','Concepcion Papalo','20'),('2024','Constancia del Rosario','20'),('2025','Cosolapa','20'),('2026','Cosoltepec','20'),('2027','Cuilapam de Guerrero','20'),('2028','Cuna de la Independencia de Oaxaca','20'),('2029','Cuyamecalco Villa de Zaragoza','20'),('2030','El Barrio de la Soledad','20'),('2031','El Espinal','20'),('2032','Eloxochitlan de Flores Magon','20'),('2033','Fresnillo de Trujano','20'),('2034','Guadalupe Etla','20'),('2035','Guadalupe de Ramirez','20'),('2036','Guelatao de Juarez','20'),('2037','Guevea de Humboldt','20'),('2038','Heroica Ciudad de Ejutla de Crespo','20'),('2039','Heroica Ciudad de Huajuapan de Leon','20'),('2040','Heroica Ciudad de Juchitan de Zaragoza','20'),('2041','Heroica Ciudad de Tlaxiaco','20'),('2042','Heroica Villa Tezoatlan de Segura y Luna','20'),('2043','Huautepec','20'),('2044','Huautla de Jimenez','20'),('2045','Ixpantepec Nieves','20'),('2046','Ixtlan de Juarez','20'),('2047','La Compania','20'),('2048','La Pe','20'),('2049','La Reforma','20'),('2050','La Trinidad Vista Hermosa','20'),('2051','Loma Bonita','20'),('2052','Magdalena Apasco','20'),('2053','Magdalena Jaltepec','20'),('2054','Magdalena Mixtepec','20'),('2055','Magdalena Ocotlan','20'),('2056','Magdalena Penasco','20'),('2057','Magdalena Teitipac','20'),('2058','Magdalena Tequisistlan','20'),('2059','Magdalena Tlacotepec','20'),('2060','Magdalena Yodocono de Porfirio Diaz','20'),('2061','Magdalena Zahuatlan','20'),('2062','Mariscala de Juarez','20'),('2063','Martires de Tacubaya','20'),('2064','Matias Romero Avendano','20'),('2065','Mazatlan Villa de Flores','20'),('2066','Mesones Hidalgo','20'),('2067','Miahuatlan de Porfirio Diaz','20'),('2068','Mixistlan de la Reforma','20'),('2069','Monjas','20'),('2070','Natividad','20'),('2071','Nazareno Etla','20'),('2072','Nejapa de Madero','20'),('2073','Nuevo Zoquiapam','20'),('2074','Oaxaca de Juarez','20'),('2075','Ocotlan de Morelos','20'),('2076','Pinotepa de Don Luis','20'),('2077','Pluma Hidalgo','20'),('2078','Putla Villa de Guerrero','20'),('2079','Reforma de Pineda','20'),('2080','Reyes Etla','20'),('2081','Rojas de Cuauhtemoc','20'),('2082','Salina Cruz','20'),('2083','San Agustin Amatengo','20'),('2084','San Agustin Atenango','20'),('2085','San Agustin Chayuco','20'),('2086','San Agustin Etla','20'),('2087','San Agustin Loxicha','20'),('2088','San Agustin Tlacotepec','20'),('2089','San Agustin Yatareni','20'),('2090','San Agustin de las Juntas','20'),('2091','San Andres Cabecera Nueva','20'),('2092','San Andres Dinicuiti','20'),('2093','San Andres Huaxpaltepec','20'),('2094','San Andres Huayapam','20'),('2095','San Andres Ixtlahuaca','20'),('2096','San Andres Lagunas','20'),('2097','San Andres Nuxino','20'),('2098','San Andres Paxtlan','20'),('2099','San Andres Sinaxtla','20'),('2100','San Andres Solaga','20'),('2101','San Andres Teotilalpam','20'),('2102','San Andres Tepetlapa','20'),('2103','San Andres Yaa','20'),('2104','San Andres Zabache','20'),('2105','San Andres Zautla','20'),('2106','San Antonino Castillo Velasco','20'),('2107','San Antonino Monte Verde','20'),('2108','San Antonino el Alto','20'),('2109','San Antonio Acutla','20'),('2110','San Antonio Huitepec','20'),('2111','San Antonio Nanahuatipam','20'),('2112','San Antonio Sinicahua','20'),('2113','San Antonio Tepetlapa','20'),('2114','San Antonio de la Cal','20'),('2115','San Baltazar Chichicapam','20'),('2116','San Baltazar Loxicha','20'),('2117','San Baltazar Yatzachi el Bajo','20'),('2118','San Bartolo Coyotepec','20'),('2119','San Bartolo Soyaltepec','20'),('2120','San Bartolo Yautepec','20'),('2121','San Bartolome Ayautla','20'),('2122','San Bartolome Loxicha','20'),('2123','San Bartolome Quialana','20'),('2124','San Bartolome Yucuane','20'),('2125','San Bartolome Zoogocho','20'),('2126','San Bernardo Mixtepec','20'),('2127','San Blas Atempa','20'),('2128','San Carlos Yautepec','20'),('2129','San Cristobal Amatlan','20'),('2130','San Cristobal Amoltepec','20'),('2131','San Cristobal Lachirioag','20'),('2132','San Cristobal Suchixtlahuaca','20'),('2133','San Dionisio Ocotepec','20'),('2134','San Dionisio Ocotlan','20'),('2135','San Dionisio del Mar','20'),('2136','San Esteban Atatlahuca','20'),('2137','San Felipe Jalapa de Diaz','20'),('2138','San Felipe Tejalapam','20'),('2139','San Felipe Usila','20'),('2140','San Francisco Cahuacua','20'),('2141','San Francisco Cajonos','20'),('2142','San Francisco Chapulapa','20'),('2143','San Francisco Chindua','20'),('2144','San Francisco Huehuetlan','20'),('2145','San Francisco Ixhuatan','20'),('2146','San Francisco Jaltepetongo','20'),('2147','San Francisco Lachigolo','20'),('2148','San Francisco Logueche','20'),('2149','San Francisco Nuxano','20'),('2150','San Francisco Ozolotepec','20'),('2151','San Francisco Sola','20'),('2152','San Francisco Telixtlahuaca','20'),('2153','San Francisco Teopan','20'),('2154','San Francisco Tlapancingo','20'),('2155','San Francisco del Mar','20'),('2156','San Gabriel Mixtepec','20'),('2157','San Ildefonso Amatlan','20'),('2158','San Ildefonso Sola','20'),('2159','San Ildefonso Villa Alta','20'),('2160','San Jacinto Amilpas','20'),('2161','San Jacinto Tlacotepec','20'),('2162','San Jeronimo Coatlan','20'),('2163','San Jeronimo Silacayoapilla','20'),('2164','San Jeronimo Sosola','20'),('2165','San Jeronimo Taviche','20'),('2166','San Jeronimo Tecoatl','20'),('2167','San Jeronimo Tlacochahuaya','20'),('2168','San Jorge Nuchita','20'),('2169','San Jose Ayuquila','20'),('2170','San Jose Chiltepec','20'),('2171','San Jose Estancia Grande','20'),('2172','San Jose Independencia','20'),('2173','San Jose Lachiguiri','20'),('2174','San Jose Tenango','20'),('2175','San Jose del Penasco','20'),('2176','San Jose del Progreso','20'),('2177','San Juan Achiutla','20'),('2178','San Juan Atepec','20'),('2179','San Juan Bautista Atatlahuca','20'),('2180','San Juan Bautista Coixtlahuaca','20'),('2181','San Juan Bautista Cuicatlan','20'),('2182','San Juan Bautista Guelache','20'),('2183','San Juan Bautista Jayacatlan','20'),('2184','San Juan Bautista Lo de Soto','20'),('2185','San Juan Bautista Suchitepec','20'),('2186','San Juan Bautista Tlachichilco','20'),('2187','San Juan Bautista Tlacoatzintepec','20'),('2188','San Juan Bautista Tuxtepec','20'),('2189','San Juan Bautista Valle Nacional','20'),('2190','San Juan Cacahuatepec','20'),('2191','San Juan Chicomezuchil','20'),('2192','San Juan Chilateca','20'),('2193','San Juan Cieneguilla','20'),('2194','San Juan Coatzospam','20'),('2195','San Juan Colorado','20'),('2196','San Juan Comaltepec','20'),('2197','San Juan Cotzocon','20'),('2198','San Juan Diuxi','20'),('2199','San Juan Evangelista Analco','20'),('2200','San Juan Guelavia','20'),('2201','San Juan Guichicovi','20'),('2202','San Juan Ihualtepec','20'),('2203','San Juan Juquila Mixes','20'),('2204','San Juan Juquila Vijanos','20'),('2205','San Juan Lachao','20'),('2206','San Juan Lachigalla','20'),('2207','San Juan Lajarcia','20'),('2208','San Juan Lalana','20'),('2209','San Juan Mazatlan','20'),('2210','San Juan Mixtepec','20'),('2211','San Juan Mixtepec','20'),('2212','San Juan Numi','20'),('2213','San Juan Ozolotepec','20'),('2214','San Juan Petlapa','20'),('2215','San Martin Huamelulpam','20'),('2216','San Martin Itunyoso','20'),('2217','San Martin Lachila','20'),('2218','San Martin Peras','20'),('2219','San Martin Tilcajete','20'),('2220','San Martin Toxpalan','20'),('2221','San Martin Zacatepec','20'),('2222','San Martin de los Cansecos','20'),('2223','San Mateo Cajonos','20'),('2224','San Mateo Etlatongo','20'),('2225','San Mateo Nejapam','20'),('2226','San Mateo Penasco','20'),('2227','San Mateo Pinas','20'),('2228','San Mateo Rio Hondo','20'),('2229','San Mateo Sindihui','20'),('2230','San Mateo Tlapiltepec','20'),('2231','San Mateo Yoloxochitlan','20'),('2232','San Mateo Yucutindoo','20'),('2233','San Mateo del Mar','20'),('2234','San Melchor Betaza','20'),('2235','San Miguel Achiutla','20'),('2236','San Miguel Ahuehuetitlan','20'),('2237','San Miguel Aloapam','20'),('2238','San Miguel Amatitlan','20'),('2239','San Miguel Amatlan','20'),('2240','San Miguel Chicahua','20'),('2241','San Miguel Chimalapa','20'),('2242','San Miguel Coatlan','20'),('2243','San Miguel Ejutla','20'),('2244','San Miguel Huautla','20'),('2245','San Miguel Mixtepec','20'),('2246','San Miguel Panixtlahuaca','20'),('2247','San Miguel Peras','20'),('2248','San Miguel Piedras','20'),('2249','San Miguel Quetzaltepec','20'),('2250','San Miguel Santa Flor','20'),('2251','San Miguel Soyaltepec','20'),('2252','San Miguel Suchixtepec','20'),('2253','San Miguel Tecomatlan','20'),('2254','San Miguel Tenango','20'),('2255','San Miguel Tequixtepec','20'),('2256','San Miguel Tilquiapam','20'),('2257','San Miguel Tlacamama','20'),('2258','San Miguel Tlacotepec','20'),('2259','San Miguel Tulancingo','20'),('2260','San Miguel Yotao','20'),('2261','San Miguel del Puerto','20'),('2262','San Miguel del Rio','20'),('2263','San Miguel el Grande','20'),('2264','San Nicolas Hidalgo','20'),('2265','San Nicolas','20'),('2266','San Pablo Coatlan','20'),('2267','San Pablo Cuatro Venados','20'),('2268','San Pablo Etla','20'),('2269','San Pablo Huitzo','20'),('2270','San Pablo Huixtepec','20'),('2271','San Pablo Macuiltianguis','20'),('2272','San Pablo Tijaltepec','20'),('2273','San Pablo Villa de Mitla','20'),('2274','San Pablo Yaganiza','20'),('2275','San Pedro Amuzgos','20'),('2276','San Pedro Apostol','20'),('2277','San Pedro Atoyac','20'),('2278','San Pedro Cajonos','20'),('2279','San Pedro Comitancillo','20'),('2280','San Pedro Coxcaltepec Cantaros','20'),('2281','San Pedro Huamelula','20'),('2282','San Pedro Huilotepec','20'),('2283','San Pedro Ixcatlan','20'),('2284','San Pedro Ixtlahuaca','20'),('2285','San Pedro Jaltepetongo','20'),('2286','San Pedro Jicayan','20'),('2287','San Pedro Jocotipac','20'),('2288','San Pedro Juchatengo','20'),('2289','San Pedro Martir Quiechapa','20'),('2290','San Pedro Martir Yucuxaco','20'),('2291','San Pedro Martir','20'),('2292','San Pedro Mixtepec','20'),('2293','San Pedro Mixtepec','20'),('2294','San Pedro Molinos','20'),('2295','San Pedro Nopala','20'),('2296','San Pedro Ocopetatillo','20'),('2297','San Pedro Ocotepec','20'),('2298','San Pedro Pochutla','20'),('2299','San Pedro Quiatoni','20'),('2300','San Pedro Sochiapam','20'),('2301','San Pedro Tapanatepec','20'),('2302','San Pedro Taviche','20'),('2303','San Pedro Teozacoalco','20'),('2304','San Pedro Teutila','20'),('2305','San Pedro Tidaa','20'),('2306','San Pedro Topiltepec','20'),('2307','San Pedro Totolapam','20'),('2308','San Pedro Yaneri','20'),('2309','San Pedro Yolox','20'),('2310','San Pedro Yucunama','20'),('2311','San Pedro el Alto','20'),('2312','San Pedro y San Pablo Ayutla','20'),('2313','San Pedro y San Pablo Teposcolula','20'),('2314','San Pedro y San Pablo Tequixtepec','20'),('2315','San Raymundo Jalpan','20'),('2316','San Sebastian Abasolo','20'),('2317','San Sebastian Coatlan','20'),('2318','San Sebastian Ixcapa','20'),('2319','San Sebastian Nicananduta','20'),('2320','San Sebastian Rio Hondo','20'),('2321','San Sebastian Tecomaxtlahuaca','20'),('2322','San Sebastian Teitipac','20'),('2323','San Sebastian Tutla','20'),('2324','San Simon Almolongas','20'),('2325','San Simon Zahuatlan','20'),('2326','San Vicente Coatlan','20'),('2327','San Vicente Lachixio','20'),('2328','San Vicente Nunu','20'),('2329','Santa Ana Ateixtlahuaca','20'),('2330','Santa Ana Cuauhtemoc','20'),('2331','Santa Ana Tavela','20'),('2332','Santa Ana Tlapacoyan','20'),('2333','Santa Ana Yareni','20'),('2334','Santa Ana Zegache','20'),('2335','Santa Ana del Valle','20'),('2336','Santa Ana','20'),('2337','Santa Catalina Quieri','20'),('2338','Santa Catarina Cuixtla','20'),('2339','Santa Catarina Ixtepeji','20'),('2340','Santa Catarina Juquila','20'),('2341','Santa Catarina Lachatao','20'),('2342','Santa Catarina Loxicha','20'),('2343','Santa Maria Tataltepec','20'),('2344','Santa Maria Tecomavaca','20'),('2345','Santa Maria Temaxcalapa','20'),('2346','Santa Maria Temaxcaltepec','20'),('2347','Santa Maria Teopoxco','20'),('2348','Santa Maria Tepantlali','20'),('2349','Santa Maria Texcatitlan','20'),('2350','Santa Maria Tlahuitoltepec','20'),('2351','Santa Maria Tlalixtac','20'),('2352','Santa Maria Tonameca','20'),('2353','Santa Maria Totolapilla','20'),('2354','Santa Maria Xadani','20'),('2355','Santa Maria Yalina','20'),('2356','Santa Maria Yavesia','20'),('2357','Santa Maria Yolotepec','20'),('2358','Santa Maria Yosoyua','20'),('2359','Santa Maria Yucuhiti','20'),('2360','Santa Maria Zacatepec','20'),('2361','Santa Maria Zaniza','20'),('2362','Santa Maria Zoquitlan','20'),('2363','Santa Maria del Rosario','20'),('2364','Santa Maria del Tule','20'),('2365','Santa Maria la Asuncion','20'),('2366','Santiago Amoltepec','20'),('2367','Santiago Apoala','20'),('2368','Santiago Apostol','20'),('2369','Santiago Astata','20'),('2370','Santiago Atitlan','20'),('2371','Santiago Ayuquililla','20'),('2372','Santiago Cacaloxtepec','20'),('2373','Santiago Camotlan','20'),('2374','Santiago Chazumba','20'),('2375','Santiago Choapam','20'),('2376','Santiago Comaltepec','20'),('2377','Santiago Huajolotitlan','20'),('2378','Santiago Huauclilla','20'),('2379','Santiago Ihuitlan Plumas','20'),('2380','Santiago Ixcuintepec','20'),('2381','Santiago Ixtayutla','20'),('2382','Santiago Jamiltepec','20'),('2383','Santiago Jocotepec','20'),('2384','Santiago Juxtlahuaca','20'),('2385','Santiago Lachiguiri','20'),('2386','Santiago Lalopa','20'),('2387','Santiago Laollaga','20'),('2388','Santiago Laxopa','20'),('2389','Santiago Llano Grande','20'),('2390','Santiago Matatlan','20'),('2391','Santiago Miltepec','20'),('2392','Santiago Minas','20'),('2393','Santiago Nacaltepec','20'),('2394','Santiago Nejapilla','20'),('2395','Santiago Niltepec','20'),('2396','Santiago Nundiche','20'),('2397','Santiago Nuyoo','20'),('2398','Santiago Pinotepa Nacional','20'),('2399','Santiago Suchilquitongo','20'),('2400','Santiago Tamazola','20'),('2401','Santiago Tapextla','20'),('2402','Santiago Tenango','20'),('2403','Santiago Tepetlapa','20'),('2404','Santiago Tetepec','20'),('2405','Santiago Texcalcingo','20'),('2406','Santiago Textitlan','20'),('2407','Santiago Tilantongo','20'),('2408','Santiago Tillo','20'),('2409','Santiago Tlazoyaltepec','20'),('2410','Santiago Xanica','20'),('2411','Santiago Xiacui','20'),('2412','Santiago Yaitepec','20'),('2413','Santiago Yaveo','20'),('2414','Santiago Yolomecatl','20'),('2415','Santiago Yosondua','20'),('2416','Santiago Yucuyachi','20'),('2417','Santiago Zacatepec','20'),('2418','Santiago Zoochila','20'),('2419','Santiago del Rio','20'),('2420','Santo Domingo Albarradas','20'),('2421','Santo Domingo Armenta','20'),('2422','Santo Domingo Chihuitan','20'),('2423','Santo Domingo Ingenio','20'),('2424','Santo Domingo Ixcatlan','20'),('2425','Santo Domingo Nuxaa','20'),('2426','Santo Domingo Ozolotepec','20'),('2427','Santo Domingo Petapa','20'),('2428','Santo Domingo Roayaga','20'),('2429','Santo Domingo Tehuantepec','20'),('2430','Santo Domingo Teojomulco','20'),('2431','Santo Domingo Tepuxtepec','20'),('2432','Santo Domingo Tlatayapam','20'),('2433','Santo Domingo Tomaltepec','20'),('2434','Santo Domingo Tonala','20'),('2435','Santo Domingo Tonaltepec','20'),('2436','Santo Domingo Xagacia','20'),('2437','Santo Domingo Yanhuitlan','20'),('2438','Santo Domingo Yodohino','20'),('2439','Santo Domingo Zanatepec','20'),('2441','Santo Domingo de Morelos','20'),('2442','Santo Tomas Jalieza','20'),('2443','Santo Tomas Mazaltepec','20'),('2444','Santo Tomas Ocotepec','20'),('2445','Santo Tomas Tamazulapan','20'),('2446','Santos Reyes Nopala','20'),('2447','Santos Reyes Papalo','20'),('2448','Santos Reyes Tepejillo','20'),('2449','Santos Reyes Yucuna','20'),('2450','Silacayoapam','20'),('2451','Sitio de Xitlapehua','20'),('2452','Soledad Etla','20'),('2453','Tamazulapam del Espiritu Santo','20'),('2454','Tanetze de Zaragoza','20'),('2455','Taniche','20'),('2456','Tataltepec de Valdes','20'),('2457','Teococuilco de Marcos Perez','20'),('2458','Teotitlan de Flores Magon','20'),('2459','Teotitlan del Valle','20'),('2460','Teotongo','20'),('2461','Tepelmeme Villa de Morelos','20'),('2462','Tlacolula de Matamoros','20'),('2463','Tlacotepec Plumas','20'),('2464','Tlalixtac de Cabrera','20'),('2465','Totontepec Villa de Morelos','20'),('2466','Trinidad Zaachila','20'),('2467','Union Hidalgo','20'),('2468','Valerio Trujano','20'),('2469','Villa Diaz Ordaz','20'),('2470','Villa Hidalgo','20'),('2471','Villa Sola de Vega','20'),('2472','Villa Talea de Castro','20'),('2473','Villa Tejupam de la Union','20'),('2474','Villa de Chilapa de Diaz','20'),('2475','Villa de Etla','20'),('2476','Villa de Tamazulapam del Progreso','20'),('2477','Villa de Tututepec','20'),('2478','Villa de Zaachila','20'),('2479','Yaxe','20'),('2480','Yogana','20'),('2481','Yutanduchi de Guerrero','20'),('2482','Zapotitlan Lagunas','20'),('2483','Zapotitlan Palmas','20'),('2484','Zimatlan de Alvarez','20');
/*!40000 ALTER TABLE `municipalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalities`
--

DROP TABLE IF EXISTS `nationalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationalities` (
  `id_nationality` bigint(20) NOT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_nationality`),
  UNIQUE KEY `UK_12dw9wtufmiacyb4mpq9iuqtu` (`nationality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalities`
--

LOCK TABLES `nationalities` WRITE;
/*!40000 ALTER TABLE `nationalities` DISABLE KEYS */;
INSERT INTO `nationalities` VALUES (3,'Canadiense'),(4,'Española'),(2,'Estadounidense'),(5,'Francesa'),(1,'Mexicana');
/*!40000 ALTER TABLE `nationalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neighborhoods`
--

DROP TABLE IF EXISTS `neighborhoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neighborhoods` (
  `id_neighborhood` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `fk_locality` varchar(5) NOT NULL,
  PRIMARY KEY (`id_neighborhood`),
  KEY `FKcnju14or3j0n7jsu0983icv60` (`fk_locality`),
  CONSTRAINT `FKcnju14or3j0n7jsu0983icv60` FOREIGN KEY (`fk_locality`) REFERENCES `localities` (`id_locality`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neighborhoods`
--

LOCK TABLES `neighborhoods` WRITE;
/*!40000 ALTER TABLE `neighborhoods` DISABLE KEYS */;
INSERT INTO `neighborhoods` VALUES (1,'Colonia centro','01010'),(2,'La merced','01010'),(3,'Barrio San Isidro','01010');
/*!40000 ALTER TABLE `neighborhoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `non_pathological_personal_antecedents`
--

DROP TABLE IF EXISTS `non_pathological_personal_antecedents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_pathological_personal_antecedents` (
  `id_non_pathological_personal_antecedents` bigint(20) NOT NULL AUTO_INCREMENT,
  `daily_sleep_hours` bigint(20) DEFAULT NULL,
  `drinks_sodas` bit(1) DEFAULT NULL,
  `drinks_water_daily` bit(1) DEFAULT NULL,
  `eats_cereals` bit(1) DEFAULT NULL,
  `eats_fruits_vegetables` bit(1) DEFAULT NULL,
  `eats_junk_food` bit(1) DEFAULT NULL,
  `eats_meat` bit(1) DEFAULT NULL,
  `house_with_floor` bit(1) DEFAULT NULL,
  `times_bathes_per_week` bigint(20) DEFAULT NULL,
  `times_brushes_teeth_per_day` bigint(20) DEFAULT NULL,
  `fk_housing_material` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_non_pathological_personal_antecedents`),
  KEY `FKpscpuyjf9d5wpicd3pfsx40ib` (`fk_housing_material`),
  CONSTRAINT `FKpscpuyjf9d5wpicd3pfsx40ib` FOREIGN KEY (`fk_housing_material`) REFERENCES `housing_material` (`housing_material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_pathological_personal_antecedents`
--

LOCK TABLES `non_pathological_personal_antecedents` WRITE;
/*!40000 ALTER TABLE `non_pathological_personal_antecedents` DISABLE KEYS */;
/*!40000 ALTER TABLE `non_pathological_personal_antecedents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupations`
--

DROP TABLE IF EXISTS `occupations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `occupations` (
  `id_occupation` bigint(20) NOT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_occupation`),
  UNIQUE KEY `UK_elbul8ai2woincjektcvtwb2q` (`occupation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupations`
--

LOCK TABLES `occupations` WRITE;
/*!40000 ALTER TABLE `occupations` DISABLE KEYS */;
INSERT INTO `occupations` VALUES (17,'Administrador'),(18,'Científico'),(11,'Contador'),(16,'Economista'),(14,'Electricista'),(19,'Farmacéutico'),(3,'Ingeniero'),(2,'Maestro'),(15,'Mecánico'),(1,'Médico'),(99,'No definido'),(13,'Periodista'),(12,'Psicólogo'),(20,'Veterinario');
/*!40000 ALTER TABLE `occupations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odontogram`
--

DROP TABLE IF EXISTS `odontogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odontogram` (
  `id_odontogram` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL,
  `creation_date` date NOT NULL,
  PRIMARY KEY (`id_odontogram`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odontogram`
--

LOCK TABLES `odontogram` WRITE;
/*!40000 ALTER TABLE `odontogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `odontogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_answers_non_pathological`
--

DROP TABLE IF EXISTS `open_answers_non_pathological`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `open_answers_non_pathological` (
  `id_open_answer_non_pathological` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` text DEFAULT NULL,
  `fk_medical_histories` bigint(20) DEFAULT NULL,
  `fk_open_questions_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_open_answer_non_pathological`),
  KEY `FKt845lgk3b351vby55olhotqha` (`fk_medical_histories`),
  KEY `FKtohb3s54uqw4eefjt75ik40n9` (`fk_open_questions_id`),
  CONSTRAINT `FKt845lgk3b351vby55olhotqha` FOREIGN KEY (`fk_medical_histories`) REFERENCES `medical_histories` (`id_medical_history`),
  CONSTRAINT `FKtohb3s54uqw4eefjt75ik40n9` FOREIGN KEY (`fk_open_questions_id`) REFERENCES `open_questions_pathological_antecedents` (`id_open_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_answers_non_pathological`
--

LOCK TABLES `open_answers_non_pathological` WRITE;
/*!40000 ALTER TABLE `open_answers_non_pathological` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_answers_non_pathological` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_questions_pathological_antecedents`
--

DROP TABLE IF EXISTS `open_questions_pathological_antecedents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `open_questions_pathological_antecedents` (
  `id_open_question` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(300) NOT NULL,
  PRIMARY KEY (`id_open_question`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_questions_pathological_antecedents`
--

LOCK TABLES `open_questions_pathological_antecedents` WRITE;
/*!40000 ALTER TABLE `open_questions_pathological_antecedents` DISABLE KEYS */;
INSERT INTO `open_questions_pathological_antecedents` VALUES (1,'¿Has sido hospitalizado? (en mujeres también anotar datos de parto)'),(2,'Motivo de la hospitalización'),(3,'¿Ha tomado algún medicamento recientemente?'),(4,'¿Cuál es el motivo?'),(5,'¿Ha tenido algún problema con la anestesia dental o anestesia general?'),(6,'¿Cuál es el problema?'),(7,'¿Es alérgico/a a algún medicamento o sustancia?'),(8,'¿Cuál es la sustancia a la que es alérgico/a?'),(9,'(Solo para mujeres) ¿Está embarazada?'),(10,'Meses de embarazo');
/*!40000 ALTER TABLE `open_questions_pathological_antecedents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id_patient` bigint(20) NOT NULL AUTO_INCREMENT,
  `admission_date` date DEFAULT NULL,
  `has_disability` bit(1) DEFAULT NULL,
  `is_minor` bit(1) DEFAULT NULL,
  `fk_address` bigint(20) NOT NULL,
  `fk_ethnic_group` bigint(20) DEFAULT NULL,
  `fk_guardian` bigint(20) DEFAULT NULL,
  `fk_marital_status` bigint(20) DEFAULT NULL,
  `fk_medical_history` bigint(20) DEFAULT NULL,
  `fk_nationality` bigint(20) DEFAULT NULL,
  `fk_occupation` bigint(20) DEFAULT NULL,
  `fk_person` varchar(20) NOT NULL,
  `fk_religion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_patient`),
  KEY `FKdlvldb52keb39yb2ffnxvhucy` (`fk_address`),
  KEY `FKnk3agsyv8f6urfguu5clisowq` (`fk_ethnic_group`),
  KEY `FK16emrlmo0abbj6c3m5kq5wtoe` (`fk_guardian`),
  KEY `FKj6xaq25sn4vx5vht39rbdyc4` (`fk_marital_status`),
  KEY `FK4pvbm0k7mrhj4859h5o6fnno` (`fk_medical_history`),
  KEY `FKhc3qyee3pq9n7emkj30pl8m12` (`fk_nationality`),
  KEY `FKqgn35dn1jxc9gsgbcqjohu8nt` (`fk_occupation`),
  KEY `FK5eavkxggptydymedyrrxejw8h` (`fk_person`),
  KEY `FKp915937atqguh5h4s2am7d1d9` (`fk_religion`),
  CONSTRAINT `FK16emrlmo0abbj6c3m5kq5wtoe` FOREIGN KEY (`fk_guardian`) REFERENCES `guardians` (`id_guardian`),
  CONSTRAINT `FK4pvbm0k7mrhj4859h5o6fnno` FOREIGN KEY (`fk_medical_history`) REFERENCES `medical_histories` (`id_medical_history`),
  CONSTRAINT `FK5eavkxggptydymedyrrxejw8h` FOREIGN KEY (`fk_person`) REFERENCES `people` (`curp`),
  CONSTRAINT `FKdlvldb52keb39yb2ffnxvhucy` FOREIGN KEY (`fk_address`) REFERENCES `addresses` (`id_address`),
  CONSTRAINT `FKhc3qyee3pq9n7emkj30pl8m12` FOREIGN KEY (`fk_nationality`) REFERENCES `nationalities` (`id_nationality`),
  CONSTRAINT `FKj6xaq25sn4vx5vht39rbdyc4` FOREIGN KEY (`fk_marital_status`) REFERENCES `marital_statuses` (`id_marital_status`),
  CONSTRAINT `FKnk3agsyv8f6urfguu5clisowq` FOREIGN KEY (`fk_ethnic_group`) REFERENCES `ethnic_groups` (`id_ethnic_group`),
  CONSTRAINT `FKp915937atqguh5h4s2am7d1d9` FOREIGN KEY (`fk_religion`) REFERENCES `religions` (`id_religion`),
  CONSTRAINT `FKqgn35dn1jxc9gsgbcqjohu8nt` FOREIGN KEY (`fk_occupation`) REFERENCES `occupations` (`id_occupation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'2024-05-01',_binary '\0',_binary '\0',1,3,NULL,1,1,1,18,'JIAS2015ASDF',110103),(2,'2024-05-01',_binary '\0',_binary '\0',1,23,NULL,2,3,1,99,'AOPS011028HOCNRLA9',110103);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `curp` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `first_lastname` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `second_lastname` varchar(50) DEFAULT NULL,
  `second_name` varchar(50) DEFAULT NULL,
  `fk_gender` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`curp`),
  UNIQUE KEY `UK_sw73blrfiqs1etfk8qecdieyx` (`email`),
  KEY `FKf6hmgwsansmue1xrjuvnx4wpl` (`fk_gender`),
  CONSTRAINT `FKf6hmgwsansmue1xrjuvnx4wpl` FOREIGN KEY (`fk_gender`) REFERENCES `genders` (`id_gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES ('AOPS011028HOCNRLA9','2003-06-04','example@gmail.com','ANTONIO','JUAN','5645123541','Martíez','LUIS',1),('FIMJ011004HOCGRLA8','2001-10-04','froste@gmail.com','Figueroa','Joel','5018221525','Martinez','Francisco',1),('JIAS2015ASDF','2024-05-01','73338az@gmail.com','sanchez','juan','5645123541','perez','pedro',1),('stringstringstring','2024-04-30','string','string','string','5192603003','string','string',2);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodontogram`
--

DROP TABLE IF EXISTS `periodontogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodontogram` (
  `id_periodontogram` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id_periodontogram`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodontogram`
--

LOCK TABLES `periodontogram` WRITE;
/*!40000 ALTER TABLE `periodontogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `periodontogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pocket_measurement_detail`
--

DROP TABLE IF EXISTS `pocket_measurement_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pocket_measurement_detail` (
  `id_pocket_measurement_detail` bigint(20) NOT NULL AUTO_INCREMENT,
  `measurement` float DEFAULT NULL,
  `fk_dental_code` bigint(20) DEFAULT NULL,
  `fk_periodontogram` bigint(20) DEFAULT NULL,
  `fk_regions_measurement_pockets` bigint(20) DEFAULT NULL,
  `fk_tooth_regions_periodontogram` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_pocket_measurement_detail`),
  KEY `FKl566ufqp8am4e3h4q2yhrsy1p` (`fk_dental_code`),
  KEY `FK2tr9vew0odec4sickcskorob1` (`fk_periodontogram`),
  KEY `FK5aon02kq03rgqokrvjyxph8vd` (`fk_regions_measurement_pockets`),
  KEY `FKqr35mgumyne1v0jing4ml65ut` (`fk_tooth_regions_periodontogram`),
  CONSTRAINT `FK2tr9vew0odec4sickcskorob1` FOREIGN KEY (`fk_periodontogram`) REFERENCES `periodontogram` (`id_periodontogram`),
  CONSTRAINT `FK5aon02kq03rgqokrvjyxph8vd` FOREIGN KEY (`fk_regions_measurement_pockets`) REFERENCES `regions_measurement_pockets` (`id_regions_measurement_pockets`),
  CONSTRAINT `FKl566ufqp8am4e3h4q2yhrsy1p` FOREIGN KEY (`fk_dental_code`) REFERENCES `dental_code` (`id_dental_code`),
  CONSTRAINT `FKqr35mgumyne1v0jing4ml65ut` FOREIGN KEY (`fk_tooth_regions_periodontogram`) REFERENCES `tooth_regions_periodontogram` (`id_tooth_regions_periodontogram`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pocket_measurement_detail`
--

LOCK TABLES `pocket_measurement_detail` WRITE;
/*!40000 ALTER TABLE `pocket_measurement_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pocket_measurement_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions_measurement_pockets`
--

DROP TABLE IF EXISTS `regions_measurement_pockets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions_measurement_pockets` (
  `id_regions_measurement_pockets` bigint(20) NOT NULL AUTO_INCREMENT,
  `region` varchar(100) NOT NULL,
  PRIMARY KEY (`id_regions_measurement_pockets`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions_measurement_pockets`
--

LOCK TABLES `regions_measurement_pockets` WRITE;
/*!40000 ALTER TABLE `regions_measurement_pockets` DISABLE KEYS */;
INSERT INTO `regions_measurement_pockets` VALUES (1,'VESTIBULARES SUPERIORES'),(2,'PALATINAS'),(3,'VESTIBULARES INFERIORES'),(4,'LINGUALES');
/*!40000 ALTER TABLE `regions_measurement_pockets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `religions`
--

DROP TABLE IF EXISTS `religions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `religions` (
  `id_religion` bigint(20) NOT NULL,
  `religion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_religion`),
  UNIQUE KEY `UK_rm2yg4113s5nhv6hqqw98r65v` (`religion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
INSERT INTO `religions` VALUES (133100,'Adventistas del Séptimo Día'),(310301,'Agnósticos'),(240102,'Ágora'),(110104,'Agustino'),(131100,'Amistad Cristiana'),(110105,'Amor Misericordioso'),(130100,'Anabautista/Menonita'),(290101,'Ananda Marga'),(130200,'Anglicana/Episcopal'),(240103,'Antroposofía'),(280102,'Apostólica Tradicional México-USA (Santa Muerte)'),(131200,'Asambleas de Dios'),(110106,'Asuncionista'),(310201,'Ateos'),(230301,'Bahaísmo'),(130300,'Bautista'),(110107,'Benedictino'),(230101,'Budismo'),(130701,'Calvinista'),(110108,'Capuchino'),(110109,'Carmelita'),(110110,'Carmelita Descalza'),(131801,'Casa de Oración'),(110103,'Católico'),(110101,'Católico Apostólico Romano'),(110102,'Católico Romano'),(131802,'Centro de Fe, Esperanza y Amor de la Cruzada Misionera de Avivamiento'),(131803,'Centro de Fe, Esperanza y Amor Fuerza Ágape'),(230302,'Centro Onkaranada'),(240104,'Centros de Tensegridad'),(250101,'Chamanismo'),(220102,'Chiíes'),(290102,'Ciencia Cristiana'),(240114,'Ciencia Esotérica'),(290103,'Cienciología o Dianética'),(110111,'Cisterciense'),(110112,'Claretiano'),(110113,'Clérigos San Viator'),(110114,'Comboniano'),(240105,'Comunidad del Arco iris'),(110115,'Comunidad Salesiana'),(110116,'Concepcionistas Franciscanos'),(230303,'Confusionismo'),(110118,'Congregación de los Padres Bayonenses'),(130702,'Congregacional'),(290104,'Contacto Angélico'),(110117,'Corazonista'),(290105,'Creciendo en Gracia'),(270106,'Cristiana Espiritual'),(134100,'Cristianas'),(120106,'Cristianos Tradicionalistas'),(130703,'Cuáquera'),(240106,'Cuarto Camino'),(280103,'Culto a Jesús Malverde'),(110119,'Diócesis Maronita de México, Eparquía Nuestra Señora de los Mártires del Líbano'),(131804,'Discípulos de Cristo'),(110120,'Dominico'),(290106,'Eckankar'),(131805,'Ejército de Salvación'),(250102,'El Costumbre'),(110121,'Eparquía Greco-Melquita Católica'),(110122,'Ermitaño Eucarístico del Padre celestial'),(110123,'Esclavas de María Inmaculada'),(110124,'Escolapio'),(240107,'Esenios'),(270103,'Espiritista'),(270113,'Espíritu Santo, Pureza, Amor y Luz'),(240108,'Espiritualidad Nueva Era'),(270102,'Espiritualista'),(270105,'Espiritualista de la Tercera Era'),(270108,'Espiritualista Fe, Esperanza y Caridad, Jesús de la Montaña'),(270109,'Espiritualista para el Divino Maestro y la Pureza de María'),(270101,'Espiritualistas Eliasistas'),(270104,'Espiritualistas Trinitarios Marianos'),(110125,'Eudista'),(134200,'Evangélicas'),(110126,'Franciscano'),(131806,'Fraternidad Pentecostés Independiente'),(110127,'Fraternidad Sacerdotal San Pío X (Lefebristas)'),(240115,'Gnosticismo'),(240109,'Gran Fraternidad Blanca'),(240110,'Gran Fraternidad Universal'),(110128,'Guadalupano'),(230202,'Hare Krishna'),(110129,'Hermandad de Sacerdotes Operarios Diocesanos'),(110130,'Hermano de Nuestra Señora de Consolación en el Mundo'),(110131,'Hermano de San Juan de Dios'),(110133,'Hermano Obrero de María'),(110132,'Hermanos Fossores de la Sagrada Misericordia'),(110134,'Hijas de la Caridad de San Vicente de Paúl'),(110135,'Hijas de la Inmaculada Concepción'),(110136,'Hijas de María Auxiliadora'),(110137,'Hijas de San Pablo'),(110138,'Hijas del Divino Salvador'),(110139,'Hijas del Espíritu Santo'),(110140,'Hijos de la Sagrada Familia'),(110141,'Hijos de María Madre de la Iglesia'),(230201,'Hinduismo'),(110142,'Hospitalario de San Juan de Dios'),(250103,'Huaxcam Dios Xastacná'),(131807,'Iglesia Agua Viva'),(131808,'Iglesia Aposento Alto'),(131300,'Iglesia Apostólica de la Fe en Cristo Jesús'),(132601,'Iglesia Bíblica'),(110143,'Iglesia Católica Apostólica Mexicana'),(120102,'Iglesia Católica Apostólica Ortodoxa'),(120103,'Iglesia Católica Apostólica Ortodoxa del Patriarca de Moscú'),(120107,'Iglesia Católica Apostólica Romana Reformada'),(120108,'Iglesia Católica de Cristo Internacional'),(120109,'Iglesia Católica de los Apóstoles de los Tiempos Posteriores'),(110144,'Iglesia Católica de Rito Latino'),(120104,'Iglesia Católica Griega'),(120110,'Iglesia Católica Nacional Mexicana'),(120111,'Iglesia Católica Tridentina Rito Latino'),(131809,'Iglesia Cristiana Espiritual'),(131810,'Iglesia Cristiana Evangélica Pentecostal'),(131811,'Iglesia Cristiana Independiente Pentecostés'),(132100,'Iglesia Cristiana Interdenominacional'),(131812,'Iglesia Cristiana Interdenominacional de la República Mexicana'),(131819,'Iglesia Cristiana Solo Cristo Salva'),(132300,'Iglesia de Cristo'),(132602,'Iglesia de Cristo Miel'),(131400,'Iglesia de Dios'),(131500,'Iglesia de Dios de la Profecía'),(131600,'Iglesia de Dios en México del Evangelio Completo'),(133200,'Iglesia de Jesucristo de los Santos de los Últimos Días (Mormones)'),(131813,'Iglesia de Jesucristo sobre la Roca'),(290107,'Iglesia de la Unificación'),(131814,'Iglesia del Concilio Evangélico Pentecostal'),(132200,'Iglesia del Dios Vivo, Columna y Apoyo de la Verdad, la Luz del Mundo'),(132400,'Iglesia del Nazareno'),(132603,'Iglesia Evangélica Independiente de la República Mexicana'),(131815,'Iglesia Evangélica Pentecostés Cristo Roca de mi Salvación'),(280101,'Iglesia Fidencista Cristiana'),(110145,'Iglesia Madre'),(131816,'Iglesia Mexicana del Evangelio de Cristo Pentecostés'),(270112,'Iglesia Mexicana La Mujer Hermosa Vestida de Sol'),(120105,'Iglesia Ortodoxa Católica'),(131817,'Iglesia Pentecostal Unida de México'),(132604,'Iglesia Renovada de Jesucristo y los Apóstoles del Amor Divino'),(131818,'Iglesia Universal del Reino de Dios'),(250104,'In kantonal, Casa del Sol'),(240111,'Instituto Arica'),(110146,'Instituto del Verbo Encarnado'),(220101,'Islámicas'),(230304,'Jainismo'),(220103,'Jariyismo'),(110147,'Jerónimo'),(110148,'Jesuita'),(210101,'Judaica'),(270111,'La Luz y Esperanza'),(270110,'Las Tres Potencias Padre, Hijo y Espíritu Santo'),(110149,'Lazarita'),(110150,'Legionarios de Cristo'),(290108,'Loordista'),(130400,'Luterana'),(110151,'Mantellata Sierva de María'),(110153,'Marista'),(240116,'Masonería'),(290109,'Meditación Trascendental'),(110152,'Mercedaria del Santísimo Sacramento'),(240117,'Metafísica'),(240112,'Metafísicos Cristianos'),(130500,'Metodista'),(250105,'Mexicáyotl'),(290110,'Misión Rama'),(110154,'Misionera de la Cruz'),(110155,'Misionera del Verbo Divino'),(110156,'Misionera Hija del Corazón de María'),(110157,'Misionero de Guadalupe'),(110158,'Misionero de la Inmaculada Concepción'),(110159,'Misionero del Espíritu Santo'),(110160,'Misionero Redentorista'),(110161,'Misionero Xaveriano en el Mundo'),(110162,'Monje de la Adoración'),(250106,'Movimiento Confederado Restaurador de la Cultura de Anáhuac'),(290111,'Movimiento del Sendero Interior del Alma (MSIA)'),(131820,'Movimiento Iglesia Evangélica Pentecostés Independiente'),(290112,'Movimiento Raeliano'),(132500,'Movimientos Sincréticos Judaicos Neoisraelitas'),(240101,'New Age (Nueva era)'),(310101,'Ninguna religión'),(290113,'Niños de Dios'),(110163,'Nuestra Señora de la Consolación'),(240113,'Nueva Acrópolis'),(280104,'Nueva Jerusalén'),(110164,'Obra de Don Orione'),(240118,'Ocultismo'),(110165,'Operario del Reino de Cristo'),(110166,'Orden de San Benito'),(260101,'Origen afro'),(120101,'Ortodoxo'),(131824,'Otras asociaciones pentecostales'),(132605,'Otras cristianas evangélicas'),(130704,'Otras protestantes'),(290119,'Otros nuevos movimientos religiosos'),(290114,'Pacal Votán'),(290115,'Palmar de Troya'),(110167,'Pasionista'),(110168,'Paulino'),(134300,'Pentecostales'),(110169,'Pequeña Obra de la Divina Providencia'),(130600,'Presbiteriana'),(131700,'Príncipe de Paz'),(134400,'Protestantes'),(260102,'Rastafaris'),(250107,'Regina'),(999999,'Religión no especificada'),(250109,'Religiones indígenas'),(110170,'Religiosa de la Asunción'),(110171,'Religiosa de Nuestra Señora de Sión'),(110172,'Religiosa de San José de Gerona'),(110173,'Religiosa del Sagrado Corazón'),(240119,'Rosacruces'),(110174,'Sagrado Corazón'),(110175,'Salesiano'),(110176,'San José de Tarbes'),(280105,'San Pascualito'),(290116,'Santa Iglesia Tao Cristiana Espiritual'),(110177,'Servidor del Señor y la Virgen'),(110178,'Sierva de Jesús'),(110179,'Sierva de Jesús de la Caridad'),(110180,'Sierva de la Pasión'),(110181,'Siervo de María'),(110182,'Siervos de la Sagrada Familia'),(230305,'Sijismo'),(310401,'Sin adscripción religiosa (creyentes)'),(230306,'Sintoísmo'),(290117,'Sociedad de Ascensión(Ishayas)'),(110183,'Sociedad de San Pablo'),(110184,'Sociedad de San Pío X'),(270107,'Sociedad Judictora Reinado de Leonardo Alcalá Leos'),(120112,'Sociedad Sacerdotal Trento'),(290118,'Sri Sathya Sai Baba'),(220105,'Sufismo'),(220104,'Suníes'),(230307,'Taoísmo'),(240120,'Teosofía'),(110185,'Terciaria Capuchina de la Sagrada Familia'),(133300,'Testigos de Jehová'),(250108,'Toltecáyotl'),(120113,'Unión Católica Trento Mexicana'),(131822,'Unión de Iglesias Evangélicas Independientes'),(131821,'Unión Nacional de Iglesias Cristianas Evangélicas (UNICE)'),(131823,'Unión Nacional de Iglesias Evangélicas Pentecostés Emmanuel'),(110186,'Ursulina de la Unión Romana'),(110187,'Vicentino'),(240121,'Wicca'),(230308,'Zoroastrismo');
/*!40000 ALTER TABLE `religions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` enum('ROLE_ADMIN','ROLE_STUDENT') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_STUDENT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semesters` (
  `id_semester` bigint(20) NOT NULL AUTO_INCREMENT,
  `fk_cycle` bigint(20) DEFAULT NULL,
  `fk_group` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_semester`),
  KEY `FK1jd8yrqhktltrn0mjc2mabd7t` (`fk_cycle`),
  KEY `FK7xw362v78hao37tpjgwdecc2s` (`fk_group`),
  CONSTRAINT `FK1jd8yrqhktltrn0mjc2mabd7t` FOREIGN KEY (`fk_cycle`) REFERENCES `cycles` (`id_cycle`),
  CONSTRAINT `FK7xw362v78hao37tpjgwdecc2s` FOREIGN KEY (`fk_group`) REFERENCES `groups` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id_state` varchar(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('1','Aguascalientes'),('10','Durango'),('11','Guanajuato'),('12','Guerrero'),('13','Hidalgo'),('14','Jalisco'),('15','Edo. de México'),('16','Michoacán de Ocampo'),('17','Morelos'),('18','Nayarit'),('19','Nuevo León'),('2','Baja California'),('20','Oaxaca'),('21','Puebla'),('22','Querétaro'),('23','Quintana Roo'),('24','San Luis Potosí'),('25','Sinaloa'),('26','Sonora'),('27','Tabasco'),('28','Tamaulipas'),('29','Tlaxcala'),('3','Baja California Sur'),('30','Veracruz de Ignacio de la Llave'),('31','Yucatán'),('32','Zacatecas'),('33','Nacional'),('34','Extranjero'),('4','Campeche'),('5','Chiapas'),('6','Chihuahua'),('7','Ciudad de México'),('8','Coahuila de Zaragoza'),('9','Colima');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streets`
--

DROP TABLE IF EXISTS `streets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `streets` (
  `id_street` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `fk_neighborhood` bigint(20) NOT NULL,
  PRIMARY KEY (`id_street`),
  KEY `FKqdulr8m8up4rj2d5lpgm3nvp8` (`fk_neighborhood`),
  CONSTRAINT `FKqdulr8m8up4rj2d5lpgm3nvp8` FOREIGN KEY (`fk_neighborhood`) REFERENCES `neighborhoods` (`id_neighborhood`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streets`
--

LOCK TABLES `streets` WRITE;
/*!40000 ALTER TABLE `streets` DISABLE KEYS */;
INSERT INTO `streets` VALUES (1,'Calle Juárez',1),(2,'Avenida Reforma',2),(3,'Calle Madero',3);
/*!40000 ALTER TABLE `streets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_patient`
--

DROP TABLE IF EXISTS `student_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_patient` (
  `id_student_patient` bigint(20) NOT NULL AUTO_INCREMENT,
  `fk_patient` bigint(20) DEFAULT NULL,
  `fk_student` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_student_patient`),
  KEY `FKghwwjdkti37jnwnwrtiepotgr` (`fk_patient`),
  KEY `FKl4jl7bcm6vqrmlcg1l8ir6bo1` (`fk_student`),
  CONSTRAINT `FKghwwjdkti37jnwnwrtiepotgr` FOREIGN KEY (`fk_patient`) REFERENCES `patients` (`id_patient`),
  CONSTRAINT `FKl4jl7bcm6vqrmlcg1l8ir6bo1` FOREIGN KEY (`fk_student`) REFERENCES `students` (`enrollment`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_patient`
--

LOCK TABLES `student_patient` WRITE;
/*!40000 ALTER TABLE `student_patient` DISABLE KEYS */;
INSERT INTO `student_patient` VALUES (1,1,'2019060310'),(2,2,'2019060310'),(3,2,'2019060310');
/*!40000 ALTER TABLE `student_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `enrollment` varchar(255) NOT NULL,
  `fk_person` varchar(20) DEFAULT NULL,
  `fk_user` binary(16) NOT NULL,
  PRIMARY KEY (`enrollment`),
  UNIQUE KEY `UK_36kncqxr7ko2svrs9fat2ilrm` (`fk_user`),
  UNIQUE KEY `UK_im7xtdqrxu8ba7g7wgph2hc9b` (`fk_person`),
  CONSTRAINT `FKerha93sft5akhl5oexjg9vasy` FOREIGN KEY (`fk_person`) REFERENCES `people` (`curp`),
  CONSTRAINT `FKqks2kvph1quvyaysfucpmx4l` FOREIGN KEY (`fk_user`) REFERENCES `user_app` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('2019060310','FIMJ011004HOCGRLA8',_binary '�n;/��K�');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_semesters`
--

DROP TABLE IF EXISTS `students_semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_semesters` (
  `id_student_semester` bigint(20) NOT NULL AUTO_INCREMENT,
  `fk_semester` bigint(20) DEFAULT NULL,
  `fk_student` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_student_semester`),
  KEY `FK1ngs2h47y6743rfr8fk9gi0bw` (`fk_semester`),
  KEY `FKlpipqdy7xqasfotfpfhjxmure` (`fk_student`),
  CONSTRAINT `FK1ngs2h47y6743rfr8fk9gi0bw` FOREIGN KEY (`fk_semester`) REFERENCES `semesters` (`id_semester`),
  CONSTRAINT `FKlpipqdy7xqasfotfpfhjxmure` FOREIGN KEY (`fk_student`) REFERENCES `students` (`enrollment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_semesters`
--

LOCK TABLES `students_semesters` WRITE;
/*!40000 ALTER TABLE `students_semesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tooth`
--

DROP TABLE IF EXISTS `tooth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tooth` (
  `id_tooth` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` date NOT NULL,
  `fk_odontogram` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_tooth`),
  KEY `FKr7kcbeci7owh6t70gwe357bt0` (`fk_odontogram`),
  CONSTRAINT `FKr7kcbeci7owh6t70gwe357bt0` FOREIGN KEY (`fk_odontogram`) REFERENCES `odontogram` (`id_odontogram`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tooth`
--

LOCK TABLES `tooth` WRITE;
/*!40000 ALTER TABLE `tooth` DISABLE KEYS */;
/*!40000 ALTER TABLE `tooth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tooth_condition`
--

DROP TABLE IF EXISTS `tooth_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tooth_condition` (
  `id_tooth_condition` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tooth_condition`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tooth_condition`
--

LOCK TABLES `tooth_condition` WRITE;
/*!40000 ALTER TABLE `tooth_condition` DISABLE KEYS */;
INSERT INTO `tooth_condition` VALUES (1,'Diente presente'),(2,'Diente parcialmente erupcionado'),(3,'Diente obturado'),(4,'Diente con corona'),(5,'Mantenedor de espacio con corona'),(6,'Mantenedor de espacio con banda'),(7,'Prótesis removible'),(8,'Puente'),(9,'Diente cariado'),(10,'Diente extraido'),(12,'Diente con fractura'),(13,'Fístula'),(14,'Diente con fluorosis'),(15,'Diente con hipoplasia'),(16,'Diente obturado con caries'),(17,'Diente en mal posición derecha'),(18,'Diente en mal posición izquierda');
/*!40000 ALTER TABLE `tooth_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tooth_condition_rel`
--

DROP TABLE IF EXISTS `tooth_condition_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tooth_condition_rel` (
  `id_tooth_condition_rel` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` date NOT NULL,
  `fk_tooth` bigint(20) DEFAULT NULL,
  `fk_tooth_condition` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_tooth_condition_rel`),
  KEY `FK6gr8p596riesuube9cb3dx3av` (`fk_tooth`),
  KEY `FK5ng6adfd4uu71jms1a70g9yhu` (`fk_tooth_condition`),
  CONSTRAINT `FK5ng6adfd4uu71jms1a70g9yhu` FOREIGN KEY (`fk_tooth_condition`) REFERENCES `tooth_condition` (`id_tooth_condition`),
  CONSTRAINT `FK6gr8p596riesuube9cb3dx3av` FOREIGN KEY (`fk_tooth`) REFERENCES `tooth` (`id_tooth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tooth_condition_rel`
--

LOCK TABLES `tooth_condition_rel` WRITE;
/*!40000 ALTER TABLE `tooth_condition_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tooth_condition_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tooth_face`
--

DROP TABLE IF EXISTS `tooth_face`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tooth_face` (
  `id_tooth_face` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` date NOT NULL,
  `fk_tooth` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_tooth_face`),
  KEY `FKitfki8xb05cy5bg4ee6xkrs52` (`fk_tooth`),
  CONSTRAINT `FKitfki8xb05cy5bg4ee6xkrs52` FOREIGN KEY (`fk_tooth`) REFERENCES `tooth` (`id_tooth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tooth_face`
--

LOCK TABLES `tooth_face` WRITE;
/*!40000 ALTER TABLE `tooth_face` DISABLE KEYS */;
/*!40000 ALTER TABLE `tooth_face` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tooth_face_condition_rel`
--

DROP TABLE IF EXISTS `tooth_face_condition_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tooth_face_condition_rel` (
  `id_tooth_face_condition_rel` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` date NOT NULL,
  `fk_tooth_condition` bigint(20) DEFAULT NULL,
  `fk_tooth_face` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_tooth_face_condition_rel`),
  KEY `FK7cbt8x6ts48l2u3x1jjucboaa` (`fk_tooth_condition`),
  KEY `FKla5ql9n2xrfkbk3dx0qeru4uo` (`fk_tooth_face`),
  CONSTRAINT `FK7cbt8x6ts48l2u3x1jjucboaa` FOREIGN KEY (`fk_tooth_condition`) REFERENCES `tooth_condition` (`id_tooth_condition`),
  CONSTRAINT `FKla5ql9n2xrfkbk3dx0qeru4uo` FOREIGN KEY (`fk_tooth_face`) REFERENCES `tooth_face` (`id_tooth_face`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tooth_face_condition_rel`
--

LOCK TABLES `tooth_face_condition_rel` WRITE;
/*!40000 ALTER TABLE `tooth_face_condition_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tooth_face_condition_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tooth_regions_periodontogram`
--

DROP TABLE IF EXISTS `tooth_regions_periodontogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tooth_regions_periodontogram` (
  `id_tooth_regions_periodontogram` bigint(20) NOT NULL AUTO_INCREMENT,
  `region` varchar(2) NOT NULL,
  PRIMARY KEY (`id_tooth_regions_periodontogram`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tooth_regions_periodontogram`
--

LOCK TABLES `tooth_regions_periodontogram` WRITE;
/*!40000 ALTER TABLE `tooth_regions_periodontogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `tooth_regions_periodontogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_app`
--

DROP TABLE IF EXISTS `user_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_app` (
  `id` binary(16) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK65kue06vu2g78mxpdfke453e5` (`username`),
  KEY `FKbl4c0iar4dskgpsjiydh639i6` (`role_id`),
  CONSTRAINT `FKbl4c0iar4dskgpsjiydh639i6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_app`
--

LOCK TABLES `user_app` WRITE;
/*!40000 ALTER TABLE `user_app` DISABLE KEYS */;
INSERT INTO `user_app` VALUES (_binary 'w~2��NB�\�','$2a$10$FsfHswsodA.7t8.tJKuvgef3NR/ar3VZEXgAxEIv.kIYH19//l0kq','string',1,_binary ''),(_binary '�n;/��K�','$2a$10$PsXJlaqLHmD93aK6svRMruRtfMoRgoW6O6bbVjS91iedGsnRG.qdW','2019060310',2,_binary '');
/*!40000 ALTER TABLE `user_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vital_signs`
--

DROP TABLE IF EXISTS `vital_signs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vital_signs` (
  `id_vital_signs` bigint(20) NOT NULL AUTO_INCREMENT,
  `blood_pressure` float DEFAULT NULL,
  `glucose` float DEFAULT NULL,
  `heart_rate` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `oxygen_saturation` float DEFAULT NULL,
  `pulse` float DEFAULT NULL,
  `respiratory_rate` float DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  PRIMARY KEY (`id_vital_signs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vital_signs`
--

LOCK TABLES `vital_signs` WRITE;
/*!40000 ALTER TABLE `vital_signs` DISABLE KEYS */;
/*!40000 ALTER TABLE `vital_signs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-20  6:17:24
