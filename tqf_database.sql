CREATE DATABASE  IF NOT EXISTS `tqf_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tqf_database`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tqf_database
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `approval`
--

DROP TABLE IF EXISTS `approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval` (
  `approval_id` int NOT NULL AUTO_INCREMENT,
  `approvalstatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval`
--

LOCK TABLES `approval` WRITE;
/*!40000 ALTER TABLE `approval` DISABLE KEYS */;
INSERT INTO `approval` VALUES (1,1),(2,0);
/*!40000 ALTER TABLE `approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_plan`
--

DROP TABLE IF EXISTS `assessment_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_plan` (
  `assessment_plan_id` int NOT NULL AUTO_INCREMENT,
  `activity_order` varchar(100) NOT NULL,
  `learning_outcome` varchar(100) NOT NULL,
  `evaluation_method` varchar(100) NOT NULL,
  `assessment_week` varchar(100) NOT NULL,
  `assessment_weight` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`assessment_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_plan`
--

LOCK TABLES `assessment_plan` WRITE;
/*!40000 ALTER TABLE `assessment_plan` DISABLE KEYS */;
INSERT INTO `assessment_plan` VALUES (1,'แบบฝึกหัด','ความเข้าใจในเนื้อหาวิชา','ให้คะแนนจากแบบฝึกหัด','สัปดาห์ที่ 4','20%'),(2,'สอบกลางภาค','การวิเคราะห์ข้อมูล','ให้คะแนนจากข้อสอบ','สัปดาห์ที่ 8','30%'),(3,'โครงงาน','การนำไปประยุกต์ใช้','ให้คะแนนจากการนำเสนอ','สัปดาห์ที่ 12','30%'),(4,'สอบปลายภาค','การประเมินความเข้าใจโดยรวม','ให้คะแนนจากข้อสอบปลายภาค','สัปดาห์ที่ 16','20%');
/*!40000 ALTER TABLE `assessment_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackdot_whitedot`
--

DROP TABLE IF EXISTS `blackdot_whitedot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blackdot_whitedot` (
  `blackdot_whitedot_id` int NOT NULL AUTO_INCREMENT,
  `dotname` int DEFAULT NULL,
  PRIMARY KEY (`blackdot_whitedot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackdot_whitedot`
--

LOCK TABLES `blackdot_whitedot` WRITE;
/*!40000 ALTER TABLE `blackdot_whitedot` DISABLE KEYS */;
INSERT INTO `blackdot_whitedot` VALUES (1,0),(2,1);
/*!40000 ALTER TABLE `blackdot_whitedot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'วิทยาการคอมพิวเตอร์');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_code` varchar(100) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `Pre_requisites` varchar(100) NOT NULL,
  `Co_requisites` varchar(100) NOT NULL,
  `Credit_details` varchar(100) NOT NULL,
  `teacher_id` int DEFAULT NULL,
  `curriculum_id` int DEFAULT NULL,
  `course_hours_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `improvementplan_id` int DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `curriculum_id` (`curriculum_id`),
  KEY `course_hours_id` (`course_hours_id`),
  KEY `branch_id` (`branch_id`),
  KEY `improvementplan_id` (`improvementplan_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`teacher_id`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`curriculum_id`),
  CONSTRAINT `course_ibfk_3` FOREIGN KEY (`course_hours_id`) REFERENCES `course_hours` (`course_hours_id`),
  CONSTRAINT `course_ibfk_4` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  CONSTRAINT `course_ibfk_5` FOREIGN KEY (`improvementplan_id`) REFERENCES `reviewandrevision` (`improvementplan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'04-10-318','ปัญญาประดิษฐ์','คณะบริหารธุรกิจและเทคโนโลยีสารสนเทศ มทร.ตะวันออก','1/2567','ไม่มี','ไม่มี','3(2-2-5)',1,1,1,1,NULL,'2025-03-10 09:14:43');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_hours`
--

DROP TABLE IF EXISTS `course_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_hours` (
  `course_hours_id` int NOT NULL AUTO_INCREMENT,
  `lecture_hours` int DEFAULT NULL,
  `practice_hours` int DEFAULT NULL,
  `self_study_hours` int DEFAULT NULL,
  PRIMARY KEY (`course_hours_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_hours`
--

LOCK TABLES `course_hours` WRITE;
/*!40000 ALTER TABLE `course_hours` DISABLE KEYS */;
INSERT INTO `course_hours` VALUES (1,2,2,5);
/*!40000 ALTER TABLE `course_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursecategory`
--

DROP TABLE IF EXISTS `coursecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coursecategory` (
  `course_category_id` int NOT NULL AUTO_INCREMENT,
  `category_type` varchar(100) NOT NULL,
  PRIMARY KEY (`course_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursecategory`
--

LOCK TABLES `coursecategory` WRITE;
/*!40000 ALTER TABLE `coursecategory` DISABLE KEYS */;
INSERT INTO `coursecategory` VALUES (1,'คุณธรรม จริยธรรม'),(2,'ความรู้'),(3,'ทักษะทางปัญญา'),(4,'ทักษะความสัมพันธ์ระหว่างบุคคลและความรับผิดชอบ'),(5,'ทักษะการวิเคราะห์เชิงตัวเลข การสื่อสาร และการใช้เทคโนโลยีสารสนเทศ'),(6,'ทักษะด้านการปฏิบัติงาน');
/*!40000 ALTER TABLE `coursecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum` (
  `curriculum_id` int NOT NULL AUTO_INCREMENT,
  `curriculum_detail` varchar(100) NOT NULL,
  `curriculum_revision_date` varchar(100) NOT NULL,
  PRIMARY KEY (`curriculum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (1,'หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์','2024-06-24');
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainheader`
--

DROP TABLE IF EXISTS `mainheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mainheader` (
  `main_header_id` int NOT NULL AUTO_INCREMENT,
  `namemainheader` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`main_header_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainheader`
--

LOCK TABLES `mainheader` WRITE;
/*!40000 ALTER TABLE `mainheader` DISABLE KEYS */;
INSERT INTO `mainheader` VALUES (1,'1. คุณธรรม จริยธรรม'),(2,'2. ความรู้'),(3,'3. ทักษะทางปัญญา'),(4,'4. ทักษะความสัมพันธ์ระหว่างบุคคลและความรับผิดชอบ'),(5,'5. ทักษะการวิเคราะห์เชิงตัวเลข การสื่อสาร และการใช้เทคโนโลยีสารสนเทศ'),(6,'6. ทักษะด้านการปฏิบัติงาน (ถ้ามี)');
/*!40000 ALTER TABLE `mainheader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewandrevision`
--

DROP TABLE IF EXISTS `reviewandrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewandrevision` (
  `improvementplan_id` int NOT NULL AUTO_INCREMENT,
  `add_detail` varchar(100) NOT NULL,
  PRIMARY KEY (`improvementplan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewandrevision`
--

LOCK TABLES `reviewandrevision` WRITE;
/*!40000 ALTER TABLE `reviewandrevision` DISABLE KEYS */;
INSERT INTO `reviewandrevision` VALUES (1,'ปรับปรุงเนื้อหาเกี่ยวกับ Machine Learning'),(2,'เพิ่มการฝึกปฏิบัติในโครงงาน AI');
/*!40000 ALTER TABLE `reviewandrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section1`
--

DROP TABLE IF EXISTS `section1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section1` (
  `section1_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`section1_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `section1_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section1`
--

LOCK TABLES `section1` WRITE;
/*!40000 ALTER TABLE `section1` DISABLE KEYS */;
INSERT INTO `section1` VALUES (1,1);
/*!40000 ALTER TABLE `section1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section2`
--

DROP TABLE IF EXISTS `section2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section2` (
  `section2_id` int NOT NULL AUTO_INCREMENT,
  `course_objectives` varchar(100) NOT NULL,
  `course_development_objectives` varchar(100) NOT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`section2_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `section2_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section2`
--

LOCK TABLES `section2` WRITE;
/*!40000 ALTER TABLE `section2` DISABLE KEYS */;
INSERT INTO `section2` VALUES (1,'เข้าใจแนวคิดพื้นฐานของ AI','พัฒนาเนื้อหาให้สอดคล้องกับเทคโนโลยีใหม่',1);
/*!40000 ALTER TABLE `section2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section3`
--

DROP TABLE IF EXISTS `section3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section3` (
  `section3_id` int NOT NULL AUTO_INCREMENT,
  `course_descriptions` varchar(100) NOT NULL,
  `consultation_Hours` varchar(100) NOT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`section3_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `section3_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section3`
--

LOCK TABLES `section3` WRITE;
/*!40000 ALTER TABLE `section3` DISABLE KEYS */;
INSERT INTO `section3` VALUES (1,'ศึกษาแนวคิดพื้นฐานของ AI และการใช้งานจริง','2 ชั่วโมงต่อสัปดาห์',1);
/*!40000 ALTER TABLE `section3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section4`
--

DROP TABLE IF EXISTS `section4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section4` (
  `section4_id` int NOT NULL AUTO_INCREMENT,
  `teaching_methods` varchar(100) NOT NULL,
  `assessment_methods` varchar(100) DEFAULT NULL,
  `table_id` int DEFAULT NULL,
  PRIMARY KEY (`section4_id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `section4_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `tablesection4` (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section4`
--

LOCK TABLES `section4` WRITE;
/*!40000 ALTER TABLE `section4` DISABLE KEYS */;
INSERT INTO `section4` VALUES (1,'บรรยายและปฏิบัติ','แบบฝึกหัดและสอบ',NULL);
/*!40000 ALTER TABLE `section4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section5`
--

DROP TABLE IF EXISTS `section5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section5` (
  `section5_id` int NOT NULL AUTO_INCREMENT,
  `assessment_Criteria` varchar(100) NOT NULL,
  `assessment_plan_id` int DEFAULT NULL,
  `teachingplan_id` int DEFAULT NULL,
  PRIMARY KEY (`section5_id`),
  KEY `assessment_plan_id` (`assessment_plan_id`),
  KEY `teachingplan_id` (`teachingplan_id`),
  CONSTRAINT `section5_ibfk_1` FOREIGN KEY (`assessment_plan_id`) REFERENCES `assessment_plan` (`assessment_plan_id`),
  CONSTRAINT `section5_ibfk_2` FOREIGN KEY (`teachingplan_id`) REFERENCES `teachingplan` (`teaching_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section5`
--

LOCK TABLES `section5` WRITE;
/*!40000 ALTER TABLE `section5` DISABLE KEYS */;
INSERT INTO `section5` VALUES (1,'เกณฑ์การให้คะแนนตามแบบฝึกหัดและสอบ',1,1),(2,'เกณฑ์การให้คะแนนจากสอบกลางภาค',2,2),(3,'เกณฑ์การให้คะแนนจากโครงงาน',3,3),(4,'เกณฑ์การให้คะแนนจากสอบปลายภาค',4,4);
/*!40000 ALTER TABLE `section5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section6`
--

DROP TABLE IF EXISTS `section6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section6` (
  `section6_id` int NOT NULL AUTO_INCREMENT,
  `primary_Textbook` varchar(100) NOT NULL,
  `important_Documents_Info` varchar(100) NOT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`section6_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `section6_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section6`
--

LOCK TABLES `section6` WRITE;
/*!40000 ALTER TABLE `section6` DISABLE KEYS */;
INSERT INTO `section6` VALUES (1,'Machine Learning by Example','AI Research Papers',1);
/*!40000 ALTER TABLE `section6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section7`
--

DROP TABLE IF EXISTS `section7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section7` (
  `section7_id` int NOT NULL AUTO_INCREMENT,
  `student_evaluation_strategy` varchar(100) NOT NULL,
  `teaching_evaluation_strategy` varchar(100) NOT NULL,
  `teaching_improvement` varchar(100) NOT NULL,
  `student_achievement_review` varchar(100) NOT NULL,
  `course_improvement_plan` varchar(100) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`section7_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `section7_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section7`
--

LOCK TABLES `section7` WRITE;
/*!40000 ALTER TABLE `section7` DISABLE KEYS */;
INSERT INTO `section7` VALUES (1,'แบบสอบถามออนไลน์','การสังเกตพฤติกรรมในชั้นเรียน','ปรับปรุงตามเทคโนโลยี AI ใหม่','วิเคราะห์ผลสัมฤทธิ์นักศึกษา','พัฒนาเนื้อหาวิชาต่อเนื่อง',1);
/*!40000 ALTER TABLE `section7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subheading`
--

DROP TABLE IF EXISTS `subheading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subheading` (
  `sub_heading_id` int NOT NULL AUTO_INCREMENT,
  `descriptions` varchar(100) NOT NULL,
  `main_header_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_heading_id`),
  KEY `main_header_id` (`main_header_id`),
  CONSTRAINT `subheading_ibfk_1` FOREIGN KEY (`main_header_id`) REFERENCES `coursecategory` (`course_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subheading`
--

LOCK TABLES `subheading` WRITE;
/*!40000 ALTER TABLE `subheading` DISABLE KEYS */;
INSERT INTO `subheading` VALUES (1,'ตระหนักในคุณค่าและคุณธรรม จริยธรรม เสียสละ และซื่อสัตย์สุจริต',1),(2,'มีวินัย ตรงต่อเวลา และความรับผิดชอบต่อตนเองและสังคม',1),(3,'เคารพกฎระเบียบและข้อบังคับต่าง ๆ ขององค์กรและสังคม',1),(4,'มีจรรยาบรรณทางวิชาการและวิชาชีพ',1),(5,'มีความรู้ ความเข้าใจในหลักการและทฤษฎีของปัญญาประดิษฐ์',2),(6,'สามารถวิเคราะห์ปัญหา เข้าใจและอธิบายความต้องการทางคอมพิวเตอร์',2),(7,'สามารถวิเคราะห์ ออกแบบ ติดตั้ง ปรับปรุงระบบคอมพิวเตอร์',2),(8,'สามารถติดตามความก้าวหน้าทางวิชาการและวิวัฒนาการคอมพิวเตอร์',2),(9,'รู้ เข้าใจและสนใจพัฒนาความรู้ ความชำนาญทางคอมพิวเตอร์อย่างต่อเนื่อง',2),(10,'มีความรู้ในแนวกว้างของสาขาวิชาที่ศึกษา',2),(11,'มีประสบการณ์ในการพัฒนาและ/หรือการประยุกต์ซอฟต์แวร์ที่ใช้งานได้จริง',2),(12,'สามารถบูรณาการความรู้ในที่ศึกษากับความรู้ในศาสตร์อื่น ๆ ที่เกี่ยวข้อง',2),(13,'คิดอย่างมีวิจารณญาณและเป็นระบบ',3),(14,'สามารถรวบรวม ศึกษา วิเคราะห์ และสรุปประเด็นปัญหา',3),(15,'สามารถประยุกต์ความรู้และทักษะกับการแก้ไขปัญหาทางคอมพิวเตอร์',3),(16,'มีความรับผิดชอบในงานของตนเองและงานกลุ่ม',4),(17,'มีความรับผิดชอบในการพัฒนาการเรียนรู้ของตนเองและทางวิชาชีพ',4),(18,'สามารถใช้เครื่องมือที่เกี่ยวข้องกับคอมพิวเตอร์ได้อย่างเหมาะสม',5),(19,'สามารถสื่อสารภาษาไทยและภาษาอังกฤษได้อย่างมีประสิทธิภาพ',5),(20,'มีทักษะในการใช้เครื่องมือและอุปกรณ์เทคโนโลยีสารสนเทศ',6),(21,'มีทักษะในการพัฒนาระบบงานด้านเทคโนโลยีสารสนเทศ',6);
/*!40000 ALTER TABLE `subheading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablesection4`
--

DROP TABLE IF EXISTS `tablesection4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablesection4` (
  `table_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `blackdot_whitedot_id` int DEFAULT NULL,
  `sub_heading_id` int DEFAULT NULL,
  PRIMARY KEY (`table_id`),
  KEY `course_id` (`course_id`),
  KEY `blackdot_whitedot_id` (`blackdot_whitedot_id`),
  KEY `sub_heading_id` (`sub_heading_id`),
  CONSTRAINT `tablesection4_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `tablesection4_ibfk_2` FOREIGN KEY (`blackdot_whitedot_id`) REFERENCES `blackdot_whitedot` (`blackdot_whitedot_id`),
  CONSTRAINT `tablesection4_ibfk_3` FOREIGN KEY (`sub_heading_id`) REFERENCES `subheading` (`sub_heading_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablesection4`
--

LOCK TABLES `tablesection4` WRITE;
/*!40000 ALTER TABLE `tablesection4` DISABLE KEYS */;
INSERT INTO `tablesection4` VALUES (1,1,1,1),(2,1,2,2),(3,1,1,3),(4,1,2,4),(5,1,2,5),(6,1,2,6),(7,1,2,7),(8,1,2,8),(9,1,2,9),(10,1,2,10),(11,1,2,11),(12,1,1,12),(13,1,2,13),(14,1,1,14),(15,1,2,15),(16,1,2,16),(17,1,2,17),(18,1,2,18),(19,1,2,19),(20,1,2,20),(21,1,1,21);
/*!40000 ALTER TABLE `tablesection4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachingplan`
--

DROP TABLE IF EXISTS `teachingplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachingplan` (
  `teaching_plan_id` int NOT NULL AUTO_INCREMENT,
  `week_number` int DEFAULT NULL,
  `descriptions` varchar(100) NOT NULL,
  `total_hours` int DEFAULT NULL,
  `activity_performed` varchar(100) DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  PRIMARY KEY (`teaching_plan_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `teachingplan_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachingplan`
--

LOCK TABLES `teachingplan` WRITE;
/*!40000 ALTER TABLE `teachingplan` DISABLE KEYS */;
INSERT INTO `teachingplan` VALUES (1,1,'แนะนำหลักการพื้นฐานของ AI',4,'บรรยายและฝึกปฏิบัติ',1),(2,2,'ศึกษา Machine Learning และการประยุกต์ใช้',4,'บรรยายและฝึกปฏิบัติ',1),(3,3,'การพัฒนาโมเดล AI เบื้องต้น',4,'ฝึกปฏิบัติและทำโครงงาน',1),(4,4,'การนำ AI ไปใช้จริง',4,'บรรยายและทดสอบความเข้าใจ',1);
/*!40000 ALTER TABLE `teachingplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tqf`
--

DROP TABLE IF EXISTS `tqf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tqf` (
  `tqf_id` int NOT NULL AUTO_INCREMENT,
  `dates` date DEFAULT NULL,
  `confirm` tinyint(1) DEFAULT NULL,
  `student_group` int DEFAULT NULL,
  `file_document` varchar(100) NOT NULL,
  `verify` tinyint(1) DEFAULT NULL,
  `approval_status` tinyint(1) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `approval_id` int DEFAULT NULL,
  PRIMARY KEY (`tqf_id`),
  KEY `course_id` (`course_id`),
  KEY `approval_id` (`approval_id`),
  CONSTRAINT `tqf_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `tqf_ibfk_2` FOREIGN KEY (`approval_id`) REFERENCES `approval` (`approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tqf`
--

LOCK TABLES `tqf` WRITE;
/*!40000 ALTER TABLE `tqf` DISABLE KEYS */;
INSERT INTO `tqf` VALUES (1,'2024-06-01',1,1,'TQF-AI-2567.pdf',1,1,1,1),(2,'2024-06-05',0,2,'TQF-DS-2567.pdf',0,0,1,2);
/*!40000 ALTER TABLE `tqf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `posittion` varchar(100) NOT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'พิชัย','จอดพิมาย','pichai@rmutto.ac.th','อาจารย์',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-11  5:32:30
