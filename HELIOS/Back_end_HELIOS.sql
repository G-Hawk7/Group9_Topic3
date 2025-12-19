-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2025 at 05:13 AM
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
-- Database: `helios`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `assessment_id` varchar(10) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `total_questions` int(11) DEFAULT NULL,
  `avg_score_percent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`assessment_id`, `course_id`, `title`, `total_questions`, `avg_score_percent`) VALUES
('ASS001', 'CRS001', 'JavaScript Basics Quiz', 20, 85),
('ASS002', 'CRS006', 'React Components Midterm', 25, 74),
('ASS003', 'CRS007', 'Node.js Fundamentals Quiz', 15, 68),
('ASS004', 'CRS003', 'Python Fundamentals Test', 10, 78),
('ASS005', 'CRS005', 'UX Design Principles Quiz', 10, 92);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` varchar(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `instructor_user_id` varchar(10) NOT NULL,
  `enrolled_count` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `title`, `instructor_user_id`, `enrolled_count`, `capacity`, `rating`, `status`) VALUES
('CRS001', 'Introduction to Web Development', 'USR002', 142, 200, 4.6, 'Active'),
('CRS002', 'Advanced JavaScript', 'USR006', 89, 150, 4.4, 'Active'),
('CRS003', 'Data Science Fundamentals', 'USR003', 120, 180, 4.2, 'Active'),
('CRS004', 'Python Programming', 'USR007', 95, 150, 4.5, 'Active'),
('CRS005', 'UX/UI Design Principles', 'USR008', 78, 120, 4.7, 'Active'),
('CRS006', 'React Fundamentals', 'USR002', 67, 100, NULL, 'Active'),
('CRS007', 'Node.js Backend', 'USR002', 54, 100, NULL, 'Active'),
('CRS008', 'Database Design', 'USR002', 38, 100, NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollments`
--

CREATE TABLE `course_enrollments` (
  `enrollment_id` varchar(10) NOT NULL,
  `student_user_id` varchar(10) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `enrollment_date` date DEFAULT NULL,
  `progress_percent` int(11) DEFAULT 0,
  `time_spent_hrs` int(11) DEFAULT 0,
  `payment_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_enrollments`
--

INSERT INTO `course_enrollments` (`enrollment_id`, `student_user_id`, `course_id`, `enrollment_date`, `progress_percent`, `time_spent_hrs`, `payment_status`) VALUES
('ENR001', 'USR001', 'CRS001', '2023-08-01', 85, 42, 'Paid'),
('ENR002', 'USR001', 'CRS003', '2023-09-01', 42, 28, 'Paid'),
('ENR003', 'USR001', 'CRS002', '2023-08-20', 65, 35, 'Paid'),
('ENR004', 'USR001', 'CRS004', '2023-08-25', 30, 15, 'Paid'),
('ENR005', 'USR001', 'CRS005', '2023-08-28', 90, 50, 'Paid'),
('ENR006', 'USR008', 'CRS005', '2023-08-28', NULL, NULL, 'Paid'),
('ENR007', 'USR007', 'CRS004', '2023-08-25', NULL, NULL, 'Paid'),
('ENR008', 'USR006', 'CRS002', '2023-08-20', NULL, NULL, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `financial_transactions`
--

CREATE TABLE `financial_transactions` (
  `transaction_id` varchar(10) NOT NULL,
  `student_user_id` varchar(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` varchar(50) NOT NULL,
  `reason` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `financial_transactions`
--

INSERT INTO `financial_transactions` (`transaction_id`, `student_user_id`, `amount`, `type`, `reason`, `date`, `status`) VALUES
('TRN001', 'USR001', 199.99, 'Payment', 'Data Science Fundamentals enrollment', '2023-09-01', 'Paid'),
('TRN002', 'USR008', 149.99, 'Payment', 'UX/UI Design Principles enrollment', '2023-08-28', 'Paid'),
('TRN003', 'USR007', 179.99, 'Payment', 'Python Programming enrollment', '2023-08-25', 'Paid'),
('TRN0123', 'USR009', 99.99, 'Refund', 'Course content mismatch', '2023-11-01', 'Pending'),
('TRN0124', 'USR010', 149.99, 'Refund', 'Technical issues', '2023-11-01', 'Pending'),
('TRN0125', 'USR011', 79.99, 'Refund', 'Personal reasons', '2023-10-01', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `description`) VALUES
(1, 'student', 'Enrolled user focused on learning, progress, and assessments.'),
(2, 'instructor', 'Faculty member managing courses, content, and student performance.'),
(3, 'admin', 'Superuser responsible for system-wide user, course, and enrollment management.'),
(4, 'it', 'Technical officer overseeing system health, security, and activity logs.'),
(5, 'finance', 'Officer managing financial reports, billing, and enrollments.');

-- --------------------------------------------------------

--
-- Table structure for table `studentinformation`
--

CREATE TABLE `studentinformation` (
  `studentID` int(8) NOT NULL,
  `studentName` varchar(50) NOT NULL,
  `studentAddress` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentinformation`
--

INSERT INTO `studentinformation` (`studentID`, `studentName`, `studentAddress`) VALUES
(1, 'John Walker', 'Manhattan, New York City, NY');

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `log_id` varchar(10) NOT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `activity` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip_address` varchar(40) DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_logs`
--

INSERT INTO `system_logs` (`log_id`, `user_id`, `activity`, `timestamp`, `ip_address`, `status`) VALUES
('LOG001', 'USR001', 'Logged in', '2023-08-15 03:23:45', '192.168.1.101', 'Success'),
('LOG004', 'USR003', 'Deleted course CRS005', '2023-08-15 06:45:01', '192.168.1.100', 'High Risk'),
('LOG005', 'USR002', 'Uploaded new content', '2023-08-15 05:30:15', '192.168.1.102', 'Success'),
('LOG006', 'USR006', 'Created new quiz', '2023-08-14 10:20:30', '192.168.1.103', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(10) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `name`, `email`, `password_hash`) VALUES
('USR001', 1, 'John Walker', 'john.walker@example.com', NULL),
('USR002', 2, 'Walter White', 'walter.white@example.com', NULL),
('USR003', 3, 'Charles Xavier', 'charles.xavier@example.com', NULL),
('USR004', 4, 'Diddy Combs', 'diddy.combs@example.com', NULL),
('USR005', 5, 'Kevin Hart', 'kevin.hart@example.com', NULL),
('USR006', 2, 'Emily Davis', 'emily.davis@example.com', NULL),
('USR007', 2, 'Michael Chen', 'michael.chen@example.com', NULL),
('USR008', 2, 'Sarah Johnson', 'sarah.johnson@example.com', NULL),
('USR009', 1, 'Jane Doe', 'jane.doe@example.com', NULL),
('USR010', 1, 'Robert Brown', 'robert.brown@example.com', NULL),
('USR011', 1, 'Lisa Taylor', 'lisa.taylor@example.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `user_id` varchar(10) NOT NULL,
  `goals` text DEFAULT NULL,
  `interests` text DEFAULT NULL,
  `achievements` text DEFAULT NULL,
  `expertise` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`user_id`, `goals`, `interests`, `achievements`, `expertise`) VALUES
('USR001', 'Become a full-stack developer focusing on JavaScript and cloud technologies.', 'Web Development, JavaScript, React, System Architecture, Reading.', 'Completed 3 certifications, Top 5% in Advanced JavaScript course.', NULL),
('USR002', 'Improve course content and student engagement.', 'Teaching, UX/UI Design, Educational Technology.', 'Won teaching award, published 5 courses.', 'Web Dev, UX'),
('USR006', NULL, NULL, NULL, 'JavaScript, React'),
('USR007', NULL, NULL, NULL, 'Python, Data Science'),
('USR008', NULL, NULL, NULL, 'UX/UI Design');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`assessment_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `instructor_user_id` (`instructor_user_id`);

--
-- Indexes for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_user_id` (`student_user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `financial_transactions`
--
ALTER TABLE `financial_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `student_user_id` (`student_user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `studentinformation`
--
ALTER TABLE `studentinformation`
  ADD PRIMARY KEY (`studentID`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `studentinformation`
--
ALTER TABLE `studentinformation`
  MODIFY `studentID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessments`
--
ALTER TABLE `assessments`
  ADD CONSTRAINT `assessments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`instructor_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  ADD CONSTRAINT `course_enrollments_ibfk_1` FOREIGN KEY (`student_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `course_enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `financial_transactions`
--
ALTER TABLE `financial_transactions`
  ADD CONSTRAINT `financial_transactions_ibfk_1` FOREIGN KEY (`student_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD CONSTRAINT `system_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;


