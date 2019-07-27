-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(20)  NOT NULL COMMENT 'user_name',
  `password` varchar(20)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `userPhoto` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `birthday` varchar(20)  NULL COMMENT '��������',
  `telephone` varchar(20)  NOT NULL COMMENT '�û��绰',
  `address` varchar(20)  NULL COMMENT '��ͥ��ַ',
  `userType` varchar(20)  NOT NULL COMMENT '�û�����',
  `regTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_movieHall` (
  `movieHallId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ӱ��id',
  `movieHallName` varchar(20)  NOT NULL COMMENT 'Ӱ������',
  `rows` int(11) NOT NULL COMMENT '��λ����',
  `cols` int(11) NOT NULL COMMENT '��λ����',
  PRIMARY KEY (`movieHallId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_movie` (
  `movieId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ӰƬid',
  `movieName` varchar(40)  NOT NULL COMMENT 'ӰƬ����',
  `movieType` varchar(20)  NOT NULL COMMENT 'ӰƬ����',
  `moviePhoto` varchar(60)  NOT NULL COMMENT 'ӰƬͼƬ',
  `director` varchar(20)  NOT NULL COMMENT '����',
  `mainPerformer` varchar(50)  NOT NULL COMMENT '����',
  `duration` varchar(20)  NOT NULL COMMENT 'ʱ��',
  `area` varchar(20)  NOT NULL COMMENT '����',
  `releaseDate` varchar(20)  NULL COMMENT '��ӳ����',
  `price` float NOT NULL COMMENT 'Ʊ��',
  `opera` varchar(2000)  NOT NULL COMMENT '����',
  PRIMARY KEY (`movieId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_schedule` (
  `scheduleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `movieObj` int(11) NOT NULL COMMENT '��Ӱ',
  `hallObj` int(11) NOT NULL COMMENT '����Ӱ��',
  `scheduleDate` varchar(20)  NULL COMMENT '��ӳ����',
  `scheduleTime` varchar(20)  NOT NULL COMMENT '��ӳʱ��',
  PRIMARY KEY (`scheduleId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_movieOrder` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ʊid',
  `scheduleObj` int(11) NOT NULL COMMENT '����',
  `rowsIndex` int(11) NOT NULL COMMENT '��λ�к�',
  `cols` int(11) NOT NULL COMMENT '��λ�к�',
  `price` float NOT NULL COMMENT 'Ʊ��',
  `userObj` varchar(20)  NOT NULL COMMENT '�û�',
  `orderTime` varchar(20)  NULL COMMENT 'Ԥ��ʱ��',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ӱ��id',
  `movieObj` int(11) NOT NULL COMMENT '��Ӱ',
  `content` varchar(90)  NOT NULL COMMENT 'Ӱ������',
  `userObj` varchar(20)  NOT NULL COMMENT '�����û�',
  `commentTime` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_schedule ADD CONSTRAINT FOREIGN KEY (movieObj) REFERENCES t_movie(movieId);
ALTER TABLE t_schedule ADD CONSTRAINT FOREIGN KEY (hallObj) REFERENCES t_movieHall(movieHallId);
ALTER TABLE t_movieOrder ADD CONSTRAINT FOREIGN KEY (scheduleObj) REFERENCES t_schedule(scheduleId);
ALTER TABLE t_movieOrder ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_comment ADD CONSTRAINT FOREIGN KEY (movieObj) REFERENCES t_movie(movieId);
ALTER TABLE t_comment ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


