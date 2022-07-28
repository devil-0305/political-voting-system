-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql312.epizy.com
-- Generation Time: May 18, 2022 at 10:09 AM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epiz_31742805_eballot`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `created_at`) VALUES
(1, 'sachinsharma2168@gmail.com', '$2y$10$wtKdL3V8rO5vtiiFpYETyeGYCLIicru.izxEHIgg0RAxWmLXFhQX.', '2022-05-17 06:52:30'),
(2, 'anshulcruck@gmail.com', '$2y$10$S5zu1expjd7RcBr6D9sZH.SLpN3bKUbjP0svyfbQw1i4oh2IbNF1O', '2022-05-17 07:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `name`, `email`, `created_on`) VALUES
(1, 'sachin sharma ', 'contact.@gmail.com', '2022-05-17 14:49:04'),
(2, 'anshul', 'sachinsharma2168@gmail.com', '2022-05-17 14:49:27');

-- --------------------------------------------------------

--
-- Table structure for table `election_name`
--

CREATE TABLE `election_name` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `creatad_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `election_name`
--

INSERT INTO `election_name` (`id`, `name`, `position`, `description`, `creatad_on`) VALUES
(1, 'Test', 'president', 'hlo', '2022-05-17 14:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `vote` varchar(50) NOT NULL,
  `submitted_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `email`, `vote`, `submitted_at`) VALUES
(1, 'sachinsharma2168@gmail.com', 'Sachin Sharma', '2022-05-17 15:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_on`) VALUES
(4, 'anshulcruck@gmail.com', '$2y$10$rQchVVAfIXA0zAekLVBUNuvDLpwwIq36A88rUiSEOTZUJ3BybhmqO', '2022-05-17 07:27:45'),
(3, 'sachinsharma2168@gmail.com', '$2y$10$m8S8RSIY05RMqUlZU03h1.cQDtw3U5kEEXB/Wdj0LFI66BG9h9vq6', '2022-05-17 06:52:30'),
(6, 'anshul@gmail.com', '$2y$10$fSc9o53afRFypdBH7raQIeh0D6sB.8wvFhMgeQkK9nun/nJEkTrsG', '2022-05-17 08:16:14'),
(7, 'admin@gmail.com', '$2y$10$Wwl0DwvUvtfLbUFh.eXYeuaMmQ9m7WWNtV9PDZikIANVcayR5wC6W', '2022-05-17 08:50:29');

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `name`, `email`) VALUES
(1, 'SACHIN', 'sachinsharma2168@gmail.com'),
(2, 'ANSHUL', 'anshul@gmail.com'),
(3, 'AMIT', 'amit@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `unique` (`id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `election_name`
--
ALTER TABLE `election_name`
  ADD UNIQUE KEY `unique` (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `unique` (`id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD UNIQUE KEY `unique` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `election_name`
--
ALTER TABLE `election_name`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
