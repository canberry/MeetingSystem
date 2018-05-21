/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.31 : Database - meeting_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`meeting_system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `meeting_system`;

/*Table structure for table `document` */

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(100) NOT NULL,
  `path` varchar(100) NOT NULL,
  `m_id` int(11) NOT NULL,
  PRIMARY KEY (`d_id`),
  KEY `document_mid` (`m_id`),
  CONSTRAINT `document_mid` FOREIGN KEY (`m_id`) REFERENCES `meeting` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `document` */

insert  into `document`(`d_id`,`d_name`,`path`,`m_id`) values (1,'qas db.docx','upload/document/1525680201538.docx',1),(2,'qas db.pptx','upload/document/1525680201578.pptx',1);

/*Table structure for table `meeting` */

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(20) NOT NULL,
  `scheduled_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` varchar(200) NOT NULL,
  `cancel` enum('yes','no') NOT NULL DEFAULT 'no',
  `hold` enum('yes','no') NOT NULL DEFAULT 'no',
  `mr_id` int(11) NOT NULL,
  `scheduler` int(11) NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `meeting_mrid` (`mr_id`),
  KEY `meeting_scheduler` (`scheduler`),
  CONSTRAINT `meeting_mrid` FOREIGN KEY (`mr_id`) REFERENCES `meeting_room` (`mr_id`),
  CONSTRAINT `meeting_scheduler` FOREIGN KEY (`scheduler`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `meeting` */

insert  into `meeting`(`m_id`,`m_name`,`scheduled_time`,`start_time`,`end_time`,`description`,`cancel`,`hold`,`mr_id`,`scheduler`) values (1,'QAS db数据迁移讨论','2018-05-18 13:59:05','2018-05-11 08:00:00','2018-05-11 10:00:00','讨论QAS数据库数据迁移问题','no','no',5,3),(2,'ETA架构交流分享','2018-05-18 13:59:20','2018-05-11 10:30:00','2018-05-11 12:00:00','学习交流ETA架构','no','no',5,3),(3,'NAM Data Corp项目总结交流','2018-05-18 13:59:36','2018-05-14 14:00:00','2018-05-14 15:30:00','总结NAM Data Corporation项目，并展望下一步工作。','no','no',5,3),(4,'GI项目可行性分析','2018-05-18 13:59:54','2018-05-14 16:00:00','2018-05-14 18:00:00','分析是否可以展开GI项目','no','no',5,3),(5,'每周session分享','2018-05-18 14:00:11','2018-05-16 12:00:00','2018-05-16 13:30:00','利用午饭时间，随意交流工作心得。','no','no',5,3),(6,'组内管理制度的优化和漏洞讨论','2018-05-18 14:00:42','2018-05-22 14:00:00','2018-05-22 15:30:00','讨论交流组内管理制度，探讨该如何优化与如何弥补现存漏洞。','no','no',5,3),(7,'部门发展规划的内容和方向讨论','2018-05-18 14:00:52','2018-05-22 17:00:00','2018-05-22 18:00:00','讨论部门下一步的发展方向和计划','yes','no',5,3),(8,'公司形象的推广交流','2018-05-18 14:01:12','2018-05-24 08:00:00','2018-05-24 09:00:00','交流如何推广公司形象和影响力','no','no',5,3),(9,'团队建设活动交流','2018-05-18 14:01:23','2018-05-24 16:00:00','2018-05-24 16:30:00','讨论周末团队建设活动事宜','no','no',5,3),(10,'工作效率心得分享','2018-05-18 14:01:38','2018-05-25 11:00:00','2018-05-25 12:00:00','大家就如何提高工作效率发表意见','no','no',5,3),(11,'AI技术应用分享','2018-05-19 10:51:27','2018-05-28 14:00:00','2018-05-28 15:00:00','交流分享AI技术应用','no','no',4,1),(12,'小组工作阶段性总结交流','2018-05-19 10:51:31','2018-05-30 08:00:00','2018-05-30 10:00:00','对小组的阶段性工作进行总结','no','no',5,1);

/*Table structure for table `meeting_detail` */

DROP TABLE IF EXISTS `meeting_detail`;

CREATE TABLE `meeting_detail` (
  `m_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `md_role` enum('recorder','participant','master') NOT NULL DEFAULT 'participant',
  `will` enum('yes','no','uncertain') NOT NULL DEFAULT 'uncertain',
  `optional` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`m_id`,`user_id`),
  KEY `meetingdetail_userid` (`user_id`),
  CONSTRAINT `meetingdetail_mid` FOREIGN KEY (`m_id`) REFERENCES `meeting` (`m_id`),
  CONSTRAINT `meetingdetail_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `meeting_detail` */

insert  into `meeting_detail`(`m_id`,`user_id`,`md_role`,`will`,`optional`) values (1,1,'master','uncertain','no'),(1,5,'recorder','uncertain','no'),(1,9,'participant','uncertain','yes'),(2,1,'recorder','uncertain','yes'),(3,1,'recorder','uncertain','yes'),(4,1,'master','uncertain','yes'),(5,1,'master','uncertain','yes'),(6,1,'participant','uncertain','yes'),(6,10,'master','uncertain','yes'),(6,12,'recorder','uncertain','no'),(7,1,'participant','uncertain','yes'),(8,1,'participant','uncertain','yes'),(9,1,'participant','uncertain','yes'),(10,1,'participant','uncertain','yes'),(11,3,'participant','yes','yes'),(12,5,'participant','uncertain','yes');

/*Table structure for table `meeting_resource` */

DROP TABLE IF EXISTS `meeting_resource`;

CREATE TABLE `meeting_resource` (
  `m_id` int(11) NOT NULL,
  `r_id` int(11) NOT NULL,
  `number` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_id`,`r_id`),
  KEY `meetingresource_rid` (`r_id`),
  CONSTRAINT `meetingresource_mid` FOREIGN KEY (`m_id`) REFERENCES `meeting` (`m_id`),
  CONSTRAINT `meetingresource_rid` FOREIGN KEY (`r_id`) REFERENCES `resource` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `meeting_resource` */

insert  into `meeting_resource`(`m_id`,`r_id`,`number`) values (6,5,2),(6,6,1);

/*Table structure for table `meeting_room` */

DROP TABLE IF EXISTS `meeting_room`;

CREATE TABLE `meeting_room` (
  `mr_id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(20) NOT NULL,
  `mr_name` varchar(20) NOT NULL,
  `capacity` int(2) NOT NULL DEFAULT '0',
  `occupation` enum('yes','no') NOT NULL DEFAULT 'no',
  `mr_state` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`mr_id`),
  UNIQUE KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `meeting_room` */

insert  into `meeting_room`(`mr_id`,`no`,`mr_name`,`capacity`,`occupation`,`mr_state`) values (1,'S-101','小型会议室',2,'no','no'),(2,'S-201','小型会议室',2,'no','no'),(3,'S-102','小型会议室',5,'no','no'),(4,'S-202','小型会议室',5,'no','no'),(5,'M-103','中型会议室',10,'no','no'),(6,'M-203','中型会议室',10,'no','no'),(7,'M-104','中型会议室',15,'no','no'),(8,'M-204','中型会议室',15,'no','no'),(9,'L-105','大型会议室',20,'no','no'),(10,'L-205','大型会议室',30,'no','no'),(11,'F-106','多功能会议室',20,'no','no'),(12,'F-206','多功能会议室',20,'no','no');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_name` varchar(20) NOT NULL,
  `send_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(300) NOT NULL,
  `scan` enum('yes','no') NOT NULL DEFAULT 'no',
  `send_user_id` int(11) NOT NULL,
  `receive_user_id` int(11) NOT NULL,
  `send_state` enum('yes','no') NOT NULL DEFAULT 'no',
  `receive_state` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`message_id`),
  KEY `message_sendid` (`send_user_id`),
  KEY `message_receiveid` (`receive_user_id`),
  CONSTRAINT `message_receiveid` FOREIGN KEY (`receive_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `message_sendid` FOREIGN KEY (`send_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`message_id`,`message_name`,`send_time`,`content`,`scan`,`send_user_id`,`receive_user_id`,`send_state`,`receive_state`) values (1,'会议回复: AI技术应用分享','2018-05-19 10:51:45','曾玥  回复了会议: AI技术应用分享,    开始时间: 2018-05-14 14:00,    结束时间: 2018-05-14 15:00,    TA 的回复是: 同意参加,    请去查看详情','yes',3,1,'no','no');

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(20) NOT NULL,
  `total` int(2) NOT NULL DEFAULT '0',
  `remain` int(2) NOT NULL DEFAULT '0',
  `r_state` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `resource` */

insert  into `resource`(`r_id`,`r_name`,`total`,`remain`,`r_state`) values (1,'圆桌',30,30,'no'),(2,'长方桌',20,20,'no'),(3,'椅子',100,100,'no'),(4,'投影仪',10,10,'no'),(5,'记号笔',20,18,'no'),(6,'白板',10,9,'no'),(7,'麦克风',25,25,'no');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '123',
  `signature` varchar(300) DEFAULT '请修改个性签名',
  `avatar` varchar(100) DEFAULT 'avatar/default_avatar.jpg',
  `sex` enum('man','female','secret') DEFAULT 'secret',
  `user_role` enum('ordinary','admin') NOT NULL DEFAULT 'ordinary',
  `nickname` varchar(20) DEFAULT '请修改昵称',
  `mobile` varchar(20) DEFAULT '请添加手机号码',
  `email` varchar(50) DEFAULT '请添加个人邮箱地址',
  `address` varchar(100) DEFAULT '请添加工作地址',
  `position` enum('Intern','Officer','Associate Manager','Manager','Director','Senior Director','Vice President','President') NOT NULL DEFAULT 'Intern',
  `user_state` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`password`,`signature`,`avatar`,`sex`,`user_role`,`nickname`,`mobile`,`email`,`address`,`position`,`user_state`) values (1,'罗晓镁','123','认真工作','upload/avatar/1525681697337.png','female','ordinary','罗晓镁','18382369590','413781768@qq.com','上海浦东新区','Officer','no'),(2,'叶鹏霄','123','请修改个性签名','upload/avatar/1525680569382.png','man','admin','叶鹏霄','15108273160','343681476@foxmail.com','四川成都武侯区','President','no'),(3,'曾玥','123','请修改个性签名','upload/avatar/1525680600134.png','secret','ordinary','曾玥','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Vice President','no'),(4,'董浩阳','123','请修改个性签名','upload/avatar/1525680639601.png','man','ordinary','shuaige','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Officer','no'),(5,'朱旦','123','请修改个性签名','upload/avatar/1525680668190.png','female','ordinary','eggs','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Officer','no'),(6,'张家谱','123','请修改个性签名','upload/avatar/1525680738971.png','man','ordinary','请修改昵称','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Intern','no'),(7,'孟祥宇','123','请修改个性签名','upload/avatar/1525680762222.png','man','ordinary','请修改昵称','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Senior Director','no'),(8,'杨志强','123','请修改个性签名','upload/avatar/1525680783696.png','man','ordinary','请修改昵称','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Director','no'),(9,'邹圆圆','123','请修改个性签名','upload/avatar/1525680807692.png','secret','ordinary','请修改昵称','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Intern','no'),(10,'林静','123','请修改个性签名','upload/avatar/1525680827896.png','female','ordinary','请修改昵称','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Intern','no'),(11,'刘一儒','123','请修改个性签名','upload/avatar/1525680849050.png','secret','ordinary','请修改昵称','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Manager','no'),(12,'郭文婷','123','请修改个性签名','upload/avatar/1525681713324.png','secret','ordinary','请修改昵称','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Associate Manager','no'),(13,'朱冰','123','请修改个性签名','upload/avatar/1525680900842.png','female','ordinary','请修改昵称','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Officer','no'),(14,'陈红妃','123','请修改个性签名','upload/avatar/1525681740619.png','man','ordinary','请修改昵称','请添加手机号码','请添加个人邮箱地址','请添加工作地址','Intern','no');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
