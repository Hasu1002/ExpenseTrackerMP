-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jan 30, 2024 at 11:36 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(100) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Item` varchar(100) NOT NULL,
  `Expense` varchar(100) NOT NULL,
  `Amount` int(100) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `Username`, `Item`, `Expense`, `Amount`, `Date`) VALUES
(15, 'Kavya', 'coffee mug', 'utilities', 80, '2024-01-24'),
(23, 'kayal', 'orange', 'groceries', 200, '2024-01-26'),
(28, 'Subash', 'film', 'entertainment', 500, '2024-01-19');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `Username` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Phoneno` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `UserID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`Username`, `Email`, `Gender`, `Phoneno`, `Password`, `UserID`) VALUES
('Harsha', 'harshas2304@gmail.com', 'female', '9363609841', '1234', 1),
('Madhumitha', 'madhumitha@gmail.com', 'female', '8438537606', 'madhu', 2),
('Kani', 'kani@gmail.com', 'female', '9789724008', 'kani', 3),
('Kavya', 'kavya@gmail.com', 'female', '9876543210', '12345', 5),
('kayal', 'kayal@gmail.com', 'female', '123456789', '1234', 6),
('Suba', 'suba@gmail.com', 'male', '9108765432', 'Suba', 7),
('Mayu', 'mayu@gmail.com', 'female', '90876654321', '1234', 8),
('Subash', 'subash2@gmail.com', 'male', '9780654321', '1234', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Phoneno` (`Phoneno`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `UserID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
