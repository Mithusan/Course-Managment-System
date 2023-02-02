-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 30, 2022 at 04:46 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_registeration`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `Course_ID` varchar(200) NOT NULL,
  `PSsn` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  KEY `Course_ID` (`Course_ID`),
  KEY `PSsn` (`PSsn`),
  KEY `StudentID` (`StudentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`Course_ID`, `PSsn`, `StudentID`) VALUES
('COMM1050', 98188899, 100781121),
('MATH1010', 98122345, 100781511),
('BUSI2040', 98123345, 100781322),
('ELEE2010', 98133455, 100821222),
('MATH1020', 98122345, 100781322),
('COMM1050', 98188899, 100821222),
('COMM1050', 98188899, 100781322),
('MATH1010', 98122345, 100781121),
('MATH1010', 98122345, 100821222),
('ELEE2010', 98133455, 100781511),
('ELEE2010', 98133455, 100781322);

-- --------------------------------------------------------

--
-- Table structure for table `courseprerequiste`
--

DROP TABLE IF EXISTS `courseprerequiste`;
CREATE TABLE IF NOT EXISTS `courseprerequiste` (
  `Course_ID` varchar(100) NOT NULL,
  `Prereq_ID` varchar(100) NOT NULL,
  KEY `Course_ID` (`Course_ID`),
  KEY `Prereq_ID` (`Prereq_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseprerequiste`
--

INSERT INTO `courseprerequiste` (`Course_ID`, `Prereq_ID`) VALUES
('MATH1020', 'MATH1010');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `ID` varchar(200) NOT NULL,
  `CourseName` varchar(255) NOT NULL,
  `Section` varchar(255) DEFAULT NULL,
  `Program_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Program_ID` (`Program_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`ID`, `CourseName`, `Section`, `Program_ID`) VALUES
('COMM1050', 'Communications ', '04', 'B_COMM'),
('ELEE2010', 'Digital Systems ', '02', 'B_ELEE'),
('MATH1010', 'Calculus', '01', 'B_MATH'),
('BUSI2040', 'Information systems', '02', 'B_BUSI'),
('MATH1020', 'Calculus2', '01', 'B_MATH');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `FacultyID` varchar(100) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FacultyID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FacultyID`, `Name`) VALUES
('FEAS', 'Faculty of Engineering and Applied Science'),
('FSSH', 'Faculty of Social Science and Humanities'),
('FBIT', 'Faculty of Business and Information Technology'),
('FSc', 'Faculty of Science');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `StudentID` int(11) NOT NULL,
  `Pass` varchar(255) NOT NULL,
  PRIMARY KEY (`StudentID`,`Pass`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`StudentID`, `Pass`) VALUES
(100781121, 'abc34'),
(100781322, 'ab67y'),
(100781511, 'afdg'),
(100821222, 'abgf');

-- --------------------------------------------------------

--
-- Table structure for table `professors_information`
--

DROP TABLE IF EXISTS `professors_information`;
CREATE TABLE IF NOT EXISTS `professors_information` (
  `Ssn` int(11) NOT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Faculty_ID` varchar(255) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Phone` int(100) DEFAULT NULL,
  `Salary` int(10) DEFAULT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `Faculty_ID` (`Faculty_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professors_information`
--

INSERT INTO `professors_information` (`Ssn`, `LastName`, `FirstName`, `Address`, `Faculty_ID`, `BirthDate`, `Phone`, `Salary`) VALUES
(98188899, 'Loki', 'John', '45 Heaven Street, Oshawa, Ontario', 'FBIT', '1972-04-01', 346627778, 120000),
(98122345, 'Loki', 'Lorence', '43 Heaven Streer,Oshawa,Ontario', 'FSSH', '1971-05-02', 346887109, 125000),
(98133455, 'Garg', 'Arnav', '25 Swansea Street, Whitby, Ontario', 'FEAS', '1970-05-21', 556991107, 170000),
(98123345, 'Sharma ', 'Raj', '24 Swansea Street, Whitby, Ontario.', 'FSc', '1969-05-12', 413445789, 180000);

-- --------------------------------------------------------

--
-- Table structure for table `program_information`
--

DROP TABLE IF EXISTS `program_information`;
CREATE TABLE IF NOT EXISTS `program_information` (
  `Program_ID` varchar(11) NOT NULL,
  `Faculty_ID` varchar(100) NOT NULL,
  `Program_Name` varchar(100) NOT NULL,
  `Duration` varchar(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Program_ID`),
  KEY `Faculty_ID` (`Faculty_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program_information`
--

INSERT INTO `program_information` (`Program_ID`, `Faculty_ID`, `Program_Name`, `Duration`, `type`) VALUES
('B_MATH', 'FSc', 'Applied and Industrial Mathematics', '4 Years', 'Bachelors of Science '),
('B_SOFE', 'FEAS', 'Software Engineering', '4 Years ', 'Bachelors of Engineering'),
('B_COMM', 'FSSH', 'Communication and Digital Media Studies', '4 Years', 'Bachelor of Arts'),
('B_BUSI', 'FBIT', 'Technology Management ', '4 Years', 'Bachelors of Commerce'),
('B_ELEE', 'FEAS', 'Electrical Engineering ', '4 years ', 'Bachelors of Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `student_information`
--

DROP TABLE IF EXISTS `student_information`;
CREATE TABLE IF NOT EXISTS `student_information` (
  `Student_ID` int(11) NOT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `Program_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `Program_id` (`Program_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_information`
--

INSERT INTO `student_information` (`Student_ID`, `LastName`, `FirstName`, `Birthdate`, `Phone`, `Address`, `Year`, `Program_id`) VALUES
(100781121, 'Sharma', 'Lucky', '2001-10-09', '3658851044', '24 Swanse Street', 1, 'B_MATH'),
(100781511, 'Kapoor', 'Raj', '2003-09-10', '4164451022', '32 Bomanville', 3, 'B_COMM'),
(100821222, 'Sharm', 'Mohan', '2001-08-12', '4164451023', '31 Oakville ', 1, 'B_SOFE'),
(100781322, 'Lous', 'Jacky', '2000-07-04', '4163351023', '23 Oakville', 1, 'B_COMM');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view1`;
CREATE TABLE IF NOT EXISTS `view1` (
`FirstName` varchar(255)
,`LastName` varchar(255)
,`Course_ID` varchar(200)
,`Section` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view2`;
CREATE TABLE IF NOT EXISTS `view2` (
`FirstName` varchar(255)
,`LastName` varchar(255)
,`Course_ID` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view3`;
CREATE TABLE IF NOT EXISTS `view3` (
`FirstName` varchar(255)
,`LastName` varchar(255)
,`Salary` int(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view4`;
CREATE TABLE IF NOT EXISTS `view4` (
`FirstName` varchar(255)
,`Program_id` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view5`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view5`;
CREATE TABLE IF NOT EXISTS `view5` (
`FirstName` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view6`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view6`;
CREATE TABLE IF NOT EXISTS `view6` (
`FirstName` varchar(255)
,`LastName` varchar(255)
,`Program_Name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view7`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view7`;
CREATE TABLE IF NOT EXISTS `view7` (
`ID` varchar(200)
,`type` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view8`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view8`;
CREATE TABLE IF NOT EXISTS `view8` (
`Faculty_ID` varchar(100)
,`ID` varchar(200)
,`CourseName` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view9`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view9`;
CREATE TABLE IF NOT EXISTS `view9` (
`Name` varchar(100)
,`Program_ID` varchar(11)
,`type` varchar(100)
,`ID` varchar(200)
,`CourseName` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view10`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view10`;
CREATE TABLE IF NOT EXISTS `view10` (
`FirstName` varchar(255)
,`LastName` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

DROP VIEW IF EXISTS `view1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS SELECT `p`.`FirstName` AS `FirstName`, `p`.`LastName` AS `LastName`, `c`.`Course_ID` AS `Course_ID`, `cs`.`Section` AS `Section` FROM ((`class` `c` join `courses` `cs`) join `professors_information` `p`) WHERE ((`c`.`PSsn` = `p`.`Ssn`) AND (`c`.`Course_ID` = `cs`.`ID`)) GROUP BY `p`.`FirstName` ;

-- --------------------------------------------------------

--
-- Structure for view `view2`
--
DROP TABLE IF EXISTS `view2`;

DROP VIEW IF EXISTS `view2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2`  AS SELECT `s`.`FirstName` AS `FirstName`, `s`.`LastName` AS `LastName`, `c`.`Course_ID` AS `Course_ID` FROM (`class` `c` join `student_information` `s`) WHERE `c`.`StudentID` in (select `student_information`.`Student_ID` from `student_information` where (`s`.`Student_ID` = `student_information`.`Student_ID`)) GROUP BY `s`.`FirstName` ;

-- --------------------------------------------------------

--
-- Structure for view `view3`
--
DROP TABLE IF EXISTS `view3`;

DROP VIEW IF EXISTS `view3`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3`  AS SELECT `p`.`FirstName` AS `FirstName`, `p`.`LastName` AS `LastName`, `p`.`Salary` AS `Salary` FROM `professors_information` AS `p` WHERE (`p`.`Salary` > (select avg(`professors_information`.`Salary`) from `professors_information`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view4`
--
DROP TABLE IF EXISTS `view4`;

DROP VIEW IF EXISTS `view4`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4`  AS SELECT `s`.`FirstName` AS `FirstName`, `s`.`Program_id` AS `Program_id` FROM (`student_information` `s` join `courses` on((`s`.`Program_id` = `courses`.`Program_ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view5`
--
DROP TABLE IF EXISTS `view5`;

DROP VIEW IF EXISTS `view5`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view5`  AS SELECT `s`.`FirstName` AS `FirstName` FROM `student_information` AS `s` ;

-- --------------------------------------------------------

--
-- Structure for view `view6`
--
DROP TABLE IF EXISTS `view6`;

DROP VIEW IF EXISTS `view6`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view6`  AS SELECT `s`.`FirstName` AS `FirstName`, `s`.`LastName` AS `LastName`, `p`.`Program_Name` AS `Program_Name` FROM (`student_information` `s` join `program_information` `p`) WHERE ((`s`.`Program_id` = `p`.`Program_ID`) AND (`s`.`Year` = 1)) ;

-- --------------------------------------------------------

--
-- Structure for view `view7`
--
DROP TABLE IF EXISTS `view7`;

DROP VIEW IF EXISTS `view7`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view7`  AS SELECT `c`.`ID` AS `ID`, `p`.`type` AS `type` FROM (`courses` `c` join `program_information` `p`) WHERE (`p`.`Program_ID` = `c`.`Program_ID`) ;

-- --------------------------------------------------------

--
-- Structure for view `view8`
--
DROP TABLE IF EXISTS `view8`;

DROP VIEW IF EXISTS `view8`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view8`  AS SELECT `p`.`Faculty_ID` AS `Faculty_ID`, `c`.`ID` AS `ID`, `c`.`CourseName` AS `CourseName` FROM (`courses` `c` join `program_information` `p`) WHERE (`c`.`Program_ID` = `p`.`Program_ID`) ;

-- --------------------------------------------------------

--
-- Structure for view `view9`
--
DROP TABLE IF EXISTS `view9`;

DROP VIEW IF EXISTS `view9`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view9`  AS SELECT `f`.`Name` AS `Name`, `p`.`Program_ID` AS `Program_ID`, `p`.`type` AS `type`, `c`.`ID` AS `ID`, `c`.`CourseName` AS `CourseName` FROM ((`courses` `c` join `program_information` `p`) join `faculty` `f`) WHERE ((`c`.`Program_ID` = `p`.`Program_ID`) AND (`f`.`FacultyID` = `p`.`Faculty_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view10`
--
DROP TABLE IF EXISTS `view10`;

DROP VIEW IF EXISTS `view10`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view10`  AS SELECT `p`.`FirstName` AS `FirstName`, `p`.`LastName` AS `LastName` FROM (`professors_information` `p` join `faculty` `f`) WHERE (`f`.`FacultyID` = `p`.`Faculty_ID`) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
