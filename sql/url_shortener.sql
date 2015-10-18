-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2015 at 06:27 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `url_shortener`
--
CREATE DATABASE IF NOT EXISTS `url_shortener` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `url_shortener`;

-- --------------------------------------------------------

--
-- Table structure for table `urls`
--

CREATE TABLE IF NOT EXISTS `urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `long_url` varchar(255) NOT NULL,
  `short_url` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `long_url` (`long_url`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `urls`
--

INSERT INTO `urls` (`id`, `long_url`, `short_url`) VALUES
(1, 'http://www.w3schools.com/bootstrap/bootstrap_get_started.asp', 'http://goo.gl/ydcK9e'),
(2, 'https://www.npmjs.com/package/google-url', 'https://goo.gl/s70fVR'),
(3, 'http://expressjs.com/guide/database-integration.html#mysql', 'http://goo.gl/2BFlgg'),
(5, 'http://www.w3schools.com/bootstrap/bootstrap_grid_basic.asp', 'http://goo.gl/yzW0A7');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
