/*
SQLyog Ultimate v9.63 
MySQL - 5.5.5-10.4.8-MariaDB : Database - adise19_chess3
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`adise19_chess3` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `adise19_chess3`;

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') NOT NULL,
  `piece_color` enum('W','B') DEFAULT NULL,
  `piece` enum('K','Q','R','B','N','P') DEFAULT NULL,
  PRIMARY KEY (`x`,`y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `board` */

insert  into `board`(`x`,`y`,`b_color`,`piece_color`,`piece`) values (1,1,'B','W','R'),(1,2,'W','W','P'),(1,3,'B',NULL,NULL),(1,4,'W',NULL,NULL),(1,5,'B',NULL,NULL),(1,6,'W',NULL,NULL),(1,7,'B','B','P'),(1,8,'W','B','R'),(2,1,'W','W','N'),(2,2,'B','W','P'),(2,3,'W',NULL,NULL),(2,4,'B',NULL,NULL),(2,5,'W',NULL,NULL),(2,6,'B',NULL,NULL),(2,7,'W','B','P'),(2,8,'B','B','N'),(3,1,'B','W','B'),(3,2,'W','W','P'),(3,3,'B',NULL,NULL),(3,4,'W',NULL,NULL),(3,5,'B',NULL,NULL),(3,6,'W',NULL,NULL),(3,7,'B','B','P'),(3,8,'W','B','B'),(4,1,'W','W','Q'),(4,2,'B','W','P'),(4,3,'W',NULL,NULL),(4,4,'B',NULL,NULL),(4,5,'W',NULL,NULL),(4,6,'B',NULL,NULL),(4,7,'W','B','P'),(4,8,'B','B','Q'),(5,1,'B','W','K'),(5,2,'W','W','P'),(5,3,'B',NULL,NULL),(5,4,'W',NULL,NULL),(5,5,'B',NULL,NULL),(5,6,'W',NULL,NULL),(5,7,'B','B','P'),(5,8,'W','B','K'),(6,1,'W','W','B'),(6,2,'B','W','P'),(6,3,'W',NULL,NULL),(6,4,'B',NULL,NULL),(6,5,'W',NULL,NULL),(6,6,'B',NULL,NULL),(6,7,'W','B','P'),(6,8,'B','B','B'),(7,1,'B','W','N'),(7,2,'W','W','P'),(7,3,'B',NULL,NULL),(7,4,'W',NULL,NULL),(7,5,'B',NULL,NULL),(7,6,'W',NULL,NULL),(7,7,'B','B','P'),(7,8,'W','B','N'),(8,1,'W','W','R'),(8,2,'B','W','P'),(8,3,'W',NULL,NULL),(8,4,'B',NULL,NULL),(8,5,'W',NULL,NULL),(8,6,'B',NULL,NULL),(8,7,'W','B','P'),(8,8,'B','B','R');

/*Table structure for table `board_empty` */

DROP TABLE IF EXISTS `board_empty`;

CREATE TABLE `board_empty` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') NOT NULL,
  `piece_color` enum('W','B') DEFAULT NULL,
  `piece` enum('K','Q','R','B','N','P') DEFAULT NULL,
  PRIMARY KEY (`y`,`x`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `board_empty` */

insert  into `board_empty`(`x`,`y`,`b_color`,`piece_color`,`piece`) values (1,1,'B','W','R'),(2,1,'W','W','N'),(3,1,'B','W','B'),(4,1,'W','W','Q'),(5,1,'B','W','K'),(6,1,'W','W','B'),(7,1,'B','W','N'),(8,1,'W','W','R'),(1,2,'W','W','P'),(2,2,'B','W','P'),(3,2,'W','W','P'),(4,2,'B','W','P'),(5,2,'W','W','P'),(6,2,'B','W','P'),(7,2,'W','W','P'),(8,2,'B','W','P'),(1,3,'B',NULL,NULL),(2,3,'W',NULL,NULL),(3,3,'B',NULL,NULL),(4,3,'W',NULL,NULL),(5,3,'B',NULL,NULL),(6,3,'W',NULL,NULL),(7,3,'B',NULL,NULL),(8,3,'W',NULL,NULL),(1,4,'W',NULL,NULL),(2,4,'B',NULL,NULL),(3,4,'W',NULL,NULL),(4,4,'B',NULL,NULL),(5,4,'W',NULL,NULL),(6,4,'B',NULL,NULL),(7,4,'W',NULL,NULL),(8,4,'B',NULL,NULL),(1,5,'B',NULL,NULL),(2,5,'W',NULL,NULL),(3,5,'B',NULL,NULL),(4,5,'W',NULL,NULL),(5,5,'B',NULL,NULL),(6,5,'W',NULL,NULL),(7,5,'B',NULL,NULL),(8,5,'W',NULL,NULL),(1,6,'W',NULL,NULL),(2,6,'B',NULL,NULL),(3,6,'W',NULL,NULL),(4,6,'B',NULL,NULL),(5,6,'W',NULL,NULL),(6,6,'B',NULL,NULL),(7,6,'W',NULL,NULL),(8,6,'B',NULL,NULL),(1,7,'B','B','P'),(2,7,'W','B','P'),(3,7,'B','B','P'),(4,7,'W','B','P'),(5,7,'B','B','P'),(6,7,'W','B','P'),(7,7,'B','B','P'),(8,7,'W','B','P'),(1,8,'W','B','R'),(2,8,'B','B','N'),(3,8,'W','B','B'),(4,8,'B','B','Q'),(5,8,'W','B','K'),(6,8,'B','B','B'),(7,8,'W','B','N'),(8,8,'B','B','R');

/*Table structure for table `game_status` */

DROP TABLE IF EXISTS `game_status`;

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('W','B') DEFAULT NULL,
  `result` enum('B','W','D') DEFAULT NULL,
  `last_change` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `game_status` */

insert  into `game_status`(`status`,`p_turn`,`result`,`last_change`) values ('started','W',NULL,'2019-12-11 00:18:00');

/*Table structure for table `players` */

DROP TABLE IF EXISTS `players`;

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('B','W') NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `last_action` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`piece_color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `players` */

insert  into `players`(`username`,`piece_color`,`token`,`last_action`) values ('bbbbbb','B','3739a531704cb26e4fd0ad1f4ee28c27','2019-12-11 00:18:00'),('www','W','8efd6f154181c2117a0558b57a4afb84','2019-12-11 00:17:53');

/* Trigger structure for table `game_status` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `game_status_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN
		set NEW.last_change = now();
    END */$$


DELIMITER ;

/* Procedure structure for procedure `clean_board` */

/*!50003 DROP PROCEDURE IF EXISTS  `clean_board` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board`()
BEGIN
	replace into board select * from board_empty;
	update `players` set username=null, token=null;
	update `game_status` set `status`='not active', `p_turn`=null, `result`=null;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `move_piece` */

/*!50003 DROP PROCEDURE IF EXISTS  `move_piece` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`asidirop`@`%` PROCEDURE `move_piece`(x1 tinyint,y1 tinyint,x2 tinyint,y2 tinyint)
BEGIN
	declare  p, p_color char;
	
	select  piece, piece_color into p, p_color FROM `board` WHERE X=x1 AND Y=y1;
	
	update board
	set piece=p, piece_color=p_color
	where x=x2 and y=y2;
	
	UPDATE board
	SET piece=null,piece_color=null
	WHERE X=x1 AND Y=y1;
	
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `test_move` */

/*!50003 DROP PROCEDURE IF EXISTS  `test_move` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`asidirop`@`%` PROCEDURE `test_move`()
BEGIN
SELECT * FROM
board B1 INNER JOIN board B2
WHERE B1.x=2 AND B1.y=2
AND (B2.`piece_color` IS NULL OR B2.`piece_color`<>B1.`piece_color`)
AND B1.x=B2.x AND B1.y<B2.y AND (B2.y-B1.y)<=2 ;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
