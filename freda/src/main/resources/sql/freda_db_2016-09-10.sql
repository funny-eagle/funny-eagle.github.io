# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.13)
# Database: freda_db
# Generation Time: 2016-09-10 14:59:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `ID` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `TITLE` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `AUTHOR` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '作者',
  `PREVIEW` longtext COLLATE utf8_bin COMMENT '预览',
  `CONTENT` longtext COLLATE utf8_bin COMMENT '正文',
  `TAG` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签',
  `CREATE_TIME` datetime NOT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `AUTHOR_SITE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '作者网站',
  `SOURCE` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '文章来源',
  `ARTICLE_TYPE` int(11) DEFAULT NULL COMMENT '文章类别：1、技术；2、其他；',
  `STATE` int(11) DEFAULT NULL COMMENT '发布状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='文章表';



# Dump of table dict
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dict`;

CREATE TABLE `dict` (
  `dict_id` varchar(32) NOT NULL,
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dict_pid` varchar(100) NOT NULL,
  PRIMARY KEY (`dict_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;



# Dump of table dict_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dict_type`;

CREATE TABLE `dict_type` (
  `dic_pid` varchar(32) NOT NULL,
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dic_pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `ID` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `USERNAME` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  `PASSWORD` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `CREATE_TIME` datetime DEFAULT NULL,
  `LAST_LOGIN_TIME` datetime DEFAULT NULL,
  `LAST_LOGIN_IP` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
