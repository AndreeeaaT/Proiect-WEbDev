-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Generation Time: May 25, 2024 at 09:46 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spital`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctori`
--

CREATE TABLE `doctori` (
  `id` int NOT NULL,
  `nume` varchar(255) DEFAULT NULL,
  `specializare` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctori`
--

INSERT INTO `doctori` (`id`, `nume`, `specializare`) VALUES
(2, 'Maria Gheorghe', 'Cardiologie'),
(8, 'Mihai Octavian', 'Pediatrie'),
(12, 'Andrei Ionescu', 'Radiologie'),
(13, 'Ioana Popa', 'Ginecologie');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `feedback_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `doctor_id`, `patient_name`, `feedback_text`, `created_at`) VALUES
(2, 2, 'andrei', 'da', '2024-05-20 09:30:31'),
(4, 8, 'Andrei', 'super', '2024-05-20 09:35:06'),
(5, 12, 'Georgel', 'Cel mai tare doctor pe bune', '2024-05-20 09:50:00'),
(7, 8, 'Diana', 'okey', '2024-05-20 14:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `programari`
--

CREATE TABLE `programari` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `sectiune_id` int NOT NULL,
  `data_programare` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `programari`
--

INSERT INTO `programari` (`id`, `user_id`, `sectiune_id`, `data_programare`) VALUES
(18, 12, 1, '2024-05-29'),
(20, 12, 1, '2024-05-22'),
(23, 12, 4, '2024-06-07'),
(27, 12, 2, '2024-06-02'),
(28, 16, 3, '2024-06-27'),
(29, 16, 4, '2024-06-06'),
(30, 12, 2, '2024-06-10');

-- --------------------------------------------------------

--
-- Table structure for table `sectiuni`
--

CREATE TABLE `sectiuni` (
  `id` int NOT NULL,
  `nume` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sectiuni`
--

INSERT INTO `sectiuni` (`id`, `nume`) VALUES
(1, 'Cardiologie'),
(2, 'Radiologie'),
(3, 'Pediatrie'),
(4, 'Ginecologie');

-- --------------------------------------------------------

--
-- Table structure for table `utilizatori`
--

CREATE TABLE `utilizatori` (
  `id` int NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `parola` varchar(255) NOT NULL,
  `tip_utilizator` enum('pacient','doctor','administrator') NOT NULL,
  `profil_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `utilizatori`
--

INSERT INTO `utilizatori` (`id`, `user_name`, `parola`, `tip_utilizator`, `profil_img`) VALUES
(2, 'Maria Gheorghe', '1234', 'doctor', 'uploads/66519ae7d03d0.jpg'),
(3, 'admin', 'admin', 'administrator', NULL),
(12, 'Andrei', '0000', 'pacient', 'uploads/66519b54b8ea8.jpg'),
(14, 'Mihai Octavian', '12345', 'doctor', NULL),
(15, 'Ioana Popa', 'oooo', 'doctor', NULL),
(16, 'Andreea', '1111', 'pacient', 'uploads/radio.png');

-- --------------------------------------------------------

--
-- Table structure for table `utilizator_tokens`
--

CREATE TABLE `utilizator_tokens` (
  `id` int NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashed_validator` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctori`
--
ALTER TABLE `doctori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `programari`
--
ALTER TABLE `programari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sectiune_id` (`sectiune_id`);

--
-- Indexes for table `sectiuni`
--
ALTER TABLE `sectiuni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utilizatori`
--
ALTER TABLE `utilizatori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utilizator_tokens`
--
ALTER TABLE `utilizator_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctori`
--
ALTER TABLE `doctori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `programari`
--
ALTER TABLE `programari`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sectiuni`
--
ALTER TABLE `sectiuni`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `utilizatori`
--
ALTER TABLE `utilizatori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `utilizator_tokens`
--
ALTER TABLE `utilizator_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctori` (`id`);

--
-- Constraints for table `programari`
--
ALTER TABLE `programari`
  ADD CONSTRAINT `programari_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `utilizatori` (`id`),
  ADD CONSTRAINT `programari_ibfk_2` FOREIGN KEY (`sectiune_id`) REFERENCES `sectiuni` (`id`);

--
-- Constraints for table `utilizator_tokens`
--
ALTER TABLE `utilizator_tokens`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `utilizatori` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
