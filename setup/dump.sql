-- MySQL dump 10.13  Distrib 8.0.4-rc, for Linux (x86_64)
--
-- Host: localhost    Database: STUDENT_INFO
-- ------------------------------------------------------
-- Server version	8.0.4-rc-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `COURSE`
--

DROP TABLE IF EXISTS `COURSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `COURSE` (
  `CourseId` int(11) NOT NULL,
  `CourseTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`CourseId`),
  UNIQUE KEY `CourseTitle` (`CourseTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COURSE`
--

LOCK TABLES `COURSE` WRITE;
/*!40000 ALTER TABLE `COURSE` DISABLE KEYS */;
INSERT INTO `COURSE` VALUES (2,'Базы данных'),(1,'Физика');
/*!40000 ALTER TABLE `COURSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXAM_RESULT`
--

DROP TABLE IF EXISTS `EXAM_RESULT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EXAM_RESULT` (
  `StudentId` int(11) NOT NULL,
  `ExamSheetId` int(11) NOT NULL,
  `Mark` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`StudentId`,`ExamSheetId`),
  KEY `EXR_EXT_FK` (`ExamSheetId`),
  CONSTRAINT `EXR_EXT_FK` FOREIGN KEY (`ExamSheetId`) REFERENCES `EXAM_SHEET` (`examsheetid`),
  CONSTRAINT `ST_EX_FK` FOREIGN KEY (`StudentId`) REFERENCES `STUDENT` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXAM_RESULT`
--

LOCK TABLES `EXAM_RESULT` WRITE;
/*!40000 ALTER TABLE `EXAM_RESULT` DISABLE KEYS */;
INSERT INTO `EXAM_RESULT` VALUES (345567,1,5),(345567,3,5),(345568,1,3),(345568,3,4),(345569,1,5),(345569,3,2),(345570,2,4),(345570,4,5),(345571,2,3),(345571,4,2),(345572,2,5),(345572,4,5);
/*!40000 ALTER TABLE `EXAM_RESULT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXAM_SHEET`
--

DROP TABLE IF EXISTS `EXAM_SHEET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EXAM_SHEET` (
  `ExamSheetId` int(11) NOT NULL,
  `GroupNumber` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `TeacherId` int(11) DEFAULT NULL,
  `ClassRoom` int(11) DEFAULT NULL,
  `ExamDate` date DEFAULT NULL,
  PRIMARY KEY (`ExamSheetId`),
  KEY `COURSE_EX_SHEET_FK` (`CourseId`),
  KEY `TEACHER_EX_SHEET_FK` (`TeacherId`),
  KEY `GROUP_EX_SHEET_FK` (`GroupNumber`),
  CONSTRAINT `COURSE_EX_SHEET_FK` FOREIGN KEY (`CourseId`) REFERENCES `COURSE` (`courseid`),
  CONSTRAINT `GROUP_EX_SHEET_FK` FOREIGN KEY (`GroupNumber`) REFERENCES `ST_GROUP` (`groupnumber`),
  CONSTRAINT `TEACHER_EX_SHEET_FK` FOREIGN KEY (`TeacherId`) REFERENCES `TEACHER` (`teacherid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXAM_SHEET`
--

LOCK TABLES `EXAM_SHEET` WRITE;
/*!40000 ALTER TABLE `EXAM_SHEET` DISABLE KEYS */;
INSERT INTO `EXAM_SHEET` VALUES (1,341,1,1,2408,'2017-01-25'),(2,371,1,1,2408,'2017-01-27'),(3,341,2,2,2446,'2017-01-28'),(4,371,2,2,NULL,'2017-01-26');
/*!40000 ALTER TABLE `EXAM_SHEET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHONE_LIST`
--

DROP TABLE IF EXISTS `PHONE_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PHONE_LIST` (
  `StudentId` int(11) NOT NULL,
  `PhoneType` char(3) DEFAULT NULL,
  `Phone` char(11) NOT NULL,
  KEY `ST_PH_FK` (`StudentId`),
  CONSTRAINT `ST_PH_FK` FOREIGN KEY (`StudentId`) REFERENCES `STUDENT` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHONE_LIST`
--

LOCK TABLES `PHONE_LIST` WRITE;
/*!40000 ALTER TABLE `PHONE_LIST` DISABLE KEYS */;
INSERT INTO `PHONE_LIST` VALUES (345567,'моб','89211264567'),(345567,'дом','88121564567'),(345568,'моб','89217234567'),(345571,'моб','89071254567'),(345572,'моб','88121239567');
/*!40000 ALTER TABLE `PHONE_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STUDENT`
--

DROP TABLE IF EXISTS `STUDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `STUDENT` (
  `StudentId` int(11) NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(50) NOT NULL,
  `GroupNumber` int(11) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StudentId`),
  KEY `GROUP_ST_FK` (`GroupNumber`),
  CONSTRAINT `GROUP_ST_FK` FOREIGN KEY (`GroupNumber`) REFERENCES `ST_GROUP` (`groupnumber`)
) ENGINE=InnoDB AUTO_INCREMENT=345573 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STUDENT`
--

LOCK TABLES `STUDENT` WRITE;
/*!40000 ALTER TABLE `STUDENT` DISABLE KEYS */;
INSERT INTO `STUDENT` VALUES (345567,'Иванов Александр',341,'1999-01-20','Петергоф, Библиотечная пл., дом 2'),(345568,'Широков Федор',341,'1998-03-21','Санкт-Петербург, ул. Гаванская 34'),(345569,'Антонова Даша',341,'1999-05-17','Санкт-Петербург, ул. Широкая 45'),(345570,'Антипенко Денис',371,'1998-08-11','Санкт-Петербург, Малый пр. 15'),(345571,'Сидоров Александр',371,'1999-07-12','Санкт-Петербург, Средний пр. 4'),(345572,'Фадеев Дмитрий',371,'1999-11-24','Санкт-Петербург, Невский пр.23');
/*!40000 ALTER TABLE `STUDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ST_GROUP`
--

DROP TABLE IF EXISTS `ST_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ST_GROUP` (
  `GroupNumber` int(11) NOT NULL,
  `Specialization` varchar(50) NOT NULL,
  PRIMARY KEY (`GroupNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ST_GROUP`
--

LOCK TABLES `ST_GROUP` WRITE;
/*!40000 ALTER TABLE `ST_GROUP` DISABLE KEYS */;
INSERT INTO `ST_GROUP` VALUES (341,'Иноформационно-аналитические системы'),(371,'Системное программирование');
/*!40000 ALTER TABLE `ST_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEACHER`
--

DROP TABLE IF EXISTS `TEACHER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TEACHER` (
  `TeacherId` int(11) NOT NULL,
  `TeacherName` varchar(50) NOT NULL,
  `Position` varchar(30) NOT NULL,
  PRIMARY KEY (`TeacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEACHER`
--

LOCK TABLES `TEACHER` WRITE;
/*!40000 ALTER TABLE `TEACHER` DISABLE KEYS */;
INSERT INTO `TEACHER` VALUES (1,'Петров Иван Семенович','профессор'),(2,'Семенова Анна Ивановна','доцент');
/*!40000 ALTER TABLE `TEACHER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-17 14:07:30
