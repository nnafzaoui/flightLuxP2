-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2020 at 11:21 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flightmanagmentp2`
--

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `id_flight` int(11) NOT NULL,
  `plane_name` varchar(50) DEFAULT NULL,
  `depart` varchar(80) DEFAULT NULL,
  `distination` varchar(80) DEFAULT NULL,
  `date_flight` datetime DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total_places` int(4) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`id_flight`, `plane_name`, `depart`, `distination`, `date_flight`, `price`, `total_places`, `is_active`) VALUES
(1, 'Airways', 'Morocco', 'France', '2020-05-23 00:00:00', 1500, 92, 1),
(2, ' Airlines', 'Morocco', 'Spain', '2020-06-02 00:00:00', 2000, 130, 1),
(3, 'Emirates', 'Spain', 'UK', '2020-06-02 00:00:00', 1000, 78, 1),
(4, 'ANA All Nippon Airways', 'France', 'Japan', '2020-06-04 00:00:00', 10000, 200, 1),
(5, 'Airways', 'Morocco', 'Japan', '2020-05-23 00:00:00', 1500, 99, 1),
(6, 'Airlines', 'Morocco', 'Spain', '2020-06-02 00:00:00', 2000, 150, 1),
(7, 'Emirates', 'Morocco', 'France', '2020-06-02 00:00:00', 1000, 77, 1),
(8, 'AIRJAPAN', 'Spain', 'France', '2020-06-04 00:00:00', 10000, 198, 1),
(9, 'EVA Air', 'France', 'China', '2020-06-10 00:00:00', 10100, 100, 1),
(10, 'Airlines', 'Morocco', 'France', '2020-04-12 00:00:00', 1000, 79, 1),
(11, 'AIRNOUR', 'Safi', 'NY', '2020-06-27 00:00:00', 5000, 200, 1),
(12, 'NAZAIRS', 'Japan', 'Safi', '2020-06-28 00:00:00', 10000, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id_resevation` int(11) NOT NULL,
  `id_flight` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `date_resevation` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id_resevation`, `id_flight`, `id_user`, `date_resevation`) VALUES
(1, 2, 3, '2020-06-25 01:10:36'),
(2, 1, 3, '2020-06-26 06:09:44'),
(3, 1, 1, '2020-06-27 13:41:34'),
(4, 1, 1, '2020-06-28 00:13:14'),
(5, 1, 1, '2020-06-28 00:13:53'),
(6, 1, 1, '2020-06-28 00:16:06'),
(7, 1, 1, '2020-06-28 00:16:39'),
(8, 1, 1, '2020-06-28 00:16:58'),
(9, 2, 5, '2020-06-28 01:44:02'),
(10, 2, 5, '2020-06-28 01:50:36'),
(11, 2, 5, '2020-06-28 11:58:31'),
(12, 2, 5, '2020-06-28 11:58:52'),
(13, 2, 5, '2020-06-28 12:08:17'),
(14, 2, 5, '2020-06-28 12:17:07'),
(15, 2, 5, '2020-06-28 12:17:10'),
(16, 2, 5, '2020-06-28 12:17:11'),
(17, 2, 5, '2020-06-28 12:17:11'),
(18, 2, 5, '2020-06-28 12:17:12'),
(19, 2, 5, '2020-06-28 12:17:12'),
(20, 2, 5, '2020-06-28 12:17:13'),
(21, 2, 5, '2020-06-28 12:17:13'),
(22, 2, 5, '2020-06-28 12:17:28'),
(23, 2, 5, '2020-06-28 12:19:53'),
(24, 2, 5, '2020-06-28 12:19:57'),
(25, 2, 5, '2020-06-28 12:19:58'),
(26, 2, 5, '2020-06-28 12:19:58'),
(27, 1, 5, '2020-06-28 12:20:01'),
(28, 2, 5, '2020-06-28 12:23:30'),
(29, 10, 5, '2020-06-28 12:24:02'),
(30, 3, 5, '2020-06-28 12:25:39'),
(31, 3, 5, '2020-06-28 12:26:28'),
(32, 5, 1, '2020-06-28 14:28:09'),
(33, 8, 5, '2020-06-28 22:10:31'),
(34, 7, 1, '2020-06-28 22:14:12'),
(35, 7, 1, '2020-06-28 22:15:15'),
(36, 8, 1, '2020-06-28 22:16:17'),
(37, 7, 1, '2020-06-28 22:18:25');

--
-- Triggers `reservation`
--
DELIMITER $$
CREATE TRIGGER `reservePlace` AFTER INSERT ON `reservation` FOR EACH ROW BEGIN
UPDATE Flight SET Flight.total_places = Flight.total_places - 1 WHERE Flight.id_flight = NEW.id_flight;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `travler`
--

CREATE TABLE `travler` (
  `id_travler` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_flight` int(11) DEFAULT NULL,
  `id_resevation` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `passport` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `travler`
--

INSERT INTO `travler` (`id_travler`, `id_user`, `id_flight`, `id_resevation`, `first_name`, `last_name`, `passport`) VALUES
(1, 3, 2, 1, 'Noureddine', 'Nafzaoui', 'nn1234'),
(2, 3, 1, 2, 'Noureddine', 'Nafzaoui', 'nn1234'),
(3, 1, 1, 3, 'Nour', 'Eddine', 'JP1111'),
(4, 1, 1, 4, 'Nour', 'Eddine', 'JP1111'),
(5, 1, 1, 5, 'Nour', 'Eddine', 'JP1111'),
(6, 1, 1, 6, 'Nour', 'Eddine', 'JP1111'),
(7, 1, 1, 7, 'Nour', 'Eddine', 'JP1111'),
(8, 1, 1, 8, 'Nour', 'Eddine', 'JP1111'),
(9, 5, 2, 9, 'salma', 'lol', 'hhaaa'),
(10, 5, 2, 10, 'salma', 'lol', 'hhaaa'),
(11, 5, 2, 11, 'salma', 'lol', 'hhaaa'),
(12, 5, 2, 12, 'salma', 'lol', 'hhaaa'),
(13, 5, 1, 27, 'salma', 'lol', 'hhaaa'),
(14, 5, 2, 28, 'salma', 'lol', 'hhaaa'),
(15, 5, 10, 29, 'salma', 'lol', 'hhaaa'),
(16, 5, 3, 30, 'salma', 'lol', 'hhaaa'),
(17, 5, 3, 31, 'salma', 'lol', 'hhaaa'),
(18, 1, 5, 32, 'Nour', 'Eddine', 'JP1111'),
(19, 5, 8, 33, 'salma', 'lol', 'hhaaa'),
(20, 1, 7, 34, 'Nour', 'Eddine', 'JP1111'),
(21, 1, 7, 35, 'Nour', 'Eddine', 'JP1111'),
(22, 1, 8, 36, 'Nour', 'Eddine', 'JP1111'),
(23, 1, 7, 37, 'Nour', 'Eddine', 'JP1111');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `id_card` varchar(10) DEFAULT NULL,
  `passport` varchar(10) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password_user` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `first_name`, `last_name`, `id_card`, `passport`, `nationality`, `birthday`, `email`, `password_user`, `phone`, `role`) VALUES
(1, 'Nour', 'Eddine', 'HH12222', 'JP1111', 'Morocco', '1997-09-28 00:00:00', 'nour@gmail.com', 'admin123', '+21266578685', 'admin'),
(3, 'Noureddine', 'Nafzaoui', 'HH3343', 'nn1234', 'Morocco', '1997-09-28 00:00:00', 'nourdine@gmail.com', '123456', '1231412', 'user'),
(4, 'Noureddine', 'Nafzaoui', 'HH3343', 'nn1234', 'Morocco', '1997-02-08 00:00:00', 'nourdine@gmail.com', '123456', '1231412', 'user'),
(5, 'salma', 'lol', 'HHHD', 'hhaaa', 'Morocco', '1999-02-08 00:00:00', 'nnnn@hhhh', '123456', '0612101750', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id_flight`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_resevation`),
  ADD KEY `id_flight` (`id_flight`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `travler`
--
ALTER TABLE `travler`
  ADD PRIMARY KEY (`id_travler`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_flight` (`id_flight`),
  ADD KEY `id_resevation` (`id_resevation`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `id_flight` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_resevation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `travler`
--
ALTER TABLE `travler`
  MODIFY `id_travler` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `travler`
--
ALTER TABLE `travler`
  ADD CONSTRAINT `travler_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `travler_ibfk_2` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`),
  ADD CONSTRAINT `travler_ibfk_3` FOREIGN KEY (`id_resevation`) REFERENCES `reservation` (`id_resevation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
