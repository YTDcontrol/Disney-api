-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: disney_api
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

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
-- Table structure for table `cast`
--

DROP TABLE IF EXISTS `cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cast` (
  `cast_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL DEFAULT 0,
  `character_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cast_id`),
  KEY `FK_cast_movies` (`movie_id`),
  KEY `FK_cast_characters` (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast`
--

LOCK TABLES `cast` WRITE;
/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
INSERT INTO `cast` VALUES (7,5,5),(9,6,7),(12,9,7),(18,10,8),(19,10,13),(20,15,14),(21,17,15),(22,18,16),(24,20,14);
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `character_id` int(30) NOT NULL AUTO_INCREMENT,
  `charImage` varchar(255) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `age` int(50) NOT NULL,
  `weight` int(50) NOT NULL,
  `history` varchar(255) NOT NULL,
  PRIMARY KEY (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (5,'https://i.pinimg.com/originals/47/25/e6/4725e6abf4ba15d25fb20b6f0131fb9d.png','Moana',16,50,'Sixteen-year-old Moana Waialiki, daughter of a chief of a long line of navigators, sets sail for an island with a powerful demigod to help save her family from annihilation'),(6,'https://media.gq.com.mx/photos/5fd7ca23d4ffa987c2fab0a9/master/pass/home%20alone%20mi%20pobre%20angelito.jpg','Kevin',8,36,'Peter and Kate\'s youngest son, Kevin, is the subject of ridicule by his older siblings. Later, Kevin accidentally ruins the family dinner and their flight tickets to Paris after a scuffle with his older brother Buzz, resulting in him getting sent to the a'),(7,'https://spoiler.bolavip.com/__export/1602425337137/sites/bolavip/img/2020/10/11/juegogemelas_crop1602424790098.jpg_1934285973.jpg','Hallie',10,42,'An 11-year-old girl meets her twin from California. The two devise a plan to reunite their divorced parents.'),(9,'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/pelicula-cruella-vil-llegara-2020.jpg?itok=3Hl9-znr','Cruella De Vil',60,66,'She is an eccentric, fashion-obsessed heiress who wishes to use the skins of 99 Dalmatian puppies to create a spotted fur coat'),(10,'https://static.wikia.nocookie.net/disney/images/a/a0/Ariel-1.png/revision/latest/top-crop/width/360/height/450?cb=20170929163212&path-prefix=es','Ariel',19,51,'Ariel is a very beautiful mermaid with an enchanting voice, capable of captivating anyone. She lives at the bottom of the sea, where she has many friends. She loves to explore ships and has all her treasures stored in a cave hidden from the harsh gaze of '),(11,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYEQ55KHSWB0u6OmqvKY2iEO1xjnLpsgg_54S_kPRoUuwTRj88iBDwhZa8gFy0OAJuX6Y&usqp=CAU','Rapunzel',18,55,'Rapunzel may have lived her entire life locked inside a hidden tower, but Rapunzel is no damsel in distress. The 70-foot golden-haired girl is an energetic and inquisitive teenager who fills her days with art, books and imagination. Rapunzel is full of cu'),(13,'https://pbs.twimg.com/media/EY9z-UWWsAAukaU.jpg','Clarisse Renaldi',60,65,'She was arranged to marry when she was younger to the Rupestrian Prince (later Rupestrian King) She was widowed a year before she told Mia that she was the sole heir, she has and had a romantic interest in her head of security Joseph who is now her husban'),(14,'https://upload.wikimedia.org/wikipedia/commons/6/64/Johnny_Depp_as_Captain_Jack_Sparrow_in_Queensland%2C_Australia.jpg','Jack Sparrow',35,70,'Jack Sparrow was born to Edward Teague and an unknown woman on a pirate ship caught in the middle of a typhoon. He was named Jack after his uncle and Teague\'s brother, Jack. Jack grew up in a tumultuous household full of outlaws at Shipwreck Cove.'),(16,'https://www.tonica.la/__export/1563495099812/sites/debate/img/2019/07/18/coraline_laika.jpg_1902800913.jpg','Coraline',11,40,'Coraline is a girl who looks to be about 11, an only child who has moved to a remote boarding house with her freelance writer/editor parents.'),(17,'https://pics.filmaffinity.com/El_diario_de_la_princesa-724056289-large.jpg','Mia Thermopolis',16,60,'Under the tutelage of her estranged grandmother (Andrews), the kingdom\'s reigning queen, Mia must decide whether to claim the throne she has inherited or renounce her title permanently');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '0',
  `movies` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`genre_id`),
  KEY `FK_genre_movies` (`movies`),
  CONSTRAINT `FK_genre_movies` FOREIGN KEY (`movies`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (4,'comedy','https://selva857.files.wordpress.com/2016/07/comedia.jpg?w=646',5),(5,'adventures','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFBgVFRQYGBgaHBobHBobGhshHRsdJB0aIhsdHR8bIS0kHSEqHxshJTclKi4xNDQ0ISM6PzozPi0zNDEBCwsLEA8QHRISHzMqJCszMzMzMzMzMzMzMzMxMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzPv/AABEIAJkBSQMBIgACEQEDEQH/',15),(6,'musical','http://formacion.intef.es/pluginfile.php/110252/mod_imscp/content/4/inteligencia_musical.png',17),(9,'thriller','https://i.pinimg.com/originals/47/25/e6/4725e6abf4ba15d25fb20b6f0131fb9d.png',18);
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_movie`
--

DROP TABLE IF EXISTS `genre_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL DEFAULT 0,
  `genre_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_genre_movie_movies` (`movie_id`),
  KEY `FK_genre_movie_genre` (`genre_id`),
  CONSTRAINT `FK_genre_movie_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  CONSTRAINT `FK_genre_movie_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_movie`
--

LOCK TABLES `genre_movie` WRITE;
/*!40000 ALTER TABLE `genre_movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `movie_id` int(30) NOT NULL AUTO_INCREMENT,
  `movieImage` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `cast` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`) USING BTREE,
  KEY `FK_movies_cast` (`cast`),
  CONSTRAINT `FK_movies_cast` FOREIGN KEY (`cast`) REFERENCES `cast` (`cast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (5,'https://static.wikia.nocookie.net/disney/images/a/a8/Monstruos_sa.jpg/revision/latest?cb=20110804055254&path-prefix=es','Monsters, Inc.','2001-11-02 15:20:47',5,18),(15,'https://i.blogs.es/13b8c5/piratascaribe/1366_2000.jpg','Pirates of the Caribbean 1','2003-05-29 13:23:40',4,20),(17,'https://i.pinimg.com/originals/7c/66/ba/7c66ba790ccea68680a32609c89307cc.jpg','Alice in wonderland','2010-05-29 16:13:20',5,21),(18,'https://static.rogerebert.com/uploads/review/primary_image/reviews/coraline-2009/EB20090204REVIEWS902049989AR.jpg','Coraline and the secret door ','2009-05-29 16:30:21',3,22),(20,'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSSCxI6sNpIwAXSsY5zYhaduo1gvxo4bqohTiaDQYWGl1rDvDDF','Pirates of the Caribbean: Dead Man\'s Chest ','2006-05-29 16:39:17',5,24);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(30) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(150) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','$2a$10$e22hx0.RyRJI1PAw3iImqe/afWKHX9GDrL03kCMNy6YHxZYfqmYcy','administrator','admin@justmail.com',1),(2,'ventasytd','$2a$10$H53fauoEWxMfynF0n6NZa.6S7WzIv/LWGP2nh4TdliCc339v6E7QO','Ana Maidana','ventas@ytdcontrol.com.ar',0),(4,'Admin3','$2a$10$pW3DoJy0bAK0JlY1sHX14e7yZVIlCBlHrzB2mNHOEIAQSt84HRPwG','administrador','info@ytdcontrol.com.ar',1),(5,'julissa','$2a$10$JRevizcwbynpNQ/hbtUuOeei9gTwujeAUAPPg/targAhOTANFTTPq','Juliefta Sosa','julasi123@gmail.com',0),(6,'Mati','$2a$10$8Zcf2DGoxt2KCF5TzR/iNO9/qSWyUoJGA12kjGEJXgJK5KIoXr.Cm','Matias Maidana','ytdcontrol@gmail.com',0),(7,'julisosa','$2a$10$D71iOzEF.UN8U7nnmcKUveySL9vKezhLkyfHvgH2RuDJ8wPj4WeoK','Julieta Sosa','juli123@gmail.com',0),(72,'adrians43','$2a$10$WAvNF1uUgHpxC4DulcAS7ewqzc1KVcdlHaSksAgvX06RgVTGIGtI.','Carlos A Sosa','adrians43@outlook.es',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'disney_api'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23 20:44:11
