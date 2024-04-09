create database testdb;

use testdb;

CREATE TABLE `tblcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) default NULL,
  `pid` int(11) NOT NULL
) ;

INSERT INTO `tblcategories` VALUES (1, 'Hardware', 0);
INSERT INTO `tblcategories` VALUES (2, 'Software', 0);
INSERT INTO `tblcategories` VALUES (3, 'Movies', 0);
INSERT INTO `tblcategories` VALUES (4, 'Mouse', 1);
INSERT INTO `tblcategories` VALUES (5, 'Keyboard', 1);
INSERT INTO `tblcategories` VALUES (6, 'Monitor', 1);
INSERT INTO `tblcategories` VALUES (7, 'Desktop', 2);
INSERT INTO `tblcategories` VALUES (8, 'Web Application', 2);
INSERT INTO `tblcategories` VALUES (9, 'Mobile Application', 2);
INSERT INTO `tblcategories` VALUES (10, 'Hindi', 3);
INSERT INTO `tblcategories` VALUES (11, 'English', 3);
INSERT INTO `tblcategories` VALUES (12, 'Punjabi', 3);
INSERT INTO `tblcategories` VALUES (13, 'French', 3);
INSERT INTO `tblcategories` VALUES (14, 'American Beauty', 11);
INSERT INTO `tblcategories` VALUES (15, 'Lord of rings', 11);
INSERT INTO `tblcategories` VALUES (20, 'Spinderman III', 11);
INSERT INTO `tblcategories` VALUES (19, 'Logitech', 5);
INSERT INTO `tblcategories` VALUES (16, 'Creative', 5);
INSERT INTO `tblcategories` VALUES (17, 'www.Yahoo.com', 8);
INSERT INTO `tblcategories` VALUES (18, 'www.Hotmail.com', 8);
INSERT INTO `tblcategories` VALUES (21, 'Om Shanti Om', 10);
INSERT INTO `tblcategories` VALUES (22, 'Ji Ayaan Nu', 12);
INSERT INTO `tblcategories` VALUES (23, 'Music', 0);