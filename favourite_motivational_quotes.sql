-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2023 at 01:05 AM
-- Server version: 8.0.28
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `favourite_motivational_quotes`
--

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int NOT NULL,
  `quote` varchar(1024) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `background_image_filename` varchar(255) DEFAULT NULL,
  `created_on` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `author`, `background_image_filename`, `created_on`) VALUES
(1, 'The best time to plant a tree was 20 years ago. The second best time is now.', 'Chinese Proverb', 'background_05', NULL),
(2, 'Write it. Shoot it. Publish it. Crochet it. Sauté it. Whatever. MAKE.', 'Joss Whedon', 'background_04', NULL),
(3, 'Don’t limit yourself. Many people limit themselves to what they think they can do. You can go as far as your mind lets you. What you believe, remember, you can achieve.', 'Mary Kay Ash', 'background_03', NULL),
(4, 'The secret of getting ahead is getting started.', 'Mark Twain', 'background_02', NULL),
(5, 'Don\'t let your happiness depend on something you may lose.', 'C.S. Lewis', 'background_01', NULL),
(11, 'The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.', 'Hellen Keller', 'background_06', NULL),
(12, 'You cannot have a positive life and a negative mind.', 'Joyce Meyer', 'background_07', NULL),
(13, 'Strength and growth come only through continuous effort and struggle.', 'Napoleon Hill', 'background_08', NULL),
(14, 'The trust of the innocent is the liar\'s most useful tool.', 'Stephen King', 'background_09', NULL),
(15, 'We must let go of the life we have planned, so as to accept the one that is waiting for us.', 'Joseph Campbell', 'background_10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cnic` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `address`, `cnic`) VALUES
(1, 'imran', 'imran', 'Imran', 'Faisalabad', '42212-1234567-1'),
(4, 'yasir', 'yasir', 'Yasir', 'Karachi', '23341-9865932-1'),
(5, 'babar', 'babar', 'Babar', 'Lahore', '34522-5657564-1'),
(6, 'raza', 'raza', 'Raza', 'Faisalabad', '43234-5675423-1');

-- --------------------------------------------------------

--
-- Table structure for table `users_quotes`
--

CREATE TABLE `users_quotes` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `quote_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users_quotes`
--

INSERT INTO `users_quotes` (`id`, `user_id`, `quote_id`) VALUES
(1, 1, 1),
(2, 1, 5),
(3, 1, 2),
(4, 1, 4),
(5, 1, 3),
(6, 1, 11),
(7, 1, 12),
(8, 1, 13),
(9, 1, 14),
(10, 1, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_quotes`
--
ALTER TABLE `users_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_idx` (`user_id`),
  ADD KEY `quotes_idx` (`quote_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users_quotes`
--
ALTER TABLE `users_quotes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_quotes`
--
ALTER TABLE `users_quotes`
  ADD CONSTRAINT `quotes` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
