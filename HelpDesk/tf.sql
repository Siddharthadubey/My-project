-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: tf
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu18.04.1

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `acontent` varchar(100) NOT NULL,
  `qid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `fk_answers_1_idx` (`qid`),
  KEY `fk_answers_2_idx` (`uid`),
  CONSTRAINT `fk_answers_1` FOREIGN KEY (`qid`) REFERENCES `questions` (`qid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answers_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'noting',11,2),(2,'3',11,2),(3,'Collection Framework is readymade lib for collecting objects.',8,2),(4,'40',11,1);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `fk_likes_1_idx` (`uid`),
  KEY `fk_likes_2_idx` (`pid`),
  CONSTRAINT `fk_likes_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_2` FOREIGN KEY (`pid`) REFERENCES `questions` (`qid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,11),(2,1,10),(3,1,9),(4,1,7),(5,1,6),(6,1,5),(7,1,4),(8,1,3),(9,1,2),(10,1,8);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `qcontent` varchar(500) NOT NULL,
  `qheading` varchar(100) DEFAULT NULL,
  `qdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) DEFAULT NULL,
  `code` varchar(1000) DEFAULT NULL,
  `code_lang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`qid`),
  KEY `fk_new_table_1_idx` (`uid`),
  CONSTRAINT `fk_new_table_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (2,'What is programming?','Computer Science','2018-07-19 10:43:19',1,NULL,NULL),(3,'What is routing?','Computer Science','2018-07-19 11:19:26',1,NULL,'none'),(4,'What is operator overloading in Python?','Python Language','2018-07-19 11:21:22',2,NULL,'python'),(5,'What is Enums in java?','Java Programing','2018-07-19 11:22:47',2,NULL,'java'),(6,'What is the output?','Ouput Based','2018-07-19 11:24:51',2,'class Test\r\n{\r\nstatic{\r\nSystem.out.println(\"Hello\");\r\n}\r\n}','java'),(7,'How can we use kotlin with android?','Kotlin','2018-07-19 11:33:47',2,'','none'),(8,'What is collection Framework in java?','Java Programing','2018-07-21 10:29:38',1,'','none'),(9,'What is the output of?','Java Programming','2018-07-21 10:35:49',1,'class CountDigit{\r\n	public static void main(String[] args) {\r\n		int n=346346;\r\n		System.out.println(String.valueOf(n).length());\r\n		String s=String.valueOf(n);\r\n		System.out.println(s+2);\r\n		System.out.println(n+1);\r\n		System.out.println(s+\"hello this is number\");\r\n		System.out.println(s.concat(\"Hello this is number\"));\r\n		System.out.println(\"+==============================\")\r\n		;\r\n		String a=\"ABC\";\r\n		String b=\"ABC\";\r\n		System.out.println(a.equals(b));\r\n		StringBuffer br=new StringBuffer(\"ABC\");\r\n		StringBuffer br1=new StringBuffer(\"ABC\");\r\n		System.out.println(br.equals(br1));\r\n		System.out.println(a==b);\r\n		System.out.println(br==br1);\r\n	}\r\n}','java'),(10,'out ?','PYTHON code','2018-07-21 10:54:26',1,'import os\r\n# foldername=input(\"Enter the foldername \")\r\n# os.mkdir(foldername)\r\n# print(\"Created...\")\r\nfor i in range(1,11):\r\n    foldername=input(\"enter \"+str(i)+\" foldername\")\r\n    os.mkdir(foldername)\r\n    print(\"created....\")','python'),(11,'Style','Css Code','2018-07-21 10:57:11',1,'\r\ncode[class*=\"language-\"],\r\npre[class*=\"language-\"] {\r\n	color: #ccc;\r\n	background: none;\r\n	font-family: Consolas, Monaco, \'Andale Mono\', \'Ubuntu Mono\', monospace;\r\n	text-align: left;\r\n	white-space: pre;\r\n	word-spacing: normal;\r\n	word-break: normal;\r\n	word-wrap: normal;\r\n	line-height: 1.5;\r\n\r\n	-moz-tab-size: 4;\r\n	-o-tab-size: 4;\r\n	tab-size: 4;\r\n\r\n	-webkit-hyphens: none;\r\n	-moz-hyphens: none;\r\n	-ms-hyphens: none;\r\n	hyphens: none;\r\n\r\n}','java');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `about` varchar(500) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profilepic` varchar(45) NOT NULL DEFAULT 'profile.png',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Durgesh Kumar Tiwari','i am java programmer .','durgeshkumar305@gmail.com','mypass','w.jpg'),(2,'John','I am python programmer','john@gmail.com','mypass','profile.png');
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

-- Dump completed on 2018-07-26 16:49:39
