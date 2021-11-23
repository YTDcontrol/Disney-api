CREATE DATABASE IF NOT EXISTS `disney_api` ;
USE `disney_api`;

CREATE TABLE IF NOT EXISTS `cast` (
  `cast_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL DEFAULT 0,
  `character_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cast_id`),
  KEY `FK_cast_movies` (`movie_id`),
  KEY `FK_cast_characters` (`character_id`),
  CONSTRAINT `FK_cast_characters` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`),
  CONSTRAINT `FK_cast_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
INSERT INTO `cast` (`cast_id`, `movie_id`, `character_id`) VALUES
	(7, 5, 5),
	(9, 6, 7),
	(12, 9, 7),
	(18, 10, 8),
	(19, 10, 13),
	(20, 15, 14),
	(21, 17, 15),
	(22, 18, 16),
	(24, 20, 14);
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `characters` (
  `character_id` int(30) NOT NULL AUTO_INCREMENT,
  `charImage` varchar(255) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `age` int(50) NOT NULL,
  `weight` int(50) NOT NULL,
  `history` varchar(255) NOT NULL,
  PRIMARY KEY (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` (`character_id`, `charImage`, `name`, `age`, `weight`, `history`) VALUES
	(5, 'https://i.pinimg.com/originals/47/25/e6/4725e6abf4ba15d25fb20b6f0131fb9d.png', 'Moana', 16, 50, 'Sixteen-year-old Moana Waialiki, daughter of a chief of a long line of navigators, sets sail for an island with a powerful demigod to help save her family from annihilation'),
	(6, 'https://media.gq.com.mx/photos/5fd7ca23d4ffa987c2fab0a9/master/pass/home%20alone%20mi%20pobre%20angelito.jpg', 'Kevin', 8, 36, 'Peter and Kate\'s youngest son, Kevin, is the subject of ridicule by his older siblings. Later, Kevin accidentally ruins the family dinner and their flight tickets to Paris after a scuffle with his older brother Buzz, resulting in him getting sent to the a'),
	(7, 'https://spoiler.bolavip.com/__export/1602425337137/sites/bolavip/img/2020/10/11/juegogemelas_crop1602424790098.jpg_1934285973.jpg', 'Hallie', 10, 42, 'An 11-year-old girl meets her twin from California. The two devise a plan to reunite their divorced parents.'),
	(8, 'https://pics.filmaffinity.com/El_diario_de_la_princesa-724056289-large.jpg', 'Mia Thermopolis', 16, 60, 'Under the tutelage of her estranged grandmother (Andrews), the kingdom\'s reigning queen, Mia must decide whether to claim the throne she has inherited or renounce her title permanently'),
	(9, 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/pelicula-cruella-vil-llegara-2020.jpg?itok=3Hl9-znr', 'Cruella De Vil', 60, 66, 'She is an eccentric, fashion-obsessed heiress who wishes to use the skins of 99 Dalmatian puppies to create a spotted fur coat'),
	(10, 'https://static.wikia.nocookie.net/disney/images/a/a0/Ariel-1.png/revision/latest/top-crop/width/360/height/450?cb=20170929163212&path-prefix=es', 'Ariel', 19, 51, 'Ariel is a very beautiful mermaid with an enchanting voice, capable of captivating anyone. She lives at the bottom of the sea, where she has many friends. She loves to explore ships and has all her treasures stored in a cave hidden from the harsh gaze of '),
	(11, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYEQ55KHSWB0u6OmqvKY2iEO1xjnLpsgg_54S_kPRoUuwTRj88iBDwhZa8gFy0OAJuX6Y&usqp=CAU', 'Rapunzel', 18, 55, 'Rapunzel may have lived her entire life locked inside a hidden tower, but Rapunzel is no damsel in distress. The 70-foot golden-haired girl is an energetic and inquisitive teenager who fills her days with art, books and imagination. Rapunzel is full of cu'),
	(13, 'https://pbs.twimg.com/media/EY9z-UWWsAAukaU.jpg', 'Clarisse Renaldi', 60, 65, 'She was arranged to marry when she was younger to the Rupestrian Prince (later Rupestrian King) She was widowed a year before she told Mia that she was the sole heir, she has and had a romantic interest in her head of security Joseph who is now her husban'),
	(14, 'https://upload.wikimedia.org/wikipedia/commons/6/64/Johnny_Depp_as_Captain_Jack_Sparrow_in_Queensland%2C_Australia.jpg', 'Jack Sparrow', 35, 70, 'Jack Sparrow was born to Edward Teague and an unknown woman on a pirate ship caught in the middle of a typhoon. He was named Jack after his uncle and Teague\'s brother, Jack. Jack grew up in a tumultuous household full of outlaws at Shipwreck Cove.'),
	(15, 'https://i2.wp.com/contraste.info/desarrollo/wp-content/uploads/2014/11/Critica-AliciaPaisMaravillas2010-FichaCine.jpg?fit=1400%2C932&ssl=1', 'Alice', 19, 55, 'Alice falls through a rabbit hole into a subterranean fantasy world populated by peculiar, anthropomorphic creatures'),
	(16, 'https://www.tonica.la/__export/1563495099812/sites/debate/img/2019/07/18/coraline_laika.jpg_1902800913.jpg', 'Coraline', 11, 40, 'Coraline is a girl who looks to be about 11, an only child who has moved to a remote boarding house with her freelance writer/editor parents.');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '0',
  `movies` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`genre_id`),
  KEY `FK_genre_movies` (`movies`),
  CONSTRAINT `FK_genre_movies` FOREIGN KEY (`movies`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`genre_id`, `name`, `image`, `movies`) VALUES
	(4, 'comedy', 'https://selva857.files.wordpress.com/2016/07/comedia.jpg?w=646', 5),
	(5, 'adventures', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFBgVFRQYGBgaHBobHBobGhshHRsdJB0aIhsdHR8bIS0kHSEqHxshJTclKi4xNDQ0ISM6PzozPi0zNDEBCwsLEA8QHRISHzMqJCszMzMzMzMzMzMzMzMxMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzPv/AABEIAJkBSQMBIgACEQEDEQH/', 15),
	(6, 'Fantasy', 'https://i.pinimg.com/originals/47/25/e6/4725e6abf4ba15d25fb20b6f0131fb9d.png', 17),
	(7, 'Drama', 'https://i.pinimg.com/originals/47/25/e6/4725e6abf4ba15d25fb20b6f0131fb9d.png', 10),
	(9, 'thriller', 'https://i.pinimg.com/originals/47/25/e6/4725e6abf4ba15d25fb20b6f0131fb9d.png', 18);
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `genre_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL DEFAULT 0,
  `genre_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_genre_movie_movies` (`movie_id`),
  KEY `FK_genre_movie_genre` (`genre_id`),
  CONSTRAINT `FK_genre_movie_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  CONSTRAINT `FK_genre_movie_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*!40000 ALTER TABLE `genre_movie` DISABLE KEYS */;
INSERT INTO `genre_movie` (`id`, `movie_id`, `genre_id`) VALUES
	(2, 15, 5),
	(3, 5, 4),
	(4, 6, 4),
	(5, 9, 4),
	(6, 10, 4),
	(7, 18, 9),
	(8, 20, 5);
/*!40000 ALTER TABLE `genre_movie` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` int(30) NOT NULL AUTO_INCREMENT,
  `movieImage` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `cast` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`) USING BTREE,
  KEY `FK_movies_cast` (`cast`),
  CONSTRAINT `FK_movies_cast` FOREIGN KEY (`cast`) REFERENCES `cast` (`cast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` (`movie_id`, `movieImage`, `title`, `releaseDate`, `score`, `cast`) VALUES
	(5, 'https://static.wikia.nocookie.net/disney/images/7/76/Moana_official_poster.jpg/revision/latest?cb=20160921035605&path-prefix=es', 'Moana, a sea of adventures', '2016-11-26 18:04:48', 4, 7),
	(6, 'https://spoiler.bolavip.com/__export/1602425337137/sites/bolavip/img/2020/10/11/juegogemelas_crop1602424790098.jpg_1934285973.jpg', 'The parent trap', '1999-08-07 18:19:30', 5, 9),
	(9, 'https://spoiler.bolavip.com/__export/1602425337137/sites/bolavip/img/2020/10/11/juegogemelas_crop1602424790098.jpg_1934285973.jpg', 'The parent trap 2', '2001-05-27 18:31:38', 3, 9),
	(10, 'https://i.pinimg.com/originals/47/25/e6/4725e6abf4ba15d25fb20b6f0131fb9d.png', 'The Princess Diaries 2: Royal Engagement', '2004-08-07 18:31:38', 5, 18),
	(15, 'https://i.blogs.es/13b8c5/piratascaribe/1366_2000.jpg', 'Pirates of the Caribbean 1', '2003-05-29 13:23:40', 4, 20),
	(17, 'https://i.pinimg.com/originals/7c/66/ba/7c66ba790ccea68680a32609c89307cc.jpg', 'Alice in wonderland', '2010-05-29 16:13:20', 5, 21),
	(18, 'https://static.rogerebert.com/uploads/review/primary_image/reviews/coraline-2009/EB20090204REVIEWS902049989AR.jpg', 'Coraline and the secret door ', '2009-05-29 16:30:21', 3, 22),
	(20, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSSCxI6sNpIwAXSsY5zYhaduo1gvxo4bqohTiaDQYWGl1rDvDDF', 'Pirates of the Caribbean: Dead Man\'s Chest ', '2006-05-29 16:39:17', 5, 24);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(30) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(150) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `username`, `password`, `fullname`, `email`, `is_admin`) VALUES
	(1, 'ninasimone', '$2a$10$9lvnQxpTQttAywtfp0EGtuNcAlgMFYRSRhTXOy/dIlYDWr.UgkwXG', 'Nina Simone', 'ninasimone@gmail.com', 0),
	(2, 'lilaflorenz', '$2a$10$SSWx0t2bffcwxwMeYI0QjOLmnX2bTKW54/qcvYLsF.LuKwPVUfrZa', 'Lila Florenz', 'lilaflorenz@gmail.com', 0),
	(3, 'Admin', '$2a$10$wKBadSDZCCDMlJIU1KOm.ugAgY0YWssteh/3zPTsjjQNA0magNZSO', 'administrator', 'administrator@gmail.com', 1),
	(5, 'Philip Log', '$2a$10$ReKVGTTElNzd6LpI/NekAO.a5UA53PaXV0HGdydV6Y0z9G0kjec9a', 'Philip Log', 'philiplog@gmail.com', 0),
	(6, 'ernestsholtis', '$2a$10$M0Wbq4jWC0HOiFfIAknrQOznzgzFR4O8SYT698FSLys5h8yz6WZxe', 'Ernest Sholtis', 'ernestsholtis@gmail.com', 0),
	(8, 'mashadevz', '$2a$10$DNtTMHcQNaUd7zYAnQHQpO6ZwGC5RZy2eUPJZFYGeXlKBM1dmQ6L6', 'Masha Devz', 'mashadevz@gmail.com', 0),
	(9, 'silvanitat', '$2a$10$uT9FT/vl2G5xvX2cGmVTkOMMmylqwhAoi/STKiLu2PprdzMpS/RA2', 'Silvana Martinez', 'silvanita@yopmail.com', 0),
	(10, 'silvanitat1', '$2a$10$0SL6BcIu.JbvRXh2CRbnteE3YoJhJzOgZX1bJ96XvvknI015WWgPm', 'Silvana Martinez', 'silvanita1@yopmail.com', 0),
	(11, 'silvanitat2', '$2a$10$7DXDkdULMx1mrdNknvhPHOwm2lOhQDxkJfYRdGgQ30x/A5Dvfw/Ra', 'Silvana Martinez', 'silvanita2@yopmail.com', 0),
	(12, 'silvanitat4', '$2a$10$1.CZ/wjH3R0niJD6r3tcUucVHzv63e/oSrUoKzFKtFyggLfPdYdIi', 'Silvana Martinez', 'silvanita4@yopmail.com', 0),
	(13, 'silvanitat5', '$2a$10$hbT73K.UY2dlTEvKtzEiJOt2wpMIymyMLnKT/SwkEZULmI1rTDrJm', 'Silvana Martinez', 'silvanita5@yopmail.com', 0),
	(14, 'silvanitat6', '$2a$10$Rwol8E/.Lau.9k/s3BRs5.6BOBAbtaJPPMdcbO5nmWE5ovvdXLskW', 'Silvana Martinez', 'silvanita6@yopmail.com', 0),
	(15, 'silvanitat8', '$2a$10$E9XNK.iUEjm8Bim.GwKd/e1/U.yVkPk1NTpjUo1J.jLGZlYs6T61u', 'Silvana Martinez', 'silvanita8@yopmail.com', 0),
	(16, 'silvanitat9', '$2a$10$GgCRF1LDFsZgkjcfiuROaeVBPBWPFKqD79GhF3RPDShVWwJ8DM1C6', 'Silvana Martinez', 'silvanita9@yopmail.com', 0),
	(17, 'silvanitat15', '$2a$10$6Wv2.3g92jlCZGKShkRO4ecMFQzKZ/Y.6H2sur.NLGScIKebcc4B.', 'Silvana Martinez', 'silvanita15@yopmail.com', 0),
	(18, 'silvanitat18', '$2a$10$qUpNSlmk.XuqkqyjHNxqR.ftvITX6PnOHU0ld1rXW4sJYxR62S3U2', 'Silvana Martinez', 'silvanita18@yopmail.com', 0),
	(19, 'silvanitat19', '$2a$10$MhtgmtckTobOob612Iw1F.0MTrtpkmMOxa5E5p8txE4ShONvlqEwq', 'Silvana Martinez', 'silvanita19@yopmail.com', 0),
	(20, 'silvanitat62', '$2a$10$X5V5jJJH1Hs4glEqS26JUePACK3tBmZ9D/TUFtnbEA.dkib8CV0BS', 'Silvana Martinez', 'silvanita62@yopmail.com', 0),
	(21, 'silvanitat61', '$2a$10$s6OWsNDZCqdTLaIYjru8EuNKkvpqmSi7oFvZTBXo28fO/EbW/l072', 'Silvana Martinez', 'silvanita61@yopmail.com', 0),
	(22, 'silvanitat74', '$2a$10$AzUHTwR3mAKlAkepFly7Q.E.xAbvJZSYlMmwGndJ7UI6chaYEUSFG', 'Silvana Martinez', 'silvanita74@yopmail.com', 0),
	(23, 'silvanitat81', '$2a$10$yc4qDtBYMFwWz6D6I/DDbuaVlDWv1qslMj2zr4q94B58iPz7b7GRa', 'Silvana Martinez', 'silvanita781@yopmail.com', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

