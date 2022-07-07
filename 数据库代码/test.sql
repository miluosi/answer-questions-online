/*
 Navicat Premium Data Transfer

 Source Server         : mz华为云
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 120.46.157.46:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 18/12/2021 09:07:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 1111111_qs
-- ----------------------------
DROP TABLE IF EXISTS `1111111_qs`;
CREATE TABLE `1111111_qs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `finished_time` datetime(0) NULL DEFAULT NULL,
  `ifTrue` bigint(0) NULL DEFAULT NULL,
  `whole_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `ts1_ibfk1111111` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1111111_qs
-- ----------------------------
INSERT INTO `1111111_qs` VALUES (1, 3, '111', '2021-12-12 10:04:01', '2021-12-12 10:04:03', NULL, 2);
INSERT INTO `1111111_qs` VALUES (2, 1, 'mkied', '2021-12-12 10:04:06', '2021-12-12 10:04:09', NULL, 3);
INSERT INTO `1111111_qs` VALUES (3, 1, '123321', '2021-12-12 10:04:11', '2021-12-12 10:04:13', NULL, 2);
INSERT INTO `1111111_qs` VALUES (4, 8, '321123', '2021-12-12 10:04:18', '2021-12-12 10:04:20', NULL, 2);

-- ----------------------------
-- Table structure for 1111111_sc
-- ----------------------------
DROP TABLE IF EXISTS `1111111_sc`;
CREATE TABLE `1111111_sc`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NOT NULL,
  PRIMARY KEY (`id`, `qsid`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `1111111_sc_ibfk_1` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1111111_sc
-- ----------------------------

-- ----------------------------
-- Table structure for 1951234_qs
-- ----------------------------
DROP TABLE IF EXISTS `1951234_qs`;
CREATE TABLE `1951234_qs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finished_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ifTrue` bigint(0) NULL DEFAULT NULL,
  `whole_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `ts1_ibfk1951234` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1951234_qs
-- ----------------------------
INSERT INTO `1951234_qs` VALUES (22, 7, '2<<3，因为将一个数左移n位，就相当于乘以了2的n次方。', '2021-11-12 12:17:12', '2021-11-12 12:17:22', 0, 10);
INSERT INTO `1951234_qs` VALUES (23, 7, '2<<3，因为将一个数左移n位，就相当于乘以了2的n次方。', '2021-11-12 12:18:34', '2021-11-12 12:18:46', 0, 12);
INSERT INTO `1951234_qs` VALUES (24, 7, '2<<3，因为将一个数左移n位，就相当于乘以了2的n次方。', '2021-11-12 12:24:06', '2021-11-12 12:24:12', 0, 6);
INSERT INTO `1951234_qs` VALUES (25, 7, '2<<3', '2021-11-12 12:25:38', '2021-11-12 12:25:43', 0, 5);
INSERT INTO `1951234_qs` VALUES (26, 7, 'A', '2021-11-12 12:25:47', '2021-11-12 12:25:48', 0, 1);
INSERT INTO `1951234_qs` VALUES (27, 9, 'A', '2021-11-12 12:27:41', '2021-11-12 12:27:43', 1, 2);
INSERT INTO `1951234_qs` VALUES (28, 8, '使用final关键字修饰一个变量时，是指引用变量不能变，引用变量所指向的对象中的内容还是可以改变的。', '2021-11-12 12:27:47', '2021-11-12 12:27:55', 1, 8);
INSERT INTO `1951234_qs` VALUES (29, 8, '可以', '2021-11-12 12:33:24', '2021-11-12 12:33:29', 0, 5);
INSERT INTO `1951234_qs` VALUES (30, 7, '哦婆婆', '2021-11-16 14:40:55', '2021-11-16 14:41:00', 0, 5);
INSERT INTO `1951234_qs` VALUES (31, 4, '得得得', '2021-11-16 14:41:05', '2021-11-16 14:41:11', 0, 6);
INSERT INTO `1951234_qs` VALUES (32, 10, 'B', '2021-11-16 15:20:01', '2021-11-16 15:20:14', 1, 13);
INSERT INTO `1951234_qs` VALUES (33, 7, '2<<3', '2021-11-11 15:20:01', '2021-11-11 15:20:14', 0, 13);
INSERT INTO `1951234_qs` VALUES (34, 10, 'B', '2021-11-11 15:20:01', '2021-11-11 15:20:14', 1, 13);
INSERT INTO `1951234_qs` VALUES (35, 6, '可以', '2021-11-17 08:57:44', '2021-11-17 08:57:48', 0, 4);
INSERT INTO `1951234_qs` VALUES (36, 3, '不知道', '2021-11-17 08:57:53', '2021-11-17 08:57:58', 0, 5);
INSERT INTO `1951234_qs` VALUES (37, 1, ' 可以，一个类中只能有一个被public修饰的类，这个类名还必须和文件名相同。', '2021-11-17 08:58:05', '2021-11-17 08:58:25', 1, 20);
INSERT INTO `1951234_qs` VALUES (38, 2, ' 没有，这个是保留字，还没有在java中被使用。\n', '2021-11-17 11:09:07', '2021-11-17 11:09:28', 1, 21);
INSERT INTO `1951234_qs` VALUES (39, 3, '111', '2021-11-17 11:11:46', '2021-11-17 11:11:48', 1, 2);
INSERT INTO `1951234_qs` VALUES (40, 4, '11111', '2021-11-17 11:11:52', '2021-11-17 11:11:55', 1, 3);
INSERT INTO `1951234_qs` VALUES (41, 5, '3232323', '2021-11-17 11:11:59', '2021-11-17 11:12:01', 1, 2);
INSERT INTO `1951234_qs` VALUES (42, 5, '434343', '2021-11-17 11:12:07', '2021-11-17 11:12:09', 1, 2);
INSERT INTO `1951234_qs` VALUES (43, 6, '999', '2021-11-17 11:12:14', '2021-11-17 11:12:19', 1, 5);
INSERT INTO `1951234_qs` VALUES (44, 7, 'jiji', '2021-11-17 11:12:24', '2021-11-17 11:12:26', 1, 2);
INSERT INTO `1951234_qs` VALUES (45, 11, 'A', '2021-11-17 11:46:11', '2021-11-17 11:46:13', 1, 2);
INSERT INTO `1951234_qs` VALUES (46, 12, 'A', '2021-11-17 11:46:19', '2021-11-17 11:46:21', 1, 2);
INSERT INTO `1951234_qs` VALUES (47, 1, '哈哈哈', '2021-11-19 08:21:39', '2021-11-19 08:21:49', 1, 10);
INSERT INTO `1951234_qs` VALUES (48, 3, '不敏感', '2021-11-19 08:23:51', '2021-11-19 08:23:57', 0, 6);
INSERT INTO `1951234_qs` VALUES (49, 5, 'where', '2021-11-19 08:24:01', '2021-11-19 08:24:05', 1, 4);
INSERT INTO `1951234_qs` VALUES (50, 12, '数组赋值', '2021-11-19 08:24:10', '2021-11-19 08:24:14', 1, 4);
INSERT INTO `1951234_qs` VALUES (51, 4, '不会做', '2021-11-19 08:24:19', '2021-11-19 08:24:23', 1, 4);
INSERT INTO `1951234_qs` VALUES (52, 18, '可以', '2021-11-19 08:24:27', '2021-11-19 08:24:29', 1, 2);
INSERT INTO `1951234_qs` VALUES (53, 5, '88888', '2021-11-19 09:26:12', '2021-11-19 09:26:15', 1, 3);
INSERT INTO `1951234_qs` VALUES (54, 5, '9999', '2021-11-19 09:26:18', '2021-11-19 09:26:20', 0, 2);
INSERT INTO `1951234_qs` VALUES (55, 2, 'nnnnnnnnnnn', '2021-11-30 23:01:59', '2021-11-30 23:02:12', 0, 13);
INSERT INTO `1951234_qs` VALUES (56, 9, '111', '2021-12-11 23:03:43', '2021-12-11 23:03:45', NULL, 2);
INSERT INTO `1951234_qs` VALUES (57, 4, '321123', '2021-12-11 23:03:47', '2021-12-11 23:03:49', NULL, 2);
INSERT INTO `1951234_qs` VALUES (58, 5, '3333333', '2021-12-11 23:03:52', '2021-12-11 23:03:53', NULL, 1);
INSERT INTO `1951234_qs` VALUES (59, 14, '99999', '2021-12-11 23:03:58', '2021-12-11 23:04:00', 1, 2);
INSERT INTO `1951234_qs` VALUES (60, 15, '99999', '2021-12-12 10:10:01', '2021-12-12 10:10:04', NULL, 3);
INSERT INTO `1951234_qs` VALUES (61, 15, '898989', '2021-12-12 10:10:09', '2021-12-12 10:10:11', NULL, 2);
INSERT INTO `1951234_qs` VALUES (62, 16, '00000', '2021-12-12 10:10:16', '2021-12-12 10:10:19', NULL, 3);
INSERT INTO `1951234_qs` VALUES (63, 1, '得得得', '2021-12-12 14:18:48', '2021-12-12 14:18:52', 1, 4);
INSERT INTO `1951234_qs` VALUES (64, 14, 'ui', '2021-12-12 14:19:00', '2021-12-12 14:19:03', 1, 3);
INSERT INTO `1951234_qs` VALUES (69, 13, '```\nfor i in range(10):\n	a.append(i)\n\n```\n', '2021-12-18 08:27:51', '2021-12-18 08:28:45', 0, 54);
INSERT INTO `1951234_qs` VALUES (70, 13, '给数组赋值：通过 sort方法。\n```\ndataType[] arrayRefVar = new dataType[arraySize]; \nArrarys.sort(arrayRefVar);\n\n```\n\n', '2021-12-18 08:33:10', '2021-12-18 08:34:15', 1, 65);

-- ----------------------------
-- Table structure for 1951234_sc
-- ----------------------------
DROP TABLE IF EXISTS `1951234_sc`;
CREATE TABLE `1951234_sc`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NOT NULL,
  PRIMARY KEY (`id`, `qsid`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `1951234_sc_ibfk_1` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1951234_sc
-- ----------------------------
INSERT INTO `1951234_sc` VALUES (1, 1);
INSERT INTO `1951234_sc` VALUES (2, 2);
INSERT INTO `1951234_sc` VALUES (3, 3);
INSERT INTO `1951234_sc` VALUES (4, 4);
INSERT INTO `1951234_sc` VALUES (8, 5);
INSERT INTO `1951234_sc` VALUES (5, 7);
INSERT INTO `1951234_sc` VALUES (6, 10);
INSERT INTO `1951234_sc` VALUES (7, 11);
INSERT INTO `1951234_sc` VALUES (9, 13);

-- ----------------------------
-- Table structure for 1951360_qs
-- ----------------------------
DROP TABLE IF EXISTS `1951360_qs`;
CREATE TABLE `1951360_qs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `finished_time` datetime(0) NULL DEFAULT NULL,
  `ifTrue` bigint(0) NULL DEFAULT NULL,
  `whole_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `ts1_ibfk1951360` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1951360_qs
-- ----------------------------

-- ----------------------------
-- Table structure for 1951360_sc
-- ----------------------------
DROP TABLE IF EXISTS `1951360_sc`;
CREATE TABLE `1951360_sc`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NOT NULL,
  PRIMARY KEY (`id`, `qsid`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `1951360_sc_ibfk_1` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1951360_sc
-- ----------------------------

-- ----------------------------
-- Table structure for 1951369_qs
-- ----------------------------
DROP TABLE IF EXISTS `1951369_qs`;
CREATE TABLE `1951369_qs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `finished_time` datetime(0) NULL DEFAULT NULL,
  `ifTrue` bigint(0) NULL DEFAULT NULL,
  `whole_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `ts1_ibfk1951369` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1951369_qs
-- ----------------------------

-- ----------------------------
-- Table structure for 1951369_sc
-- ----------------------------
DROP TABLE IF EXISTS `1951369_sc`;
CREATE TABLE `1951369_sc`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NOT NULL,
  PRIMARY KEY (`id`, `qsid`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `1951369_sc_ibfk_1` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1951369_sc
-- ----------------------------

-- ----------------------------
-- Table structure for 1985678_qs
-- ----------------------------
DROP TABLE IF EXISTS `1985678_qs`;
CREATE TABLE `1985678_qs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `finished_time` datetime(0) NULL DEFAULT NULL,
  `ifTrue` bigint(0) NULL DEFAULT NULL,
  `whole_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `ts1_ibfk1985678` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1985678_qs
-- ----------------------------
INSERT INTO `1985678_qs` VALUES (1, 14, 'ijiji', '2021-12-12 09:38:42', '2021-12-12 09:38:44', NULL, 2);
INSERT INTO `1985678_qs` VALUES (2, 4, 'ijiji', '2021-12-12 09:38:52', '2021-12-12 09:38:54', NULL, 2);
INSERT INTO `1985678_qs` VALUES (3, 1, 'uiui', '2021-12-12 09:38:58', '2021-12-12 09:39:02', NULL, 4);
INSERT INTO `1985678_qs` VALUES (4, 1, 'uiuiui', '2021-12-12 09:39:04', '2021-12-12 09:39:06', NULL, 2);
INSERT INTO `1985678_qs` VALUES (5, 14, 'iii', '2021-12-12 09:39:12', '2021-12-12 09:39:14', NULL, 2);
INSERT INTO `1985678_qs` VALUES (6, 8, 'jihui', '2021-12-12 09:39:57', '2021-12-12 09:40:00', NULL, 3);
INSERT INTO `1985678_qs` VALUES (7, 8, '111', '2021-12-12 14:35:33', '2021-12-12 14:35:35', NULL, 2);
INSERT INTO `1985678_qs` VALUES (8, 9, 'i哦i哦i哦', '2021-12-12 14:35:41', '2021-12-12 14:35:44', NULL, 3);
INSERT INTO `1985678_qs` VALUES (9, 10, 'iiiii', '2021-12-12 14:35:48', '2021-12-12 14:35:51', NULL, 3);
INSERT INTO `1985678_qs` VALUES (10, 14, 'iiii', '2021-12-12 14:35:58', '2021-12-12 14:36:00', NULL, 2);
INSERT INTO `1985678_qs` VALUES (11, 6, '999', '2021-12-12 14:36:07', '2021-12-12 14:36:09', 0, 2);
INSERT INTO `1985678_qs` VALUES (12, 11, 'uuuuu', '2021-12-12 14:36:16', '2021-12-12 14:36:18', NULL, 2);

-- ----------------------------
-- Table structure for 1985678_sc
-- ----------------------------
DROP TABLE IF EXISTS `1985678_sc`;
CREATE TABLE `1985678_sc`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NOT NULL,
  PRIMARY KEY (`id`, `qsid`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `1985678_sc_ibfk_1` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1985678_sc
-- ----------------------------

-- ----------------------------
-- Table structure for 1989898_qs
-- ----------------------------
DROP TABLE IF EXISTS `1989898_qs`;
CREATE TABLE `1989898_qs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `finished_time` datetime(0) NULL DEFAULT NULL,
  `if_true` bigint(0) NULL DEFAULT NULL,
  `whole_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `ts1_ibfk` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1989898_qs
-- ----------------------------

-- ----------------------------
-- Table structure for 1989978_qs
-- ----------------------------
DROP TABLE IF EXISTS `1989978_qs`;
CREATE TABLE `1989978_qs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `finished_time` datetime(0) NULL DEFAULT NULL,
  `ifTrue` bigint(0) NULL DEFAULT NULL,
  `whole_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `ts1_ibfk1989978` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1989978_qs
-- ----------------------------
INSERT INTO `1989978_qs` VALUES (1, 1, '1222222', '2021-11-30 23:38:45', '2021-11-30 23:38:46', 1, 1);
INSERT INTO `1989978_qs` VALUES (2, 2, '222222222', '2021-11-30 23:38:49', '2021-11-30 23:38:50', 1, 1);
INSERT INTO `1989978_qs` VALUES (3, 2, '222222222222', '2021-11-30 23:38:52', '2021-11-30 23:38:53', NULL, 1);
INSERT INTO `1989978_qs` VALUES (4, 5, '33333333333', '2021-11-30 23:38:56', '2021-11-30 23:38:57', NULL, 1);
INSERT INTO `1989978_qs` VALUES (5, 13, '88888888888', '2021-11-30 23:39:03', '2021-11-30 23:39:04', NULL, 1);

-- ----------------------------
-- Table structure for 1989978_sc
-- ----------------------------
DROP TABLE IF EXISTS `1989978_sc`;
CREATE TABLE `1989978_sc`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NOT NULL,
  PRIMARY KEY (`id`, `qsid`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `1989978_sc_ibfk_1` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1989978_sc
-- ----------------------------

-- ----------------------------
-- Table structure for 1989999_qs
-- ----------------------------
DROP TABLE IF EXISTS `1989999_qs`;
CREATE TABLE `1989999_qs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `finished_time` datetime(0) NULL DEFAULT NULL,
  `ifTrue` bigint(0) NULL DEFAULT NULL,
  `whole_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `ts1_ibfk1989999` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1989999_qs
-- ----------------------------
INSERT INTO `1989999_qs` VALUES (1, 1, '1111111', '2021-11-30 23:17:28', '2021-11-30 23:17:30', NULL, 2);
INSERT INTO `1989999_qs` VALUES (2, 1, '33333', '2021-11-30 23:17:34', '2021-11-30 23:17:36', NULL, 2);
INSERT INTO `1989999_qs` VALUES (3, 3, '33232', '2021-11-30 23:17:39', '2021-11-30 23:17:40', NULL, 1);
INSERT INTO `1989999_qs` VALUES (4, 4, '00000000', '2021-11-30 23:17:43', '2021-11-30 23:17:45', 0, 2);
INSERT INTO `1989999_qs` VALUES (5, 2, '222222', '2021-11-30 23:18:06', '2021-11-30 23:18:08', 1, 2);
INSERT INTO `1989999_qs` VALUES (6, 2, '11111111111', '2021-11-30 23:18:11', '2021-11-30 23:18:12', NULL, 1);
INSERT INTO `1989999_qs` VALUES (7, 8, '000', '2021-12-01 09:07:09', '2021-12-01 09:07:12', NULL, 3);
INSERT INTO `1989999_qs` VALUES (8, 7, 'diiiiii', '2021-12-01 09:07:21', '2021-12-01 09:07:24', 1, 3);

-- ----------------------------
-- Table structure for 1989999_sc
-- ----------------------------
DROP TABLE IF EXISTS `1989999_sc`;
CREATE TABLE `1989999_sc`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qsid` int(0) NOT NULL,
  PRIMARY KEY (`id`, `qsid`) USING BTREE,
  INDEX `qsid`(`qsid`) USING BTREE,
  CONSTRAINT `1989999_sc_ibfk_1` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 1989999_sc
-- ----------------------------

-- ----------------------------
-- Table structure for m_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `m_knowledge`;
CREATE TABLE `m_knowledge`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of m_knowledge
-- ----------------------------
INSERT INTO `m_knowledge` VALUES (5, '48个关键字：abstract、assert、boolean、break、byte、case、catch、char、class、continue、default、do、double、else、enum、extends、final、finally、float、for、if、implements、import、int、interface、instanceof、long、native、new、package、private、protected、public、return、short、static、strictfp、super、switch、synchronized、this、throw、throws、transient、try、void、volatile、while。', '关键字', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (6, 'Java语言提供了八种基本类型。六种数字类型（四个整数型，两个浮点型），一种字符类型，还有一种布尔型。', '数据类型', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (7, '整型、实型（常量）、字符型数据可以混合运算。运算中，不同类型的数据先转化为同一类型，然后进行运算。', '数据类型', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (8, '类变量：独立于方法之外的变量，用 static 修饰。实例变量：独立于方法之外的变量，不过没有 static 修饰。局部变量：类的方法中的变量。', 'Java变量', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (9, '局部变量在方法、构造方法、或者语句块被执行的时候创建，当它们执行完成后，变量将会被销毁.', 'Java变量', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (10, '实例变量具有默认值。数值型变量的默认值是0，布尔型变量的默认值是false，引用类型变量的默认值是null。变量的值可以在声明时指定，也可以在构造方法中指定；', 'Java变量', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (11, '对于 while 语句而言，如果不满足条件，则不能进入循环。但有时候我们需要即使不满足条件，也至少执行一次。', 'Java循环', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (12, 'Java中有三种主要的循环结构：while,do while,for', 'Java循环', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (13, '数组变量的声明，和创建数组可以用一条语句完成，如下所示：\n```\ndataType[] arrayRefVar = new dataType[arraySize];\n\n```\n', 'Java数组', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (14, '多维数组可以看成是数组的数组，比如二维数组就是一个特殊的一维数组，其每一个元素都是一个一维数组', 'Java数组', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (15, 'java.util.Arrays 类能方便地操作数组，它提供的所有方法都是静态的。给数组赋值：通过 fill 方法。对数组排序：通过 sort 方法,按升序。', 'Java数组', 'Java语言语法基础');
INSERT INTO `m_knowledge` VALUES (16, '子类拥有父类非 private 的属性、方法。', '子类属性', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (17, '子类可以拥有自己的属性和方法，即子类可以对父类进行扩展。', '子类属性', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (18, '一个子类只能拥有一个父类，所以 extends 只能继承一个类。', '子类属性', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (19, 'super关键字来实现对父类成员的访问，用来引用当前对象的父类。this关键字指向自己的引用。', '关键字', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (20, 'final 关键字声明类可以把类定义为不能继承的，即最终类；或者用于修饰方法，该方法不能被子类重写：', '关键字', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (21, '多态体现为父类引用变量可以指向子类对象。', '多态', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (22, '多态性是面向对象编程的又一个重要特征，它是指在父类中定义的属性和方法被子类继承之后，可以具有不同的数据类型或表现出不同的行为，这使得同一个属性或方法在父类及其各个子类中具有不同的含义。', '多态', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (23, '接口中每一个方法也是隐式抽象的,接口中的方法会被隐式的指定为 public abstract（只能是 public abstract，其他修饰符都会报错）。', '接口', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (24, '一个类可以同时实现多个接口。', '接口', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (25, '在Java中，类的多继承是不合法，但接口允许多继承。', '接口', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (26, '一个接口可以有多个方法。', '接口', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (27, '接口中每一个方法也是隐式抽象的,接口中的方法会被隐式的指定为 public abstract（只能是 public abstract，其他修饰符都会报错）。', '接口', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (28, ' 抽象类中的方法可以有方法体，就是能实现方法的具体功能，但是接口中的方法不行。一个类只能继承一个抽象类，而一个类却可以实现多个接口。', '接口', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (29, '接口是隐式抽象的，当声明一个接口的时候，不必使用abstract关键字。', '接口', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (32, '类使用implements关键字实现接口。在类声明中，Implements关键字放在class声明后面。参照：...implements 接口名称[, 其他接口名称, 其他接口名称..., ...] ...', '接口', 'Java面向对象');
INSERT INTO `m_knowledge` VALUES (33, 'ava 中 Applet 类继承了 java.applet.Applet 类。Applet 被设计为嵌入在一个 HTML 页面。', 'Applet', 'JavaApplet编程');
INSERT INTO `m_knowledge` VALUES (34, 'Applet 类中的init: 该方法的目的是为你的 Applet 提供所需的任何初始化。在 Applet 标记内的 param 标签被处理后调用该方法。', NULL, 'JavaApplet编程');
INSERT INTO `m_knowledge` VALUES (35, 'Applet类中start: 浏览器调用 init 方法后，该方法被自动调用。每当用户从其他页面返回到包含 Applet 的页面时，则调用该方法。', NULL, 'JavaApplet编程');
INSERT INTO `m_knowledge` VALUES (36, 'Applet类中的stop: 当用户从包含 Applet 的页面移除的时候，该方法自动被调用。因此，可以在相同的 Applet 中反复调用该方法。', NULL, 'JavaApplet编程');
INSERT INTO `m_knowledge` VALUES (37, 'Applet类中的destroy: 此方法仅当浏览器正常关闭时调用。因为 Applet 只有在 HTML 网页上有效，所以你不应该在用户离开包含 Applet 的页面后遗漏任何资源。', NULL, 'JavaApplet编程');
INSERT INTO `m_knowledge` VALUES (38, 'Applet类中的paint: 该方法在 start() 方法之后立即被调用，或者在 Applet 需要重绘在浏览器的时候调用。paint() 方法实际上继承于 java.awt。', NULL, 'JavaApplet编程');
INSERT INTO `m_knowledge` VALUES (39, '<applet> 标签的属性指定了要运行的 Applet 类。width 和 height 用来指定 Applet 运行面板的初始大小。Applet 必须使用 </applet> 标签来关闭。', NULL, 'JavaApplet编程');
INSERT INTO `m_knowledge` VALUES (40, 'CheckerApplet 在 init() 方法里得到它的参数。也可以在 paint() 方法里得到它的参数。然而，在 Applet 开始得到值并保存了设置，而不是每一次刷新的时候都得到值，这样是很方便，并且高效的。', NULL, 'JavaApplet编程');
INSERT INTO `m_knowledge` VALUES (41, 'Applet 类从 Container 类继承了许多事件处理方法。Container 类定义了几个方法，例如：processKeyEvent() 和processMouseEvent()，用来处理特别类型的事件，还有一个捕获所有事件的方法叫做 processEvent。', NULL, 'JavaApplet编程');
INSERT INTO `m_knowledge` VALUES (42, 'Applet 能显示 GIF,JPEG,BMP 等其他格式的图片。为了在 Applet 中显示图片，你需要使用 java.awt.Graphics 类的drawImage()方法。', NULL, 'JavaApplet编程');
INSERT INTO `m_knowledge` VALUES (43, 'AWT(Abstract Window Toolkit)：抽象窗口工具包，早期编写图形界面应用程序的包。', NULL, 'Java图形界面编程');
INSERT INTO `m_knowledge` VALUES (44, 'Swing，不仅提供了AWT 的所有功能，还用纯粹的Java代码对AWT的功能进行了大幅度的扩充。例如：并不是所有的操作系统都提供了对树形控件的支持，Swing则利用了AWT中所提供的基本作图方法模拟了一个树形控件。', NULL, 'Java图形界面编程');
INSERT INTO `m_knowledge` VALUES (45, '事件源是一个产生(或触发)事件的对象，如文本框、按钮等。当这个事件源对象的某些状态以某种方式发生变化时，就会产生某种类型的事件(一个事件源可能会生成多个不同类型的事件)。', NULL, 'Java图形界面编程');
INSERT INTO `m_knowledge` VALUES (46, '事件就是承载事件源状态改变时的信息对象。或者说，事件是事件源事件监听器传输事件源状态信息的载体。', NULL, 'Java图形界面编程');
INSERT INTO `m_knowledge` VALUES (47, ' 事件监听者实际上就是一个类，该类实现了某个事件监听器接口，它就可以作为一个事件监听者，对接受到的事件进行处理。', NULL, 'Java图形界面编程');
INSERT INTO `m_knowledge` VALUES (48, '容器可容纳组件和容器，同一个容器中的组件可被同时显示或同时隐藏。', '图形界面', '图形界面编程');

-- ----------------------------
-- Table structure for m_qsnum
-- ----------------------------
DROP TABLE IF EXISTS `m_qsnum`;
CREATE TABLE `m_qsnum`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qsid` int(0) NULL DEFAULT NULL,
  `num` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `us1`(`userid`) USING BTREE,
  INDEX `kn1`(`qsid`) USING BTREE,
  CONSTRAINT `kn1` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `us1` FOREIGN KEY (`userid`) REFERENCES `m_student` (`studentid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of m_qsnum
-- ----------------------------
INSERT INTO `m_qsnum` VALUES (1, '1951234', 7, 1);
INSERT INTO `m_qsnum` VALUES (2, '1951234', 8, 3);
INSERT INTO `m_qsnum` VALUES (7, '1951234', 2, 1);
INSERT INTO `m_qsnum` VALUES (8, '1989999', 1, 2);
INSERT INTO `m_qsnum` VALUES (9, '1989999', 3, 1);
INSERT INTO `m_qsnum` VALUES (10, '1989999', 4, 1);
INSERT INTO `m_qsnum` VALUES (11, '1989999', 2, 2);
INSERT INTO `m_qsnum` VALUES (12, '1989978', 1, 1);
INSERT INTO `m_qsnum` VALUES (13, '1989978', 2, 2);
INSERT INTO `m_qsnum` VALUES (14, '1989978', 5, 1);
INSERT INTO `m_qsnum` VALUES (15, '1989978', 13, 1);
INSERT INTO `m_qsnum` VALUES (16, '1989999', 8, 1);
INSERT INTO `m_qsnum` VALUES (17, '1989999', 7, 1);
INSERT INTO `m_qsnum` VALUES (18, '1951234', 9, 1);
INSERT INTO `m_qsnum` VALUES (19, '1951234', 4, 1);
INSERT INTO `m_qsnum` VALUES (20, '1951234', 5, 1);
INSERT INTO `m_qsnum` VALUES (21, '1951234', 14, 2);
INSERT INTO `m_qsnum` VALUES (22, '1985678', 14, 3);
INSERT INTO `m_qsnum` VALUES (23, '1985678', 4, 1);
INSERT INTO `m_qsnum` VALUES (24, '1985678', 1, 2);
INSERT INTO `m_qsnum` VALUES (25, '1985678', 8, 2);
INSERT INTO `m_qsnum` VALUES (26, '1111111', 3, 1);
INSERT INTO `m_qsnum` VALUES (27, '1111111', 1, 2);
INSERT INTO `m_qsnum` VALUES (28, '1111111', 8, 1);
INSERT INTO `m_qsnum` VALUES (29, '1951234', 15, 2);
INSERT INTO `m_qsnum` VALUES (30, '1951234', 16, 1);
INSERT INTO `m_qsnum` VALUES (31, '1951234', 1, 1);
INSERT INTO `m_qsnum` VALUES (32, '1985678', 9, 1);
INSERT INTO `m_qsnum` VALUES (33, '1985678', 10, 1);
INSERT INTO `m_qsnum` VALUES (34, '1985678', 6, 1);
INSERT INTO `m_qsnum` VALUES (35, '1985678', 11, 1);
INSERT INTO `m_qsnum` VALUES (36, '1951234', 19, 1);
INSERT INTO `m_qsnum` VALUES (37, '1951234', 17, 1);
INSERT INTO `m_qsnum` VALUES (38, '1951234', 13, 2);

-- ----------------------------
-- Table structure for m_qsrecord
-- ----------------------------
DROP TABLE IF EXISTS `m_qsrecord`;
CREATE TABLE `m_qsrecord`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NULL DEFAULT NULL,
  `qsid` int(0) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finished_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ifTrue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `review` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kn2`(`qsid`) USING BTREE,
  CONSTRAINT `kn2` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of m_qsrecord
-- ----------------------------
INSERT INTO `m_qsrecord` VALUES (1, 1951234, 1, '哈哈哈', '2021-11-19 08:21:49', '1', '正确');
INSERT INTO `m_qsrecord` VALUES (2, 1951234, 3, '不敏感', '2021-11-19 08:23:57', '0', NULL);
INSERT INTO `m_qsrecord` VALUES (3, 1951234, 5, 'where', '2021-11-19 08:24:05', '1', '');
INSERT INTO `m_qsrecord` VALUES (4, 1951234, 12, '数组赋值', '2021-11-19 08:24:14', '1', NULL);
INSERT INTO `m_qsrecord` VALUES (5, 1951234, 4, '不会做', '2021-11-19 08:24:23', '1', '');
INSERT INTO `m_qsrecord` VALUES (6, 1951234, 18, '可以', '2021-11-19 08:24:29', '1', '');
INSERT INTO `m_qsrecord` VALUES (7, 1951234, 5, '88888', '2021-11-19 09:26:15', '1', '');
INSERT INTO `m_qsrecord` VALUES (8, 1951234, 5, '9999', '2021-11-19 09:26:20', '0', '888888');
INSERT INTO `m_qsrecord` VALUES (9, 1951234, 2, 'nnnnnnnnnnn', '2021-11-30 23:02:12', '0', '');
INSERT INTO `m_qsrecord` VALUES (10, 1989999, 1, '1111111', '2021-11-30 23:17:30', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (11, 1989999, 1, '33333', '2021-11-30 23:17:36', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (12, 1989999, 3, '33232', '2021-11-30 23:17:40', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (13, 1989999, 4, '00000000', '2021-11-30 23:17:45', '0', '错误');
INSERT INTO `m_qsrecord` VALUES (14, 1989999, 2, '222222', '2021-11-30 23:18:08', '1', '好好好');
INSERT INTO `m_qsrecord` VALUES (15, 1989999, 2, '11111111111', '2021-11-30 23:18:12', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (16, 1989978, 1, '1222222', '2021-11-30 23:38:46', '1', '');
INSERT INTO `m_qsrecord` VALUES (17, 1989978, 2, '222222222', '2021-11-30 23:38:50', '1', '');
INSERT INTO `m_qsrecord` VALUES (18, 1989978, 2, '222222222222', '2021-11-30 23:38:53', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (19, 1989978, 5, '33333333333', '2021-11-30 23:38:57', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (20, 1989978, 13, '88888888888', '2021-11-30 23:39:04', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (21, 1989999, 8, '000', '2021-12-1 09:07:12', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (22, 1989999, 7, 'diiiiii', '2021-12-1 09:07:24', '1', '');
INSERT INTO `m_qsrecord` VALUES (23, 1951234, 9, '111', '2021-12-11 23:03:45', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (24, 1951234, 4, '321123', '2021-12-11 23:03:49', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (25, 1951234, 5, '3333333', '2021-12-11 23:03:53', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (26, 1951234, 14, '99999', '2021-12-11 23:04:00', '1', '');
INSERT INTO `m_qsrecord` VALUES (27, 1985678, 14, 'ijiji', '2021-12-12 09:38:44', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (28, 1985678, 4, 'ijiji', '2021-12-12 09:38:54', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (29, 1985678, 1, 'uiui', '2021-12-12 09:39:02', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (30, 1985678, 1, 'uiuiui', '2021-12-12 09:39:06', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (31, 1985678, 14, 'iii', '2021-12-12 09:39:14', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (32, 1985678, 8, 'jihui', '2021-12-12 09:40:00', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (33, 1111111, 3, '111', '2021-12-12 10:04:03', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (34, 1111111, 1, 'mkied', '2021-12-12 10:04:09', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (35, 1111111, 1, '123321', '2021-12-12 10:04:13', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (36, 1111111, 8, '321123', '2021-12-12 10:04:20', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (37, 1951234, 15, '99999', '2021-12-12 10:10:04', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (38, 1951234, 15, '898989', '2021-12-12 10:10:11', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (39, 1951234, 16, '00000', '2021-12-12 10:10:19', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (40, 1951234, 1, '得得得', '2021-12-12 14:18:52', '1', '非常对');
INSERT INTO `m_qsrecord` VALUES (41, 1951234, 14, 'ui', '2021-12-12 14:19:03', '1', '答得不错理解到位');
INSERT INTO `m_qsrecord` VALUES (42, 1985678, 8, '111', '2021-12-12 14:35:35', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (43, 1985678, 9, 'i哦i哦i哦', '2021-12-12 14:35:44', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (44, 1985678, 10, 'iiiii', '2021-12-12 14:35:51', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (45, 1985678, 14, 'iiii', '2021-12-12 14:36:00', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (46, 1985678, 6, '999', '2021-12-12 14:36:09', '0', '错误');
INSERT INTO `m_qsrecord` VALUES (47, 1985678, 11, 'uuuuu', '2021-12-12 14:36:18', NULL, NULL);
INSERT INTO `m_qsrecord` VALUES (52, 1951234, 13, '```\nfor i in range(10):\n	a.append(i)\n\n```\n', '2021-12-18 08:28:45', '0', 'python学的还不错，但是你java不太行');
INSERT INTO `m_qsrecord` VALUES (53, 1951234, 13, '给数组赋值：通过 sort方法。\n```\ndataType[] arrayRefVar = new dataType[arraySize]; \nArrarys.sort(arrayRefVar);\n\n```\n\n', '2021-12-18 08:34:15', '1', '好的');

-- ----------------------------
-- Table structure for m_question
-- ----------------------------
DROP TABLE IF EXISTS `m_question`;
CREATE TABLE `m_question`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trueanswer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qslevel` int(0) NULL DEFAULT NULL,
  `point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of m_question
-- ----------------------------
INSERT INTO `m_question` VALUES (1, '标识符的开始标志？', '所有的标识符都应该以字母（A-Z 或者 a-z）,美元符（$）、或者下划线（_）开始', 'Java语言语法基础', 0, '标识符');
INSERT INTO `m_question` VALUES (2, '关键字是否可以作为标识符，可以或不可以？', '不可以', 'Java语言语法基础', 0, '标识符');
INSERT INTO `m_question` VALUES (3, '标识符是否大小写敏感', '标识符是大小写敏感的', 'Java语言语法基础', 0, '标识符');
INSERT INTO `m_question` VALUES (4, '在 JAVA中如何跳出当前的多重嵌套循环？ \r\nJava类名和接口名的编写规范', '每个单词的首字母大写，其余小写', 'Java语言语法基础', 0, '标识符');
INSERT INTO `m_question` VALUES (5, '以下五个哪个不是java的关键字:this、throw、throws、transient、where', 'where', 'Java语言语法基础', 0, '关键字');
INSERT INTO `m_question` VALUES (6, 'Java一共有几种基本类型', 'Java语言提供了八种基本类型。六种数字类型（四个整数型，两个浮点型），一种字符类型，还有一种布尔型。', 'Java语言语法基础', 0, '数据类型');
INSERT INTO `m_question` VALUES (7, 'Java整型可以与哪些类型进行运算？', '实型（常量）、字符型数据可以与整型混合运算', 'Java语言语法基础', 0, '数据类型');
INSERT INTO `m_question` VALUES (8, '请写出java的三种循环方式', 'do while,for,while的三种方式', 'Java语言语法基础', 0, 'Java循环');
INSERT INTO `m_question` VALUES (9, 'Java循环语句中break关键字的作用？', 'break 主要用在循环语句或者 switch 语句中，用来跳出整个语句块。', 'Java语言语法基础', 0, 'Java循环');
INSERT INTO `m_question` VALUES (10, 'continue 适用于任何循环控制结构中。作用是让程序立刻跳转到下一次循环的迭代。正确或错误？', '正确', 'Java语言语法基础', 0, 'Java循环');
INSERT INTO `m_question` VALUES (11, '请写出java数组的索引范围', '数组索引从 0 开始，所以索引值从 0 到 length-1。', 'Java语言语法基础', 0, 'Java数组');
INSERT INTO `m_question` VALUES (12, '写出Arrarys类对数组进行赋值的方法', '给数组赋值：通过 fill 方法。', 'Java语言语法基础', 0, 'Java数组');
INSERT INTO `m_question` VALUES (13, '写出Arrarys类对数组进行排序的方法', '给数组赋值：通过 sort方法。', 'Java语言语法基础', 0, 'Java数组');
INSERT INTO `m_question` VALUES (14, 'Java语言标识符中可以使用美元符。\r\n', '正确', 'Java语言语法基础', 0, 'Java数组');
INSERT INTO `m_question` VALUES (15, 'Java语言是一种强类型语言，数据类型转换有两种：隐含转换和强制转换', '正确', 'Java语言语法基础', 0, NULL);
INSERT INTO `m_question` VALUES (16, '数据由高类型转换到低类型时，采用强制转换，数据精度要受到损失。', '正确', 'Java语言语法基础', 0, NULL);
INSERT INTO `m_question` VALUES (17, 'Java语言中只有无符号的字符型', '正确', 'Java语言语法基础', 0, NULL);
INSERT INTO `m_question` VALUES (18, 'Java语言中，变量出现的位置只有一种，即为类体内定义的成员变量。', '错误', 'Java语言语法基础', 0, NULL);
INSERT INTO `m_question` VALUES (19, 'Java语言规定在的程序块中不允许定义同名变量。', '正确', 'Java语言语法基础', 0, NULL);
INSERT INTO `m_question` VALUES (20, '静态变量的引用只能使用对象。', '错误', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (21, '静态方法只能处理静态变量。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (22, '抽象方法是一种只有说明而无具体实现的方法。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (23, '最终方法是不能被当前子类重新定义的方法。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (24, 'Java语言中，方法调用一律都是传址的引用调用。', '错误', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (25, '非静态方法中不能引用静态变量。', '错误', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (26, '静态初始化器是在构造方法被自动调用之前运行的。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (27, '抽象方法仅有方法头，而无方法体。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (28, '抽象方法一定出现在抽象类中。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (29, '最终类，最终方法和最终变量的修饰符都用final 。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (30, '创建对象时系统将调用适当的构造方法给对象初始化。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (31, '使用运算符new 创建对象时，赋给对象的值实际上是一个地址值。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (32, '使用构造方法只能给非静态成员变量赋初值。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (33, 'Java 语言中，对象成员的表示只使用运算符 “.”。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (34, '对象可作方法参数，对象数组不能作方法参数。', '错误', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (35, 'Java语言中，所创建的子类都应有一个父类。', '正确', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (36, '在类的修饰符中，规定只能被同一包类所使用的修饰符是', '默认     ', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (37, '在成员变量的修饰符中，规定只允许该类自身访问的修饰符是', 'private      ', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (38, '循环语句中，循环体被执行的次数为', '无限 ', 'Java语言面向对象的特征\r\n', 1, NULL);
INSERT INTO `m_question` VALUES (44, 'Applet程序是以.Java为扩展名的Java语言源程序，该程序经过编译器后便可成为可执行文件。', '错误', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (45, '嵌入到HTML文件中的是Applet的源程序。', '错误', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (46, '运行Applet程序是使用AppletViewer命令运行嵌入了字节码文件的HTML文件，从而获得运行结果。', '正确', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (47, 'Applet程序中的主类必须是Applet类的子类。', '正确', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (48, 'Applet类是Java语言类库中的一个重要的系统类，它被存放在java.awt包中。', '错误', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (49, 'init()方法是用来完成初始化操作的，在Applet程序运行期间只执行一次。', '正确', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (50, 'start()方法被系统自动调用来启动主线程运行。通常在Applet程序被重启动时，该方法被系统自动调用。', '正确', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (51, 'paint()方法是在需要重画图形界面时被系统自动调用来显示输出结果的。', '正确', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (52, 'stop()方法是用来暂停执行操作的，它与start()方法不同，只被调用一次。', '错误', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (53, 'init()，start()，stop()和destroy()4个方法构成Applet程序的生命周期。', '正确', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (54, 'HTML语言中<HEAD>和</HEAD>是用来表示HTML文件开始和结束的标记。', '错误', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (55, 'HTML中多数标记是成对出现的，也有不成对出现的标记。', '正确', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (56, 'HTML中是区分大小写字母的。', '错误', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (57, '通过HTML文件中使用的PARAM标记可以向Applet程序传递参数的。', '正确', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (58, 'parseInt()方法的功能是将int型数据转换成String型数据的。', '错误', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (59, 'AWT提供了许多标准的GUI组件和布局管理等类。', '正确', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (60, 'Java语言采用了16位颜色标准，Java的调色板保证128色。', '错误', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (61, 'Graphics类提供了3种绘制文本的方法，其方法名都是drawString()。', '正确', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (63, '所有事件类的父类是\r\n', 'AwtEvent  \r\n', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (64, '所有GUI标准组件类的父类是 \r\n', 'Component  \r\n', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (65, '在下列各种容器中，最简单的无边框的又不能移动和缩放的只能包含在另一种容器中的容器是 \r\n', 'Panel \r\n', 'Java Applet及其应用\r\n', 2, NULL);
INSERT INTO `m_question` VALUES (66, '事件组件都应注册一个事件监听者。', '正确', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (67, '事件监听者除了得知事件的发生外，还应调用相应方法处理事件。', '正确', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (68, '所有事件的父类是EventObject类。', '正确', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (69, '图形用户界面是由用户自定义成分、控制组件和容器组成的。', '正确', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (70, '所有GUI标准组件类的父类是Component类。', '正确', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (71, '所有容器类的父类是Frame类。', '错误', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (72, '标准和按钮都是事件源。', '正确', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (73, '文本去和文本框都可以引发两种事件：文本改变事件和动作事件。', '错误', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (74, '每个复选框有两种状态：“打开”和“关闭”状态。', '正确', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (75, ' 单选按钮组(CheckboxGroup)是由若干个按钮组成的。在一组按钮中可选 多个。', '错误', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (76, '列表(List)是由多个选项组成的，只可在列表框的若干个选项选取一个。', '错误', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (77, '下拉列表(Choice)是一种“多选多”的输入界面。', '错误', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (78, '滚动条有两类：水平滚动条和垂直滚动条。', '正确', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (79, '画布(Canvas)是一种可容纳多个组件的容器。', '错误', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (80, '所有容器都采用顺序布局(FlowLayout)作为默认布局管理器。', '错误', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (81, '边界布局(BorderLayout)将容器分为东、西、南、北共4个区域。', '错误', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (82, '卡片布局(CardLayout)可使容器容纳多个组件，在同一时刻只显示若干个组件中的一个。', '正确', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (83, '容器可容纳组件和容器，同一个容器中的组件可被同时显示或同时隐藏。', '正确', '图形用户界面设计\r\n', 3, NULL);
INSERT INTO `m_question` VALUES (85, '简述图形用户界面设计', '容器可容纳组件和容器，同一个容器中的组件可被同时显示或同时隐藏。', '图形用户界面设计', 3, NULL);

-- ----------------------------
-- Table structure for m_student
-- ----------------------------
DROP TABLE IF EXISTS `m_student`;
CREATE TABLE `m_student`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `studentid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `specialty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userlevel` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`, `studentid`) USING BTREE,
  INDEX `studentid`(`studentid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of m_student
-- ----------------------------
INSERT INTO `m_student` VALUES (17, 'mz1', '1951234', 'male', 'MIS', '123321', 0);
INSERT INTO `m_student` VALUES (18, 'mz123', '1989999', '男', 'MIS', '123456', 0);
INSERT INTO `m_student` VALUES (19, 'zmzm', '1989978', 'male', 'MIS', '123321', 0);
INSERT INTO `m_student` VALUES (20, 'mz1', '1951369', 'male', 'MIS', '123321', 0);
INSERT INTO `m_student` VALUES (21, 'mz1', '1951360', 'mzle', '12', '123321', 0);
INSERT INTO `m_student` VALUES (22, '123321', '1985678', '12', 'MIS', '123321', 0);
INSERT INTO `m_student` VALUES (23, '122', '1111111', 'male', 'MIS', '123321', 0);

-- ----------------------------
-- Table structure for m_teacher
-- ----------------------------
DROP TABLE IF EXISTS `m_teacher`;
CREATE TABLE `m_teacher`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacherid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of m_teacher
-- ----------------------------
INSERT INTO `m_teacher` VALUES (1, 'teacher1', '123321', 111);

-- ----------------------------
-- Table structure for mapping
-- ----------------------------
DROP TABLE IF EXISTS `mapping`;
CREATE TABLE `mapping`  (
  `qsid` int(0) NOT NULL,
  `knid` int(0) NULL DEFAULT NULL,
  INDEX `qs`(`qsid`) USING BTREE,
  INDEX `kn`(`knid`) USING BTREE,
  CONSTRAINT `kn` FOREIGN KEY (`knid`) REFERENCES `m_knowledge` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qs` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mapping
-- ----------------------------
INSERT INTO `mapping` VALUES (3, 5);
INSERT INTO `mapping` VALUES (4, 5);
INSERT INTO `mapping` VALUES (5, 6);
INSERT INTO `mapping` VALUES (6, 6);
INSERT INTO `mapping` VALUES (7, 7);
INSERT INTO `mapping` VALUES (8, 8);
INSERT INTO `mapping` VALUES (8, 9);
INSERT INTO `mapping` VALUES (9, 8);
INSERT INTO `mapping` VALUES (9, 9);
INSERT INTO `mapping` VALUES (10, 11);
INSERT INTO `mapping` VALUES (11, 12);
INSERT INTO `mapping` VALUES (11, 11);
INSERT INTO `mapping` VALUES (12, 13);
INSERT INTO `mapping` VALUES (12, 14);
INSERT INTO `mapping` VALUES (13, 13);
INSERT INTO `mapping` VALUES (13, 15);
INSERT INTO `mapping` VALUES (14, 14);
INSERT INTO `mapping` VALUES (14, 13);
INSERT INTO `mapping` VALUES (14, 15);
INSERT INTO `mapping` VALUES (15, 5);
INSERT INTO `mapping` VALUES (15, 5);
INSERT INTO `mapping` VALUES (16, 5);
INSERT INTO `mapping` VALUES (17, 5);
INSERT INTO `mapping` VALUES (18, 5);
INSERT INTO `mapping` VALUES (19, 11);
INSERT INTO `mapping` VALUES (19, 12);
INSERT INTO `mapping` VALUES (19, 13);
INSERT INTO `mapping` VALUES (20, 16);
INSERT INTO `mapping` VALUES (21, 17);
INSERT INTO `mapping` VALUES (22, 18);
INSERT INTO `mapping` VALUES (22, 19);
INSERT INTO `mapping` VALUES (22, 20);
INSERT INTO `mapping` VALUES (23, 21);
INSERT INTO `mapping` VALUES (24, 21);
INSERT INTO `mapping` VALUES (25, 22);
INSERT INTO `mapping` VALUES (26, 22);
INSERT INTO `mapping` VALUES (27, 22);
INSERT INTO `mapping` VALUES (28, 22);
INSERT INTO `mapping` VALUES (29, 23);
INSERT INTO `mapping` VALUES (30, 24);
INSERT INTO `mapping` VALUES (31, 26);
INSERT INTO `mapping` VALUES (32, 27);
INSERT INTO `mapping` VALUES (33, 28);
INSERT INTO `mapping` VALUES (34, 29);
INSERT INTO `mapping` VALUES (35, 32);
INSERT INTO `mapping` VALUES (36, 32);
INSERT INTO `mapping` VALUES (37, 32);
INSERT INTO `mapping` VALUES (38, 32);
INSERT INTO `mapping` VALUES (44, 33);
INSERT INTO `mapping` VALUES (45, 33);
INSERT INTO `mapping` VALUES (46, 33);
INSERT INTO `mapping` VALUES (47, 33);
INSERT INTO `mapping` VALUES (48, 34);
INSERT INTO `mapping` VALUES (49, 34);
INSERT INTO `mapping` VALUES (50, 34);
INSERT INTO `mapping` VALUES (51, 34);
INSERT INTO `mapping` VALUES (52, 35);
INSERT INTO `mapping` VALUES (53, 35);
INSERT INTO `mapping` VALUES (54, 36);
INSERT INTO `mapping` VALUES (55, 36);
INSERT INTO `mapping` VALUES (56, 36);
INSERT INTO `mapping` VALUES (57, 37);
INSERT INTO `mapping` VALUES (58, 38);
INSERT INTO `mapping` VALUES (59, 39);
INSERT INTO `mapping` VALUES (60, 40);
INSERT INTO `mapping` VALUES (61, 41);
INSERT INTO `mapping` VALUES (63, 42);
INSERT INTO `mapping` VALUES (64, 42);
INSERT INTO `mapping` VALUES (65, 42);
INSERT INTO `mapping` VALUES (66, 43);
INSERT INTO `mapping` VALUES (67, 43);
INSERT INTO `mapping` VALUES (69, 43);
INSERT INTO `mapping` VALUES (70, 43);
INSERT INTO `mapping` VALUES (71, 44);
INSERT INTO `mapping` VALUES (72, 44);
INSERT INTO `mapping` VALUES (73, 44);
INSERT INTO `mapping` VALUES (74, 44);
INSERT INTO `mapping` VALUES (75, 44);
INSERT INTO `mapping` VALUES (76, 45);
INSERT INTO `mapping` VALUES (77, 45);
INSERT INTO `mapping` VALUES (78, 45);
INSERT INTO `mapping` VALUES (79, 45);
INSERT INTO `mapping` VALUES (80, 46);
INSERT INTO `mapping` VALUES (81, 47);
INSERT INTO `mapping` VALUES (82, 47);
INSERT INTO `mapping` VALUES (83, 47);

SET FOREIGN_KEY_CHECKS = 1;
