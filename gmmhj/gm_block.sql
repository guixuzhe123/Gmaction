-- MySQL dump 10.15  Distrib 10.0.13-MariaDB, for Linux (x86_64)
--
-- Host: 192.168.68.238    Database: gm
-- ------------------------------------------------------
-- Server version	10.0.13-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gm_block`
--

DROP TABLE IF EXISTS `gm_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blocktitle` varchar(32) NOT NULL COMMENT '模块标题',
  `blockname` varchar(32) NOT NULL COMMENT '模块名称',
  `blockrank` int(3) NOT NULL COMMENT '栏目等级',
  `parentblock` int(10) NOT NULL COMMENT '父栏目ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `blocktitle` (`blocktitle`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_block`
--

LOCK TABLES `gm_block` WRITE;
/*!40000 ALTER TABLE `gm_block` DISABLE KEYS */;
INSERT INTO `gm_block` VALUES (1,'100','运营平台、区服管理',1,0),(2,'200','数据查询',1,0),(3,'300','在线数据',1,0),(4,'400','玩家信息',1,0),(5,'500','游戏公告管理',1,0),(6,'600','申请管理',1,0),(7,'700','权限管理',1,0),(8,'800','日志管理',1,0),(9,'10010','区服列表',2,100),(10,'10020','平台管理',2,100),(11,'10030','3595平台服务器对接',2,100),(12,'20010','每日数据',2,200),(13,'20020','每日留存',2,200),(14,'20030','每小时注册量',2,200),(16,'20040','充值查询',2,200),(17,'20050','ip登陆查询',2,200),(18,'20060','银币查询',2,200),(19,'20070','元宝查询',2,200),(20,'20080','礼金查询',2,200),(21,'20090','任务查询',2,200),(22,'200100','全服老玩家查询',2,200),(23,'200110','全服注册创角查询',2,200),(24,'200120','商城道具排行榜',2,200),(25,'200130','付费段人数查询',2,200),(26,'30010','实时在线查询',2,300),(27,'30020','历史在线',2,300),(28,'30030','实时等级分布',2,300),(29,'30040','历史等级分布',2,300),(30,'30050','充值总量',2,300),(31,'30060','充值排行榜',2,300),(32,'40010','玩家信息查询',2,400),(33,'40020','封IP',2,400),(34,'40030','IP封禁列表查询',2,400),(35,'40040','批量封号',2,400),(36,'50010','即时公告',2,500),(37,'50020','循环公告',2,500),(38,'50030','定时公告',2,500),(39,'50040','公告列表',2,500),(40,'60010','申请元宝',2,600),(41,'60020','申请充值',2,600),(42,'60030','申请道具',2,600),(43,'60040','全服元宝',2,600),(44,'60080','全服礼金',2,600),(45,'60050','元宝申请列表',2,600),(46,'60060','充值申请列表',2,600),(47,'60070','道具申请列表',2,600),(48,'70010','管理员列表',2,700),(49,'70020','密码修改',2,700),(50,'80010','日志列表',2,800);
/*!40000 ALTER TABLE `gm_block` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-26 14:38:47
