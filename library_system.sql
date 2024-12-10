-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2024 at 11:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Year` int(11) NOT NULL,
  `Genre` varchar(100) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `Status` enum('Available','Checked Out') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ID`, `Title`, `Author`, `description`, `created_by`, `created_at`, `Year`, `Genre`, `ISBN`, `Status`) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', NULL, NULL, '2024-12-09 21:35:32', 1925, 'Fiction', '9780743273565', 'Checked Out'),
(2, 'To Kill a Mockingbird', 'Harper Lee', NULL, NULL, '2024-12-09 21:35:32', 1960, 'Fiction', '9780061120084', 'Checked Out'),
(3, '1984', 'George Orwell', 'A dystopian novel depicting a totalitarian society under constant surveillance.', 1, '2024-12-09 15:01:00', 1949, 'Dystopian', '9780451524935', 'Checked Out'),
(4, 'Moby Dick', 'Herman Melville', 'An epic tale of obsession and revenge on the high seas.', 1, '2024-12-09 15:03:00', 1851, 'Adventure', '9781503280786', 'Available'),
(5, 'Pride and Prejudice', 'Jane Austen', 'A classic romantic comedy about love and misunderstandings.', 1, '2024-12-09 15:04:00', 1813, 'Romance', '9781503290563', 'Checked Out'),
(6, 'The Catcher in the Rye', 'J.D. Salinger', 'A teenager\'s journey through alienation and identity in 1950s America.', 1, '2024-12-09 15:05:00', 1951, 'Fiction', '9780316769488', 'Available'),
(7, 'Brave New World', 'Aldous Huxley', 'A futuristic world where society is engineered for conformity.', 1, '2024-12-09 15:06:00', 1932, 'Science Fiction', '9780060850524', 'Checked Out'),
(8, 'The Hobbit', 'J.R.R. Tolkien', 'A prelude to the Lord of the Rings, chronicling Bilbo\'s adventures.', 1, '2024-12-09 15:07:00', 1937, 'Fantasy', '9780547928227', 'Available'),
(9, 'The Alchemist', 'Paulo Coelho', 'A philosophical tale of a shepherd\'s journey to find his personal legend.', 1, '2024-12-09 15:08:00', 1988, 'Adventure', '9780061122415', 'Available'),
(10, 'Crime and Punishment', 'Fyodor Dostoevsky', 'An intense psychological study of crime, guilt, and redemption.', 1, '2024-12-09 15:09:00', 1866, 'Philosophical Fiction', '9780486454115', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE `checkouts` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `book_id` int(11) NOT NULL,
  `checkout_date` date NOT NULL,
  `return_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkouts`
--

INSERT INTO `checkouts` (`id`, `first_name`, `last_name`, `book_id`, `checkout_date`, `return_date`) VALUES
(1, 'Cheyenne ', 'Korda', 1, '2024-12-10', '2024-12-13'),
(2, 'Michael', 'Berry', 2, '2024-12-10', '2024-12-13'),
(3, 'Michael ', 'Beryr', 2, '2024-12-10', '2024-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$QR8EgAySTNkYu6wA1xxyg.r7QA7WQztGtA5ixsWZr9GdTNSm2RRPm', 'user', '2024-12-09 20:47:52'),
(2, 'chey@gmail.com', '$2y$10$pbVbJfzP.mM643DepWroLOjsyHLa7VJx7l9Q3n55BhM2l4RXDkVsq', 'user', '2024-12-09 21:03:41'),
(3, 'Berrym21@mymail.nku.edu', '$2y$10$/0lVr7tbs3vm2Qf9fHb9x.kAbZA0NdIhL1W/t5fWmQqVp820IK7qu', 'user', '2024-12-09 21:19:40'),
(4, 'Berrym21@mymail.nku.edu', '$2y$10$Df3W./7Z9eILyQ1rAgwIMeVdgeTRYyZnu0wB9xCvYnT9HqfIaN74.', 'user', '2024-12-09 21:21:15'),
(5, 'm.berry@fuse.net', '$2y$10$Rlx0T.dVKbByEBpzvB8eHOOyukAShxW1Tc/Dwk5UT4UX62YhQKqS2', 'user', '2024-12-09 21:25:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
