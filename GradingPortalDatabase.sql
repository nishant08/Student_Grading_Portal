-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: GradingPortal
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.04.2

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
-- Table structure for table `AdminLogin`
--

DROP TABLE IF EXISTS `AdminLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdminLogin` (
  `LoginId` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdminLogin`
--

LOCK TABLES `AdminLogin` WRITE;
/*!40000 ALTER TABLE `AdminLogin` DISABLE KEYS */;
INSERT INTO `AdminLogin` VALUES ('Admin','Admin');
/*!40000 ALTER TABLE `AdminLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseDetails`
--

DROP TABLE IF EXISTS `CourseDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseDetails` (
  `CourseId` varchar(30) NOT NULL DEFAULT '',
  `CourseName` varchar(100) DEFAULT NULL,
  `Credit` int(4) DEFAULT NULL,
  `FacultyId` varchar(30) NOT NULL DEFAULT '',
  `InstructorName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CourseId`,`FacultyId`),
  KEY `FacultyId` (`FacultyId`),
  CONSTRAINT `FacultyId` FOREIGN KEY (`FacultyId`) REFERENCES `InstructorLogin` (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseDetails`
--

LOCK TABLES `CourseDetails` WRITE;
/*!40000 ALTER TABLE `CourseDetails` DISABLE KEYS */;
INSERT INTO `CourseDetails` VALUES ('CSE001','C programming',5,'Faculty001','Ravi Gorthi'),('CSE002','Data Structure',4,'Faculty001','Ravi Gorthi'),('CSE003','Software Engineering',4,'Faculty001','Ravi Gorthi'),('CSE004','Compiler Design',4,'Faculty001','Ravi Gorthi'),('ECE001','Electronics 1',5,'Faculty002','Debnath'),('ECE002','Electronics 2',5,'Faculty002','Debnath'),('ECE003','Electronics 3',3,'Faculty003','Tomar'),('ECE004','wireless network',4,'Faculty004','Sandeep');
/*!40000 ALTER TABLE `CourseDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InstructorLogin`
--

DROP TABLE IF EXISTS `InstructorLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstructorLogin` (
  `LoginId` varchar(30) NOT NULL DEFAULT '',
  `Password` varchar(20) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `RoomNumber` varchar(10) DEFAULT NULL,
  `EmailId` varchar(50) DEFAULT NULL,
  `PhoneNumber` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InstructorLogin`
--

LOCK TABLES `InstructorLogin` WRITE;
/*!40000 ALTER TABLE `InstructorLogin` DISABLE KEYS */;
INSERT INTO `InstructorLogin` VALUES ('Faculty001','xpd54','Ravi','Gorthi','001','ravi@test.com',1234567890),('Faculty002','xpd54','Sumitra','Debnath','002','Debnath@test.com',1123456789),('Faculty003','xpd54','Raghu','Tomar','003','Tomar@test.com',123456789),('Faculty004','xpd54','Rajiv','Sandeep','004','Rajiv@test.com',123456789);
/*!40000 ALTER TABLE `InstructorLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentCourseDetails`
--

DROP TABLE IF EXISTS `StudentCourseDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentCourseDetails` (
  `RollNumber` varchar(8) NOT NULL,
  `CourseId` varchar(30) NOT NULL,
  `CourseType` varchar(100) DEFAULT NULL,
  `Credit` int(11) NOT NULL,
  PRIMARY KEY (`RollNumber`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `StudentCourseDetails_ibfk_1` FOREIGN KEY (`RollNumber`) REFERENCES `StudentLogin` (`LoginId`),
  CONSTRAINT `StudentCourseDetails_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `CourseDetails` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentCourseDetails`
--

LOCK TABLES `StudentCourseDetails` WRITE;
/*!40000 ALTER TABLE `StudentCourseDetails` DISABLE KEYS */;
INSERT INTO `StudentCourseDetails` VALUES ('1','CSE001','CompulsoryCourse',0),('1','CSE002','CompulsoryCourse',0),('1','ECE001','ProgrammElective',0),('1','ECE002','OpenElective',0),('y09uc204','CSE001','CompulsoryCourse',0),('y09uc204','CSE003','CompulsoryCourse',0),('y09uc204','ECE002','CompulsoryCourse',0),('y09uc204','ECE003','CompulsoryCourse',0),('y10uc074','CSE001','CompulsoryCourse',0),('y10uc074','CSE003','CompulsoryCourse',0),('y10uc074','CSE004','CompulsoryCourse',0),('y10uc074','ECE002','CompulsoryCourse',0),('y10uc074','ECE004','CompulsoryCourse',0),('y10uc133','CSE001','CompulsoryCourse',5),('y10uc133','CSE002','CompulsoryCourse',4),('y10uc133','ECE001','CompulsoryCourse',5),('y10uc133','ECE003','OpenElective',3),('y10uc201','CSE001','CompulsoryCourse',5),('y10uc201','CSE003','CompulsoryCourse',4),('y10uc201','ECE003','OpenElective',3),('y10uc201','ECE004','ProgrammElective',4),('y10uc250','CSE001','CompulsoryCourse',5),('y10uc250','CSE002','CompulsoryCourse',4),('y10uc250','CSE003','CompulsoryCourse',4),('y10uc250','CSE004','CompulsoryCourse',4),('y10uc250','ECE001','CompulsoryCourse',5),('y10uc250','ECE003','CompulsoryCourse',3),('y10uc250','ECE004','ProgrammElective',4),('y10uc256','CSE001','CompulsoryCourse',5),('y10uc256','CSE002','CompulsoryCourse',4),('y10uc256','CSE003','OpenElective',4),('y10uc256','CSE004','CompulsoryCourse',4),('y10uc256','ECE001','CompulsoryCourse',5),('y10uc256','ECE002','OpenElective',5),('y10uc256','ECE004','ProgrammElective',4);
/*!40000 ALTER TABLE `StudentCourseDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentLogin`
--

DROP TABLE IF EXISTS `StudentLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentLogin` (
  `LoginId` varchar(8) NOT NULL DEFAULT '',
  `Password` varchar(20) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `EmailId` varchar(50) DEFAULT NULL,
  `PhoneNumber` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentLogin`
--

LOCK TABLES `StudentLogin` WRITE;
/*!40000 ALTER TABLE `StudentLogin` DISABLE KEYS */;
INSERT INTO `StudentLogin` VALUES ('1','1','1','1','1@gmail.com',1),('121212','abc','abc','abc','abc@gmail.com',1234567890),('21','21','ap','pa','asd@gmail.com',9123245672),('5','6','d','k','d@gmail.com',8565643336),('y09uc204','abhimanyu','abhimanyu','saraswat','abhimanyu27saraswat@gmail.com',9461594523),('y09uc207','y09uc207','Akshat','Mansinghka','akshat.mansinghka@gmail.com',9829757499),('y09uc243','9748152626','Kaushik','Mohta','kmohta23@gmail.com',7597322702),('y09uc262','123456','Paresh','Kumar','coolpkl@gmail.com',9462000610),('y10uc001','123456','AAGMAN ','GOUR','fdsfsd@gmail.com',5479879544),('y10uc007','y10uc007','James','Bond','bond007@gmaiil.com',7597167525),('y10uc034','illuminate','Akshay ','Lohiya','akshay.lohiya2@gmail.com',9982093135),('y10uc066','753951','Anupam ','Singh','anupam.lnmiity10@gmail.com',9461065192),('y10uc074','apoorva','Apoorva','Asthana','sweetapoorva16@gmail.com',9462544395),('y10uc081','integral8210','Arvind','Thakur','arvind.lnm@gmail.com',9468955599),('y10uc103','imaginerum','Deepak ','Garg','deepakgarg1991@gmail.com',9694817212),('y10uc129','asdf','himanshu','patel','abc@xyz.com',1234567890),('y10uc133','xpd54','Itar','Mhk','Itar@gmail.com',123456789),('y10uc201','xpd54','Nishant','Bansal','Nishat@test.com',1234567893),('Y10UC238','tiwari','prateek','tiwari','ptiwari91@gmail.com',9998812737),('y10uc250','xpd54','Rajat','Vayas','Rajat.vayas@gmail.com',1234567890),('y10uc256','xpd54','Ravi','Prakash','vickyravi17@gmail.com',123456789),('y10uc260','1','rish','rish','1@gmail.com',1),('y10uc364','y10uc364','yatindra ','hada','hada.yatindra1992@gmail.com',9166380692),('y10uc999','pinkelephants','mister','tux','pinkelephant@crappycollege.com',655),('y11uc002','02091993','Aarohi','Surya','aarohisurya@gmail.com',9468882585);
/*!40000 ALTER TABLE `StudentLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentPerformance`
--

DROP TABLE IF EXISTS `StudentPerformance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentPerformance` (
  `RollNumber` varchar(8) NOT NULL,
  `CourseId` varchar(30) NOT NULL,
  `Quiz1` int(11) DEFAULT NULL,
  `Quiz2` int(11) DEFAULT NULL,
  `Quiz3` int(11) DEFAULT NULL,
  `Quiz4` int(11) DEFAULT NULL,
  `MidSemMarks` int(11) DEFAULT NULL,
  `EndSemMarks` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  `Grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`RollNumber`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `StudentPerformance_ibfk_1` FOREIGN KEY (`RollNumber`) REFERENCES `StudentLogin` (`LoginId`),
  CONSTRAINT `StudentPerformance_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `CourseDetails` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentPerformance`
--

LOCK TABLES `StudentPerformance` WRITE;
/*!40000 ALTER TABLE `StudentPerformance` DISABLE KEYS */;
INSERT INTO `StudentPerformance` VALUES ('Y10UC133','CSE001',5,6,7,8,40,70,136,'AB'),('Y10UC133','CSE002',6,7,8,9,35,60,125,''),('Y10UC133','ECE001',5,6,7,8,40,70,136,'AB'),('Y10UC133','ECE002',6,7,8,9,35,60,125,'B'),('Y10UC201','CSE001',6,7,8,9,35,60,125,'B'),('Y10UC201','CSE002',5,6,7,8,40,70,136,''),('Y10UC201','ECE001',6,7,8,9,35,60,125,'B'),('Y10UC201','ECE002',5,6,7,8,40,70,136,'AB'),('Y10UC250','CSE001',4,5,6,7,42,90,154,'A'),('Y10UC250','CSE002',4,5,6,7,42,90,154,''),('Y10UC250','ECE001',4,5,6,7,42,90,154,'A'),('Y10UC250','ECE002',4,5,6,7,42,90,154,'A'),('Y10UC256','CSE001',5,5,8,6,43,72,141,'AB'),('Y10UC256','CSE002',5,5,8,6,34,67,132,''),('Y10UC256','ECE001',5,5,8,6,43,72,141,'AB'),('Y10UC256','ECE002',5,5,8,6,34,67,132,'B');
/*!40000 ALTER TABLE `StudentPerformance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-25 23:15:27
