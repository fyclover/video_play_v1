-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: ntp_video_update
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `hty_adposition`
--

DROP TABLE IF EXISTS `hty_adposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_adposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `width` smallint(4) DEFAULT NULL,
  `height` smallint(4) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_adposition`
--

LOCK TABLES `hty_adposition` WRITE;
/*!40000 ALTER TABLE `hty_adposition` DISABLE KEYS */;
INSERT INTO `hty_adposition` VALUES (1,'轮播图',NULL,NULL,1588814279),(2,'弹窗广告',NULL,NULL,1588814290),(3,'海报',NULL,NULL,1588814290);
/*!40000 ALTER TABLE `hty_adposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_ads`
--

DROP TABLE IF EXISTS `hty_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sort` smallint(4) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_ads`
--

LOCK TABLES `hty_ads` WRITE;
/*!40000 ALTER TABLE `hty_ads` DISABLE KEYS */;
INSERT INTO `hty_ads` VALUES (29,1,NULL,0,'storage/ads/20220802/f5cf637854375613e9b32571abf311d3.jpg','',7,1,1592201950),(42,1,NULL,1,'storage/ads/20220802/9014604448521051a80f4bd3f4dc151e.jpg','',8,2,1658440886),(43,1,NULL,1,'storage/ads/20220802/19f63db1c243299e00f8ecbdc2d66918.png','',9,1,1658441035),(44,1,NULL,1,'storage/ads/20220802/d4902c0648ff5f3f9a2d564e09566f62.jpg','',10,1,1658441113),(50,1,NULL,0,'storage/ads/20220802/e7291550c742a16e1b7b177007796ff1.jpg','',1,2,1659431711);
/*!40000 ALTER TABLE `hty_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_auth_group`
--

DROP TABLE IF EXISTS `hty_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `sort` int(4) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1',
  `rules` text,
  `desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_auth_group`
--

LOCK TABLES `hty_auth_group` WRITE;
/*!40000 ALTER TABLE `hty_auth_group` DISABLE KEYS */;
INSERT INTO `hty_auth_group` VALUES (1,'超级管理员',NULL,1,'83,3,2,1,86,85,57,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,52,28,23,22,36,35,34,33,32,31,30,29,53,38,44,43,42,41,48,47,46,45,78,77,76,75,74,73,72,71,70,66,65,64,63,84,82,69,68,67',''),(5,'广告管理',NULL,1,'44,43,42,41',''),(6,'运营',NULL,1,'101,91,90,89,83,3,2,1,105,104,103,102,86,85,57,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,52,28,23,22,31,30,29,38,96,95,94,93,92,44,43,42,41,84,48,47,46,45,111,110,109,108,107,106,100,99,98,78,77,76,75,74,73,72,71,70,66,65,64,63,97,82,69,68,67',''),(7,'代理上传',NULL,1,'114,113,101,91,90,89,83,3,2,1','');
/*!40000 ALTER TABLE `hty_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_auth_group_access`
--

DROP TABLE IF EXISTS `hty_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_auth_group_access` (
  `uid` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_auth_group_access`
--

LOCK TABLES `hty_auth_group_access` WRITE;
/*!40000 ALTER TABLE `hty_auth_group_access` DISABLE KEYS */;
INSERT INTO `hty_auth_group_access` VALUES (9,2),(10,2),(11,2),(12,2),(13,4),(14,3),(15,3),(16,3),(8,1),(9,5),(10,6),(11,5),(12,5),(13,1),(14,7);
/*!40000 ALTER TABLE `hty_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_auth_module`
--

DROP TABLE IF EXISTS `hty_auth_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_auth_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_auth_module`
--

LOCK TABLES `hty_auth_module` WRITE;
/*!40000 ALTER TABLE `hty_auth_module` DISABLE KEYS */;
INSERT INTO `hty_auth_module` VALUES (1,'用户管理',NULL,1590116499,1590116499),(2,'产品管理',NULL,1590116517,1590116517),(3,'订单管理',NULL,1590116524,1590116524),(5,'权限管理',NULL,1590116537,1590116537),(6,'系统设置',NULL,1590116544,1590116544),(7,'图片管理',NULL,1590116550,1590116550),(8,'消息通知',NULL,1590116557,1590116557),(11,'配置项',NULL,1597816056,NULL),(12,'财务管理',NULL,1597816056,NULL);
/*!40000 ALTER TABLE `hty_auth_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_auth_rule`
--

DROP TABLE IF EXISTS `hty_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `condition` int(11) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_auth_rule`
--

LOCK TABLES `hty_auth_rule` WRITE;
/*!40000 ALTER TABLE `hty_auth_rule` DISABLE KEYS */;
INSERT INTO `hty_auth_rule` VALUES (1,'Member/index','用户列表',NULL,1,1,1590116605,1590116605),(2,'Member/edit','用户编辑',NULL,1,1,1590116637,1590116637),(3,'Member/detail','用户详情',NULL,1,1,1590116657,1590116657),(6,'Types/index','产品模型',NULL,2,1,1590116749,1590116749),(7,'Types/add','新增产品模型',NULL,2,1,1590116764,1590116764),(8,'Types/edit','修改产品模型',NULL,2,1,1590116779,1590116779),(9,'Types/delete','删除产品模型',NULL,2,1,1590116791,1590116791),(10,'Types/specs','产品规格',NULL,2,1,1590116804,1590116804),(11,'Types/addspecs','新增规格',NULL,2,1,1590116816,1590116816),(12,'Types/editspec','编辑规格',NULL,2,1,1590116826,1590116826),(13,'Types/specdel','删除规格',NULL,2,1,1590116837,1590116837),(14,'Category/index','产品分类',NULL,2,1,1590116848,1590116848),(15,'Category/add','新增分类',NULL,2,1,1590116858,1590116858),(16,'Category/edit','编辑分类',NULL,2,1,1590116869,1590116869),(17,'Category/delete','删除分类',NULL,2,1,1590116881,1590116881),(18,'Goods/index','产品列表1',NULL,2,1,1590116892,1590116892),(19,'Goods/add','新增产品',NULL,2,1,1590116904,1590116904),(20,'Goods/edit','编辑产品',NULL,2,1,1590116917,1590116917),(21,'Goods/delete','删除产品',NULL,2,1,1590116930,1590116930),(22,'Order/index','订单列表',NULL,3,1,1590116941,1590116941),(23,'Order/detail','订单详情',NULL,3,1,1590116953,1590116953),(28,'Order/delete','订单删除',NULL,3,1,1590117176,1590117176),(29,'AuthUser/index','管理员列表',NULL,5,1,1590117216,1590117216),(30,'AuthUser/add','新增管理员',NULL,5,1,1590117230,1590117230),(31,'AuthUser/edit','编辑管理员',NULL,5,1,1590117244,1590117244),(32,'AuthUser/delete','删除管理员',NULL,5,1,1590117256,1590117256),(33,'AuthGroup/index','角色管理',NULL,5,1,1590117267,1590117267),(34,'AuthGroup/add','新增角色',NULL,5,1,1590117279,1590117279),(35,'AuthGroup/edit','编辑角色',NULL,5,1,1590117294,1590117294),(36,'AuthGroup/delete','删除角色',NULL,5,1,1590117317,1590117317),(38,'Webset/index','系统设置列表',NULL,6,1,1590117357,1590117357),(41,'Ads/index','图片管理',NULL,7,1,1590117407,1590117407),(42,'Ads/add','新增图片',NULL,7,1,1590117417,1590117417),(43,'Ads/edit','编辑图片',NULL,7,1,1590117428,1590117428),(44,'Ads/delete','删除图片',NULL,7,1,1590117440,1590117440),(45,'Notice/index','消息列表',NULL,8,1,1590117462,1590117462),(46,'Notice/add','新增消息',NULL,8,1,1590117487,1590117487),(47,'Notice/edit','编辑消息',NULL,8,1,1590117498,1590117498),(48,'Notice/delete','删除消息',NULL,8,1,1590117508,1590117508),(52,'Order/sure','确认发货',NULL,3,1,1591331504,1591331504),(57,'Goods/updateSta','上下架',NULL,2,1,1592809789,1592809789),(63,'Peizhi/index','VIP等级配置',NULL,11,1,1598002163,1598002163),(64,'Pezhi/sanji','三级返佣比例',NULL,11,1,NULL,NULL),(65,'Peizhi/qd','签到注册等奖励',NULL,11,1,NULL,NULL),(66,'Peizhi/cid','充值账号管理',NULL,11,1,NULL,NULL),(67,'Log/chonzhi','充值日志',NULL,12,1,NULL,NULL),(68,'Log/fanyon','返佣日志',NULL,12,1,NULL,NULL),(69,'Tx/index','提现申请列表',NULL,12,1,NULL,NULL),(70,'Peizhi/edit_vip','修改 vip配置',NULL,11,1,NULL,NULL),(71,'Peizhi/edit_sanji','修改三级返佣比例',NULL,11,1,NULL,NULL),(72,'Peizhi/edit_qd','修改签到',NULL,11,1,NULL,NULL),(73,'Peizhi/add_cid','添加支付信息',NULL,11,1,NULL,NULL),(74,'Peizhi/edit_cid','编辑支付信息',NULL,11,1,NULL,NULL),(75,'Peizhi/switchs','支付信息切换',NULL,11,1,NULL,NULL),(76,'Peizhi/gindex','关于我们列表',NULL,11,1,NULL,NULL),(77,'Peizhi/addg','添加关于我们',NULL,11,1,NULL,NULL),(78,'Peizhi/edit_g','编辑关于我们',NULL,11,1,NULL,NULL),(82,'Log/gmjl','购买商品获取积分等记录',NULL,12,1,NULL,NULL),(83,'Member/team','团队查询',NULL,1,1,NULL,NULL),(84,'Log/msg_log','站内消息',NULL,8,1,NULL,NULL),(85,'Cpin/pl','评论管理',NULL,2,1,NULL,NULL),(86,'Cpin/del','删除评论',NULL,2,1,NULL,NULL),(89,'Member/add','添加用户',NULL,1,1,NULL,NULL),(90,'Member/chonzhi','充值',NULL,1,1,NULL,NULL),(91,'Member/jianzhi','减值',NULL,1,1,NULL,NULL),(92,'Ads/updateSta','轮播图开关',NULL,7,1,NULL,NULL),(93,'Headimg/index','头像列表',NULL,7,1,NULL,NULL),(94,'Headimg/add','添加头像',NULL,7,1,NULL,NULL),(95,'Headimg/edit','编辑头像',NULL,7,1,NULL,NULL),(96,'Headimg/delete','删除头像',NULL,7,1,NULL,NULL),(97,'Log/chonzhi_sh','审核充值',NULL,12,1,NULL,NULL),(98,'Peizhi/add_cid','添加账号',NULL,11,1,NULL,NULL),(99,'Peizhi/is_bili','切换数量和比例',NULL,11,1,NULL,NULL),(100,'Peizhi/sanji','三级返佣比例',NULL,11,1,NULL,NULL),(101,'AuthUser/edit','编辑后台个人信息',NULL,1,1,NULL,NULL),(102,'Category/updateSta','切换显示',NULL,2,1,NULL,NULL),(103,'Goods/edit_pl','新增评论',NULL,2,1,NULL,NULL),(104,'Cpin/edit','编辑评论',NULL,2,1,NULL,NULL),(105,'Cpin/del_pl','删除评论',NULL,2,1,NULL,NULL),(106,'Peizhi/switch','开关管理',NULL,11,1,NULL,NULL),(107,'Peizhi/is_switch','切换',NULL,11,1,NULL,NULL),(108,'Cj/index','常见问题',NULL,11,1,NULL,NULL),(109,'Cj/add','添加问题',NULL,11,1,NULL,NULL),(110,'Cj/edit','编辑问题',NULL,11,1,NULL,NULL),(111,'Cj/del','删除问题',NULL,11,1,NULL,NULL),(113,'upload/cf','上传文件',NULL,1,1,1590116657,1590116657),(114,'Upload/index','上传文件1',NULL,1,1,1590116657,1590116657);
/*!40000 ALTER TABLE `hty_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_auth_user`
--

DROP TABLE IF EXISTS `hty_auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `last_login_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_auth_user`
--

LOCK TABLES `hty_auth_user` WRITE;
/*!40000 ALTER TABLE `hty_auth_user` DISABLE KEYS */;
INSERT INTO `hty_auth_user` VALUES (7,1,'admin','15928280591','e10adc3949ba59abbe56e057f20f883e',1,NULL,1678089527,1678089527,NULL),(8,1,'wodage','15866669999','d3b9b8d0cfc5bd9e4c45f4cf7849d719',1,1658368986,1660043677,1660043677,NULL),(9,5,'guanggao','','e10adc3949ba59abbe56e057f20f883e',1,1658396778,1658396792,1658396792,NULL),(10,6,'yunying','123456','e10adc3949ba59abbe56e057f20f883e',1,1658397023,1660044106,1660044106,NULL),(13,1,'kaikai','','71dcc018252ab7cc9ea8376746d4e200',1,1659019774,1659284178,1659284178,NULL),(14,7,'agent11','18060989004','e10adc3949ba59abbe56e057f20f883e',1,1677742641,1677743009,1677743009,NULL);
/*!40000 ALTER TABLE `hty_auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_common_sys_config`
--

DROP TABLE IF EXISTS `hty_common_sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_common_sys_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '配置中文名称',
  `value` varchar(200) DEFAULT NULL COMMENT '约束条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='后台配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_common_sys_config`
--

LOCK TABLES `hty_common_sys_config` WRITE;
/*!40000 ALTER TABLE `hty_common_sys_config` DISABLE KEYS */;
INSERT INTO `hty_common_sys_config` VALUES (1,'web_name','管理系统'),(2,'logo_url','/logo.png'),(3,'web_keywords','关键词'),(4,'web_description','描述'),(5,'app_down_ios','http://www.baiduc.com'),(6,'app_down_android','http://www.baiduc.com'),(7,'video_single_price','1.2');
/*!40000 ALTER TABLE `hty_common_sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_common_upload`
--

DROP TABLE IF EXISTS `hty_common_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_common_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `size` double DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `file` varchar(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `click` float(255,0) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL COMMENT '上传路径',
  `create_time` int(11) unsigned DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '上传用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_common_upload`
--

LOCK TABLES `hty_common_upload` WRITE;
/*!40000 ALTER TABLE `hty_common_upload` DISABLE KEYS */;
INSERT INTO `hty_common_upload` VALUES (29,'WeChat_20221012140631.mp4',8.25,'video/mp4','0',1672214654,NULL,NULL,'upload/WeChat_20221012140631.mp4',1672214654,0),(28,'mmexport1665827080306.mp4',17.66,'video/mp4','0',1672212771,NULL,NULL,'upload/mmexport1665827080306.mp4',1672212771,0);
/*!40000 ALTER TABLE `hty_common_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_domain_name`
--

DROP TABLE IF EXISTS `hty_domain_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_domain_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '域名',
  `pid` int(11) DEFAULT '0' COMMENT '上级id',
  `create_time` datetime DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='域名管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_domain_name`
--

LOCK TABLES `hty_domain_name` WRITE;
/*!40000 ALTER TABLE `hty_domain_name` DISABLE KEYS */;
INSERT INTO `hty_domain_name` VALUES (1,'sdfee.top',0,'2023-01-29 11:13:28',0),(2,'xcdbc.top',0,'2023-01-29 11:13:28',0),(3,'fxczz.top',0,'2023-01-29 11:13:28',0),(4,'xxgfc.top',0,'2023-01-29 11:13:28',0),(5,'ffacc.top',0,'2023-01-29 11:13:28',0),(6,'fdx33.top',0,'2023-01-29 11:13:28',0),(7,'ccdxx.top',0,'2023-01-29 11:13:28',0),(8,'jj8ii.top',0,'2023-01-29 11:13:28',0),(9,'fcd99.top',0,'2023-01-29 11:13:28',0),(10,'eefsa.top',0,'2023-01-29 11:13:28',0),(11,'eidfx.top',0,'2023-01-29 11:13:28',0),(12,'xdefd.top',0,'2023-01-29 11:13:28',0),(13,'sdfwe.top',0,'2023-01-29 11:13:28',0),(14,'asxcc.top',0,'2023-01-29 11:13:28',0),(15,'ojods.top',0,'2023-01-29 11:13:28',0),(16,'ojojsd.top',0,'2023-01-29 11:13:28',0),(17,'iefsc.top',0,'2023-01-29 11:13:28',0),(18,'sadze.top',0,'2023-01-29 11:13:28',0),(19,'efsdc.top',0,'2023-01-29 11:13:28',0),(20,'ifesc.top',0,'2023-01-29 11:13:28',0),(27,'012928ivyte.asxcc.top',14,'2023-01-29 17:15:28',1),(28,'012935psqas.ccdxx.top',7,'2023-01-29 17:15:35',1),(29,'012905u7u4b.ojods.top',15,'2023-01-29 17:20:05',1),(26,'tjnsliro.sadze.top',18,'2023-01-29 17:13:39',1);
/*!40000 ALTER TABLE `hty_domain_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_member`
--

DROP TABLE IF EXISTS `hty_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` tinyint(2) DEFAULT '0' COMMENT 'VIP0-vip5',
  `old_role_id` tinyint(2) DEFAULT NULL,
  `group_id` tinyint(1) DEFAULT '0' COMMENT '1推广大使2服务中心',
  `user_id` int(11) DEFAULT '0' COMMENT '上级id',
  `two_level` int(11) DEFAULT '0',
  `ancestors` varchar(100) DEFAULT NULL COMMENT '2级',
  `level` smallint(4) DEFAULT '0',
  `plate_count` smallint(4) DEFAULT '0',
  `all_user_num` int(11) DEFAULT '0' COMMENT '伞下总人数',
  `openid` varchar(100) DEFAULT NULL,
  `unionid` varchar(100) DEFAULT NULL,
  `nickname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_code` varchar(6) DEFAULT NULL,
  `rec_code` varchar(20) DEFAULT NULL COMMENT '推荐码',
  `token` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `head_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` tinyint(2) DEFAULT NULL,
  `qrcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qrcode_bg` varchar(200) DEFAULT NULL,
  `qrcode_url` varchar(200) DEFAULT NULL,
  `qrcode_time` int(11) DEFAULT NULL,
  `xf_money` decimal(12,2) DEFAULT '0.00' COMMENT '消费金额',
  `yj_money` decimal(12,2) DEFAULT '0.00' COMMENT '加权分红',
  `balance` decimal(12,2) DEFAULT '0.00' COMMENT '余额',
  `qianbao` decimal(12,2) DEFAULT '0.00' COMMENT '可提余额',
  `qiandou` decimal(12,2) DEFAULT '0.00' COMMENT '多宝',
  `qiandou_js` decimal(12,2) DEFAULT '0.00',
  `qiandou_fx` decimal(12,2) DEFAULT '0.00',
  `qiandou_dl` decimal(12,2) DEFAULT '0.00',
  `team_yj` int(11) DEFAULT '0' COMMENT '团队业绩',
  `cash_total` decimal(8,2) DEFAULT NULL,
  `bank_name` varchar(10) DEFAULT NULL,
  `bank_title` varchar(50) DEFAULT NULL,
  `bank_code` varchar(50) DEFAULT NULL,
  `alipay_name` varchar(20) DEFAULT NULL,
  `alipay_code` varchar(50) DEFAULT NULL,
  `id_card` varchar(50) DEFAULT NULL,
  `card_name` varchar(20) DEFAULT NULL,
  `jishou_num` smallint(4) DEFAULT '0' COMMENT '寄售次数',
  `sign_num` tinyint(1) DEFAULT '0',
  `jishou_end_time` int(11) DEFAULT '0',
  `auth_time` int(11) DEFAULT NULL COMMENT '登陆过期时间',
  `last_login_time` int(11) DEFAULT NULL,
  `set_role_time` int(11) DEFAULT NULL COMMENT '修改推广大使的时间',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL COMMENT '手机端修改填写推荐码时间',
  `edit_time` int(11) DEFAULT NULL COMMENT '后台修改推荐码时间',
  `integral` decimal(10,2) DEFAULT '0.00' COMMENT '积分',
  `pass` varchar(64) DEFAULT NULL COMMENT '用户密码',
  `freeze_price` decimal(10,2) DEFAULT NULL COMMENT '冻结资金',
  `tx_pass` varchar(68) DEFAULT NULL COMMENT '提现密码',
  `is_shi` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已实名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_member`
--

LOCK TABLES `hty_member` WRITE;
/*!40000 ALTER TABLE `hty_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `hty_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hty_update_video`
--

DROP TABLE IF EXISTS `hty_update_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hty_update_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号 ID 自增',
  `admin_uid` int(11) NOT NULL COMMENT '管理员ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `video_name` varchar(300) NOT NULL COMMENT '文件名称及路径',
  `m3u8_name` varchar(300) NOT NULL COMMENT '文件及路径',
  `status` int(11) NOT NULL COMMENT '状态 0 待审核 1 正常 -1 删除 ',
  `slice_msg` varchar(600) NOT NULL COMMENT '切片信息',
  `finsh_time` datetime NOT NULL COMMENT '完成时间',
  `update_status` int(11) NOT NULL COMMENT '上传状态 0 上传中  1 已完成',
  `change_status` int(11) NOT NULL COMMENT '更新状态',
  `name` varchar(300) NOT NULL COMMENT '文件名称',
  `video_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户上传视频表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hty_update_video`
--

LOCK TABLES `hty_update_video` WRITE;
/*!40000 ALTER TABLE `hty_update_video` DISABLE KEYS */;
INSERT INTO `hty_update_video` VALUES (10,1,0,'2023-02-22 17:01:04','/www/wwwroot/up.bxgtv.top/upload/public/upload/7/awasd1.mp4','',0,'44eca73e8929835150bcba73080a57f1','2023-03-06 15:59:21',1,0,'awasd1.mp4','/upload/7/awasd1.mp4'),(11,1,0,'2023-02-22 17:01:50','/www/wwwroot/up.bxgtv.top/upload/public/upload/7/qw1.mp4','',0,'a24da0df554641517df1333412248bb9','2023-02-22 17:01:59',1,0,'qw1.mp4','/upload/7/qw1.mp4'),(12,1,7,'2023-03-02 15:30:34','/www/wwwroot/up.bxgtv.top/upload/public/upload/7/qwqe.mp4','',1,'dbb2f888b4f194b0cbe759de77beb12c','2023-03-02 15:30:46',1,0,'qwqe.mp4','/upload/7/qwqe.mp4'),(13,1,14,'2023-03-02 16:16:26','/www/wwwroot/up.bxgtv.top/upload/public/upload/14/awasd1.mp4','',1,'44eca73e8929835150bcba73080a57f1','2023-03-06 15:59:21',1,0,'awasd1.mp4','/upload/14/awasd1.mp4'),(14,1,7,'2023-03-06 15:58:56','/www/wwwroot/upload.com/upload/public/upload/7/awasd1.mp4','',1,'44eca73e8929835150bcba73080a57f1','2023-03-06 15:59:21',1,0,'awasd1.mp4','/upload/7/awasd1.mp4');
/*!40000 ALTER TABLE `hty_update_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_admin`
--

DROP TABLE IF EXISTS `ntp_common_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) DEFAULT NULL COMMENT '管理员账号',
  `pwd` varchar(200) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `role` int(2) DEFAULT '1' COMMENT '角色',
  `market_level` int(11) DEFAULT NULL COMMENT '市场部级别',
  `remarks` varchar(200) DEFAULT '0' COMMENT '备注',
  `phone` varchar(200) DEFAULT '0' COMMENT '手机号码',
  `invitation_code` varchar(200) DEFAULT '0' COMMENT '邀请码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='后台管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin`
--

LOCK TABLES `ntp_common_admin` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin` DISABLE KEYS */;
INSERT INTO `ntp_common_admin` VALUES (1,'admin','MTIzNDU2','2021-03-11 16:15:26',1,1,'123','0','0'),(2,'fyclover','MTIzNDU2','2021-03-25 11:04:03',6,2,'0','0','0'),(12,NULL,'','2022-12-27 10:21:01',1,1,'超级管理员','0','0'),(13,NULL,'','2022-12-27 10:21:01',1,1,'超级管理员','0','0');
/*!40000 ALTER TABLE `ntp_common_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_admin_log`
--

DROP TABLE IF EXISTS `ntp_common_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_admin_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_uid` int(10) DEFAULT NULL COMMENT '管理员id',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `mark` varchar(200) DEFAULT NULL COMMENT '操作内容',
  `ip` varchar(200) DEFAULT NULL COMMENT 'ip',
  `city` varchar(200) DEFAULT NULL COMMENT '地区',
  `system` varchar(200) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(200) DEFAULT NULL COMMENT '操作浏览器',
  `action` varchar(200) DEFAULT NULL COMMENT '操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='后台操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin_log`
--

LOCK TABLES `ntp_common_admin_log` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_admin_menu`
--

DROP TABLE IF EXISTS `ntp_common_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_admin_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0' COMMENT '上级菜单,0为顶级菜单',
  `title` varchar(200) DEFAULT NULL COMMENT '菜单名',
  `status` tinyint(1) DEFAULT '1' COMMENT '菜单状态 1正常 0下架',
  `admin_uid` int(10) DEFAULT NULL COMMENT '管理员ID，编辑者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `path` varchar(200) DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(200) DEFAULT NULL COMMENT '图标地址',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=716 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin_menu`
--

LOCK TABLES `ntp_common_admin_menu` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin_menu` DISABLE KEYS */;
INSERT INTO `ntp_common_admin_menu` VALUES (1,0,'控制面板',1,0,'2021-03-25 14:19:22','2021-04-15 14:02:35',NULL,NULL,1),(2,0,'权限管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','','',8),(3,0,'用户管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,2),(4,0,'财务管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,3),(5,0,'市场管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,4),(6,0,'代理商管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,5),(7,0,'公告管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,6),(8,0,'内容管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,7),(9,0,'日志管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,9),(10,0,'系统配置',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,10),(11,0,'视频管理',1,0,'2021-03-30 17:03:32','2021-03-30 17:03:32',NULL,NULL,7),(28,5,'市场部等级列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/platform/marketLevelList',NULL,0),(29,5,'市场部关系列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/platform/marketRelationsList','',0),(30,6,'代理商信息',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/platform/agent',NULL,0),(31,8,'提现列表',0,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/user/withdrawal',NULL,0),(32,2,'菜单列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemset/menulist',NULL,0),(34,2,'角色权限管理',0,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemset/role',NULL,0),(35,3,'用户列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/user/userlist',NULL,0),(36,2,'控制器管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemset/controllerlist',NULL,0),(37,2,'角色列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemset/roleadminlist',NULL,0),(38,2,'管理员列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemset/adminlist',NULL,0),(39,1,'控制面板',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/dashboard/console',NULL,0),(40,9,'操作日志',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/actionlog',NULL,0),(41,4,'资金流动',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/moneylog',NULL,0),(42,9,'登陆日志',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/loginlog',NULL,0),(43,10,'配置列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemmng/configList',NULL,0),(45,7,'公告列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/notice/noticeList',NULL,0),(46,7,'通知列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/notice/notifyList',NULL,0),(47,8,'文章分类',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/extension/articleType','',0),(48,8,'文章内容列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/extension/articleList',NULL,0),(49,11,'视频分类',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/extension/videoType',NULL,0),(50,11,'视频资源列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/extension/videoList','',0),(52,6,'代理资金流动',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/platform/moneylog','',0),(53,6,'代理充值列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/platform/rechargelog','',0),(54,6,'代理提现列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/platform/withdrawallog','',0),(55,6,'代理订单列表',1,NULL,'2021-03-30 17:03:28','2021-03-30 17:03:30','/platform/order','',0),(56,6,'代理用户列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/platform/userlist','',0),(708,4,'充值列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/rechargelog',NULL,0),(709,4,'提现列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/withdrawallog',NULL,0),(714,4,'订单列表',1,NULL,'2021-03-30 17:03:28','2021-03-30 17:03:30','/log/order',NULL,0),(715,11,'视频套餐列表',1,NULL,'2021-03-30 17:03:32','2021-03-30 17:03:33','/extension/videovipList',NULL,0);
/*!40000 ALTER TABLE `ntp_common_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_admin_power`
--

DROP TABLE IF EXISTS `ntp_common_admin_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_admin_power` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `path` varchar(200) DEFAULT NULL COMMENT '路径',
  `type` varchar(200) DEFAULT NULL COMMENT '请求方式 get post put update detele',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin_power`
--

LOCK TABLES `ntp_common_admin_power` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin_power` DISABLE KEYS */;
INSERT INTO `ntp_common_admin_power` VALUES (1,'用户列表','/admin/list','post'),(2,'用户添加','/admin/add','post'),(3,'用户删除','/admin/del','post'),(4,'用户详情','/admin/detail','post'),(5,'用户信息修改','/admin/edit','post'),(6,'文章内容新增','/article/add','post'),(7,'文章内容查询','/article/detail','post'),(8,'文章内容修改','/article/edit','post'),(9,'文章内容列表','/article/list','post'),(10,'文章内容删除','/article/del','post'),(11,'文章分类删除','/article_type/del','post'),(12,'文章分类查询','/article_type/detail','post'),(13,'文章分类添加','/article_type/add','post'),(14,'文章分类列表','/article_type/list','post'),(15,'文章分类修改','/article_type/edit','post'),(16,'资金流动日志','/money/log','post'),(17,'登陆日志','/login/log','post'),(18,'菜单删除','/menu/del','post'),(19,'菜单查询','/menu/detail','post'),(20,'菜单栏目树','/menu/list','post'),(21,'菜单修改','/menu/edit','post'),(22,'菜单添加','/menu/del','post'),(23,'通知修改','/notify/edit','post'),(24,'通知列表','/notify/list','post'),(25,'通知类型','/notify/notify','post'),(26,'通知添加','/notify/add','post'),(27,'通知删除','/notify/del','post'),(28,'通知状态切换','/notify/status','post'),(29,'通知查询详情','/notify/detail','post'),(30,'公告删除','/notice/del','post'),(31,'公告查询','/notice/detail','post'),(32,'公告列表','/notice/list','post'),(33,'公告状态切换','/notice/status','post'),(34,'公告位置','/notice/position','post'),(35,'公告修改','/notice/edit','post'),(36,'公告新增','/notice/add','post'),(37,'充值列表','/recharge/list','post'),(38,'充值确认','/recharge/status','post'),(39,'提现列表','/pay/list','post'),(40,'提现成功失败修改','/pay/status','post'),(41,'设置支付银行卡默认','/paybank/default','post'),(42,'支付银行卡列表','/paybank/list','post'),(43,'支付银行卡删除','/paybank/del','post'),(44,'设置银行卡默认','/bank/default','post'),(45,'银行卡列表','/bank/list','post'),(46,'银行卡删除','/bank/del','post'),(47,'配置删除','/config/del','post'),(48,'配置列表','/config/list','post'),(49,'配置详情','/config/detail','post'),(50,'配置修改','/config/edit','post'),(51,'配置新增','/config/add','post'),(52,'用户真实信息','/userreal/list','post'),(53,'用户状态修改','/user/status','post'),(54,'用户信息修改','/user/edit','post'),(55,'用户详情','/user/detail','post'),(56,'用户列表','/user/list','post'),(57,'市场部等级列表','/marketlevel/list','post'),(58,'市场部等级新增','/marketlevel/add','post'),(59,'市场部等级修改','/marketlevel/edit','post'),(60,'角色修改','/role/edit','post'),(61,'角色列表','/role/list','post'),(62,'角色新增','/role/edit','post'),(63,'角色菜单权限列表','/rolemenu/list','post'),(64,'角色菜单权限新增','/rolemenu/add','post'),(65,'角色菜单权限改','/rolemenu/edit','post'),(66,'角色API权限添加','/power/add','post'),(67,'角色API权限修改','/power/edit','post'),(68,'角色API权限列表','/power/list','post'),(69,'代理列表','/user/agent','post'),(70,'代理添加','/agent/add','post'),(71,'代理修改','/agent/edit','post'),(72,'代理状态修改','/agent/status','post'),(74,'视频列表','/video/list','post'),(75,'视频添加','/video/add','post'),(76,'视频修改','/video/edit','post'),(77,'视频删除','/video/del','post'),(79,'视频分类列表','/video_type/list','post'),(80,'视频分类添加','/video_type/add','post'),(81,'视频分类修改','/video_type/edit','post'),(82,'视频分类删除','/video_type/del','post'),(83,'视频分类状态修改','/video_type/status','post'),(84,'视频分类前台显示修改','/video_type/show','post'),(85,'视频套餐列表','/video_vip/list','post'),(86,'视频套餐添加','/video_vip/add','post'),(87,'视频套餐修改','/video_vip/edit','post'),(88,'视频套餐删除','/video_vip/del','post'),(89,'视频套餐分配','/video_vip/auth','post'),(90,'视频套餐一键上架','/video_vip/fast','post'),(91,'视频分类循环列表','/video_type/type','post'),(92,'代理用户列表','/user/list',NULL),(93,'代理资金流动列表','/money/log',NULL),(94,'代理充值列表','/recharge/list',NULL),(95,'代理提现列表','/pay/list',NULL),(96,'代理订单列表','/order/list',NULL),(97,'用户新增','/user/add',NULL);
/*!40000 ALTER TABLE `ntp_common_admin_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_admin_role`
--

DROP TABLE IF EXISTS `ntp_common_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_admin_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '角色名',
  `status` int(10) DEFAULT NULL COMMENT '状态 1正常 0冻结',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin_role`
--

LOCK TABLES `ntp_common_admin_role` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin_role` DISABLE KEYS */;
INSERT INTO `ntp_common_admin_role` VALUES (1,'超级管理员',1,NULL,NULL),(2,'代理商使用',1,'2021-04-13 10:59:55','2021-04-13 16:51:49'),(5,'营销一部',1,'2021-03-23 11:58:29','2021-03-23 12:00:47'),(6,'营销二部',1,'2021-03-23 11:58:35','2021-03-23 15:11:52');
/*!40000 ALTER TABLE `ntp_common_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_admin_role_menu`
--

DROP TABLE IF EXISTS `ntp_common_admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_admin_role_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL COMMENT '角色ID',
  `auth_ids` varchar(200) DEFAULT NULL COMMENT '权限组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin_role_menu`
--

LOCK TABLES `ntp_common_admin_role_menu` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin_role_menu` DISABLE KEYS */;
INSERT INTO `ntp_common_admin_role_menu` VALUES (1,1,'708,28,26,25,709,29'),(2,6,'30,6,32'),(3,5,'11,715,50,49'),(4,2,'56,55,54,53,52,6,30');
/*!40000 ALTER TABLE `ntp_common_admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_admin_role_power`
--

DROP TABLE IF EXISTS `ntp_common_admin_role_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_admin_role_power` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL COMMENT '角色ID',
  `auth_ids` varchar(200) DEFAULT NULL COMMENT '权限集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin_role_power`
--

LOCK TABLES `ntp_common_admin_role_power` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin_role_power` DISABLE KEYS */;
INSERT INTO `ntp_common_admin_role_power` VALUES (1,1,'72,71,70,69'),(2,6,'69,1,71,70,20'),(3,5,'90,89,88,87,85,86,84,82,81,80,79,77,76,75,74,20,91'),(4,2,'69,20,94,95,96,93,92,71,97,54');
/*!40000 ALTER TABLE `ntp_common_admin_role_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_admin_token`
--

DROP TABLE IF EXISTS `ntp_common_admin_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_admin_token` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT '登陆凭证',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `admin_uid` int(10) DEFAULT NULL COMMENT '管理员ID',
  `type` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='后台确定单点登陆';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin_token`
--

LOCK TABLES `ntp_common_admin_token` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin_token` DISABLE KEYS */;
INSERT INTO `ntp_common_admin_token` VALUES (2,'dc86778dced9e0b1c4b90ccaa7292612n1imj8kxjoe0rx0t08qy6','2022-12-29 11:58:32',1,1);
/*!40000 ALTER TABLE `ntp_common_admin_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_agent`
--

DROP TABLE IF EXISTS `ntp_common_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_agent` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_account` varchar(32) DEFAULT NULL COMMENT '代理账号',
  `agent_pwd` varchar(64) DEFAULT NULL COMMENT '代理密码',
  `agent_type` tinyint(1) DEFAULT NULL COMMENT '代理类型 1 3级代理 2无限级代理',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `balance` decimal(12,2) DEFAULT '0.00' COMMENT '可用余额',
  `total_money` decimal(12,2) DEFAULT '0.00' COMMENT '累计赚佣',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1正常 0冻结',
  `mask_code` varchar(200) DEFAULT NULL COMMENT '代理掩码',
  `tg_url` varchar(255) NOT NULL COMMENT '推广地址',
  `agreement` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 http  1https',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='代理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_agent`
--

LOCK TABLES `ntp_common_agent` WRITE;
/*!40000 ALTER TABLE `ntp_common_agent` DISABLE KEYS */;
INSERT INTO `ntp_common_agent` VALUES (1,'daili1','MTIzNDU2',2,'2021-03-18 15:28:05',200.00,200.00,1,'asdsd','abc',1),(2,'daili2','MTIzNDU2',2,NULL,500.00,500.00,1,'qweqwe','bcd',1),(3,'daili3','MTIzNDU2',1,'2021-03-18 15:28:05',200.00,200.00,1,'dqwe','fef',1);
/*!40000 ALTER TABLE `ntp_common_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_article`
--

DROP TABLE IF EXISTS `ntp_common_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL COMMENT '分类',
  `content` longtext COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `thumb_url` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `author` varchar(200) DEFAULT NULL COMMENT '作者',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_article`
--

LOCK TABLES `ntp_common_article` WRITE;
/*!40000 ALTER TABLE `ntp_common_article` DISABLE KEYS */;
INSERT INTO `ntp_common_article` VALUES (1,16,'<p>123123</p>','2021-04-08 09:49:20','2021-04-08 09:51:25','/topic/20210408\\3bed1e96d34e0c72330a6f376adfc3fd.png','123','123','123');
/*!40000 ALTER TABLE `ntp_common_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_article_type`
--

DROP TABLE IF EXISTS `ntp_common_article_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_article_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '分类名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_article_type`
--

LOCK TABLES `ntp_common_article_type` WRITE;
/*!40000 ALTER TABLE `ntp_common_article_type` DISABLE KEYS */;
INSERT INTO `ntp_common_article_type` VALUES (2,'文具用品'),(4,'电脑办公'),(7,'生活用品'),(5,'首饰'),(9,'茶具'),(10,'纸巾'),(11,'地板'),(12,'电器'),(13,'手机'),(14,'图书'),(15,'电子听书'),(16,'图文书籍'),(17,'国家大事'),(18,'风水轮流');
/*!40000 ALTER TABLE `ntp_common_article_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_home_token`
--

DROP TABLE IF EXISTS `ntp_common_home_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_home_token` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT '登陆凭证',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` int(10) DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_home_token`
--

LOCK TABLES `ntp_common_home_token` WRITE;
/*!40000 ALTER TABLE `ntp_common_home_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_home_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_login_log`
--

DROP TABLE IF EXISTS `ntp_common_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `unique` int(10) DEFAULT NULL COMMENT '管理员、用户id',
  `login_type` tinyint(1) DEFAULT '1' COMMENT '类型 1后台管理员 2用户 3代理',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '登陆IP',
  `login_equipment` varchar(250) DEFAULT NULL COMMENT '登陆设备',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='登陆日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_login_log`
--

LOCK TABLES `ntp_common_login_log` WRITE;
/*!40000 ALTER TABLE `ntp_common_login_log` DISABLE KEYS */;
INSERT INTO `ntp_common_login_log` VALUES (1,1,1,'2022-12-27 10:28:44','45.116.162.15','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36'),(2,1,1,'2022-12-27 10:57:00','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'),(3,1,1,'2022-12-27 10:57:04','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'),(4,1,1,'2022-12-27 11:11:02','171.216.157.37','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'),(5,1,1,'2022-12-27 11:14:29','171.216.157.37','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'),(6,1,1,'2022-12-28 16:03:11','203.91.85.96','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(7,1,1,'2022-12-28 16:03:11','203.91.85.96','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(8,1,1,'2022-12-28 19:21:31','117.173.168.121','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(9,1,1,'2022-12-28 19:42:20','117.173.168.121','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(10,1,1,'2022-12-29 11:28:40','117.173.168.121','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(11,1,1,'2022-12-29 11:30:43','117.173.168.121','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(12,1,1,'2022-12-29 11:58:32','117.173.168.121','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36');
/*!40000 ALTER TABLE `ntp_common_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_market_level`
--

DROP TABLE IF EXISTS `ntp_common_market_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_market_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID 序号 自增',
  `mkey` int(11) NOT NULL COMMENT 'key',
  `mvalue` varchar(200) NOT NULL COMMENT 'value',
  `morder` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='市场部等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_market_level`
--

LOCK TABLES `ntp_common_market_level` WRITE;
/*!40000 ALTER TABLE `ntp_common_market_level` DISABLE KEYS */;
INSERT INTO `ntp_common_market_level` VALUES (1,90,'股东',0),(2,80,'总代',NULL),(3,70,'代理',NULL),(4,60,'管理',NULL),(6,40,'普工',NULL),(5,50,'客服',NULL);
/*!40000 ALTER TABLE `ntp_common_market_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_market_relation`
--

DROP TABLE IF EXISTS `ntp_common_market_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_market_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID 序号 自增',
  `aid` int(11) NOT NULL COMMENT '市场部ID',
  `a_level` int(11) NOT NULL COMMENT '市场部管理员',
  `pid` int(11) NOT NULL COMMENT '父级ID',
  `p_level` int(11) NOT NULL COMMENT '父级级别',
  `path` text NOT NULL COMMENT '用户来源路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='市场部关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_market_relation`
--

LOCK TABLES `ntp_common_market_relation` WRITE;
/*!40000 ALTER TABLE `ntp_common_market_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_market_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_notice`
--

DROP TABLE IF EXISTS `ntp_common_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL COMMENT '公告内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '公告状态 1上架 0下架',
  `position` tinyint(2) DEFAULT NULL COMMENT '公告位置 xxx',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_notice`
--

LOCK TABLES `ntp_common_notice` WRITE;
/*!40000 ALTER TABLE `ntp_common_notice` DISABLE KEYS */;
INSERT INTO `ntp_common_notice` VALUES (1,'这里是系统通知，非常棒的系统通知！','2021-03-22 16:51:33',1,1);
/*!40000 ALTER TABLE `ntp_common_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_notify`
--

DROP TABLE IF EXISTS `ntp_common_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_notify` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL COMMENT '通知类型 1全体 2私人',
  `status` tinyint(1) DEFAULT NULL COMMENT '通知状态 1上架 0下架',
  `unique` text COMMENT '类型=2时 ，相关人员，以'',''分割',
  `create_time` datetime DEFAULT NULL COMMENT '通知时间',
  `mark` varchar(200) DEFAULT NULL COMMENT '通知内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_notify`
--

LOCK TABLES `ntp_common_notify` WRITE;
/*!40000 ALTER TABLE `ntp_common_notify` DISABLE KEYS */;
INSERT INTO `ntp_common_notify` VALUES (1,1,1,'1,2,3,4,5','2021-03-19 10:05:26','小王上线了'),(2,1,1,'1','2021-03-19 16:38:09','你被击杀了'),(3,2,1,'1','2021-03-19 16:38:22','代领工资100元'),(4,1,1,'','2021-03-19 16:48:18','你有一个大礼包可领取'),(5,2,1,'','2021-03-22 16:07:31','注册就送会员'),(6,1,1,'1','2021-03-22 16:07:31','兑换实物礼包哦'),(7,1,1,'1','2021-03-22 16:07:31','兑换游戏礼包哦'),(8,2,1,'','2021-03-22 16:07:31','你有一个道具快过去了'),(9,1,1,'','2021-03-22 16:07:31','你的队友来了');
/*!40000 ALTER TABLE `ntp_common_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_order`
--

DROP TABLE IF EXISTS `ntp_common_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `market_uid` int(11) NOT NULL DEFAULT '0' COMMENT '业务员',
  `admin_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作员ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_price` decimal(10,0) NOT NULL COMMENT '支付金额',
  `pay_no` varchar(200) NOT NULL COMMENT '订单号',
  `describe_order` varchar(200) NOT NULL COMMENT '订单描述',
  `goods_info` text COMMENT '商品所有信息',
  `pay_channel` varchar(200) DEFAULT NULL COMMENT '订单渠道',
  `ip` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_order`
--

LOCK TABLES `ntp_common_order` WRITE;
/*!40000 ALTER TABLE `ntp_common_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_pay_cash`
--

DROP TABLE IF EXISTS `ntp_common_pay_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_pay_cash` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '提现时间',
  `success_time` datetime DEFAULT NULL COMMENT '到账时间（审核时间）',
  `money` decimal(30,2) DEFAULT NULL COMMENT '提现金额',
  `money_balance` decimal(30,2) DEFAULT NULL COMMENT '用户余额',
  `money_fee` decimal(30,2) DEFAULT NULL COMMENT '手续费',
  `momey_actual` decimal(30,2) DEFAULT NULL COMMENT '实际到账金额',
  `msg` varchar(200) DEFAULT NULL COMMENT '备注',
  `u_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `u_ip` varchar(200) DEFAULT NULL COMMENT '用户IP',
  `u_city` varchar(200) DEFAULT NULL COMMENT '用户地区',
  `admin_uid` int(10) DEFAULT NULL COMMENT '管理员ID',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `pay_type` varchar(200) DEFAULT NULL COMMENT '支付方式',
  `u_bank_name` varchar(200) DEFAULT NULL COMMENT '用户收款银行名',
  `u_back_card` varchar(200) DEFAULT NULL COMMENT '用户收款账号',
  `u_back_user_name` varchar(200) DEFAULT NULL COMMENT '用户收款名',
  `market_uid` int(10) DEFAULT '0' COMMENT '业务员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_pay_cash`
--

LOCK TABLES `ntp_common_pay_cash` WRITE;
/*!40000 ALTER TABLE `ntp_common_pay_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_pay_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_pay_money_log`
--

DROP TABLE IF EXISTS `ntp_common_pay_money_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_pay_money_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '时间',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型 1收入 2支出 3后台修改金额 4提现退款',
  `status` int(3) DEFAULT NULL COMMENT '详细类型 101充值，201提现',
  `money_before` decimal(30,2) DEFAULT '0.00' COMMENT '变化前金额',
  `money_end` decimal(30,2) DEFAULT '0.00' COMMENT '变化后金额',
  `money` decimal(30,2) DEFAULT NULL COMMENT '变化金额',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `source_id` int(10) DEFAULT NULL COMMENT '源头ID',
  `market_uid` int(10) DEFAULT '0' COMMENT '业务员ID',
  `mark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资金流水表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_pay_money_log`
--

LOCK TABLES `ntp_common_pay_money_log` WRITE;
/*!40000 ALTER TABLE `ntp_common_pay_money_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_pay_money_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_pay_recharge`
--

DROP TABLE IF EXISTS `ntp_common_pay_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_pay_recharge` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '充值时间',
  `success_time` datetime DEFAULT NULL COMMENT '到账时间(审核时间)',
  `money` decimal(30,2) DEFAULT NULL COMMENT '充值金额',
  `admin_uid` int(10) DEFAULT NULL COMMENT '管理员ID',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `u_ip` varchar(200) DEFAULT NULL COMMENT '用户ip',
  `u_city` varchar(200) DEFAULT NULL COMMENT '地区',
  `sys_bank_id` varchar(200) DEFAULT NULL COMMENT '收款账号',
  `u_bank_name` varchar(200) DEFAULT NULL COMMENT '打款银行名',
  `u_bank_user_name` varchar(200) DEFAULT NULL COMMENT '打款用户名',
  `u_bank_card` varchar(200) DEFAULT NULL COMMENT '打款银行卡号',
  `market_uid` int(10) DEFAULT '0' COMMENT '业务员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_pay_recharge`
--

LOCK TABLES `ntp_common_pay_recharge` WRITE;
/*!40000 ALTER TABLE `ntp_common_pay_recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_pay_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_pay_sys_bank`
--

DROP TABLE IF EXISTS `ntp_common_pay_sys_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_pay_sys_bank` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '银行名',
  `card` varchar(200) DEFAULT NULL COMMENT '银行卡号',
  `account_name` varchar(200) DEFAULT NULL COMMENT '开户名',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 -1删除 1正常',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否默认 1默认',
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='银行卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_pay_sys_bank`
--

LOCK TABLES `ntp_common_pay_sys_bank` WRITE;
/*!40000 ALTER TABLE `ntp_common_pay_sys_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_pay_sys_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_sys_config`
--

DROP TABLE IF EXISTS `ntp_common_sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_sys_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '配置中文名称',
  `value` varchar(200) DEFAULT NULL COMMENT '约束条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='后台配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_sys_config`
--

LOCK TABLES `ntp_common_sys_config` WRITE;
/*!40000 ALTER TABLE `ntp_common_sys_config` DISABLE KEYS */;
INSERT INTO `ntp_common_sys_config` VALUES (1,'web_name','管理系统'),(2,'logo_url','/logo.png'),(3,'web_keywords','关键词'),(4,'web_description','描述'),(5,'app_down_ios','http://www.baiduc.com'),(6,'app_down_android','http://www.baiduc.com'),(7,'video_single_price','1.2');
/*!40000 ALTER TABLE `ntp_common_sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_sys_ip_config`
--

DROP TABLE IF EXISTS `ntp_common_sys_ip_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_sys_ip_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '约束条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='后台配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_sys_ip_config`
--

LOCK TABLES `ntp_common_sys_ip_config` WRITE;
/*!40000 ALTER TABLE `ntp_common_sys_ip_config` DISABLE KEYS */;
INSERT INTO `ntp_common_sys_ip_config` VALUES (1,'223.87.36.191',1),(9,'127.0.0.1',1);
/*!40000 ALTER TABLE `ntp_common_sys_ip_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_today_count`
--

DROP TABLE IF EXISTS `ntp_common_today_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_today_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `dates` date NOT NULL COMMENT '日期',
  `today_register` int(11) NOT NULL DEFAULT '0' COMMENT '注册',
  `today_withdrawal` int(11) NOT NULL DEFAULT '0' COMMENT '提现',
  `today_recharge` int(11) NOT NULL DEFAULT '0' COMMENT '充值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='每日充值提现注册统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_today_count`
--

LOCK TABLES `ntp_common_today_count` WRITE;
/*!40000 ALTER TABLE `ntp_common_today_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_today_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_upload`
--

DROP TABLE IF EXISTS `ntp_common_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `click` float(255,0) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_upload`
--

LOCK TABLES `ntp_common_upload` WRITE;
/*!40000 ALTER TABLE `ntp_common_upload` DISABLE KEYS */;
INSERT INTO `ntp_common_upload` VALUES (29,'WeChat_20221012140631.mp4',8.25,'video/mp4','0',1672214654,NULL,NULL,'upload/WeChat_20221012140631.mp4',1672214654,0),(28,'mmexport1665827080306.mp4',17.66,'video/mp4','0',1672212771,NULL,NULL,'upload/mmexport1665827080306.mp4',1672212771,0);
/*!40000 ALTER TABLE `ntp_common_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_user`
--

DROP TABLE IF EXISTS `ntp_common_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_name` varchar(200) DEFAULT NULL COMMENT '账号',
  `pwd` varchar(64) DEFAULT 'MTIzNDU2' COMMENT '密码',
  `withdraw_pwd` varchar(64) NOT NULL DEFAULT 'aa123456' COMMENT '提现密码',
  `nickname` varchar(24) DEFAULT NULL COMMENT '昵称',
  `type` tinyint(1) DEFAULT '1' COMMENT '账号类型 1代理 2会员',
  `vip_grade` int(10) DEFAULT '0' COMMENT '会员等级',
  `status` tinyint(1) DEFAULT '1' COMMENT '账号状态 1正常 0冻结',
  `state` tinyint(1) DEFAULT '0' COMMENT '是否在线 1在线 0下线',
  `money_balance` decimal(12,2) DEFAULT '0.00' COMMENT '可用余额',
  `money_freeze` decimal(12,2) DEFAULT '0.00' COMMENT '冻结金额',
  `money_total_recharge` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '累积充值',
  `money_total_withdraw` decimal(12,2) DEFAULT '0.00' COMMENT '累计提现',
  `money_total_agent` decimal(10,0) DEFAULT NULL COMMENT '代理商余额',
  `is_real_name` tinyint(1) DEFAULT '0' COMMENT '是否实名 1已实名 0未实名',
  `market_uid` int(10) DEFAULT '0' COMMENT '业务员ID',
  `is_fictitious` tinyint(1) DEFAULT '0' COMMENT '是否虚拟账号 1是 0否',
  `agent_id_1` int(10) DEFAULT NULL COMMENT '上级代理（三级分销）',
  `agent_id_2` int(10) DEFAULT NULL COMMENT '上上级代理（三级分销）',
  `agent_id_3` int(10) DEFAULT NULL COMMENT '上上上级代理（三级分销）',
  `agent_id` int(10) DEFAULT NULL COMMENT '上级代理（无限级分销）',
  `agent_rate` decimal(12,2) DEFAULT NULL COMMENT '分销比例（%）',
  `invitation_code` varchar(200) DEFAULT NULL COMMENT '邀请码',
  `phone` varchar(200) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_user`
--

LOCK TABLES `ntp_common_user` WRITE;
/*!40000 ALTER TABLE `ntp_common_user` DISABLE KEYS */;
INSERT INTO `ntp_common_user` VALUES (1,'2021-03-15 16:37:15','usertest','MTIzNDU2','123456','昵称',2,1,1,0,1.00,50.00,0.00,0.00,1,5,1,5,2,3,4,NULL,1.00,'5','18060989004',0);
/*!40000 ALTER TABLE `ntp_common_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_user_pay_bank`
--

DROP TABLE IF EXISTS `ntp_common_user_pay_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_user_pay_bank` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `card` varchar(200) DEFAULT NULL COMMENT '银行卡号',
  `name` varchar(200) DEFAULT NULL COMMENT '银行名称',
  `user_name` varchar(200) DEFAULT NULL COMMENT '开户名',
  `u_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态  -1删除',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_user_pay_bank`
--

LOCK TABLES `ntp_common_user_pay_bank` WRITE;
/*!40000 ALTER TABLE `ntp_common_user_pay_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_user_pay_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_user_real_name`
--

DROP TABLE IF EXISTS `ntp_common_user_real_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_user_real_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '真实姓名',
  `card_id` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `positive_url` varchar(255) DEFAULT NULL COMMENT '用户身份证正面图',
  `back_url` varchar(255) DEFAULT NULL COMMENT '用户身份证反面图',
  `create_time` datetime DEFAULT NULL COMMENT '时间',
  `u_id` int(10) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='身份证号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_user_real_name`
--

LOCK TABLES `ntp_common_user_real_name` WRITE;
/*!40000 ALTER TABLE `ntp_common_user_real_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_user_real_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_update_video`
--

DROP TABLE IF EXISTS `ntp_update_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_update_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号 ID 自增',
  `admin_uid` int(11) NOT NULL COMMENT '管理员ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `video_name` varchar(300) NOT NULL COMMENT '文件名称及路径',
  `m3u8_name` varchar(300) NOT NULL COMMENT '文件及路径',
  `status` int(11) NOT NULL COMMENT '状态 0 待审核 1 正常 -1 删除 ',
  `slice_msg` varchar(600) NOT NULL COMMENT '切片信息',
  `finsh_time` datetime NOT NULL COMMENT '完成时间',
  `update_status` int(11) NOT NULL COMMENT '上传状态 0 上传中  1 已完成',
  `change_status` int(11) NOT NULL COMMENT '更新状态',
  `name` varchar(300) NOT NULL COMMENT '文件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户上传视频表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_update_video`
--

LOCK TABLES `ntp_update_video` WRITE;
/*!40000 ALTER TABLE `ntp_update_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_update_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ntp_video_update'
--

--
-- Dumping routines for database 'ntp_video_update'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 16:13:51
