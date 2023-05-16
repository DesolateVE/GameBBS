/*
Navicat MySQL Data Transfer

Source Server         : VE
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : db_bbs

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2018-11-20 03:31:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_boards`
-- ----------------------------
DROP TABLE IF EXISTS `tb_boards`;
CREATE TABLE `tb_boards` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '版主信息带入的是uid，名称显示通过id映射',
  `boardname` varchar(255) DEFAULT NULL,
  `boardintroduction` varchar(255) DEFAULT NULL,
  `boardclassfication` int(11) DEFAULT NULL COMMENT '0=MMORPG,1=MOBA,2=RTS,3=ACT,4=GALGAME',
  `boardimage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tb_boards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_boards
-- ----------------------------
INSERT INTO `tb_boards` VALUES ('1', '3', '彩虹六号', 'fgh', '1', 'u20.jpg');
INSERT INTO `tb_boards` VALUES ('2', '2', 'hhh', 'jlkj', '2', 'u21.jpg');

-- ----------------------------
-- Table structure for `tb_floors`
-- ----------------------------
DROP TABLE IF EXISTS `tb_floors`;
CREATE TABLE `tb_floors` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `floornum` int(11) NOT NULL,
  `floortime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `floorcontent` varchar(255) NOT NULL,
  PRIMARY KEY (`fid`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `tb_floors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tb_floors_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `tb_posts` (`pid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_floors
-- ----------------------------
INSERT INTO `tb_floors` VALUES ('1', '2', '3', '1', '2018-06-14 16:18:11', 'BUG');
INSERT INTO `tb_floors` VALUES ('2', '2', '4', '1', '2018-06-15 16:39:03', '我就来看看');
INSERT INTO `tb_floors` VALUES ('3', '3', '4', '2', '2018-06-15 16:39:22', '巧了，我也是');
INSERT INTO `tb_floors` VALUES ('4', '4', '4', '3', '2018-06-15 16:39:37', '此贴必火');
INSERT INTO `tb_floors` VALUES ('5', '10', '4', '4', '2018-06-15 16:39:40', '前排卖个手机');
INSERT INTO `tb_floors` VALUES ('6', '11', '4', '5', '2018-06-15 16:39:42', '前面卖手机的小心点');
INSERT INTO `tb_floors` VALUES ('7', '12', '3', '2', '2018-06-21 02:08:33', '??');
INSERT INTO `tb_floors` VALUES ('8', '12', '3', '2', '2018-06-21 02:10:10', '??');
INSERT INTO `tb_floors` VALUES ('9', '12', '3', '3', '2018-06-21 02:11:55', '????');
INSERT INTO `tb_floors` VALUES ('10', '12', '3', '4', '2018-06-21 02:12:39', '再来');
INSERT INTO `tb_floors` VALUES ('11', '3', '2', '1', '2018-06-21 15:11:52', '啊实打实');
INSERT INTO `tb_floors` VALUES ('12', '12', '8', '1', '2018-06-21 15:23:29', 'sddqwed');

-- ----------------------------
-- Table structure for `tb_posts`
-- ----------------------------
DROP TABLE IF EXISTS `tb_posts`;
CREATE TABLE `tb_posts` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  `posttitle` varchar(255) NOT NULL,
  `posttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `postheat` int(11) NOT NULL DEFAULT '0' COMMENT '帖子热度由回复数量反映，简而言之就是发帖层数',
  `posttype` int(11) NOT NULL COMMENT '0=公告，1=杂谈，2=开黑，3=原创，4=活动',
  PRIMARY KEY (`pid`),
  KEY `tb_posts_ibfk_1` (`user_id`),
  KEY `board_id` (`board_id`),
  CONSTRAINT `tb_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tb_posts_ibfk_2` FOREIGN KEY (`board_id`) REFERENCES `tb_boards` (`bid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_posts
-- ----------------------------
INSERT INTO `tb_posts` VALUES ('1', '3', '1', '测试一下', '2018-06-13 23:37:22', '0', '0');
INSERT INTO `tb_posts` VALUES ('2', '4', '2', '啦啦啦', '2018-06-13 23:39:56', '0', '0');
INSERT INTO `tb_posts` VALUES ('3', '4', '1', '嘿嘿嘿', '2018-06-13 23:40:23', '0', '0');
INSERT INTO `tb_posts` VALUES ('4', '10', '1', '重大会议', '2018-06-15 16:38:31', '0', '0');
INSERT INTO `tb_posts` VALUES ('5', '12', '1', '测试一下咯', '2018-06-21 00:30:53', '0', '2');
INSERT INTO `tb_posts` VALUES ('6', '13', '1', '测试一下咯', '2018-06-21 00:31:29', '0', '2');
INSERT INTO `tb_posts` VALUES ('7', '12', '1', '测试一下咯', '2018-06-21 00:40:01', '0', '2');
INSERT INTO `tb_posts` VALUES ('8', '12', '1', 'asdasd', '2018-06-21 15:23:29', '0', '2');

-- ----------------------------
-- Table structure for `tb_refloors`
-- ----------------------------
DROP TABLE IF EXISTS `tb_refloors`;
CREATE TABLE `tb_refloors` (
  `refid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `reuser_id` int(11) DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  `refloorcontent` varchar(255) DEFAULT NULL,
  `refloortime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `messagestate` int(11) NOT NULL DEFAULT '0' COMMENT '0=未读,1=已读',
  PRIMARY KEY (`refid`),
  KEY `user_id` (`user_id`),
  KEY `reuser_id` (`reuser_id`),
  KEY `floor_id` (`floor_id`),
  CONSTRAINT `tb_refloors_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tb_refloors_ibfk_3` FOREIGN KEY (`reuser_id`) REFERENCES `tb_users` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tb_refloors_ibfk_4` FOREIGN KEY (`floor_id`) REFERENCES `tb_floors` (`fid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_refloors
-- ----------------------------
INSERT INTO `tb_refloors` VALUES ('1', '3', '10', '1', '我呸', '2018-06-14 18:53:55', '0');
INSERT INTO `tb_refloors` VALUES ('2', '4', '3', '1', '打死你', '2018-06-14 18:54:08', '0');
INSERT INTO `tb_refloors` VALUES ('5', '12', '10', '6', '要小心了', '2018-06-16 16:03:55', '0');
INSERT INTO `tb_refloors` VALUES ('7', '12', '2', '1', '234234', '2018-06-16 17:57:08', '0');
INSERT INTO `tb_refloors` VALUES ('8', '12', '2', '2', '123', '2018-06-16 18:06:00', '0');
INSERT INTO `tb_refloors` VALUES ('9', '12', '11', '6', 'ä½ å°?å¿?è¢«æ??æ??', '2018-06-16 18:07:19', '0');
INSERT INTO `tb_refloors` VALUES ('10', '12', '10', '5', '??????', '2018-06-16 18:12:03', '0');
INSERT INTO `tb_refloors` VALUES ('11', '12', '2', '1', '??', '2018-06-16 18:22:18', '0');
INSERT INTO `tb_refloors` VALUES ('12', '12', '12', '10', '没问题', '2018-06-21 02:13:00', '0');
INSERT INTO `tb_refloors` VALUES ('13', '12', '12', '9', '这个呢', '2018-06-21 02:13:14', '0');

-- ----------------------------
-- Table structure for `tb_users`
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `sex` int(11) unsigned DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `power` int(11) unsigned DEFAULT '2',
  `password` varchar(255) NOT NULL,
  `registertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `underwrite` varchar(255) DEFAULT NULL,
  `birthdate` varchar(11) DEFAULT NULL,
  `experience` int(11) NOT NULL DEFAULT '0',
  `headphoto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('2', '王尼玛', null, '', '2', '123', '2018-06-12 10:34:47', null, null, '15', '01.jpg');
INSERT INTO `tb_users` VALUES ('3', '马云', null, '', '1', '123', '2018-06-12 14:10:49', null, null, '0', '02.jpg');
INSERT INTO `tb_users` VALUES ('4', '马化腾', null, '', '2', '123', '2018-06-12 16:26:21', null, null, '0', '03.gif');
INSERT INTO `tb_users` VALUES ('10', '雷军', null, '', '0', '123', '2018-06-12 09:26:41', null, null, '0', '04.jpg');
INSERT INTO `tb_users` VALUES ('11', '特朗普', null, '', '2', '123', '2018-06-14 01:16:11', null, null, '0', '05.jpg');
INSERT INTO `tb_users` VALUES ('12', '普京', null, '', '2', '123', '2018-06-16 15:50:05', null, null, '0', '06.jpg');
INSERT INTO `tb_users` VALUES ('13', '548kljlkj', null, '', '2', '54984jhh', '2018-06-20 20:48:14', null, null, '0', null);
INSERT INTO `tb_users` VALUES ('14', 'bbs', null, '', '2', 'asdasd', '2018-06-21 00:17:55', null, null, '0', null);
INSERT INTO `tb_users` VALUES ('15', 'dfgert', null, '', '2', '54dfg', '2018-06-21 00:18:47', null, null, '0', null);
INSERT INTO `tb_users` VALUES ('16', 'sdffgert', null, '', '2', '54fddfg', '2018-06-21 00:19:15', null, null, '0', null);
INSERT INTO `tb_users` VALUES ('17', 'k12312', null, '', '2', 'asdasdf', '2018-06-21 15:13:27', null, null, '0', null);
INSERT INTO `tb_users` VALUES ('18', '王健林', null, '', '2', 'QAQ', '2018-10-19 08:49:21', null, null, '0', null);
INSERT INTO `tb_users` VALUES ('19', '魏易', null, 'admin@123', '0', '123', '2018-10-19 08:50:07', null, null, '0', '07.jpg');
