/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.0.30 : Database - db_bioskop_feby
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_bioskop_feby` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_bioskop_feby`;

/*Table structure for table `film` */

DROP TABLE IF EXISTS `film`;

CREATE TABLE `film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `durasi` int DEFAULT NULL,
  PRIMARY KEY (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `film` */

insert  into `film`(`id_film`,`judul`,`genre`,`durasi`) values 
(1,'Avengers: Endgame','Sci-Fi/Action',180),
(2,'Inception','Sci-Fi/Thriller',148);

/*Table structure for table `jadwal` */

DROP TABLE IF EXISTS `jadwal`;

CREATE TABLE `jadwal` (
  `id_jadwal` int NOT NULL AUTO_INCREMENT,
  `id_film` int DEFAULT NULL,
  `id_studio` int DEFAULT NULL,
  `jam_tayang` varchar(10) NOT NULL,
  `harga_dasar` double NOT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `id_film` (`id_film`),
  KEY `id_studio` (`id_studio`),
  CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE,
  CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id_studio`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `jadwal` */

insert  into `jadwal`(`id_jadwal`,`id_film`,`id_studio`,`jam_tayang`,`harga_dasar`) values 
(1,1,1,'12:00',35000),
(2,1,2,'15:15',50000),
(3,2,3,'19:00',75000);

/*Table structure for table `studio` */

DROP TABLE IF EXISTS `studio`;

CREATE TABLE `studio` (
  `id_studio` int NOT NULL AUTO_INCREMENT,
  `nama_studio` varchar(50) NOT NULL,
  `tipe_studio` varchar(20) NOT NULL,
  `kapasitas` int DEFAULT NULL,
  PRIMARY KEY (`id_studio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `studio` */

insert  into `studio`(`id_studio`,`nama_studio`,`tipe_studio`,`kapasitas`) values 
(1,'Studio 1','Reguler',50),
(2,'Studio 2','IMAX',40),
(3,'Studio 3','Premiere',20);

/*Table structure for table `tiket` */

DROP TABLE IF EXISTS `tiket`;

CREATE TABLE `tiket` (
  `id_tiket` int NOT NULL AUTO_INCREMENT,
  `id_jadwal` int DEFAULT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `nomor_kursi` varchar(5) NOT NULL,
  `total_bayar` double NOT NULL,
  `tanggal_booking` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tiket`),
  KEY `id_jadwal` (`id_jadwal`),
  CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tiket` */

insert  into `tiket`(`id_tiket`,`id_jadwal`,`nama_customer`,`nomor_kursi`,`total_bayar`,`tanggal_booking`) values 
(1,2,'Feby','D6',65000,'2026-06-23 10:08:48'),
(3,3,'Sintaa','G6',105000,'2026-06-23 10:12:18'),
(4,2,'Yaya','A4',65000,'2026-06-23 10:12:48'),
(5,1,'Susanti','B5',35000,'2026-06-23 10:13:39');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
