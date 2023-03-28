-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: ntp_video
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
-- Table structure for table `ntp_adposition`
--

DROP TABLE IF EXISTS `ntp_adposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_adposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `width` smallint(4) DEFAULT NULL,
  `height` smallint(4) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_adposition`
--

LOCK TABLES `ntp_adposition` WRITE;
/*!40000 ALTER TABLE `ntp_adposition` DISABLE KEYS */;
INSERT INTO `ntp_adposition` VALUES (1,'轮播图',NULL,NULL,1588814279),(2,'弹窗广告',NULL,NULL,1588814290),(3,'海报',NULL,NULL,1588814290);
/*!40000 ALTER TABLE `ntp_adposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_ads`
--

DROP TABLE IF EXISTS `ntp_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_ads` (
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
-- Dumping data for table `ntp_ads`
--

LOCK TABLES `ntp_ads` WRITE;
/*!40000 ALTER TABLE `ntp_ads` DISABLE KEYS */;
INSERT INTO `ntp_ads` VALUES (29,1,NULL,0,'storage/ads/20220802/f5cf637854375613e9b32571abf311d3.jpg','',7,1,1592201950),(42,1,NULL,1,'storage/ads/20220802/9014604448521051a80f4bd3f4dc151e.jpg','',8,2,1658440886),(43,1,NULL,1,'storage/ads/20220802/19f63db1c243299e00f8ecbdc2d66918.png','',9,1,1658441035),(44,1,NULL,1,'storage/ads/20220802/d4902c0648ff5f3f9a2d564e09566f62.jpg','',10,1,1658441113),(50,1,NULL,0,'storage/ads/20220802/e7291550c742a16e1b7b177007796ff1.jpg','',1,2,1659431711);
/*!40000 ALTER TABLE `ntp_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_auth_group`
--

DROP TABLE IF EXISTS `ntp_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_auth_group` (
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
-- Dumping data for table `ntp_auth_group`
--

LOCK TABLES `ntp_auth_group` WRITE;
/*!40000 ALTER TABLE `ntp_auth_group` DISABLE KEYS */;
INSERT INTO `ntp_auth_group` VALUES (1,'超级管理员',NULL,1,'83,3,2,1,86,85,57,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,52,28,23,22,36,35,34,33,32,31,30,29,53,38,44,43,42,41,48,47,46,45,78,77,76,75,74,73,72,71,70,66,65,64,63,84,82,69,68,67',''),(5,'广告管理',NULL,1,'44,43,42,41',''),(6,'运营',NULL,1,'101,91,90,89,83,3,2,1,105,104,103,102,86,85,57,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,52,28,23,22,31,30,29,38,96,95,94,93,92,44,43,42,41,84,48,47,46,45,111,110,109,108,107,106,100,99,98,78,77,76,75,74,73,72,71,70,66,65,64,63,97,82,69,68,67',''),(7,'代理上传',NULL,1,'116,115,114,113,101,91,90,89,83,3,2,1','');
/*!40000 ALTER TABLE `ntp_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_auth_group_access`
--

DROP TABLE IF EXISTS `ntp_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_auth_group_access` (
  `uid` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_auth_group_access`
--

LOCK TABLES `ntp_auth_group_access` WRITE;
/*!40000 ALTER TABLE `ntp_auth_group_access` DISABLE KEYS */;
INSERT INTO `ntp_auth_group_access` VALUES (9,2),(10,2),(11,2),(12,2),(13,4),(14,3),(15,3),(16,3),(8,1),(9,5),(10,6),(11,5),(12,5),(13,1),(14,7);
/*!40000 ALTER TABLE `ntp_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_auth_module`
--

DROP TABLE IF EXISTS `ntp_auth_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_auth_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_auth_module`
--

LOCK TABLES `ntp_auth_module` WRITE;
/*!40000 ALTER TABLE `ntp_auth_module` DISABLE KEYS */;
INSERT INTO `ntp_auth_module` VALUES (1,'用户管理',NULL,1590116499,1590116499),(2,'产品管理',NULL,1590116517,1590116517),(3,'订单管理',NULL,1590116524,1590116524),(5,'权限管理',NULL,1590116537,1590116537),(6,'系统设置',NULL,1590116544,1590116544),(7,'图片管理',NULL,1590116550,1590116550),(8,'消息通知',NULL,1590116557,1590116557),(11,'配置项',NULL,1597816056,NULL),(12,'财务管理',NULL,1597816056,NULL);
/*!40000 ALTER TABLE `ntp_auth_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_auth_rule`
--

DROP TABLE IF EXISTS `ntp_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `condition` int(11) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_auth_rule`
--

LOCK TABLES `ntp_auth_rule` WRITE;
/*!40000 ALTER TABLE `ntp_auth_rule` DISABLE KEYS */;
INSERT INTO `ntp_auth_rule` VALUES (1,'Member/index','用户列表',NULL,1,1,1590116605,1590116605),(2,'Member/edit','用户编辑',NULL,1,1,1590116637,1590116637),(3,'Member/detail','用户详情',NULL,1,1,1590116657,1590116657),(6,'Types/index','产品模型',NULL,2,1,1590116749,1590116749),(7,'Types/add','新增产品模型',NULL,2,1,1590116764,1590116764),(8,'Types/edit','修改产品模型',NULL,2,1,1590116779,1590116779),(9,'Types/delete','删除产品模型',NULL,2,1,1590116791,1590116791),(10,'Types/specs','产品规格',NULL,2,1,1590116804,1590116804),(11,'Types/addspecs','新增规格',NULL,2,1,1590116816,1590116816),(12,'Types/editspec','编辑规格',NULL,2,1,1590116826,1590116826),(13,'Types/specdel','删除规格',NULL,2,1,1590116837,1590116837),(14,'Category/index','产品分类',NULL,2,1,1590116848,1590116848),(15,'Category/add','新增分类',NULL,2,1,1590116858,1590116858),(16,'Category/edit','编辑分类',NULL,2,1,1590116869,1590116869),(17,'Category/delete','删除分类',NULL,2,1,1590116881,1590116881),(18,'Goods/index','产品列表1',NULL,2,1,1590116892,1590116892),(19,'Goods/add','新增产品',NULL,2,1,1590116904,1590116904),(20,'Goods/edit','编辑产品',NULL,2,1,1590116917,1590116917),(21,'Goods/delete','删除产品',NULL,2,1,1590116930,1590116930),(22,'Order/index','订单列表',NULL,3,1,1590116941,1590116941),(23,'Order/detail','订单详情',NULL,3,1,1590116953,1590116953),(28,'Order/delete','订单删除',NULL,3,1,1590117176,1590117176),(29,'AuthUser/index','管理员列表',NULL,5,1,1590117216,1590117216),(30,'AuthUser/add','新增管理员',NULL,5,1,1590117230,1590117230),(31,'AuthUser/edit','编辑管理员',NULL,5,1,1590117244,1590117244),(32,'AuthUser/delete','删除管理员',NULL,5,1,1590117256,1590117256),(33,'AuthGroup/index','角色管理',NULL,5,1,1590117267,1590117267),(34,'AuthGroup/add','新增角色',NULL,5,1,1590117279,1590117279),(35,'AuthGroup/edit','编辑角色',NULL,5,1,1590117294,1590117294),(36,'AuthGroup/delete','删除角色',NULL,5,1,1590117317,1590117317),(38,'Webset/index','系统设置列表',NULL,6,1,1590117357,1590117357),(41,'Ads/index','图片管理',NULL,7,1,1590117407,1590117407),(42,'Ads/add','新增图片',NULL,7,1,1590117417,1590117417),(43,'Ads/edit','编辑图片',NULL,7,1,1590117428,1590117428),(44,'Ads/delete','删除图片',NULL,7,1,1590117440,1590117440),(45,'Notice/index','消息列表',NULL,8,1,1590117462,1590117462),(46,'Notice/add','新增消息',NULL,8,1,1590117487,1590117487),(47,'Notice/edit','编辑消息',NULL,8,1,1590117498,1590117498),(48,'Notice/delete','删除消息',NULL,8,1,1590117508,1590117508),(52,'Order/sure','确认发货',NULL,3,1,1591331504,1591331504),(57,'Goods/updateSta','上下架',NULL,2,1,1592809789,1592809789),(63,'Peizhi/index','VIP等级配置',NULL,11,1,1598002163,1598002163),(64,'Pezhi/sanji','三级返佣比例',NULL,11,1,NULL,NULL),(65,'Peizhi/qd','签到注册等奖励',NULL,11,1,NULL,NULL),(66,'Peizhi/cid','充值账号管理',NULL,11,1,NULL,NULL),(67,'Log/chonzhi','充值日志',NULL,12,1,NULL,NULL),(68,'Log/fanyon','返佣日志',NULL,12,1,NULL,NULL),(69,'Tx/index','提现申请列表',NULL,12,1,NULL,NULL),(70,'Peizhi/edit_vip','修改 vip配置',NULL,11,1,NULL,NULL),(71,'Peizhi/edit_sanji','修改三级返佣比例',NULL,11,1,NULL,NULL),(72,'Peizhi/edit_qd','修改签到',NULL,11,1,NULL,NULL),(73,'Peizhi/add_cid','添加支付信息',NULL,11,1,NULL,NULL),(74,'Peizhi/edit_cid','编辑支付信息',NULL,11,1,NULL,NULL),(75,'Peizhi/switchs','支付信息切换',NULL,11,1,NULL,NULL),(76,'Peizhi/gindex','关于我们列表',NULL,11,1,NULL,NULL),(77,'Peizhi/addg','添加关于我们',NULL,11,1,NULL,NULL),(78,'Peizhi/edit_g','编辑关于我们',NULL,11,1,NULL,NULL),(82,'Log/gmjl','购买商品获取积分等记录',NULL,12,1,NULL,NULL),(83,'Member/team','团队查询',NULL,1,1,NULL,NULL),(84,'Log/msg_log','站内消息',NULL,8,1,NULL,NULL),(85,'Cpin/pl','评论管理',NULL,2,1,NULL,NULL),(86,'Cpin/del','删除评论',NULL,2,1,NULL,NULL),(89,'Member/add','添加用户',NULL,1,1,NULL,NULL),(90,'Member/chonzhi','充值',NULL,1,1,NULL,NULL),(91,'Member/jianzhi','减值',NULL,1,1,NULL,NULL),(92,'Ads/updateSta','轮播图开关',NULL,7,1,NULL,NULL),(93,'Headimg/index','头像列表',NULL,7,1,NULL,NULL),(94,'Headimg/add','添加头像',NULL,7,1,NULL,NULL),(95,'Headimg/edit','编辑头像',NULL,7,1,NULL,NULL),(96,'Headimg/delete','删除头像',NULL,7,1,NULL,NULL),(97,'Log/chonzhi_sh','审核充值',NULL,12,1,NULL,NULL),(98,'Peizhi/add_cid','添加账号',NULL,11,1,NULL,NULL),(99,'Peizhi/is_bili','切换数量和比例',NULL,11,1,NULL,NULL),(100,'Peizhi/sanji','三级返佣比例',NULL,11,1,NULL,NULL),(101,'AuthUser/edit','编辑后台个人信息',NULL,1,1,NULL,NULL),(102,'Category/updateSta','切换显示',NULL,2,1,NULL,NULL),(103,'Goods/edit_pl','新增评论',NULL,2,1,NULL,NULL),(104,'Cpin/edit','编辑评论',NULL,2,1,NULL,NULL),(105,'Cpin/del_pl','删除评论',NULL,2,1,NULL,NULL),(106,'Peizhi/switch','开关管理',NULL,11,1,NULL,NULL),(107,'Peizhi/is_switch','切换',NULL,11,1,NULL,NULL),(108,'Cj/index','常见问题',NULL,11,1,NULL,NULL),(109,'Cj/add','添加问题',NULL,11,1,NULL,NULL),(110,'Cj/edit','编辑问题',NULL,11,1,NULL,NULL),(111,'Cj/del','删除问题',NULL,11,1,NULL,NULL),(113,'upload/cf','上传文件',NULL,1,1,1590116657,1590116657),(114,'Upload/index','上传文件1',NULL,1,1,1590116657,1590116657),(115,'Member/upload','用户上传',NULL,1,1,NULL,NULL),(116,'Member/renew','更新到线上',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `ntp_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_auth_user`
--

DROP TABLE IF EXISTS `ntp_auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_auth_user` (
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
  `video_1` int(11) NOT NULL DEFAULT '0' COMMENT '平台 本平台ID，后面增加',
  `video_2` int(11) NOT NULL DEFAULT '0' COMMENT '麻豆',
  `video_3` int(11) NOT NULL DEFAULT '0' COMMENT '91',
  `video_4` int(11) NOT NULL DEFAULT '0' COMMENT '泛起',
  `video_5` int(11) NOT NULL DEFAULT '0' COMMENT '泡芙',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_auth_user`
--

LOCK TABLES `ntp_auth_user` WRITE;
/*!40000 ALTER TABLE `ntp_auth_user` DISABLE KEYS */;
INSERT INTO `ntp_auth_user` VALUES (7,1,'admin','15928280591','e10adc3949ba59abbe56e057f20f883e',1,NULL,1679903717,1679903717,NULL,0,0,0,0,0),(8,1,'wodage','15866669999','d3b9b8d0cfc5bd9e4c45f4cf7849d719',1,1658368986,1660043677,1660043677,NULL,0,0,0,0,0),(9,5,'guanggao','','e10adc3949ba59abbe56e057f20f883e',1,1658396778,1658396792,1658396792,NULL,0,0,0,0,0),(10,6,'yunying','123456','e10adc3949ba59abbe56e057f20f883e',1,1658397023,1660044106,1660044106,NULL,0,0,0,0,0),(13,1,'kaikai','','71dcc018252ab7cc9ea8376746d4e200',1,1659019774,1659284178,1659284178,NULL,0,0,0,0,0),(14,7,'agent1','18060989001','e10adc3949ba59abbe56e057f20f883e',1,1677742641,1679396200,1679396200,NULL,14,0,0,0,0);
/*!40000 ALTER TABLE `ntp_auth_user` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='后台管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin`
--

LOCK TABLES `ntp_common_admin` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin` DISABLE KEYS */;
INSERT INTO `ntp_common_admin` VALUES (1,'admin','MTIzNDU2','2021-03-11 16:15:26',1,1,'123','0','0'),(12,'admin1','MTIzNDU2','2023-03-10 10:56:43',1,1,'0','0','OZ53YYCVJSERDXQ3');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='后台操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin_log`
--

LOCK TABLES `ntp_common_admin_log` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin_log` DISABLE KEYS */;
INSERT INTO `ntp_common_admin_log` VALUES (1,12,'2023-03-10 18:15:11',NULL,'118.120.134.197',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63','video/add'),(2,12,'2023-03-10 18:18:44',NULL,'118.120.134.197',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63','video/add'),(3,12,'2023-03-10 18:21:27',NULL,'118.120.134.197',NULL,'PostmanRuntime-ApipostRuntime/1.1.0','PostmanRuntime-ApipostRuntime/1.1.0','video/add'),(4,12,'2023-03-10 18:33:05',NULL,'118.120.134.197',NULL,'PostmanRuntime-ApipostRuntime/1.1.0','PostmanRuntime-ApipostRuntime/1.1.0','video/add'),(5,12,'2023-03-10 18:35:24',NULL,'118.120.134.197',NULL,'PostmanRuntime-ApipostRuntime/1.1.0','PostmanRuntime-ApipostRuntime/1.1.0','video/add'),(6,12,'2023-03-10 18:35:34',NULL,'118.120.134.197',NULL,'PostmanRuntime-ApipostRuntime/1.1.0','PostmanRuntime-ApipostRuntime/1.1.0','video/add'),(7,12,'2023-03-10 18:37:19',NULL,'118.120.134.197',NULL,'PostmanRuntime-ApipostRuntime/1.1.0','PostmanRuntime-ApipostRuntime/1.1.0','video/add'),(8,12,'2023-03-10 19:01:22',NULL,'118.120.134.197',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63','video/edit'),(9,1,'2023-03-13 10:15:54',NULL,'118.120.144.221',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','video/edit'),(10,1,'2023-03-13 10:15:55',NULL,'118.120.144.221',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','video/edit'),(11,1,'2023-03-13 10:15:56',NULL,'118.120.144.221',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','video/edit'),(12,1,'2023-03-13 10:16:17',NULL,'118.120.144.221',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','video/edit'),(13,1,'2023-03-13 10:16:18',NULL,'118.120.144.221',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','video/edit'),(14,1,'2023-03-13 10:16:18',NULL,'118.120.144.221',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','video/edit'),(15,1,'2023-03-13 10:16:20',NULL,'118.120.144.221',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69','video/edit'),(16,1,'2023-03-16 16:45:43',NULL,'117.177.209.253',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36','video/edit');
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
INSERT INTO `ntp_common_admin_menu` VALUES (1,0,'控制面板',1,0,'2021-03-25 14:19:22','2021-04-15 14:02:35',NULL,NULL,1),(2,0,'权限管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','','',8),(3,0,'用户管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,2),(4,0,'财务管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,3),(5,0,'市场管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,4),(6,0,'代理商管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,5),(7,0,'公告管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,6),(8,0,'内容管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,7),(9,0,'日志管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,9),(10,0,'系统配置',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22',NULL,NULL,10),(11,0,'视频管理',1,0,'2021-03-30 17:03:32','2021-03-30 17:03:32',NULL,NULL,7),(28,5,'市场部等级列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/platform/marketLevelList',NULL,0),(29,5,'市场部关系列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/platform/marketRelationsList','',0),(30,6,'代理商信息',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/platform/agent',NULL,0),(31,8,'提现列表',0,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/user/withdrawal',NULL,0),(32,2,'菜单列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemset/menulist',NULL,0),(34,2,'角色权限管理',0,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemset/role',NULL,0),(35,3,'用户列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/user/userlist',NULL,0),(36,2,'控制器管理',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemset/controllerlist',NULL,0),(37,2,'角色列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemset/roleadminlist',NULL,0),(38,2,'管理员列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemset/adminlist',NULL,0),(39,1,'控制面板',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/dashboard/console',NULL,0),(40,9,'操作日志',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/actionlog',NULL,0),(41,4,'资金流动',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/moneylog',NULL,0),(42,9,'登陆日志',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/loginlog',NULL,0),(43,10,'配置列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/systemmng/configList',NULL,0),(45,7,'公告列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/notice/noticeList',NULL,0),(46,7,'通知列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/notice/notifyList',NULL,0),(47,8,'文章分类',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/extension/articleType','',0),(48,8,'文章内容列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/extension/articleList',NULL,0),(49,11,'视频分类',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/extension/videoType',NULL,0),(50,11,'视频资源列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/extension/videoList','',0),(52,6,'代理资金流动',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/moneylog','',0),(53,6,'代理充值列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/rechargelog','',0),(54,6,'代理提现列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/withdrawallog','',0),(55,6,'代理订单列表',1,NULL,'2021-03-30 17:03:28','2021-03-30 17:03:30','/log/order','',0),(56,6,'代理用户列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/user/userlist','',0),(708,4,'充值列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/rechargelog',NULL,0),(709,4,'提现列表',1,0,'2021-03-25 14:19:22','2021-03-25 14:19:22','/log/withdrawallog',NULL,0),(714,4,'订单列表',1,NULL,'2021-03-30 17:03:28','2021-03-30 17:03:30','/log/order',NULL,0),(715,11,'视频套餐列表',1,NULL,'2021-03-30 17:03:32','2021-03-30 17:03:33','/extension/videovipList',NULL,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin_power`
--

LOCK TABLES `ntp_common_admin_power` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin_power` DISABLE KEYS */;
INSERT INTO `ntp_common_admin_power` VALUES (1,'用户列表','/admin/list','post'),(2,'用户添加','/admin/add','post'),(3,'用户删除','/admin/del','post'),(4,'用户详情','/admin/detail','post'),(5,'用户信息修改','/admin/edit','post'),(6,'文章内容新增','/article/add','post'),(7,'文章内容查询','/article/detail','post'),(8,'文章内容修改','/article/edit','post'),(9,'文章内容列表','/article/list','post'),(10,'文章内容删除','/article/del','post'),(11,'文章分类删除','/article_type/del','post'),(12,'文章分类查询','/article_type/detail','post'),(13,'文章分类添加','/article_type/add','post'),(14,'文章分类列表','/article_type/list','post'),(15,'文章分类修改','/article_type/edit','post'),(16,'资金流动日志','/money/log','post'),(17,'登陆日志','/login/log','post'),(18,'菜单删除','/menu/del','post'),(19,'菜单查询','/menu/detail','post'),(20,'菜单栏目树','/menu/list','post'),(21,'菜单修改','/menu/edit','post'),(22,'菜单添加','/menu/del','post'),(23,'通知修改','/notify/edit','post'),(24,'通知列表','/notify/list','post'),(25,'通知类型','/notify/notify','post'),(26,'通知添加','/notify/add','post'),(27,'通知删除','/notify/del','post'),(28,'通知状态切换','/notify/status','post'),(29,'通知查询详情','/notify/detail','post'),(30,'公告删除','/notice/del','post'),(31,'公告查询','/notice/detail','post'),(32,'公告列表','/notice/list','post'),(33,'公告状态切换','/notice/status','post'),(34,'公告位置','/notice/position','post'),(35,'公告修改','/notice/edit','post'),(36,'公告新增','/notice/add','post'),(37,'充值列表','/recharge/list','post'),(38,'充值确认','/recharge/status','post'),(39,'提现列表','/pay/list','post'),(40,'提现成功失败修改','/pay/status','post'),(41,'设置支付银行卡默认','/paybank/default','post'),(42,'支付银行卡列表','/paybank/list','post'),(43,'支付银行卡删除','/paybank/del','post'),(44,'设置银行卡默认','/bank/default','post'),(45,'银行卡列表','/bank/list','post'),(46,'银行卡删除','/bank/del','post'),(47,'配置删除','/config/del','post'),(48,'配置列表','/config/list','post'),(49,'配置详情','/config/detail','post'),(50,'配置修改','/config/edit','post'),(51,'配置新增','/config/add','post'),(52,'用户真实信息','/userreal/list','post'),(53,'用户状态修改','/user/status','post'),(54,'用户信息修改','/user/edit','post'),(55,'用户详情','/user/detail','post'),(56,'用户列表','/user/list','post'),(57,'市场部等级列表','/marketlevel/list','post'),(58,'市场部等级新增','/marketlevel/add','post'),(59,'市场部等级修改','/marketlevel/edit','post'),(60,'角色修改','/role/edit','post'),(61,'角色列表','/role/list','post'),(62,'角色新增','/role/edit','post'),(63,'角色菜单权限列表','/rolemenu/list','post'),(64,'角色菜单权限新增','/rolemenu/add','post'),(65,'角色菜单权限改','/rolemenu/edit','post'),(66,'角色API权限添加','/power/add','post'),(67,'角色API权限修改','/power/edit','post'),(68,'角色API权限列表','/power/list','post'),(69,'代理列表','/user/agent','post'),(70,'代理添加','/agent/add','post'),(71,'代理修改','/agent/edit','post'),(72,'代理状态修改','/agent/status','post'),(74,'视频列表','/video/list','post'),(75,'视频添加','/video/add','post'),(76,'视频修改','/video/edit','post'),(77,'视频删除','/video/del','post'),(79,'视频分类列表','/video_type/list','post'),(80,'视频分类添加','/video_type/add','post'),(81,'视频分类修改','/video_type/edit','post'),(82,'视频分类删除','/video_type/del','post'),(83,'视频分类状态修改','/video_type/status','post'),(84,'视频分类前台显示修改','/video_type/show','post'),(85,'视频套餐列表','/video_vip/list','post'),(86,'视频套餐添加','/video_vip/add','post'),(87,'视频套餐修改','/video_vip/edit','post'),(88,'视频套餐删除','/video_vip/del','post'),(89,'视频套餐分配','/video_vip/auth','post'),(90,'视频套餐一键上架','/video_vip/fast','post'),(91,'视频分类循环列表','/video_type/type','post'),(92,'代理用户列表','/user/list',NULL),(93,'代理资金流动列表','/money/log',NULL),(94,'代理充值列表','/recharge/list',NULL),(95,'代理提现列表','/pay/list',NULL),(96,'代理订单列表','/order/list',NULL),(97,'用户新增','/user/add',NULL),(98,'视频平台列表','video/platform','post');
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
INSERT INTO `ntp_common_admin_role_menu` VALUES (1,1,'708,28,26,25,709,29'),(2,6,'30,6,32'),(3,5,'11,715,50,49'),(4,2,'56,55,54,53,52,6,30,50,11');
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
INSERT INTO `ntp_common_admin_role_power` VALUES (1,1,'72,71,70,69'),(2,6,'69,1,71,70,20'),(3,5,'90,89,88,87,85,86,84,82,81,80,79,77,76,75,74,20,91'),(4,2,'69,20,94,95,96,93,92,71,97,54,77,76,75,74,85,91,98');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='后台确定单点登陆';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_admin_token`
--

LOCK TABLES `ntp_common_admin_token` WRITE;
/*!40000 ALTER TABLE `ntp_common_admin_token` DISABLE KEYS */;
INSERT INTO `ntp_common_admin_token` VALUES (1,'752933d4c44cd049b175f7e018713f4301nl5k3x8ahx3d','2023-03-24 10:50:22',1,1),(2,'86832598d09228a6bb628eb85394bea0i84wvqnuyjye2j0','2023-03-15 15:50:37',15,2),(3,'21c1fabb24892b81b8813e654a386225kf1mnq7wnmgdbfz3gwtlzyci','2023-03-20 14:28:27',12,1),(4,'d72ae614e95be473d9ce8bfbc55660f626wg63ef2j79','2023-03-13 11:04:47',16,2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_agent`
--

LOCK TABLES `ntp_common_agent` WRITE;
/*!40000 ALTER TABLE `ntp_common_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_agent_level`
--

DROP TABLE IF EXISTS `ntp_common_agent_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_agent_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID 序号 自增',
  `agent_id` int(11) NOT NULL COMMENT '代理ID 当前用户id',
  `agent_pid` int(11) NOT NULL COMMENT '上级别ID',
  `agent_pid_level` int(11) NOT NULL COMMENT '上级ID层级等级 ',
  `rate` decimal(20,2) NOT NULL COMMENT '分成比例总',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='无限分销比例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_agent_level`
--

LOCK TABLES `ntp_common_agent_level` WRITE;
/*!40000 ALTER TABLE `ntp_common_agent_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_agent_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_agent_path`
--

DROP TABLE IF EXISTS `ntp_common_agent_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_agent_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `path` varchar(255) NOT NULL COMMENT '用户所有上一级',
  `agent_id` int(11) NOT NULL COMMENT '直属代理ID',
  `times` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COMMENT='用户所有上一级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_agent_path`
--

LOCK TABLES `ntp_common_agent_path` WRITE;
/*!40000 ALTER TABLE `ntp_common_agent_path` DISABLE KEYS */;
INSERT INTO `ntp_common_agent_path` VALUES (1,2,'2|',0,'2023-03-13 09:51:42'),(2,3,'3|',0,'2023-03-13 09:51:42'),(3,4,'4|',0,'2023-03-13 09:51:42'),(4,5,'5|',0,'2023-03-13 09:51:42'),(5,6,'6|',0,'2023-03-13 09:51:42'),(6,15,'15|',0,'2023-03-13 09:51:42'),(7,16,'16|',0,'2023-03-13 11:00:01'),(8,17,'17|',0,'2023-03-13 16:30:02'),(9,18,'18|',0,'2023-03-13 16:30:02'),(10,19,'19|',0,'2023-03-13 16:30:02'),(11,20,'20|',0,'2023-03-13 16:30:02'),(12,21,'21|',0,'2023-03-13 16:30:02'),(13,22,'22|',0,'2023-03-13 16:30:02'),(14,23,'23|',0,'2023-03-13 16:30:02'),(15,35,'35|',0,'2023-03-13 17:30:01'),(16,36,'36|',0,'2023-03-13 17:30:01'),(17,37,'37|',0,'2023-03-13 17:30:01'),(18,38,'38|',0,'2023-03-13 17:30:01'),(19,39,'39|',0,'2023-03-13 17:30:01'),(20,40,'40|',0,'2023-03-13 17:30:01'),(21,41,'41|',0,'2023-03-13 17:30:01'),(22,42,'42|',0,'2023-03-13 17:30:01'),(23,43,'43|',0,'2023-03-13 17:30:01'),(24,44,'44|',0,'2023-03-13 17:30:01'),(25,45,'45|',0,'2023-03-13 17:30:01'),(26,46,'46|',0,'2023-03-13 17:30:01'),(27,47,'47|',0,'2023-03-13 17:30:01'),(28,48,'48|',0,'2023-03-13 17:30:01'),(29,49,'49|',0,'2023-03-13 17:30:01'),(30,50,'50|',0,'2023-03-13 18:00:01'),(31,51,'51|',0,'2023-03-13 18:00:01'),(32,52,'52|',0,'2023-03-13 18:00:01'),(33,53,'53|',0,'2023-03-13 18:00:01'),(34,54,'54|',0,'2023-03-13 18:00:01'),(35,55,'55|',0,'2023-03-13 18:00:01'),(36,56,'56|',0,'2023-03-13 18:00:01'),(37,57,'57|',0,'2023-03-13 18:00:01'),(38,58,'58|',0,'2023-03-13 18:00:01'),(39,59,'59|',0,'2023-03-14 13:30:01'),(40,60,'60|',0,'2023-03-14 14:00:02'),(41,61,'61|',0,'2023-03-14 14:30:01'),(42,62,'62|',0,'2023-03-15 16:00:01'),(43,63,'63|',0,'2023-03-16 01:00:01'),(44,64,'64|',0,'2023-03-16 01:00:01'),(45,65,'65|',0,'2023-03-16 10:00:01'),(46,66,'66|',0,'2023-03-16 16:30:01'),(47,67,'67|',0,'2023-03-16 17:00:01'),(48,68,'68|',0,'2023-03-19 11:00:01'),(49,69,'69|',0,'2023-03-20 15:30:01'),(50,70,'70|',0,'2023-03-20 15:30:01'),(51,71,'71|',0,'2023-03-20 16:00:02'),(52,72,'72|',0,'2023-03-20 16:30:01'),(53,73,'73|',0,'2023-03-20 17:30:01'),(54,74,'74|',0,'2023-03-20 17:30:01'),(55,75,'75|',0,'2023-03-20 18:00:01'),(56,76,'76|',0,'2023-03-20 19:00:02'),(57,77,'77|',0,'2023-03-21 10:00:01'),(58,78,'78|',0,'2023-03-21 18:30:02'),(59,79,'79|',0,'2023-03-22 15:00:01'),(60,80,'80|',0,'2023-03-22 15:00:01'),(61,81,'81|',0,'2023-03-23 14:00:01'),(62,82,'82|',0,'2023-03-23 14:30:01'),(63,83,'83|',0,'2023-03-23 19:00:02'),(64,84,'84|',0,'2023-03-23 20:00:01'),(65,85,'85|',0,'2023-03-24 09:00:01'),(66,86,'86|',0,'2023-03-24 14:30:01'),(67,87,'87|',0,'2023-03-24 17:00:02'),(68,88,'88|',0,'2023-03-27 14:30:01'),(69,89,'89|',0,'2023-03-27 14:30:01'),(70,90,'90|',0,'2023-03-27 15:00:01'),(71,91,'91|',0,'2023-03-27 15:00:01'),(72,92,'92|',0,'2023-03-27 15:00:01'),(73,93,'93|',0,'2023-03-27 15:00:01'),(74,94,'94|',0,'2023-03-27 15:00:01'),(75,95,'95|',0,'2023-03-27 15:00:02'),(76,96,'96|',0,'2023-03-27 15:00:02'),(77,97,'97|',0,'2023-03-27 15:00:02'),(78,98,'98|',0,'2023-03-27 16:30:01'),(79,99,'99|',0,'2023-03-27 18:30:01'),(80,100,'100|',0,'2023-03-27 20:30:02'),(81,101,'101|',0,'2023-03-28 00:00:02'),(82,102,'102|',0,'2023-03-28 08:30:01'),(83,103,'103|',0,'2023-03-28 08:30:01'),(84,104,'104|',0,'2023-03-28 09:00:01'),(85,105,'105|',0,'2023-03-28 10:30:01'),(86,106,'106|',0,'2023-03-28 10:30:01'),(87,107,'107|',0,'2023-03-28 10:30:01'),(88,108,'108|',0,'2023-03-28 11:00:01'),(89,109,'109|',0,'2023-03-28 11:30:01'),(90,110,'110|',0,'2023-03-28 11:30:01'),(91,111,'111|',0,'2023-03-28 11:30:01'),(92,112,'112|',0,'2023-03-28 11:30:01'),(93,113,'113|',0,'2023-03-28 11:30:01'),(94,114,'114|',0,'2023-03-28 11:30:01'),(95,115,'115|',0,'2023-03-28 11:30:01'),(96,116,'116|',0,'2023-03-28 11:30:01'),(97,117,'117|',0,'2023-03-28 13:30:02'),(98,118,'118|',0,'2023-03-28 13:30:02');
/*!40000 ALTER TABLE `ntp_common_agent_path` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_article`
--

LOCK TABLES `ntp_common_article` WRITE;
/*!40000 ALTER TABLE `ntp_common_article` DISABLE KEYS */;
INSERT INTO `ntp_common_article` VALUES (1,16,'<p>123123</p>','2021-04-08 09:49:20','2021-04-08 09:51:25','/topic/20210408\\3bed1e96d34e0c72330a6f376adfc3fd.png','123','123','123'),(2,2,NULL,'2021-03-12 14:55:29','2021-03-12 14:55:29',NULL,'一想二干三成功质量是帆，企业是船','伸手挽明月',NULL),(3,2,NULL,'2021-03-12 14:55:29','2021-03-12 14:55:29',NULL,'优质产品，丰厚成果','君心似我心',NULL),(4,2,'<p><img src=\"/topic/20210527/a09c13faa1a8a22c339f28327004d41e.jpg\"></p>','2021-03-12 14:55:29','2021-05-27 10:53:30','/topic/20210527/1ff9b54ed95f0c1807532a812aebbeca.jpg','情同手足友谊长一等二看三落空','超甜的布丁',''),(13,10,NULL,'2021-03-12 14:55:29','2021-03-24 15:34:53',NULL,'生活因拼搏而存在，拼搏因生活而永恒','一语呢喃',NULL),(14,16,NULL,'2021-03-24 15:36:51','2021-03-24 15:36:51',NULL,'持续学习，自我完善','持续学习，自我完善',NULL),(15,18,NULL,'2021-03-29 14:54:07','2021-03-29 15:03:56',NULL,'测试文章','测试文章','thumb_urlthumb_url'),(17,17,'<p>111111111</p>','2021-04-08 09:52:57','2021-04-08 09:52:57','/topic/20210408\\07db52ae3e421ba1628631be35e79d65.jpg','1111111','123123123','1111111111'),(18,16,'<p>asdasdasd</p>','2021-04-08 09:58:22','2021-04-08 09:58:22','/topic/20210408\\f265fa4716f7d1a14004637bb1d5586c.jpg','sadad','asd','asdads');
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
-- Table structure for table `ntp_common_data_ip`
--

DROP TABLE IF EXISTS `ntp_common_data_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_data_ip` (
  `ip_start` varchar(15) DEFAULT NULL COMMENT '起始IP',
  `ip_end` varchar(15) DEFAULT NULL COMMENT '结束IP',
  `num_start` bigint(20) DEFAULT NULL COMMENT '数字起始IP',
  `num_end` bigint(20) DEFAULT NULL COMMENT '数字结束IP',
  `num` int(11) DEFAULT NULL COMMENT 'IP数量',
  `land` varchar(4) DEFAULT NULL COMMENT '大州',
  `region` varchar(30) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `area` varchar(20) DEFAULT NULL COMMENT '区县',
  `country` varchar(20) DEFAULT NULL COMMENT '国家',
  `country_english` varchar(50) DEFAULT NULL COMMENT '国家英文',
  `isp` varchar(40) DEFAULT NULL COMMENT '运营商',
  `country_id` varchar(10) DEFAULT NULL COMMENT '国家代码',
  `international_code` varchar(15) DEFAULT NULL COMMENT '国际区号',
  `region_id` varchar(20) DEFAULT NULL COMMENT '一级行政代码',
  `city_id` varchar(20) DEFAULT NULL COMMENT '二级行政代码',
  `area_id` varchar(20) DEFAULT NULL COMMENT '三级行政代码',
  `lat` varchar(15) DEFAULT NULL COMMENT '经度',
  `lng` varchar(15) DEFAULT NULL COMMENT '纬度'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_data_ip`
--

LOCK TABLES `ntp_common_data_ip` WRITE;
/*!40000 ALTER TABLE `ntp_common_data_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_data_ip` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COMMENT='前台token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_home_token`
--

LOCK TABLES `ntp_common_home_token` WRITE;
/*!40000 ALTER TABLE `ntp_common_home_token` DISABLE KEYS */;
INSERT INTO `ntp_common_home_token` VALUES (1,'e14b02aa2f2097113bcbc89ff9d6d37dmpo773jrr6dv8lbe7r86mw9r','2022-12-02 11:52:05',1),(2,'72595341b6cd6288057f9131e5009d6flcl35a36z7l9a3nu05fkiuou','2023-03-21 09:45:24',2),(3,'dcafc4a1a6c82672dc2427c8a79073e16jaknk3lodo71ksm9gf90x1sy','2023-03-22 14:19:09',3),(4,'a3e279ff6c4732be493843631a450aae7rpvxm9w7mzwmjnqq0lwlzma2y','2023-01-06 23:26:31',4),(5,'78759884016a1ade352d51b23b937236yi9brky8fu4zniod7iojg','2023-03-27 13:54:43',5),(6,'e1dfd856d3af8e24ac9949e6fcd83889r1h52sk8pvl','2023-03-13 11:09:28',6),(7,'2de4fcbc97427a592d9dd43965d8f7245z668applmpton6h8hce0o2oh6k','2023-03-13 16:10:56',20),(8,'28c2c1298542c6618b20a154748678d0pgpgbo1neqv1hdnh','2023-03-13 16:11:44',21),(9,'17b6e27e525d2b9c1c58e85412cda627j34wunfhbe','2023-03-13 16:13:04',22),(10,'a672698298f6d8439aa417b2d179b445c6gi709ns3ugwyyvjvavdb1n3zf','2023-03-13 16:13:07',23),(11,'5dff1759bcaf0513c429ee4172ed8c05b9459uygjfwkxc0a','2023-03-13 17:18:58',24),(12,'034c18b3f92259688ec77a60d0ad25da19gxx3fli61chmdafkf0py821fbsw','2023-03-13 17:19:03',25),(13,'0d17e453ff0a8bbdf46e7fae04359c31ckslapb91f7vxbmocmattbi2j4jcfc','2023-03-13 17:19:10',26),(14,'54f7638622cadb3e05a4afff2c34c6d3yufg49oyn38ut','2023-03-13 17:19:16',27),(15,'3c93f88f30715b9846ebbc8e2cb2c9834wmhra6uozys2hsvhls05q','2023-03-13 17:19:35',28),(16,'06f9545fe8f943cd34e5dfe1532e8776rr7z23wdsndt38xz','2023-03-13 17:19:36',29),(17,'b31ea9600f6a8896314bcae00a37b21f9ur0madz25ss15noda2qg5ky71erbi','2023-03-13 17:19:43',30),(18,'416f1066f7fa7851501ea7cd2c4c863ci24v1kkfkpf4s8it5gi37zuz8n','2023-03-13 17:19:48',31),(19,'4d0369a796b28b199847a6a8904d4861akj87m0x0pxp6lv71rkxgj0p7x2h','2023-03-13 17:20:03',32),(20,'049e74cb2cd265fc760ffca5e71984764m9bm5k8w3','2023-03-13 17:20:04',33),(21,'3e9adf8df80b78f464fd26cc9f1eff2ewzuduai9gyxhxy30px4db','2023-03-13 17:20:11',34),(22,'692f36e3846921073299eb32a550c9a8z094r78murabq6gcg9bpkmk','2023-03-13 17:26:19',35),(23,'85135e1ad063afe3f63bc30b0beb7c0bfepifljc0p3tu5nllpqaj7u4lb','2023-03-13 17:27:10',36),(24,'3841e2e40003c30005cb06f4a54da1534fj159xbn6j44at75fooectd8','2023-03-13 17:27:19',37),(25,'8529913ecc3a186ddcea92be6e61d93dl77dzrwx72gj2ifknop','2023-03-13 17:27:40',38),(26,'0ea379e024c5548fd07a7882bd32b047eikuxw45iox2ba6z2liph','2023-03-13 17:27:44',39),(27,'9abfe99519920ff8ea8680fc34e275b4tzxc29koqo','2023-03-13 17:27:50',40),(28,'5cffc3ac68e46e04bf1ff85d34ac2d255rxdof46162balfkdh3mwanlcc','2023-03-13 17:27:58',41),(29,'3a04d359217cb8a498dbcc16045eaf67066x7ptiqmwixpswa','2023-03-13 17:28:10',42),(30,'282897ca990f367925099f09e5b1933cfhnq23rxxwhe2w5ylpwkcz1kivc','2023-03-13 17:28:17',43),(31,'ee287b5924c3d5e8acae2baec12a0157syml85c3opdesbhq928p','2023-03-13 17:28:29',44),(32,'62c01ee98ae350386f51e8af9481c744kcyixi1j6o5w85srkkca8xl3oiwu','2023-03-13 17:28:32',45),(33,'f2fb42015f07b99b3c25951442b6f6afrx77xrbb914sz','2023-03-13 17:29:14',46),(34,'da2c8efdf9b61579664bf4b7f096c390s6tbfrtqnazx1yyaed8pmgz60v','2023-03-13 17:29:25',47),(35,'2b23b7eedadbc4edf6101e8a0629b574s19cn6przzorsiq2','2023-03-13 17:29:31',48),(36,'5a3bea2d21b193416166071295337229lifdkmxbco2ygsgi1a8425kdj4','2023-03-13 17:30:01',49),(37,'b71d625ef57bedd7b132439e78b5fe072al38xyjmi9rvoyole8mg5n','2023-03-13 17:30:14',50),(38,'1becd26cfb240c2d8ffae013953b9288jopudt6u427tf5a','2023-03-13 17:30:28',51),(39,'18a669f4037b96066628e81912b2edaexsf8pvj3zmc6v0s2wf','2023-03-13 17:31:54',52),(40,'3a07cc51eff36de88d2b6cd9e5c8d1edhq972xpw7jwjq0xevk69qxay1','2023-03-13 17:31:57',53),(41,'27c7a82b8f8dc50bdb8a1a314574ce27i8kf7kez3yn2rsn53gnee1v9ok5x','2023-03-13 17:31:59',54),(42,'f8196afafa3cb18d4f7c126138e3b6d7pifygk2zo81','2023-03-13 17:32:20',55),(43,'487244936032704b88f554b8d890b6fbc4rzkwt760d3ua4lpwgeusdt','2023-03-13 17:33:53',56),(44,'392bc6b39e10e52c36b9d269be57fc2asffeov710lrxw14bhxl','2023-03-13 17:44:23',57),(45,'7bc00378e70cd70582ecb6440ec0c176kzox61o2uy2nwt4nfp070b','2023-03-13 17:48:29',58),(46,'f63176ced3caece920c3999b38f5ff48oggz2umh9qmx3ikr14eo','2023-03-14 13:29:07',59),(47,'262ef796491bf60f3ddc50987178c0baaagyitk800','2023-03-14 13:57:08',60),(48,'151de52d66342d24a93ea2ad8e435020b0rnmmlmqa6t025mcmmzw0ygx0','2023-03-14 14:05:59',61),(49,'76620a02a6a1b854663ea8b5f85e295dngws1waploo2ld','2023-03-15 15:42:38',62),(50,'3d86564b756434fddfa625c255445dc4fekbifomx0eaw','2023-03-16 00:56:23',63),(51,'3d86564b756434fddfa625c255445dc4hcfssa23444vkhwptkmcft','2023-03-16 00:56:23',64),(52,'e135b5cb3a4241741d6a2c33cf5749ea6ug7ppk9vy7ma','2023-03-16 09:42:16',65),(53,'439ee6fbe8a253961c765639ededeed1g95wekbvajivlb5j3g0oq40lfcgwq8','2023-03-16 16:03:14',66),(54,'358d0fac855a2bc0bd4756b6bf6901fa0aqjri9l097o8sa4h','2023-03-27 13:52:28',15),(55,'78c59277ee3447e26f346ecfcb9e41757hry8bxszax1uozopywvn79k','2023-03-28 11:40:58',67),(56,'c09b956fc3176755404bbd67c12f3fa39s6y4x3l1mdswwzudq1buow8yy','2023-03-19 10:50:47',68),(57,'add0e675b8223203aa762ad65c063fde751426dqhmlxjflqu','2023-03-20 15:12:51',69),(58,'2f254faac122cf0b69966d78ee9eb9db8q3025z7e9rlf3tsds808lmmz','2023-03-20 15:22:28',70),(59,'3915e4828a3012aa9bd1d87eb29ce612bynyavqjf5k96ir56uoanxzlnng','2023-03-20 15:30:34',71),(60,'08a5155bd657396eefe91ddea0781b2cc0kp3tchl8pj2j9kpwl','2023-03-20 16:07:15',72),(61,'02c62d7b81f3ce142ae166c9d3dbbe298790b385scnvt','2023-03-20 17:21:02',73),(62,'8bfe50d28609da6fe1d45286edad4a5fg8k4hckgb1vzfbi8docz254bvbc2pr','2023-03-20 17:22:18',74),(63,'b8d88b99780bc2eeaa2c4021f745f3527ndyorjua6cpyqrnpcl024m','2023-03-20 17:49:43',75),(64,'1a132e2a6e4f38d2231235e7a0ee07e26gjycrunnpby2xth','2023-03-20 18:34:16',76),(65,'5a22e4292fb43037e121f098f2a205308uxw0hms5fs','2023-03-27 08:59:49',77),(66,'a602c8ea297cf70c096a8618675d8740v3idfkwu0zey284z3','2023-03-21 18:08:48',78),(67,'4556999ca29e1276075f5b810a9170ddx2clr1aeyy4czuyp6clh2gy6i5wu','2023-03-22 14:42:31',79),(68,'9b69453f25d4033db3a6489d0b9b648ey29anrdv773vnheh6m2qttil','2023-03-22 14:56:55',80),(69,'3c129e805b2e81af59ffdb5b382e3a01sccxqlvrct1xv05qh5agn','2023-03-23 13:44:57',81),(70,'2f31e8a0723b271eb935347acfd74bd2vmk6zqfi92hnpu1ic','2023-03-23 14:19:47',82),(71,'f99550d8e3a3e84bb7552aec8bfa8c899m2h6m60v4xrilpt1','2023-03-23 18:34:44',83),(72,'91e0ab527c371bc75edb1b409a4f789es1rxvlek0g8rju7zo0','2023-03-23 19:46:06',84),(73,'51aa7caa64e32288b464296174a256815tqxfxaa1ra6','2023-03-24 08:52:42',85),(74,'0487a4ed61ec6982625d37bcf577e230keeabyspmzp26x7tz6c7','2023-03-27 14:32:55',96),(75,'672333ffe32d233d2cec062d2bd5ae60p4zjtx4krplf1wnjy1ph','2023-03-27 14:39:13',97),(76,'420cc50d3fe65941252e86b2cd900b28j33plzt64ooah50yxbcxq3s3k3tgg','2023-03-27 16:27:05',98),(77,'7c3b9568edb3b6315e2d1864e092c5e40z6qr939ct6cg','2023-03-28 11:43:15',99),(78,'de327a247ca7765ac49ba96f57517fe47oyds31uifrx1mfddfb9','2023-03-27 20:27:39',100),(79,'3c6b880c62b035a98efd0791f40ae1eersubjvulxbc7u80dapx6si','2023-03-27 23:53:55',101),(80,'c9ed7f2d1fd4e4c2148b9c9e4b0c3d2714q6iayvysa1l9ki5a5','2023-03-28 08:26:58',102),(81,'d5d190debbbf638a9237ab9a41089492v4nbi4u29wy853pgss6mxl','2023-03-28 08:28:20',103),(82,'407ebd3b60677d99a77035357b554b6eoy5pzymvh5am12qs66gua','2023-03-28 08:30:18',104),(83,'4539f787aa4cf779545eca18c2d51cc9c4psp7d6m443zgmxja99irgr','2023-03-28 10:15:39',105),(84,'ddc1e27e76c983b4949ea571f102d49fbgqzdtzj1f4','2023-03-28 10:51:40',16),(85,'821189877798556882082f424c8db8d8hcnvw0xkvkc9','2023-03-28 10:21:23',106),(86,'78fd493c57324dd180e20df9f0a212baz46mivjgo3w9qbxl741fea6hu0p9xr','2023-03-28 10:27:05',107),(87,'c410ff995598d45609eb1251dbd1afebo0ke7m03ml8hgkv','2023-03-28 10:45:48',108),(88,'9b25812f64af9a5f4a534f4d21f8f66dwths79ddn9tryxzwmgpwkhe39ecmut','2023-03-28 11:14:55',109),(89,'a43f00654471792e9b257fe33f1714165iw7ey0ya085','2023-03-28 11:14:56',110),(90,'079db77f909a10ee8a599dac890b95738mayjn9btmg4mcdz68kpyc','2023-03-28 11:15:17',111),(91,'79539dbcc85d6ab19ff4ec07872cbd98cu6i52fgkbv6prm','2023-03-28 11:15:20',112),(92,'c4ed8ba375918aa6bd4378eac3d88922b6ljleq6bydeelc7gdbkjkdiu2jk','2023-03-28 11:15:27',113),(93,'63a6d9fd332eac9b1d8675e7314c3fd7yko7x3gc6g232e4mo','2023-03-28 11:15:31',114),(94,'a5e416eb4f15f4560191348c21458b39pz0racfokfn3ppqtu9p327','2023-03-28 11:26:38',115),(95,'f94f6832b14a39f6366579625ba00a26myh929omtqrqe9cmxeeaxmhr3635p','2023-03-28 11:26:39',116),(96,'d44a98d7529eb0230b84591c9ea29229lrfqa272f57yud23ta9vzj','2023-03-28 13:24:33',117),(97,'e6283060fe7de75faa915f60ea390a8d5bt9kyxklal37psey80uw2tf7fw','2023-03-28 13:26:44',118);
/*!40000 ALTER TABLE `ntp_common_home_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_image`
--

DROP TABLE IF EXISTS `ntp_common_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_path` text COMMENT '图片地址',
  `image_type` int(11) NOT NULL DEFAULT '0' COMMENT '1 banner  2点播banner   3 弹出层 logo下载',
  `url` text COMMENT '三方跳转下载',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_image`
--

LOCK TABLES `ntp_common_image` WRITE;
/*!40000 ALTER TABLE `ntp_common_image` DISABLE KEYS */;
INSERT INTO `ntp_common_image` VALUES (1,'/topic/banner/1.jpg',1,NULL),(2,'/topic/banner/2.jpg',1,NULL),(3,'/topic/banner/3.jpg',1,NULL),(4,'/topic/banner/1.jpg',2,NULL),(5,'/topic/banner/2.jpg',2,NULL),(6,'/topic/banner/3.jpg',2,NULL),(7,'/topic/banner/11.jpeg',3,'https://www.bxgtv.top/'),(8,'/topic/banner/22.jpg',3,'https://www.bxgtv.top/'),(9,'/topic/banner/33.jpeg',3,'https://www.bxgtv.top/'),(10,'/topic/banner/33.jpeg',3,'https://www.bxgtv.top/'),(11,'/topic/banner/44.jpeg',3,'https://www.bxgtv.top/'),(12,'/topic/banner/55.jpeg',3,'https://www.bxgtv.top/'),(13,'/topic/banner/55.jpeg',3,'https://www.bxgtv.top/'),(14,'/topic/banner/77.jpeg',3,'https://www.bxgtv.top/'),(15,'/topic/banner/77.jpeg',3,'https://www.bxgtv.top/'),(16,'/topic/banner/xuanchuan.png',4,'https://www.bxgtv.top/');
/*!40000 ALTER TABLE `ntp_common_image` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COMMENT='登陆日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_login_log`
--

LOCK TABLES `ntp_common_login_log` WRITE;
/*!40000 ALTER TABLE `ntp_common_login_log` DISABLE KEYS */;
INSERT INTO `ntp_common_login_log` VALUES (1,1,1,'2022-12-04 10:05:48','182.16.96.34','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),(2,1,1,'2023-01-06 10:26:57','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'),(3,2,2,'2023-01-06 10:34:01','171.223.88.133','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(4,3,2,'2023-01-06 10:41:20','139.5.108.199','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(5,3,2,'2023-01-06 11:48:11','117.173.160.251','Mozilla/5.0 (Linux; U; Android 12; zh-cn; M2004J7AC Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/98.0.4758.102 MQQBrowser/13.5 Mobile Safari/537.36 COVC/046321'),(6,3,2,'2023-01-06 14:21:16','139.5.108.76','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(7,1,1,'2023-01-06 14:25:09','139.5.108.76','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(8,2,2,'2023-01-06 14:30:52','171.223.88.133','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(9,2,2,'2023-01-06 14:39:11','171.223.88.133','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(10,2,2,'2023-01-06 14:41:37','171.223.88.133','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(11,2,2,'2023-01-06 14:42:51','171.223.88.133','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(12,2,2,'2023-01-06 14:43:45','171.223.88.133','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(13,3,2,'2023-01-06 14:58:53','139.5.108.76','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(14,3,2,'2023-01-06 18:18:51','171.218.55.155','Mozilla/5.0 (Linux; U; Android 12; zh-cn; M2004J7AC Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/98.0.4758.102 MQQBrowser/13.5 Mobile Safari/537.36 COVC/046321'),(15,4,2,'2023-01-06 23:26:31','117.188.14.221','Mozilla/5.0 (Linux; Android 9; VCE-AL00 Build/HUAWEIVCE-AL00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.99 XWEB/4375 MMWEBSDK/20221109 Mobile Safari/537.36 MMWEBID/1727 M'),(16,3,2,'2023-01-07 10:47:54','118.120.157.152','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(17,3,2,'2023-01-07 10:57:06','118.120.157.152','Mozilla/5.0 (Linux; U; Android 12; zh-cn; M2004J7AC Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/98.0.4758.102 MQQBrowser/13.5 Mobile Safari/537.36 COVC/046321'),(18,5,2,'2023-01-07 10:57:44','118.120.157.152','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(19,3,2,'2023-03-06 14:09:29','219.78.235.132','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(20,1,1,'2023-03-06 14:40:27','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'),(21,3,2,'2023-03-06 14:43:45','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'),(22,6,2,'2023-03-06 15:13:29','219.78.235.132','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(23,3,2,'2023-03-06 15:44:57','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'),(24,1,1,'2023-03-06 15:54:28','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'),(25,2,2,'2023-03-06 16:32:37','182.232.9.239','Mozilla/5.0 (Linux; Android 12; HarmonyOS; TAS-AN00; HMSCore 6.9.6.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.301 Mobile Safari/537.36'),(26,2,2,'2023-03-06 23:02:19','49.228.251.212','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(27,1,1,'2023-03-06 23:13:45','49.228.251.212','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36'),(28,6,2,'2023-03-07 10:04:10','219.78.235.91','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(29,6,2,'2023-03-08 09:12:24','219.78.235.132','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(30,1,1,'2023-03-08 10:02:40','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36'),(31,1,1,'2023-03-08 10:06:23','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36'),(32,1,1,'2023-03-08 10:09:14','118.120.130.26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(33,1,1,'2023-03-08 10:10:32','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36'),(34,1,1,'2023-03-09 10:17:31','118.120.130.26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(35,1,1,'2023-03-09 10:37:58','118.120.130.26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(36,1,1,'2023-03-09 10:42:22','118.120.130.26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(37,15,3,'2023-03-09 10:46:28','118.120.130.26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(38,15,3,'2023-03-09 10:49:00','118.120.130.26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(39,15,3,'2023-03-09 10:57:53','118.120.130.26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(40,1,1,'2023-03-09 15:56:24','118.120.130.26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(41,15,3,'2023-03-09 16:01:49','118.120.130.26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(42,1,1,'2023-03-10 10:28:57','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36'),(43,12,1,'2023-03-10 11:11:57','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(44,1,1,'2023-03-10 14:34:10','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(45,12,1,'2023-03-10 14:34:27','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(46,1,1,'2023-03-10 14:36:32','219.78.235.132','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36'),(47,12,1,'2023-03-10 14:39:37','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(48,15,3,'2023-03-10 14:41:16','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(49,15,3,'2023-03-10 14:43:57','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(50,1,1,'2023-03-10 16:11:15','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(51,12,1,'2023-03-10 17:28:58','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(52,12,1,'2023-03-10 17:32:57','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(53,12,1,'2023-03-10 17:33:39','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(54,12,1,'2023-03-10 17:34:20','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(55,12,1,'2023-03-10 17:35:00','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(56,12,1,'2023-03-10 17:37:02','118.120.134.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63'),(57,1,1,'2023-03-13 10:05:50','118.120.144.221','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69'),(58,15,3,'2023-03-13 10:28:28','118.120.144.221','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69'),(59,1,1,'2023-03-13 10:29:54','118.120.144.221','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(60,15,3,'2023-03-13 10:31:24','118.120.144.221','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69'),(61,1,1,'2023-03-13 10:48:41','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36'),(62,16,3,'2023-03-13 11:04:47','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36 Core/1.94.192.400 QQBrowser/11.5.5250.400'),(63,6,2,'2023-03-13 11:09:28','219.78.235.132','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(64,1,1,'2023-03-13 11:43:50','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36 Core/1.94.192.400 QQBrowser/11.5.5250.400'),(65,5,2,'2023-03-13 13:59:07','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(66,5,2,'2023-03-13 14:10:36','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(67,5,2,'2023-03-13 14:11:34','118.120.144.221','Mozilla/5.0 (Linux; U; Android 12; zh-cn; M2004J7AC Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/98.0.4758.102 MQQBrowser/13.5 Mobile Safari/537.36 COVC/046405'),(68,2,2,'2023-03-13 14:13:22','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(69,NULL,2,'2023-03-13 16:10:56','45.116.162.15','PostmanRuntime-ApipostRuntime/1.1.0'),(70,NULL,2,'2023-03-13 16:11:44','219.78.235.91','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(71,NULL,2,'2023-03-13 16:13:04','219.78.235.132','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(72,NULL,2,'2023-03-13 16:13:07','219.78.235.132','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(73,2,2,'2023-03-13 16:54:48','112.45.96.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(74,2,2,'2023-03-13 16:56:32','139.162.40.33','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(75,1,1,'2023-03-13 17:04:23','112.45.96.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(76,2,2,'2023-03-13 17:06:01','202.64.124.81','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/110.0.0.0'),(77,NULL,2,'2023-03-13 17:18:58','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36'),(78,NULL,2,'2023-03-13 17:19:03','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(79,NULL,2,'2023-03-13 17:19:10','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(80,NULL,2,'2023-03-13 17:19:16','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(81,NULL,2,'2023-03-13 17:19:35','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(82,NULL,2,'2023-03-13 17:19:36','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(83,NULL,2,'2023-03-13 17:19:43','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(84,NULL,2,'2023-03-13 17:19:48','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(85,NULL,2,'2023-03-13 17:20:03','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(86,NULL,2,'2023-03-13 17:20:04','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(87,NULL,2,'2023-03-13 17:20:11','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(88,NULL,2,'2023-03-13 17:26:19','112.45.96.197','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(89,NULL,2,'2023-03-13 17:27:10','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(90,NULL,2,'2023-03-13 17:27:19','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(91,NULL,2,'2023-03-13 17:27:40','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(92,NULL,2,'2023-03-13 17:27:44','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(93,NULL,2,'2023-03-13 17:27:50','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(94,NULL,2,'2023-03-13 17:27:58','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(95,NULL,2,'2023-03-13 17:28:10','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(96,NULL,2,'2023-03-13 17:28:17','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(97,NULL,2,'2023-03-13 17:28:29','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(98,NULL,2,'2023-03-13 17:28:32','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(99,NULL,2,'2023-03-13 17:29:14','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(100,NULL,2,'2023-03-13 17:29:25','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(101,NULL,2,'2023-03-13 17:29:31','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(102,NULL,2,'2023-03-13 17:30:01','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(103,NULL,2,'2023-03-13 17:30:14','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(104,NULL,2,'2023-03-13 17:30:28','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(105,NULL,2,'2023-03-13 17:31:54','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(106,NULL,2,'2023-03-13 17:31:57','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(107,NULL,2,'2023-03-13 17:31:59','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(108,NULL,2,'2023-03-13 17:32:20','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(109,NULL,2,'2023-03-13 17:33:53','112.45.96.197','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(110,NULL,2,'2023-03-13 17:44:23','45.116.162.15','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(111,NULL,2,'2023-03-13 17:48:29','219.78.235.91','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(112,NULL,2,'2023-03-14 13:29:07','49.230.12.177','Mozilla/5.0 (Linux; Android 12; HarmonyOS; TAS-AN00; HMSCore 6.9.6.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.302 Mobile Safari/537.36'),(113,NULL,2,'2023-03-14 13:57:08','219.78.235.91','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(114,NULL,2,'2023-03-14 14:05:59','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36'),(115,15,3,'2023-03-15 15:32:52','49.229.237.30','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36'),(116,NULL,2,'2023-03-15 15:42:38','49.229.237.30','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36'),(117,15,3,'2023-03-15 15:50:37','49.229.237.30','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36'),(118,1,1,'2023-03-15 15:53:52','49.229.237.30','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36'),(119,1,1,'2023-03-15 20:04:36','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36'),(120,NULL,2,'2023-03-16 00:56:23','40.77.189.247','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534+ (KHTML, like Gecko) BingPreview/1.0b'),(121,NULL,2,'2023-03-16 00:56:23','40.77.189.185','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534+ (KHTML, like Gecko) BingPreview/1.0b'),(122,NULL,2,'2023-03-16 09:42:16','219.78.235.91','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(123,1,1,'2023-03-16 15:50:47','117.177.209.253','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(124,NULL,2,'2023-03-16 16:03:14','117.177.209.253','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(125,15,2,'2023-03-16 16:11:47','117.177.209.253','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(126,15,2,'2023-03-16 16:31:24','171.223.88.87','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(127,NULL,2,'2023-03-16 16:41:58','117.177.209.253','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(128,15,2,'2023-03-17 14:52:33','171.223.88.87','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(129,NULL,2,'2023-03-19 10:50:47','17.22.253.191','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)'),(130,1,1,'2023-03-20 13:45:22','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36'),(131,1,1,'2023-03-20 14:28:13','49.229.237.30','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(132,12,1,'2023-03-20 14:28:27','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36'),(133,2,2,'2023-03-20 14:56:26','49.229.237.30','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(134,NULL,2,'2023-03-20 15:12:51','117.177.210.116','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44'),(135,2,2,'2023-03-20 15:20:10','171.216.157.64','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(136,NULL,2,'2023-03-20 15:22:28','182.232.1.249','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(137,NULL,2,'2023-03-20 15:30:34','117.177.210.116','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(138,1,1,'2023-03-20 15:33:08','182.232.1.249','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(139,NULL,2,'2023-03-20 16:07:15','171.216.157.64','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(140,NULL,2,'2023-03-20 17:21:02','182.232.1.249','Mozilla/5.0 (Linux; Android 12; HarmonyOS; TAS-AN00; HMSCore 6.9.6.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.302 Mobile Safari/537.36'),(141,NULL,2,'2023-03-20 17:22:18','42.236.10.106','Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Mobile Safari/537.36'),(142,NULL,2,'2023-03-20 17:49:43','125.24.2.188','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(143,NULL,2,'2023-03-20 18:34:16','203.91.85.36','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5359.95 Safari/537.36'),(144,77,2,'2023-03-21 08:41:35','175.153.163.74','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.44'),(145,2,2,'2023-03-21 09:45:24','182.16.96.34','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(146,1,1,'2023-03-21 10:25:39','117.173.160.105','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(147,1,1,'2023-03-21 10:32:34','117.173.160.105','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(148,1,1,'2023-03-21 14:54:57','45.116.162.15','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36 Core/1.94.192.400 QQBrowser/11.5.5250.400'),(149,1,1,'2023-03-21 15:11:59','117.173.160.105','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(150,1,1,'2023-03-21 16:15:07','117.173.160.105','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(151,NULL,2,'2023-03-21 18:08:48','202.64.124.19','Mozilla/5.0 (Linux; Android 9; VTR-AL00; HMSCore 6.9.6.301; GMSCore 23.06.17) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 HuaweiBrowser/11.0.7.303 Mobile Safari/537.36'),(152,1,1,'2023-03-21 18:57:27','1.10.209.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(153,67,2,'2023-03-21 19:59:26','118.120.134.172','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(154,67,2,'2023-03-21 20:03:40','1.10.209.36','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(155,67,2,'2023-03-21 20:06:33','1.10.209.36','Mozilla/5.0 (Linux; Android 12; HarmonyOS; TAS-AN00; HMSCore 6.9.6.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.302 Mobile Safari/537.36'),(156,67,2,'2023-03-22 09:19:43','175.153.163.84','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.44'),(157,3,2,'2023-03-22 14:19:09','54.188.53.185','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(158,67,2,'2023-03-22 14:19:39','54.188.53.185','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(159,NULL,2,'2023-03-22 14:42:31','175.153.163.73','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44'),(160,77,2,'2023-03-22 14:44:58','175.153.163.74','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.44'),(161,NULL,2,'2023-03-22 14:56:55','175.153.163.75','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44'),(162,NULL,2,'2023-03-23 13:44:57','117.20.112.85','Mozilla/5.0 (Linux; Android 12; HarmonyOS; TAS-AN00; HMSCore 6.9.6.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.302 Mobile Safari/537.36'),(163,NULL,2,'2023-03-23 14:19:47','175.153.163.94','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(164,NULL,2,'2023-03-23 18:34:44','175.100.103.254','Mozilla/5.0 (Linux; Android 12; HarmonyOS; TAS-AN00; HMSCore 6.9.6.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.302 Mobile Safari/537.36'),(165,NULL,2,'2023-03-23 19:46:06','175.100.103.254','Mozilla/5.0 (Linux; Android 12; HarmonyOS; TAS-AN00; HMSCore 6.9.6.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.302 Mobile Safari/537.36'),(166,NULL,2,'2023-03-24 08:52:42','118.120.134.172','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(167,67,2,'2023-03-24 10:09:34','175.153.163.75','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36 Edg/111.0.0.0'),(168,1,1,'2023-03-24 10:50:22','118.120.134.172','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(169,67,2,'2023-03-24 14:28:06','117.20.116.147','Mozilla/5.0 (Linux; Android 12; HarmonyOS; TAS-AN00; HMSCore 6.9.6.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.302 Mobile Safari/537.36'),(170,67,2,'2023-03-24 14:54:41','175.153.163.72','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.51'),(171,77,2,'2023-03-24 16:37:10','175.153.163.91','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.51'),(172,77,2,'2023-03-27 08:59:49','175.153.163.92','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.54'),(173,5,2,'2023-03-27 09:31:21','117.173.163.73','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(174,15,2,'2023-03-27 10:04:12','117.173.163.73','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(175,15,2,'2023-03-27 13:52:28','175.153.163.72','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.54'),(176,5,2,'2023-03-27 13:54:43','220.166.93.96','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(177,96,2,'2023-03-27 14:32:55','220.166.93.96','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(178,97,2,'2023-03-27 14:39:13','40.77.139.86','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534+ (KHTML, like Gecko) BingPreview/1.0b'),(179,98,2,'2023-03-27 16:27:05','220.166.93.96','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(180,67,2,'2023-03-27 18:18:11','175.153.163.85','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.54'),(181,99,2,'2023-03-27 18:23:56','175.153.163.89','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.54'),(182,67,2,'2023-03-27 18:30:15','175.153.163.94','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.54'),(183,99,2,'2023-03-27 18:34:06','175.153.163.76','Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36 Edg/111.0.1661.54'),(184,100,2,'2023-03-27 20:27:39','175.153.163.77','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(185,101,2,'2023-03-27 23:53:55','175.178.136.143','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'),(186,102,2,'2023-03-28 08:26:58','118.120.134.115','Mozilla/5.0 (Linux; U; Android 12; zh-cn; M2004J7AC Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/98.0.4758.102 MQQBrowser/13.5 Mobile Safari/537.36 COVC/046405'),(187,103,2,'2023-03-28 08:28:20','175.153.163.89','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.61 Safari/537.36 HeyTapBrowser/40.8.10.1'),(188,104,2,'2023-03-28 08:30:18','118.120.134.115','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(189,99,2,'2023-03-28 08:31:39','175.153.163.72','Mozilla/5.0 (Linux; Android 12; PCLM50 Build/RKQ1.211103.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/97.0.4692.98 Mobile Safari/537.36 T7/13.29 SP-engine/2.67.0 baiduboxapp/13.2'),(190,67,2,'2023-03-28 08:50:14','175.153.163.72','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(191,99,2,'2023-03-28 08:50:35','175.153.163.89','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(192,99,2,'2023-03-28 08:55:42','175.153.163.91','Mozilla/5.0 (Linux; Android 12; PCLM50 Build/RKQ1.211103.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/97.0.4692.98 Mobile Safari/537.36 T7/13.30 SP-engine/2.68.0 baiduboxapp/13.3'),(193,99,2,'2023-03-28 08:58:50','175.153.163.91','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(194,99,2,'2023-03-28 08:59:46','175.153.163.87','Mozilla/5.0 (Linux; Android 12; PCLM50 Build/RKQ1.211103.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/97.0.4692.98 Mobile Safari/537.36 T7/13.30 SP-engine/2.68.0 baiduboxapp/13.3'),(195,67,2,'2023-03-28 09:01:46','175.153.163.75','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54'),(196,99,2,'2023-03-28 09:06:51','175.153.163.83','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(197,99,2,'2023-03-28 09:18:31','175.153.163.73','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(198,67,2,'2023-03-28 09:22:02','175.153.163.82','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(199,99,2,'2023-03-28 10:03:28','175.153.163.81','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(200,67,2,'2023-03-28 10:06:43','175.153.163.91','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(201,67,2,'2023-03-28 10:07:07','175.153.163.82','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(202,67,2,'2023-03-28 10:09:23','175.153.163.87','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(203,67,2,'2023-03-28 10:09:43','175.153.163.76','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(204,99,2,'2023-03-28 10:11:39','175.153.163.94','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(205,105,2,'2023-03-28 10:15:39','118.120.134.115','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54'),(206,99,2,'2023-03-28 10:15:53','175.153.163.76','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(207,16,2,'2023-03-28 10:16:26','118.120.134.115','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(208,99,2,'2023-03-28 10:16:59','175.153.163.91','Mozilla/5.0 (Linux; Android 12; PCLM50 Build/RKQ1.211103.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/97.0.4692.98 Mobile Safari/537.36 T7/13.30 SP-engine/2.68.0 baiduboxapp/13.3'),(209,67,2,'2023-03-28 10:21:17','175.153.163.78','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(210,106,2,'2023-03-28 10:21:23','118.120.134.115','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(211,99,2,'2023-03-28 10:26:07','175.153.163.73','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(212,107,2,'2023-03-28 10:27:05','175.153.163.72','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(213,67,2,'2023-03-28 10:30:28','175.153.163.84','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(214,67,2,'2023-03-28 10:31:09','175.153.163.84','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(215,99,2,'2023-03-28 10:31:38','175.153.163.84','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(216,99,2,'2023-03-28 10:32:17','175.153.163.92','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(217,67,2,'2023-03-28 10:37:35','175.153.163.91','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(218,108,2,'2023-03-28 10:45:48','175.153.163.80','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(219,16,2,'2023-03-28 10:51:40','118.120.134.115','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'),(220,109,2,'2023-03-28 11:14:55','175.153.163.95','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(221,110,2,'2023-03-28 11:14:56','175.153.163.95','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(222,111,2,'2023-03-28 11:15:17','175.153.163.95','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(223,112,2,'2023-03-28 11:15:20','175.153.163.95','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(224,113,2,'2023-03-28 11:15:27','175.153.163.95','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(225,114,2,'2023-03-28 11:15:31','175.153.163.95','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/111.0.0.0'),(226,115,2,'2023-03-28 11:26:38','175.153.163.84','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),(227,116,2,'2023-03-28 11:26:39','175.153.163.84','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(228,67,2,'2023-03-28 11:29:44','175.153.163.82','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(229,99,2,'2023-03-28 11:38:50','175.153.163.94','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(230,67,2,'2023-03-28 11:40:58','175.153.163.80','Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'),(231,99,2,'2023-03-28 11:43:15','175.153.163.95','Mozilla/5.0 (Linux; Android 12; PCLM50 Build/RKQ1.211103.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/97.0.4692.98 Mobile Safari/537.36 T7/13.30 SP-engine/2.68.0 baiduboxapp/13.3'),(232,117,2,'2023-03-28 13:24:33','202.62.48.241','Mozilla/5.0 (Linux; Android 12; HarmonyOS; TAS-AN00; HMSCore 6.9.6.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.302 Mobile Safari/537.36'),(233,118,2,'2023-03-28 13:26:44','202.62.48.241','Mozilla/5.0 (Linux; Android 12; HarmonyOS; TAS-AN00; HMSCore 6.9.6.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.302 Mobile Safari/537.36');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='市场部关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_market_relation`
--

LOCK TABLES `ntp_common_market_relation` WRITE;
/*!40000 ALTER TABLE `ntp_common_market_relation` DISABLE KEYS */;
INSERT INTO `ntp_common_market_relation` VALUES (1,12,1,0,0,'12');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_notice`
--

LOCK TABLES `ntp_common_notice` WRITE;
/*!40000 ALTER TABLE `ntp_common_notice` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_notify`
--

LOCK TABLES `ntp_common_notify` WRITE;
/*!40000 ALTER TABLE `ntp_common_notify` DISABLE KEYS */;
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
  `buy_aid` int(11) DEFAULT '0' COMMENT '商品是谁的。博主ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_order`
--

LOCK TABLES `ntp_common_order` WRITE;
/*!40000 ALTER TABLE `ntp_common_order` DISABLE KEYS */;
INSERT INTO `ntp_common_order` VALUES (1,1,0,0,'2022-12-04 15:50:13','2022-12-04 15:50:13',0,3,'2022-12-04 15:50:13',1,88,'video333220221204155013','购买商品包年',NULL,'前台购买','182.16.96.34',0),(2,1,0,0,'2022-12-04 15:51:14','2022-12-04 15:51:14',0,3,'2022-12-04 15:51:14',1,88,'video414920221204155114','购买商品包年',NULL,'前台购买','182.16.96.34',0),(3,1,0,0,'2022-12-04 16:07:12','2022-12-04 16:07:12',0,3,'2022-12-04 16:07:12',1,88,'video671420221204160712','购买商品包年',NULL,'前台购买','182.16.96.34',0),(4,1,0,0,'2022-12-04 16:07:57','2022-12-04 16:07:57',0,3,'2022-12-04 16:07:57',1,88,'video374420221204160757','购买商品包年',NULL,'前台购买','182.16.96.34',0),(5,1,0,0,'2022-12-04 16:08:16','2022-12-04 16:08:16',0,3,'2022-12-04 16:08:16',1,88,'video339220221204160816','购买商品包年',NULL,'前台购买','182.16.96.34',0),(6,1,0,0,'2022-12-04 16:08:49','2022-12-04 16:08:49',0,3,'2022-12-04 16:08:49',1,88,'video614420221204160849','购买商品包年',NULL,'前台购买','182.16.96.34',0),(7,1,0,0,'2022-12-04 16:09:27','2022-12-04 16:09:27',0,3,'2022-12-04 16:09:27',1,88,'video670420221204160927','购买商品包年',NULL,'前台购买','182.16.96.34',0),(8,1,0,0,'2022-12-04 16:10:32','2022-12-04 16:10:32',0,3,'2022-12-04 16:10:32',1,88,'video555120221204161032','购买商品包年',NULL,'前台购买','182.16.96.34',0),(9,1,0,0,'2022-12-04 16:11:00','2022-12-04 16:11:00',0,1,'2022-12-04 16:11:00',1,1,'video419120221204161100','购买商品包天',NULL,'前台购买','182.16.96.34',0),(10,1,0,0,'2022-12-04 16:11:54','2022-12-04 16:11:54',0,1,'2022-12-04 16:11:54',1,1,'video753120221204161154','购买商品包天',NULL,'前台购买','182.16.96.34',0),(11,1,0,0,'2022-12-04 16:14:19','2022-12-04 16:14:19',0,1,'2022-12-04 16:14:19',1,1,'video298720221204161419','购买商品包天',NULL,'前台购买','182.16.96.34',0),(12,1,0,0,'2022-12-04 16:14:36','2022-12-04 16:14:36',0,2,'2022-12-04 16:14:36',1,18,'video871320221204161436','购买商品包月',NULL,'前台购买','182.16.96.34',0),(13,1,0,0,'2022-12-04 16:14:52','2022-12-04 16:14:52',0,3,'2022-12-04 16:14:52',1,88,'video824520221204161452','购买商品包年',NULL,'前台购买','182.16.96.34',0),(14,1,0,0,'2022-12-04 16:15:02','2022-12-04 16:15:02',0,3,'2022-12-04 16:15:02',1,88,'video687320221204161502','购买商品包年',NULL,'前台购买','182.16.96.34',0),(15,3,0,0,'2023-01-06 10:41:26','2023-01-06 10:41:26',0,1,'2023-01-06 10:41:26',1,1,'video993120230106104126','购买商品包天',NULL,'前台购买','139.5.108.199',0),(16,3,0,0,'2023-01-06 11:16:09','2023-01-06 11:16:09',0,1,'2023-01-06 11:16:09',1,1,'video702220230106111609','购买商品包天',NULL,'前台购买','202.43.234.114',0),(17,3,0,0,'2023-01-06 11:18:14','2023-01-06 11:18:14',0,1,'2023-01-06 11:18:14',1,1,'video695320230106111814','购买商品包天',NULL,'前台购买','202.43.234.114',0),(18,5,0,0,'2023-01-07 10:57:49','2023-01-07 10:57:49',0,1,'2023-01-07 10:57:49',1,1,'video838220230107105749','购买商品包天',NULL,'前台购买','118.120.157.152',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='资金流水表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_pay_money_log`
--

LOCK TABLES `ntp_common_pay_money_log` WRITE;
/*!40000 ALTER TABLE `ntp_common_pay_money_log` DISABLE KEYS */;
INSERT INTO `ntp_common_pay_money_log` VALUES (1,'2022-12-04 15:50:13',3,101,1065.00,977.00,88.00,1,1,0,'购买会员'),(2,'2022-12-04 15:51:14',3,101,977.00,889.00,88.00,1,2,0,'购买会员'),(3,'2022-12-04 16:07:12',3,101,889.00,801.00,88.00,1,3,0,'购买会员'),(4,'2022-12-04 16:07:57',3,101,801.00,713.00,88.00,1,4,0,'购买会员'),(5,'2022-12-04 16:08:16',3,101,713.00,625.00,88.00,1,5,0,'购买会员'),(6,'2022-12-04 16:08:49',3,101,625.00,537.00,88.00,1,6,0,'购买会员'),(7,'2022-12-04 16:09:27',3,101,537.00,449.00,88.00,1,7,0,'购买会员'),(8,'2022-12-04 16:10:32',3,101,449.00,361.00,88.00,1,8,0,'购买会员'),(9,'2022-12-04 16:11:00',3,101,361.00,360.00,1.00,1,9,0,'购买会员'),(10,'2022-12-04 16:11:54',3,101,360.00,359.00,1.00,1,10,0,'购买会员'),(11,'2022-12-04 16:14:19',3,101,359.00,358.00,1.00,1,11,0,'购买会员'),(12,'2022-12-04 16:14:36',3,101,358.00,340.00,18.00,1,12,0,'购买会员'),(13,'2022-12-04 16:14:52',3,101,340.00,252.00,88.00,1,13,0,'购买会员'),(14,'2022-12-04 16:15:02',3,101,252.00,164.00,88.00,1,14,0,'购买会员'),(15,'2023-03-06 15:14:00',3,101,0.00,1000.00,1000.00,6,NULL,1,NULL),(16,'2023-03-06 15:14:05',3,101,1000.00,2000.00,1000.00,6,NULL,1,NULL),(17,'2023-03-06 15:14:09',3,101,2000.00,10000.00,8000.00,6,NULL,1,NULL),(18,'2023-03-06 16:01:04',3,101,0.00,5000.00,5000.00,2,NULL,1,NULL),(19,'2023-03-06 16:02:24',3,101,0.00,1000.00,1000.00,3,NULL,1,NULL),(20,'2023-03-06 16:02:29',2,901,1000.00,999.00,1.00,3,2,0,'打赏会员'),(21,'2023-03-06 16:02:29',1,2001,0.00,1.00,1.00,15,2,0,'主播获得打赏'),(22,'2023-03-21 09:45:29',2,901,5000.00,4990.00,10.00,2,32490,0,'打赏会员'),(23,'2023-03-21 09:45:29',1,2001,164.00,174.00,10.00,15,32490,0,'主播获得打赏');
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
  `order_no` varchar(200) DEFAULT NULL COMMENT '充值订单编号',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '充值订单状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_pay_recharge`
--

LOCK TABLES `ntp_common_pay_recharge` WRITE;
/*!40000 ALTER TABLE `ntp_common_pay_recharge` DISABLE KEYS */;
INSERT INTO `ntp_common_pay_recharge` VALUES (1,'2023-01-06 10:46:35',NULL,1.00,NULL,3,'139.5.108.199','','','','','',0,'CZ539620230106104635',0),(2,'2023-01-06 10:48:30',NULL,1.00,NULL,3,'139.5.108.199','','','','','',0,'CZ767520230106104830',0),(3,'2023-01-06 10:48:45',NULL,1.00,NULL,3,'139.5.108.199','','','','','',0,'CZ741520230106104845',0),(4,'2023-01-06 10:48:56',NULL,1.00,NULL,3,'139.5.108.199','','','','','',0,'CZ191020230106104856',0),(5,'2023-01-06 23:26:42',NULL,1.00,NULL,4,'117.188.14.221','','','','','',0,'CZ701920230106232642',0);
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
  `value` text COMMENT '约束条件',
  `remarks` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='后台配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_sys_config`
--

LOCK TABLES `ntp_common_sys_config` WRITE;
/*!40000 ALTER TABLE `ntp_common_sys_config` DISABLE KEYS */;
INSERT INTO `ntp_common_sys_config` VALUES (1,'web_name','管理系统',NULL),(2,'logo_url','/logo.png',NULL),(3,'web_keywords','关键词',NULL),(4,'web_description','描述',NULL),(5,'app_down_ios','http://www.baiduc.com',NULL),(6,'app_down_android','http://www.baiduc.com',NULL),(7,'video_single_price','1.2',NULL),(8,'pay_address','https://api.sugar998.top',NULL),(9,'h5_address','https://www.sugar998.top',NULL),(10,'tips_config','提示内容',NULL),(13,'bozhu_buy_divided','1','购买博主获得分成比例 除100'),(14,'recharge_rebates','1充值返佣 除100',NULL),(15,'prompt_content','',''),(16,'ke_fu','http://www.baidu.com','客服地址'),(17,'array_banner','{\"quanbu\":\"/topic/banner/1.jpg\",\"tuijie\":\"/topic/banner/2.jpg\",\"fenlei\":\"/topic/banner/3.jpg\",\"dianbo\":\"/topic/banner/2.jpg\"}','banner图'),(18,'prompt_content_app','关于我们2','关于我们');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='后台配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_sys_ip_config`
--

LOCK TABLES `ntp_common_sys_ip_config` WRITE;
/*!40000 ALTER TABLE `ntp_common_sys_ip_config` DISABLE KEYS */;
INSERT INTO `ntp_common_sys_ip_config` VALUES (1,'223.87.36.191',1);
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
-- Table structure for table `ntp_common_user`
--

DROP TABLE IF EXISTS `ntp_common_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_name` varchar(200) DEFAULT NULL COMMENT '账号',
  `pwd` varchar(64) NOT NULL DEFAULT 'MTIzNDU2' COMMENT '密码',
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
  `head_img` varchar(300) NOT NULL,
  `viewing_times` int(11) NOT NULL DEFAULT '0' COMMENT '观看电影次数，免费3次',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_user`
--

LOCK TABLES `ntp_common_user` WRITE;
/*!40000 ALTER TABLE `ntp_common_user` DISABLE KEYS */;
INSERT INTO `ntp_common_user` VALUES (2,'2023-01-06 10:33:27','userupvrze314lz7g18zm20230106','MTIzNDU2','aa123456','新用户3007',2,0,1,0,4990.00,0.00,0.00,0.00,NULL,0,0,0,NULL,NULL,NULL,NULL,0.00,'O4ULBSIHWHGEL5OC','15800000001',0,'',0),(3,'2023-01-06 10:41:17','userco8osvdu32eit3w20230106','MTIzNDU2','aa123456','新用户1836',2,0,1,0,999.00,0.00,0.00,0.00,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,'BJAQDC7O3OOGCPQS','180180',0,'',0),(4,'2023-01-06 23:26:09','userxresjudi81xcdp7dc20230106','MTIzNDU2','aa123456','新用户2495',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,'VQS5KBGB6E4UK5KZ','15928280591',0,'',0),(5,'2023-01-07 10:57:41','user343qml8b0akuopkn20230107','MTIzNDU2','aa123456','新用户7804',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,'USREUQZQO74N4PRC','180181',0,'',0),(6,'2023-03-06 15:12:59','uservx5rvkgg3tb20230306','MTIzNDU2','aa123456','新用户5739',2,0,1,0,10000.00,0.00,0.00,0.00,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,'KS2TTOLBHF7VYK5H','15800000002',0,'',0),(15,'2022-11-29 11:15:54','agent1','MTIzNDU2','aa123456','麻豆传媒',1,0,1,0,174.00,0.00,0.00,0.00,NULL,0,0,0,NULL,NULL,NULL,NULL,0.00,'F7HKCYDOELIVYVYH','15800005566',0,'',0),(16,'2023-03-13 10:49:03','agent2','MTIzNDU2','aa123456','新用户60796',1,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,0,NULL,NULL,NULL,NULL,0.00,'4UMEL4KJH7MXFHOD',NULL,0,'',0),(35,'2023-03-13 17:26:19','user6vadx9rma5tv20230313','WVdFeE1qTTBOVFk9','aa123456','cs:4348',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'V634H5WCKZPTOYXL','',0,'',0),(36,'2023-03-13 17:27:10','user00475z92u50ora18zw20230313','WVdFeE1qTTBOVFk9','aa123456','cs:3708',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'6F6ET43MAHSZSCIE','',0,'',0),(37,'2023-03-13 17:27:19','userev22xalkyj6jal1mji220230313','WVdFeE1qTTBOVFk9','aa123456','cs:8699',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'LDQ577NCBZW5XELK','',0,'',0),(38,'2023-03-13 17:27:40','usergkztjc8teypvymxvk20230313','WVdFeE1qTTBOVFk9','aa123456','cs:3031',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'SJSWLU4LPFDUCU5D','',0,'',0),(39,'2023-03-13 17:27:44','userexl3idpy3bwpuzh9x8a20230313','WVdFeE1qTTBOVFk9','aa123456','cs:3070',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'5CUTCKVGJVUWZPPP','',0,'',0),(40,'2023-03-13 17:27:50','userg86urzvwbh07yllmb1z20230313','WVdFeE1qTTBOVFk9','aa123456','cs:5883',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'HEQBAMIBLIDLZIR5','',0,'',0),(41,'2023-03-13 17:27:58','user93othb8inicyw20230313','WVdFeE1qTTBOVFk9','aa123456','cs:9324',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'TP5TQKLM7A2UJI5V','',0,'',0),(42,'2023-03-13 17:28:10','useribvnhoi3mxa1etjxm3pb20230313','WVdFeE1qTTBOVFk9','aa123456','cs:2166',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'DZ3NXYVEZIZH5YD2','',0,'',0),(43,'2023-03-13 17:28:17','userwi9oafou6dmc3c7vhf20230313','WVdFeE1qTTBOVFk9','aa123456','cs:6262',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'WT4JNHLK3QGPWPJM','',0,'',0),(44,'2023-03-13 17:28:29','userfwgfquxzr1120230313','WVdFeE1qTTBOVFk9','aa123456','cs:8539',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'2XBRHENSQNTL2432','',0,'',0),(45,'2023-03-13 17:28:32','usersgdl24d7wv5ttx20230313','WVdFeE1qTTBOVFk9','aa123456','cs:4873',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'OPFGVTM2CXASNLKN','',0,'',0),(46,'2023-03-13 17:29:14','userhhe1o4olsya9hbeur4iq20230313','WVdFeE1qTTBOVFk9','aa123456','cs:5194',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'D7525FCJIFZ6URY3','',0,'',0),(47,'2023-03-13 17:29:25','userwgzs3e41m8w20230313','WVdFeE1qTTBOVFk9','aa123456','cs:8868',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'LQ4KBOUHQ2276HPK','',0,'',0),(48,'2023-03-13 17:29:31','user1zztsdzuraoopsd20230313','WVdFeE1qTTBOVFk9','aa123456','cs:3171',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'CHYMRUWXMJWS2LTL','',0,'',0),(49,'2023-03-13 17:30:01','user9pdd3oh15de520230313','WVdFeE1qTTBOVFk9','aa123456','cs:5003',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'CMRPLFFQRCN6OX4S','',0,'',0),(50,'2023-03-13 17:30:14','userp5ffzun4niiu20230313','WVdFeE1qTTBOVFk9','aa123456','cs:6721',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'EBFV3LHS7XGXZQTE','',0,'',0),(51,'2023-03-13 17:30:28','user7r9l9yeact1920230313','WVdFeE1qTTBOVFk9','aa123456','cs:7501',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'KVM6ZCAOGVC32QX7','',0,'',0),(52,'2023-03-13 17:31:54','userjqfm2vhwjwybn6lqwpv20230313','WVdFeE1qTTBOVFk9','aa123456','cs:5270',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'SZJVLBURJQRQGUFT','',0,'',0),(53,'2023-03-13 17:31:57','usern71rc4m8tkycw6s6rbom20230313','WVdFeE1qTTBOVFk9','aa123456','cs:6316',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'W5GD3S5LLRQ4ISQM','',0,'',0),(54,'2023-03-13 17:31:59','user0d4bguh4hiq20230313','WVdFeE1qTTBOVFk9','aa123456','cs:1009',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'NEK2JJ5HMA6XOT6D','',0,'',0),(55,'2023-03-13 17:32:20','userekgsynljbs20230313','WVdFeE1qTTBOVFk9','aa123456','cs:8590',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'4L5UXA3DSTXHIUOS','',0,'',0),(56,'2023-03-13 17:33:53','userxzntyeiv9l99bf3720230313','WVdFeE1qTTBOVFk9','aa123456','cs:9781',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'OGOSCGWQBMFT6JID','',0,'',0),(57,'2023-03-13 17:44:23','user6yzk4zcpzenqm20230313','WVdFeE1qTTBOVFk9','aa123456','cs:5783',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'WWNFJPR3T7OZ35HV','',0,'',0),(58,'2023-03-13 17:48:29','user02xxkkz5a6f0kx520230313','WVdFeE1qTTBOVFk9','aa123456','cs:8666',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'3CAX3QKLZNZZHB5T','',0,'',0),(59,'2023-03-14 13:29:07','usermjbm3uxdh4g20230314','WVdFeE1qTTBOVFk9','aa123456','cs:5020',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'ZLXZINHKQBNSYO5E','',0,'',0),(60,'2023-03-14 13:57:08','user6847gihbt9arqfxhp720230314','WVdFeE1qTTBOVFk9','aa123456','cs:9704',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'U4BBWWPRASDXLZOC','',0,'',0),(61,'2023-03-14 14:05:59','userp25zlwbhr34gijruu20230314','WVdFeE1qTTBOVFk9','aa123456','cs:8056',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'5SI2A3IGUKZVHVA7','',0,'',0),(62,'2023-03-15 15:42:38','userhbjsq5hnjqusjmus620230315','WVdFeE1qTTBOVFk9','aa123456','cs:7860',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'JGFI3GFSPKC6GPG2','',0,'',0),(63,'2023-03-16 00:56:23','useryhs4dlp8ynvho93r20230316','WVdFeE1qTTBOVFk9','aa123456','cs:4041',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'JSCOZODC3QYHOPY3','',0,'',0),(64,'2023-03-16 00:56:23','userpajbwuepc3q20230316','WVdFeE1qTTBOVFk9','aa123456','cs:3936',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'O7DX5OXFZY72J4IX','',0,'',0),(65,'2023-03-16 09:42:16','usertu9hhc5o01s20230316','WVdFeE1qTTBOVFk9','aa123456','cs:1202',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'CAVFNPAGKBYHMADB','',0,'',0),(66,'2023-03-16 16:03:14','uservc3mzsh0u7gi20230316','WVdFeE1qTTBOVFk9','aa123456','cs:5910',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'VDPWKEESPLJXSDJT','',0,'',0),(67,'2023-03-16 16:41:58','1008611','MTIzNDU2','aa123456','cs:3511',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'HAU5S5WPZNVVK3LC','',0,'',0),(68,'2023-03-19 10:50:47','userblzpwgwqrh20230319','WVdFeE1qTTBOVFk9','aa123456','cs:1505',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'Q6QUPZZKQJ4YGYNC','',0,'',0),(69,'2023-03-20 15:12:51','usergprau4ua3au75diapr220230320','WVdFeE1qTTBOVFk9','aa123456','cs:4673',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'YGGRATWOADLB6WWB','',0,'',0),(70,'2023-03-20 15:22:28','usertvwn4wrsfbbzwc5sqmrp20230320','WVdFeE1qTTBOVFk9','aa123456','cs:8200',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'GX2YNNEYUFLKRUZ2','',0,'',0),(71,'2023-03-20 15:30:34','useru7yqimvkbiivsuf20230320','WVdFeE1qTTBOVFk9','aa123456','cs:2638',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'6TNE2L2CTI5ZB2TN','',0,'',0),(72,'2023-03-20 16:07:15','user20efh0if81rjcy3mmj20230320','WVdFeE1qTTBOVFk9','aa123456','cs:3780',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'PWBZJ4P7F4HKMSXG','',0,'',0),(73,'2023-03-20 17:21:02','usera1gfx9pymcpr6v9dwl9p20230320','WVdFeE1qTTBOVFk9','aa123456','cs:9483',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'UMLIJTS43F2O5WOO','',0,'',0),(74,'2023-03-20 17:22:18','userezlp2a8zdtipgml5k20230320','WVdFeE1qTTBOVFk9','aa123456','cs:8682',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'HRXNPQGNUC2DEBZM','',0,'',0),(75,'2023-03-20 17:49:43','usergk7hocjg6zeq8yx20230320','WVdFeE1qTTBOVFk9','aa123456','cs:6405',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'HPTZQPHBZFY2FVDJ','',0,'',0),(76,'2023-03-20 18:34:16','userlz6c4sg0jvi4c20230320','WVdFeE1qTTBOVFk9','aa123456','cs:5254',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'5NZDWNUVPUTMPB74','',0,'',0),(77,'2023-03-21 08:41:27','user0968fv1gytzyf20230321','MzMyMjExeWg=','aa123456','新用户3683',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,'UR5R5Z2EPYP6OLBV','18581993887',0,'',0),(78,'2023-03-21 18:08:48','user2cwgbi85mwrvywtt20230321','WVdFeE1qTTBOVFk9','aa123456','cs:1644',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'3OY4U3KLEHODYRWE','',0,'',0),(79,'2023-03-22 14:42:31','usernxf37b20ocfqu20230322','WVdFeE1qTTBOVFk9','aa123456','cs:8749',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'F72XSSRSDTQ2I3VG','',0,'',0),(80,'2023-03-22 14:56:55','usertg1klecjxjn7il20230322','WVdFeE1qTTBOVFk9','aa123456','cs:1376',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'KTF5UY5CXKKVSYCD','',0,'',0),(81,'2023-03-23 13:44:57','user7txj29vhrbxmhwpopn020230323','WVdFeE1qTTBOVFk9','aa123456','cs:1025',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'4P4IM6WAH3S4UFJV','',0,'',0),(82,'2023-03-23 14:19:47','user0654m94zjxep4rjakhl20230323','WVdFeE1qTTBOVFk9','aa123456','cs:5419',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'O5AMKSNL76RUA35Q','',0,'',0),(83,'2023-03-23 18:34:44','userdo3iomes11805h78bjl20230323','WVdFeE1qTTBOVFk9','aa123456','cs:2988',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'DUJ4PFXOAF4PCGFI','',0,'',0),(84,'2023-03-23 19:46:05','userlbfyhx5qlgfu1s20230323','WVdFeE1qTTBOVFk9','aa123456','cs:1385',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'ZS4UUILSGCK33M6Z','',0,'',0),(85,'2023-03-24 08:52:42','usermyum2nqyihq20230324','WVdFeE1qTTBOVFk9','aa123456','cs:9933',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'6VULMASGUTXZ3N4V','',0,'',0),(86,'2023-03-24 14:27:48','userxlaybd2r4c20230324','WVdFeE1qTTBOVFk9','aa123456','cs:5548',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'3BBEKDH5O5OSTACE','',0,'',0),(87,'2023-03-24 16:36:55','user8hkgqfaalimc7ltwv20230324','WVdFeE1qTTBOVFk9','aa123456','cs:6262',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,15,NULL,NULL,15,NULL,'ZOUEG7CU6Q656ZHG','',0,'',0),(88,'2023-03-27 14:15:02','userpg520230327','WVdFeE1qTTBOVFk9','aa123456','cs:7366',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'RU5C6UIPEEQJRZMH','',0,'',0),(89,'2023-03-27 14:29:56','userqdujd20230327','WVdFeE1qTTBOVFk9','aa123456','cs:1276',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'T4BPCUCB63UXG42V','',0,'',0),(90,'2023-03-27 14:30:02','user0asqz0x20230327','WVdFeE1qTTBOVFk9','aa123456','cs:3543',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'RDRPXGINGMDFOAO6','',0,'',0),(91,'2023-03-27 14:30:45','user06g66hxt20230327','WVdFeE1qTTBOVFk9','aa123456','cs:3018',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'KSP7I3M7XL3UIDZM','',0,'',0),(92,'2023-03-27 14:31:18','usern3a20230327','WVdFeE1qTTBOVFk9','aa123456','cs:4557',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'JHRCFYQFUWXPQASH','',0,'',0),(93,'2023-03-27 14:31:19','users7l20230327','WVdFeE1qTTBOVFk9','aa123456','cs:3038',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'SE3WXP4VDK3WDFOW','',0,'',0),(94,'2023-03-27 14:31:22','userysytu4320230327','WVdFeE1qTTBOVFk9','aa123456','cs:1483',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'6E3FRTXZXHLGGGEZ','',0,'',0),(95,'2023-03-27 14:32:27','usertsz20230327','WVdFeE1qTTBOVFk9','aa123456','cs:8055',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'334Q5XHS5N55Z4VX','',0,'',0),(96,'2023-03-27 14:32:55','userss5sms20230327','WVdFeE1qTTBOVFk9','aa123456','cs:1804',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'5PXUADNED5BAHS7E','',0,'',0),(97,'2023-03-27 14:39:13','userta320230327','WVdFeE1qTTBOVFk9','aa123456','cs:1204',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'HJAQOTDIYKI6TUBY','',0,'',0),(98,'2023-03-27 16:27:05','userh0ci820230327','WVdFeE1qTTBOVFk9','aa123456','cs:1252',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'TPB5JXVH7SETPW5P','',0,'topic/20230327/c57d7e0244c70c8a08a4b49af3e65199.png',0),(99,'2023-03-27 18:23:41','userkbl20230327','MTExMTEx','aa123456','新用户1657',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,'54AKUAKMEEORPRKN','18581993886',0,'',0),(100,'2023-03-27 20:27:38','usernptjh20230327','WVdFeE1qTTBOVFk9','aa123456','cs:6472',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'OSCDQXCTGJLUN725','',0,'',0),(101,'2023-03-27 23:53:55','user9qf20230327','WVdFeE1qTTBOVFk9','aa123456','cs:6490',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'QYL4ILDZMR32VJNY','',0,'',0),(102,'2023-03-28 08:26:58','userg6dk20230328','WVdFeE1qTTBOVFk9','aa123456','cs:2417',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'PNZELSOMMPWYBSVL','',0,'',0),(103,'2023-03-28 08:28:20','user41w20230328','WVdFeE1qTTBOVFk9','aa123456','cs:7935',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'3XSMCGLBEYE3BLQQ','',0,'',0),(104,'2023-03-28 08:30:18','userywcdbtcn20230328','WVdFeE1qTTBOVFk9','aa123456','cs:9209',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'LZOY7RVU5M2XLTCG','',0,'',0),(105,'2023-03-28 10:15:39','userc1yof20230328','WVdFeE1qTTBOVFk9','aa123456','cs:6133',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'XTICCBJPUF6B3NAQ','',0,'',0),(106,'2023-03-28 10:21:23','userzijwbzay20230328','WVdFeE1qTTBOVFk9','aa123456','cs:3997',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'N46O5YWUV4QMRKOF','',0,'',0),(107,'2023-03-28 10:27:05','usertsr2r20230328','WVdFeE1qTTBOVFk9','aa123456','cs:5572',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'R2HKVZ5EAMOVTHDH','',0,'',0),(108,'2023-03-28 10:45:48','uservsmct20230328','WVdFeE1qTTBOVFk9','aa123456','cs:7677',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'6NN5562JA6W6TI3L','',0,'',0),(109,'2023-03-28 11:14:55','userdeo20230328','WVdFeE1qTTBOVFk9','aa123456','cs:9139',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'ZPIGH3FONBGY4FG2','',0,'',0),(110,'2023-03-28 11:14:56','user8dws20230328','WVdFeE1qTTBOVFk9','aa123456','cs:8043',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'UZSJHBTWIUQW27PV','',0,'',0),(111,'2023-03-28 11:15:17','user5n7zd20230328','WVdFeE1qTTBOVFk9','aa123456','cs:6721',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'WQLC3PC2VKBAESYY','',0,'',0),(112,'2023-03-28 11:15:20','userj1ha20230328','WVdFeE1qTTBOVFk9','aa123456','cs:2869',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'KKSNKPGW6MICADZC','',0,'',0),(113,'2023-03-28 11:15:27','userqyp56z5h20230328','WVdFeE1qTTBOVFk9','aa123456','cs:2886',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'FZQBNQCJKI7VXBXR','',0,'',0),(114,'2023-03-28 11:15:31','user8q7j20230328','WVdFeE1qTTBOVFk9','aa123456','cs:3266',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'VW75LSSOBTPANLPU','',0,'',0),(115,'2023-03-28 11:26:38','userhse20230328','WVdFeE1qTTBOVFk9','aa123456','cs:9367',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'VPIQG2VQTEEL6SZI','',0,'',0),(116,'2023-03-28 11:26:39','userut1ec20230328','WVdFeE1qTTBOVFk9','aa123456','cs:1433',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'JQGDSZCCBRQ4JYAM','',0,'',0),(117,'2023-03-28 13:24:33','user8bqd020230328','WVdFeE1qTTBOVFk9','aa123456','cs:5459',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'3PULCJQTXWB74TUL','',0,'',0),(118,'2023-03-28 13:26:44','usery1fuw20230328','WVdFeE1qTTBOVFk9','aa123456','cs:5818',2,0,1,0,0.00,0.00,0.00,0.00,NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,'ILX2HHHUT755WM5C','',0,'',0);
/*!40000 ALTER TABLE `ntp_common_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_common_user_online`
--

DROP TABLE IF EXISTS `ntp_common_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_user_online` (
  `ol_name` varchar(255) DEFAULT NULL COMMENT 'token',
  `ol_value` varchar(255) DEFAULT NULL COMMENT 'uid',
  `over_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_user_online`
--

LOCK TABLES `ntp_common_user_online` WRITE;
/*!40000 ALTER TABLE `ntp_common_user_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_common_user_online` ENABLE KEYS */;
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
-- Table structure for table `ntp_common_user_pour`
--

DROP TABLE IF EXISTS `ntp_common_user_pour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_common_user_pour` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `bz_id` int(11) NOT NULL COMMENT '博主ID',
  `bz_name` varchar(255) NOT NULL COMMENT '博主昵称',
  `create_time` datetime NOT NULL,
  `is_read` int(1) NOT NULL DEFAULT '0' COMMENT '0 未读 1已读',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='用户关注博主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_common_user_pour`
--

LOCK TABLES `ntp_common_user_pour` WRITE;
/*!40000 ALTER TABLE `ntp_common_user_pour` DISABLE KEYS */;
INSERT INTO `ntp_common_user_pour` VALUES (1,65,15,'麻豆传媒','2023-03-17 15:30:06',1),(2,40,15,'麻豆传媒','2023-03-17 15:30:06',1),(3,41,15,'麻豆传媒','2023-03-17 15:30:06',1),(4,42,15,'麻豆传媒','2023-03-17 15:30:06',1),(5,43,15,'麻豆传媒','2023-03-17 15:30:06',1),(6,44,15,'麻豆传媒','2023-03-17 15:30:06',1),(7,45,15,'麻豆传媒','2023-03-17 15:30:06',1),(8,46,15,'麻豆传媒','2023-03-17 15:30:06',1),(9,47,15,'麻豆传媒','2023-03-17 15:30:06',1),(10,48,15,'麻豆传媒','2023-03-17 15:30:06',1),(11,49,15,'麻豆传媒','2023-03-17 15:30:06',1),(12,50,15,'麻豆传媒','2023-03-17 15:30:06',1),(13,67,15,'麻豆传媒','2023-03-21 13:20:04',0);
/*!40000 ALTER TABLE `ntp_common_user_pour` ENABLE KEYS */;
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
-- Table structure for table `ntp_member`
--

DROP TABLE IF EXISTS `ntp_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_member` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_member`
--

LOCK TABLES `ntp_member` WRITE;
/*!40000 ALTER TABLE `ntp_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_member` ENABLE KEYS */;
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
  `status` int(11) NOT NULL COMMENT '状态 0上传 1待审核  2 正常 -1 删除 ',
  `slice_msg` varchar(600) NOT NULL COMMENT '切片信息',
  `finsh_time` datetime NOT NULL COMMENT '完成时间',
  `update_status` int(11) NOT NULL COMMENT '上传状态 0 上传中  1 已完成',
  `change_status` int(11) NOT NULL COMMENT '更新状态',
  `name` varchar(300) NOT NULL COMMENT '文件名称',
  `video_path` varchar(255) NOT NULL,
  `img_path` text COMMENT '封面图',
  `duration` int(11) DEFAULT '0' COMMENT '免费时长',
  `platform` varchar(255) DEFAULT NULL COMMENT '平台',
  `labels` varchar(255) DEFAULT '' COMMENT '标签，#隔开，比如 #古装#魅人',
  `video_title` varchar(255) DEFAULT NULL,
  `video_price` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `video_type` int(11) NOT NULL COMMENT '视频分类',
  `is_change` int(11) NOT NULL DEFAULT '0' COMMENT '0 不转 1 转 ，转m3u8',
  `size` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='用户上传视频表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_update_video`
--

LOCK TABLES `ntp_update_video` WRITE;
/*!40000 ALTER TABLE `ntp_update_video` DISABLE KEYS */;
INSERT INTO `ntp_update_video` VALUES (9,1,7,'2023-03-21 10:16:20','/www/wwwroot/upload.com/upload/public/upload/7/32112.mp4','',1,'fddff7d208d6ef5d315866791dc9bee6','2023-03-21 10:16:58',1,0,'32112.mp4','/upload/7/32112.mp4','/upload_image/7/20230321/c173a1d103f9a1a366dd2a976f2f4ce7.png',0,NULL,'#国风','测试视频1',0,NULL,1,0,17),(10,1,7,'2023-03-21 10:18:23','/www/wwwroot/upload.com/upload/public/upload/7/32321.mp4','/m3u8/7/10/input.m3u8',1,'8fa40b6c9a36e20a0df9ec8b64e1a977','2023-03-21 10:18:50',1,0,'32321.mp4','/upload/7/32321.mp4','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png',0,NULL,'#国风','长视频测试1',0,NULL,2,1,10),(11,1,7,'2023-03-21 16:35:32','/www/wwwroot/upload.com/upload/public/upload/7/1.mp4','/m3u8/7/11/input.m3u8',1,'2809e7e7e843f3d3f3896e89e8c2bae8','2023-03-21 16:36:18',1,0,'1.mp4','/upload/7/1.mp4','/upload_image/7/20230321/8296073a5744ba5a9d2d5f15cebf5dc1.jpeg',0,NULL,'#街拍','街拍10',0,NULL,7,1,29),(12,1,7,'2023-03-21 16:36:20','/www/wwwroot/upload.com/upload/public/upload/7/2.mp4','',1,'7a9fff8c132d48c5dd6815b9f348492f','2023-03-21 16:36:33',1,0,'2.mp4','/upload/7/2.mp4','/upload_image/7/20230321/3672338827c5f5a83c239756073ae5a8.jpeg',0,NULL,'#街拍','街拍9',0,NULL,1,0,8),(13,1,7,'2023-03-21 16:36:34','/www/wwwroot/upload.com/upload/public/upload/7/3.mp4','',1,'8d1e22b842f61ddbc6f5a1a31e01b975','2023-03-21 16:37:00',1,0,'3.mp4','/upload/7/3.mp4','/upload_image/7/20230321/2736baa2e47804f58f5a3b35e86eeeeb.jpeg',0,NULL,'#街拍','街拍8',0,NULL,1,0,16),(14,1,7,'2023-03-21 16:37:02','/www/wwwroot/upload.com/upload/public/upload/7/4.mp4','',1,'253f5f61befc4696498e96d2a2bfe114','2023-03-21 16:37:03',1,0,'4.mp4','/upload/7/4.mp4','/upload_image/7/20230321/da926f694c51402e4a6f87ff9bba442b.jpeg',0,NULL,'#街拍','街拍7',10,NULL,1,0,1),(15,1,7,'2023-03-21 16:37:05','/www/wwwroot/upload.com/upload/public/upload/7/5.mp4','/m3u8/7/15/input.m3u8',1,'8447b4b3d3a6084e5ea9c0eebfcd8d8f','2023-03-21 16:37:10',1,0,'5.mp4','/upload/7/5.mp4','/upload_image/7/20230321/6ebe2f122c297c55a6e6f1414096e2a1.jpeg',0,NULL,'#街拍','街拍6',10,NULL,1,0,4),(16,1,7,'2023-03-21 16:37:12','/www/wwwroot/upload.com/upload/public/upload/7/6.mp4','',1,'da53e6b02ed26705e15ce072cf1e9bd9','2023-03-21 16:37:17',1,0,'6.mp4','/upload/7/6.mp4','/upload_image/7/20230321/89f9c8317c4f3b0044339b86dddc8c15.jpeg',0,NULL,'#街拍','街拍5',10,NULL,1,0,3),(17,1,7,'2023-03-21 16:37:19','/www/wwwroot/upload.com/upload/public/upload/7/7.mp4','',1,'0dba713f6ac0626564223ba462ed9ab3','2023-03-21 16:37:21',1,0,'7.mp4','/upload/7/7.mp4','/upload_image/7/20230321/472ec377fb86a4558626ac83cca22d4e.jpeg',0,NULL,'#街拍','街拍4',10,NULL,1,0,2),(18,1,7,'2023-03-21 16:37:23','/www/wwwroot/upload.com/upload/public/upload/7/8.mp4','/m3u8/7/18/input.m3u8',1,'02ac646ee0eb749f39650cbb47ffef87','2023-03-21 16:37:28',1,0,'8.mp4','/upload/7/8.mp4','/upload_image/7/20230321/c64eae134a785060b8670d1af8e1e7d0.jpeg',0,NULL,'#街拍','街拍3',10,NULL,4,1,3),(19,1,7,'2023-03-21 16:37:30','/www/wwwroot/upload.com/upload/public/upload/7/9.mp4','/m3u8/7/19/input.m3u8',1,'65d7f9572b4deb3fb38de052da15b834','2023-03-21 16:38:20',1,0,'9.mp4','/upload/7/9.mp4','/upload_image/7/20230321/fdbb81ea6a047c81c5a7229c0ebb8d9c.jpeg',0,NULL,'#街拍','街拍2',10,NULL,3,1,31),(20,1,7,'2023-03-21 16:38:22','/www/wwwroot/upload.com/upload/public/upload/7/10.mp4','/m3u8/7/20/input.m3u8',1,'2676a4cb57b13e472f81b5149888dd92','2023-03-21 16:38:25',1,0,'10.mp4','/upload/7/10.mp4','/upload_image/7/20230321/c87df2daf99bc6434ac9678a47d1d504.jpeg',0,NULL,'#街拍','街拍1',10,NULL,5,1,3),(21,1,7,'2023-03-21 17:02:21','/www/wwwroot/upload.com/upload/public/upload/7/19.mp4','',0,'135e81ae40ea73a968f593579a9756a0','2023-03-21 17:03:12',1,0,'19.mp4','/upload/7/19.mp4',NULL,0,NULL,'',NULL,0,NULL,0,0,31),(22,1,14,'2023-03-21 18:56:56','/www/wwwroot/upload.com/upload/public/upload/14/【更多福利视频电报搜索_@niuav】_有男朋友还这么骚.mp4','',1,'df8cc02268e5ae53cab786c659b6438b','2023-03-21 18:57:20',1,0,'【更多福利视频电报搜索_@niuav】_有男朋友还这么骚.mp4','/upload/14/【更多福利视频电报搜索_@niuav】_有男朋友还这么骚.mp4','/upload_image/14/20230321/54e1d9cd031a3f55eed5319881ecd6ec.png',60,NULL,'国产','有男朋友还这么骚',26,'有男朋友还这么骚',1,0,6),(23,1,14,'2023-03-21 18:59:12','/www/wwwroot/upload.com/upload/public/upload/14/新到极品女神偷情大戏，当着老公92230a.mp4','/m3u8/14/23/input.m3u8',1,'e8a6a979b20c453b51f69b2ea443fa27','2023-03-21 19:20:05',1,0,'新到极品女神偷情大戏，当着老公92230a.mp4','/upload/14/新到极品女神偷情大戏，当着老公92230a.mp4','/upload_image/14/20230321/569866f99151339272596f938006fb4c.jpg',60,NULL,'#国产#偷情#绿帽','新到极品女神偷情大戏，当着老公',68,'新到极品女神偷情大戏，当着老公',3,1,300);
/*!40000 ALTER TABLE `ntp_update_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_video`
--

DROP TABLE IF EXISTS `ntp_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_video` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '分类名',
  `title` varchar(600) NOT NULL COMMENT '标题',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 正常',
  `video_price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '单片购买视频价格。',
  `description` varchar(255) DEFAULT NULL COMMENT '介绍描述',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `admin_uid` int(11) NOT NULL DEFAULT '0',
  `vod_play_from` varchar(255) DEFAULT NULL COMMENT '播放类型',
  `is_only_buy_alone` int(11) NOT NULL DEFAULT '0' COMMENT '是否只能单独购买',
  `labels` varchar(255) DEFAULT NULL COMMENT '标签，#隔开，比如 #古装#魅人',
  `heat` int(11) NOT NULL DEFAULT '0' COMMENT '热度，热度越高 排前面',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序。指定排到前面的电影',
  `video_money` int(11) NOT NULL DEFAULT '0' COMMENT '视频获得的打赏金额',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '免费时长',
  `platform` varchar(20) DEFAULT NULL COMMENT '平台',
  `upload_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32533 DEFAULT CHARSET=utf8mb4 COMMENT='视频详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_video`
--

LOCK TABLES `ntp_video` WRITE;
/*!40000 ALTER TABLE `ntp_video` DISABLE KEYS */;
INSERT INTO `ntp_video` VALUES (32344,1,'猫耳朵装扮可爱女友',1,0,'manbeiwenshenmengmengdashuangmaweimeiniuwuliaohepaoyoulaiyipaotexieshenhouxishunhenmailizhudongshangweiqichengfuzhuopiguyidunmengcao','2022-12-03 18:05:00','2022-12-03 18:05:00',15,'slm3u8',0,'#美女#武侠',140,0,0,0,'',NULL),(32345,1,'猫耳朵装扮可爱女友',1,0,'maoerduozhuangbankeainvyouwoshizhongrichangxingshenghuobeishuaiqinanyouwutaopapaduozishicaoxue','2022-12-03 18:05:00','2022-12-03 18:05:00',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32346,1,'猫耳朵装扮可爱女友',1,0,'laogeyuenanyueliaogegaoyanzhimeizipapatiaowuniudongyifankaiganTPhouruqichengbaoqilaidalimengcaoshenyinfeichangyouren','2022-12-03 18:05:00','2022-12-03 18:05:00',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32347,1,'猫耳朵装扮可爱女友',1,0,'mamazuijiuhouzhijieshangliaozuihoumamakuliao2','2022-12-03 18:05:00','2022-12-03 18:05:00',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32348,1,'猫耳朵装扮可爱女友',1,0,'lianxuyueduogemeizizhongtuhuanchaojiaAVshijiaoshafakuangganquanchengjilu','2022-12-03 18:05:00','2022-12-03 18:05:00',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32349,1,'猫耳朵装扮可爱女友',1,0,'kouzhaomengmeiziqingquzhuangtoushizhuangheisidaojuziweiyizishangzimobibidaojuJJchouchashenyinjiaochuanhenshiyouhuoxihuanbuyaocuoguo','2022-12-03 18:05:00','2022-12-03 18:05:00',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32350,1,'猫耳朵装扮可爱女友',1,0,'meijiaochuniangmumuyazheyangdenvrennihuiqumaxiadechufangyindetingfabianchichaohaodecaibianziweiyinjiaotaiyouhuolarenbuzhulu','2022-12-03 18:05:00','2022-12-03 18:05:00',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32351,1,'猫耳朵装扮可爱女友',1,0,'kanchengzuiwanmeishencaideGnaifengyaojuruchaogaoyanzhinvshenUnicornyongchibiandediyicixingaizipaishebaozuopindanaichengjiejingye','2022-12-03 18:05:00','2022-12-03 18:05:00',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32352,1,'猫耳朵装扮可爱女友',1,0,'laolichengmingzhizhanmodudaquansiwuqianyipaojipinchemogaoyanzhinvshenfengsaomeihuorenjianyouwu','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',2,0,0,0,'',NULL),(32353,1,'猫耳朵装扮可爱女友',1,0,'laogeyuenanyueliaogeduanfayanzhibucuoshaofupapaqichengluguankoujiaohourumengcaobaoqilaicaohenshiyouhuoxihuanbuyaocuoguo','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32354,1,'猫耳朵装扮可爱女友',1,0,'lounaiqingquzhuangmiliqingchunyanzhijiqingdaxiuzhibogensaonvPKziweisaoxuerounaizibeihaoguimiyongdaojuchouchasaoxuelangjiaoshenyinbuzhi','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32355,1,'猫耳朵装扮可爱女友',1,0,'liangchanghejidiyichanggaoyanzhiqizhibucuomeizipapashewenhumotexiekoujiaoshangweiqichengdalimengcaodierchangchangxiangqingchunluoliqunmeizipapatuodiaobaixuetexiekoujiaoshangweiqichengchouchamengcao','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32356,1,'猫耳朵装扮可爱女友',1,0,'liangjiarenqijiazhongbeilianganliangpaochengshunvrenyuwangqiangshewenchabijikexujiuyichaomanzubuyi','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32357,1,'猫耳朵装扮可爱女友',1,0,'maweibianbaorunvshenzhizhuxiaqingkaidangquzhuangxiongqiangekailunaizimitaomeiruqiaoqibaixueruyundilajiduyinsaodiaodaiheisigengshiyouren','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32358,2,'猫耳朵装扮可爱女友',1,0,'lvqidashenjilujipinyindangjiaoqihenglifuqidiaodaiheisiqingqusihoudannanquanzidongzhazhiyouwukoubaojipinyinqi','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32359,2,'猫耳朵装扮可爱女友',1,0,'meiguo9cundadiaonanyouhexianggangchangtuinenmonvyoufengkuangxingaishikunbangshoujiaonuecaozhidinghuaxin','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32360,2,'猫耳朵装扮可爱女友',1,0,'laogezhaoxiaojiezhibopapayugangxizaokoujiaochouchashangweiqichengfeichangyourenhenshiyouhuoxihuanbuyaocuoguo','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32361,2,'猫耳朵装扮可爱女友',1,0,'mamadainveryiqizhibodaxiuzhengqianquanchenglulianheisiqingqunaizishangdewenshenhuanyiyangweinverchinaiwanbishuangtoudaojuchouchagaochaobuduan','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32362,2,'猫耳朵装扮可爱女友',1,0,'meinvchuchagoudanantongshijiudianjiqingpaparangxiaogecaozuichuangxiacaodaochuangshanggezhongzishiroulinchoucha','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32363,2,'猫耳朵装扮可爱女友',1,0,'laogeyuepaoxiaofumeizikaifangpapamiaotiaoshencaihourumengcaozhanlichouchafeichangyourenhenshiyouhuoxihuanbuyaocuoguo','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32364,2,'猫耳朵装扮可爱女友',1,100,'kechunkefengsaodeshaonvyouhuoquanchengluliangaoyanzhixiganjingliaopeilangyoufasaoganjingdebibimeiyoujigenmaorounaiziweitexiezhanshihaociji','2022-12-03 18:05:03','2023-01-06 11:03:20',15,'slm3u8',1,'#美女#武侠',79,0,0,0,'',NULL),(32365,2,'猫耳朵装扮可爱女友',1,0,'keaidebaisi','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32366,2,'猫耳朵装扮可爱女友',1,0,'laogeyuenanyueliaogegaoyanzhimiaotiaomeiziyiqizhiboquanluoniudongshentikanzhuofeichangyourenhenshiyouhuoxihuanbuyaocuoguo','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32367,2,'猫耳朵装扮可爱女友',1,0,'kanqilaitinglaoshidexiaoqingnianyanfubuqianlvdianyudiaozhongdanailiangjiarenqishaofutouqingjiaodesaohenjiqingyanshejingzitulianshuomeirongdeduibaijingcai','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32368,2,'猫耳朵装扮可爱女友',1,0,'laozhubotaolubiaodiyishijiaobaixueziweidaojuchaxuehuojiliaobimaomailikouhuoshouchijingtoucaobizhijieneishe','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32369,3,'猫耳朵装扮可爱女友',1,0,'mahuabianqingchunwaibiaohensaomengmeidiandongjiadiaoqizuochaxuebaikaikandongdonghenxiaobabacaowosaobijinjinchuchumengchazhilangjiao','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32370,3,'猫耳朵装扮可爱女友',1,0,'lvshizhifudeyinyutiaodouhuarunzhishuimixuedingbuzhuliaoneishewumaomibao','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32371,3,'猫耳朵装扮可爱女友',1,0,'liujiweitoupaitoumingqingquzhuangnenmeipaoyijizhanbaolisicheqingquzhuangnucaoneisheduibaiyouqu','2022-12-03 18:05:03','2022-12-03 18:05:03',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32372,3,'猫耳朵装扮可爱女友',1,0,'laogeyelangchujiyuenanyueliaogesaoqiduanfashaofukoujiaodiaoshangmoshangsuannaitiannongganjingfeichangyourenxihuanbuyaocuoguo','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32373,3,'猫耳朵装扮可爱女友',1,0,'lianyiqunqingchunpiaoliangxuemeiqingchunganshizudaidaojiudianpapaxiaoxuedubeiwanjuanbianliaorenmeiBshouzuia','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32374,3,'猫耳朵装扮可爱女友',1,0,'youma299EWDX29228suiao','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32375,3,'猫耳朵装扮可爱女友',1,0,'manbeiwenshenshaofugendageshenyejiqingpapaquanchenglulianwenroudekoujiaodajibajiqingshangweitinglidesaonaizigezhongchouchalangjiaoshenyinbuduan','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32376,3,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO116taozi','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32377,3,'猫耳朵装扮可爱女友',1,0,'youma328HMDN25220caidiaozichengSxiaoemoJDtaboqibiantaishizhiwomanxianjietupozhongfu','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32378,3,'猫耳朵装扮可爱女友',1,0,'liangzhifennenkeaidexiaoluoliyiqijingchangdaxiuquanchenglulianbibinaizidushihennentianbitianjiaowannaizijuezhuopigubaojuhuageilangyoukan','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32379,3,'猫耳朵装扮可爱女友',1,0,'lvboxiahaiwanmeishencaiqiaoqiaomeimeishencaigaotiaoquanshenxuebaifennentingbashencaisaoxuekouchubaidaihenyourendeo','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32380,3,'猫耳朵装扮可爱女友',1,0,'liangjiemeihuxiangseqingtianxifuwujiejiehuanchuanshangjiajibacaowo','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32381,4,'猫耳朵装扮可爱女友',1,0,'meijiadianfengsaolaobanniangyanzhishaofuwozaitianjinkeyuekekongjiangquantaowozaidianlimiansuoyishenyinhenxiaogebiyouren','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32382,4,'猫耳朵装扮可爱女友',1,0,'lengyanxinggaoyanzhinvshendaizhuoyanjingyujiefengdiaodaishuiyimiaotiaoshencaimeituibaixueshouzhiroucuoyushixizaoshishenbainonggezhongzishi','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32383,4,'猫耳朵装扮可爱女友',1,0,'youma328HMDN257xiaxiuJx2renzuGETwangziyangdahaogerencuoyingchuchaotianguozhongchuyibushizhongsuren','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32384,4,'猫耳朵装扮可爱女友',1,0,'youma345SIMM32824','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32385,4,'猫耳朵装扮可爱女友',1,0,'youma332NAMA086gerencuoying22suizhongRdaxuejingjixuebujudaodemeishaonvmeifenglvchang3fashekouneishejingx2','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32386,4,'猫耳朵装扮可爱女友',1,0,'youma335ELDX061lanchuanyang','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32387,4,'猫耳朵装扮可爱女友',1,0,'manbeiwenshenshuangmaweiqingchunmengmeixingfulaogecaodaozheyangjipinxishuntiandiaokouhuohenbangzhudongqichengniudongxiyaopazhuohourucaodelangjiao','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32388,4,'猫耳朵装扮可爱女友',1,0,'youma345SIMM355','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32389,4,'猫耳朵装扮可爱女友',1,0,'youma345SIMM330meiyaoshenglianxuguichuankuangnv','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32390,4,'猫耳朵装扮可爱女友',1,0,'youma345SIMM341','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32391,4,'猫耳朵装扮可爱女友',1,0,'youma345SIMM3437nianfannongchuanJ','2022-12-03 18:05:06','2022-12-03 18:05:06',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32392,4,'猫耳朵装扮可爱女友',1,0,'mamahaosaogoudasaoerzichinaitianbigeierzikoujiaodajibasiwagaogenyouhuojuezhuopigugeilangyoukanzhuobikoujiaorangerzishezuilichi','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32393,4,'猫耳朵装扮可爱女友',1,0,'keaimengmeizinidexiaolaopowozhizhenglingqianbuyaoyaoqiutaigaowobizhiyouyigerencaoguofenshouhaojiuliaowoyigerenzhiboyoushihouhaogudana','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32394,5,'猫耳朵装扮可爱女友',1,0,'keaiyoudaidianyaoyandexiaojiejiemitaobaixinaizijueshibaihufenbihuanhenjinxiaogecharuhennuanhendaijin','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32395,5,'猫耳朵装扮可爱女友',1,0,'youma299EWDX290tazi38suiyanjingsiheaoao','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32396,5,'猫耳朵装扮可爱女友',1,0,'youma345SIMM342xingyuSEXshengniangbaobian0002','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32397,5,'猫耳朵装扮可爱女友',1,0,'youma345SIMM34023','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32398,5,'猫耳朵装扮可爱女友',1,0,'youma302GERBM006renqi','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32399,5,'猫耳朵装扮可爱女友',1,0,'youma345SIMM332charuxianyimeiyaoshengSEX','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32400,5,'猫耳朵装扮可爱女友',1,0,'youma345SIMM333jichaoniangmeiyaominganfaqingGzhongwai','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32401,5,'猫耳朵装扮可爱女友',1,0,'youma345SIMM311yi','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32402,5,'猫耳朵装扮可爱女友',1,0,'youma332NAMA085meicanggerencuoying26suiheshiliaoliwuqinwuboduobian','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32403,5,'猫耳朵装扮可爱女友',1,0,'youma326NKR012liniangwuxukezhongjieshibanzunliniangchedidiaochachaozhongliangjikannengwuxukezhongchengbai','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32404,5,'猫耳朵装扮可爱女友',1,0,'youma329EXMU036','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32405,5,'猫耳朵装扮可爱女友',1,0,'youma299EWDX28930suicuoliuchuHshuqi','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32406,5,'猫耳朵装扮可爱女友',1,0,'youma345SIMM338zhajingjishangzhongchuSEXerhuizhanqincharu','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32407,6,'猫耳朵装扮可爱女友',1,0,'youma330PER228','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32408,6,'猫耳朵装扮可爱女友',1,0,'youma336KNB082quanguorenqitujianrenqiquanguomujichuzhangcuogongkaiyousha39suijiehun3niandannayuanyinyuqiubumanqingchuxiaoyangjiuzhenmengzhongganru','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32409,6,'猫耳朵装扮可爱女友',1,0,'youma336KNB092quanguorenqitujianrenqiquanguomujichuzhangcuogongkaimali37suijiehun7nianmuqutuowuxiaoyansudiaoyangliuyuqiuAVfasanqiexiongchurushouhaoganduyinmaonongzhiloumuqiannangenmengzhongshimohoudaicharubinvlixingyiqibenghuai','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32410,6,'猫耳朵装扮可爱女友',1,0,'youma320MMGH242gerencuoyinginhao21','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32411,6,'猫耳朵装扮可爱女友',1,0,'youma345SIMM327juedarenqibaoyushibiyuanjieguowww','2022-12-03 18:05:10','2022-12-03 18:05:10',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32412,6,'猫耳朵装扮可爱女友',1,0,'youma345SIMM326GmuxingzhengxiaoemobaoyushiganSEX','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32413,6,'猫耳朵装扮可爱女友',1,0,'youma345SIMM336boqiquedingexiqinrunonghou','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32414,6,'猫耳朵装扮可爱女友',1,0,'youma320MMGH241gerencuoyinginhao20','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32415,6,'猫耳朵装扮可爱女友',1,0,'wuma1Pondo061819001lihuasinvban','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32416,6,'猫耳朵装扮可爱女友',1,0,'youma335ELDX062shantianyang25sui','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32417,6,'猫耳朵装扮可爱女友',1,0,'youma302GERBM003niang','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32418,6,'猫耳朵装扮可爱女友',1,0,'youma326SPOR019JDnvzihannonghoushenzhuozhenmianmunvzidashengshengtuzhongchugubengyaoshipilu','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32419,6,'猫耳朵装扮可爱女友',1,0,'youma336KNB096quanguorenqitujianrenqiquanguomujichuzhangcuogongkai30suijiehun2nianfuqidannashifanAVchuyanjuemeirenaoyangrushoutongshigongqichengweijiyaozhendannaqianjianjijideziqianyupilu','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32420,6,'猫耳朵装扮可爱女友',1,0,'youma336KNB091quanguorenqitujianrenqiquanguomujichuzhangcuogongkai28suijiehun1nianyuqiubumanaoyangdannaneixuAVchuyanzhiqi0julizhiaotunonghoukannengbennengxingyujiefang','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32421,6,'猫耳朵装扮可爱女友',1,0,'youma336KNB084quanguorenqitujianrenqiquanguomujichuzhangcuogongkai28suijiehun3nianyuqiubumanwangxiangjiujiyaozhenluanqichichaochuigandongleiliu','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32422,7,'猫耳朵装扮可爱女友',1,0,'youma336KNB094quanguorenqitujianrenqiquanguomujichuzhangcuogongkaiweiyou29suijiehun6niandannadanbodunganyuqiubumancijiqiuAVchuyannongmeijuedingyangfan','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32423,7,'猫耳朵装扮可爱女友',1,0,'youma326MTP010liuxingzhongchumeiyaoxiaojifaqinghedushouyuwangmanbiantaibaobiannvzi0002','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32424,7,'猫耳朵装扮可爱女友',1,0,'youma336KNB095quanguorenqitujianrenqiquanguomujichuzhangcuogongkaimeinaizi36suijiehun9niandannayanmanmantanyurenqidengchangbaoxindiliangganduliangyimijishangwei','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32425,7,'猫耳朵装扮可爱女友',1,0,'youma326AID004gecuowuxukezhongpeishenggualaidixiafancuoyinglianxipianmeishaonvcuoganxing','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32426,7,'猫耳朵装扮可爱女友',1,0,'youma345SIMM309niangyangzhuchechangdanmeinvsijian0002','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32427,7,'猫耳朵装扮可爱女友',1,0,'youma345SIMM339meikaobizhirenqimeijiao','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32428,7,'猫耳朵装扮可爱女友',1,0,'youma336KNB093quanguorenqitujianrenqiquanguomujichuzhangcuogongkai28suijiehun2nianbanquotjiejinfanjijinweiquotyanlousanlejuju2huizhanzhongchuxiaoxuwuchakuchaMrenqi','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32429,7,'猫耳朵装扮可爱女友',1,0,'youma302GERBM001renqi','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32430,7,'猫耳朵装扮可爱女友',1,0,'youma330PER232','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32431,7,'猫耳朵装扮可爱女友',1,0,'youma345SIMM300Gmingyuanqinvzishengrushouzeyunshou','2022-12-03 18:05:13','2022-12-03 18:05:13',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32432,7,'猫耳朵装扮可爱女友',1,0,'youma329EXMU035','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32433,7,'猫耳朵装扮可爱女友',1,0,'youma345SIMM347','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32434,7,'猫耳朵装扮可爱女友',1,0,'youma329EXMU046','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32435,7,'猫耳朵装扮可爱女友',1,0,'youma302GERBM007OL','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32436,7,'猫耳朵装扮可爱女友',1,0,'youma345SIMM314haorenqizhongchuzhihousaochuww','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32437,7,'猫耳朵装扮可爱女友',1,0,'youma326AID007gecuodixia1mei1000fu','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32438,7,'猫耳朵装扮可爱女友',1,0,'youma302GERBM004OL','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32439,8,'猫耳朵装扮可爱女友',1,0,'youma336KNB085quanguorenqitujianrenqiquanguomujichuzhangcuogongkaicaiya32suijiehun5nianmuchangshenmeijiaozigongsiliangaoyangdannadatarenbangqichiji','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32440,8,'猫耳朵装扮可爱女友',1,0,'youma345SIMM321faqingmeirenbuxiaqizishangsizhongchuSEXaoduow0002','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32441,8,'猫耳朵装扮可爱女友',1,0,'riyuguannengshoucangjiariyuzhongzi','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32442,8,'猫耳朵装扮可爱女友',1,0,'youma326AID009dixiagerencuoyingzhongchutongyan','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32443,8,'猫耳朵装扮可爱女友',1,0,'youma330PER231','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32444,8,'猫耳朵装扮可爱女友',1,0,'youma318LADY325','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32445,8,'猫耳朵装扮可爱女友',1,0,'riyuheixieyouhuoriyuzhongzi','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32446,8,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO100youmei','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32447,8,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO102hezi','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32448,8,'猫耳朵装扮可爱女友',1,0,'youma302GERBM008renqi','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32449,8,'猫耳朵装扮可爱女友',1,0,'youma345SIMM31020','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32450,8,'猫耳朵装扮可爱女友',1,0,'wuma1Pondo060819859chaochujinsuoyouhaolinaosumei','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32451,8,'猫耳朵装扮可爱女友',1,0,'riyuhuakuiriyuzhongzi','2022-12-03 18:05:16','2022-12-03 18:05:16',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32452,8,'猫耳朵装扮可爱女友',1,0,'riyuduoluodongjingriyuwuzi','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32453,8,'猫耳朵装扮可爱女友',1,0,'youma299EWDX30245suiyoushuqiao','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32454,8,'猫耳朵装扮可爱女友',1,0,'riyuduzishenghuodenvrenriyuwuzi','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32455,8,'猫耳朵装扮可爱女友',1,0,'youma318LADY317','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32456,9,'猫耳朵装扮可爱女友',1,0,'wuma1Pondo061319860zhichuiliu','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32457,9,'猫耳朵装扮可爱女友',1,0,'youma330PER22723','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32458,9,'猫耳朵装扮可爱女友',1,0,'wuma1Pondo062019862007SPban','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32459,9,'猫耳朵装扮可爱女友',1,0,'youma335ELDX063jiatengyang27sui','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32460,9,'猫耳朵装扮可爱女友',1,0,'youma302GERBM009renqi','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32461,9,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO115jianglizi','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32462,9,'猫耳朵装扮可爱女友',1,0,'wuma1Pondo061519861Mchinvmeiyueyouya','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32463,9,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO090lisha','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32464,9,'猫耳朵装扮可爱女友',1,0,'youma345SIMM298','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32465,9,'猫耳朵装扮可爱女友',1,0,'youma328HMDN2533Pluanjiaogecuochuhuinanboqimoruzhongfugerencuoyingsuren','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32466,9,'猫耳朵装扮可爱女友',1,0,'youma302GERBM002nvzidasheng','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32467,9,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO095','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32468,9,'猫耳朵装扮可爱女友',1,0,'youma335ELDX060yang','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32469,9,'猫耳朵装扮可爱女友',1,0,'youma326SPOR017wuxukezhongchujianyankeainvzizhenmianmudahaoniangcuojiukuaiganjingluan','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32470,9,'猫耳朵装扮可爱女友',1,0,'youma330PER229','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32471,9,'猫耳朵装扮可爱女友',1,0,'youma302GERBM005renqi','2022-12-03 18:05:20','2022-12-03 18:05:20',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32472,9,'猫耳朵装扮可爱女友',1,0,'youma302GERK213','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32473,10,'猫耳朵装扮可爱女友',1,0,'youma320MMGH244gerencuoyinginhao21','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',5,0,0,0,'',NULL),(32474,10,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO099','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32475,10,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO117molihua','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32476,10,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO089','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32477,10,'猫耳朵装扮可爱女友',1,0,'youma320MMGH243gerencuoyinginhao19','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32478,10,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO101naijinmei','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32479,10,'猫耳朵装扮可爱女友',1,0,'lizhientongxingxiangxitianbinvshenshejingbaihu','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32480,10,'猫耳朵装扮可爱女友',1,0,'youma328HMDN246gerencuoyingchunvqingyuJD18sui3niandiaojiaozuihoushishangyaoINsichuzhifubaimuxiangsicunfenshizhonggerencuoyingchengnuoji','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',17,0,0,0,'',NULL),(32481,10,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO097','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32482,10,'猫耳朵装扮可爱女友',1,0,'lianggenennenbidushiwomenxiangyaogandehuose','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32483,10,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO093shayejia','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',4,0,0,0,'',NULL),(32484,10,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO092meinai','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',0,0,0,0,'',NULL),(32485,10,'猫耳朵装扮可爱女友',1,0,'youma345SIMM34921','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',2,0,0,0,'',NULL),(32486,10,'猫耳朵装扮可爱女友',1,0,'youma329EXMU045','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',1,0,0,0,'',NULL),(32487,10,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO096','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',7,0,0,0,'',NULL),(32488,10,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO098','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',3,0,0,0,'',NULL),(32489,10,'猫耳朵装扮可爱女友',1,0,'youma371AHSHIRO094youjia','2022-12-03 18:05:23','2022-12-03 18:05:23',15,'slm3u8',0,'#美女#武侠',3,0,0,0,'',NULL),(32490,10,'猫耳朵装扮可爱女友',1,10,'youma326NKR009liyinniangzhongchuchengbai6nianbishiyanniangmoliwanduo','2022-12-03 18:05:23','2023-03-15 15:51:56',15,'slm3u8',0,'#美女#武侠',24,0,10,0,'2,1,3',NULL),(32507,11,'猫耳朵装扮可爱女友',1,10,'youma371AHSHIRO096','2023-03-13 10:36:25','2023-03-13 11:10:57',0,'slm3u8',0,'#国产',3,0,0,10,'1,2',NULL),(32508,11,'猫耳朵装扮可爱女友1',1,0,'youma371AHSHIRO096','2023-03-13 11:06:42','2023-03-21 16:24:44',16,'slm3u8',0,'#国产',16,0,0,10,'1,2,3',NULL),(32519,1,'测试视频1',1,0,NULL,'2023-03-21 10:17:35','2023-03-21 10:17:35',0,'mp4',1,'#国风',5,0,0,0,NULL,9),(32520,2,'长视频测试1',1,10,'','2023-03-21 10:19:18','2023-03-21 16:14:40',0,'slm3u8',1,'#国风',32,0,0,0,'1,2,3',10),(32521,5,'街拍1',1,10,NULL,'2023-03-21 16:48:47','2023-03-21 16:48:47',0,'$$$mp4$$$m3u8',1,'#街拍',37,0,0,0,NULL,20),(32522,3,'街拍2',1,10,NULL,'2023-03-21 16:48:52','2023-03-21 16:48:52',0,'$$$mp4$$$m3u8',1,'#街拍',45,0,0,0,NULL,19),(32523,4,'街拍3',1,10,NULL,'2023-03-21 16:48:54','2023-03-21 16:48:54',0,'$$$mp4$$$m3u8',1,'#街拍',111,0,0,0,NULL,18),(32524,1,'街拍4',1,10,NULL,'2023-03-21 16:48:56','2023-03-21 16:48:56',0,'$$$mp4',1,'#街拍',0,0,0,0,NULL,17),(32525,1,'街拍5',1,10,NULL,'2023-03-21 16:48:58','2023-03-21 16:48:58',0,'$$$mp4',1,'#街拍',0,0,0,0,NULL,16),(32526,1,'街拍6',1,10,NULL,'2023-03-21 16:48:59','2023-03-21 16:48:59',0,'$$$mp4',1,'#街拍',0,0,0,0,NULL,15),(32527,1,'街拍7',1,10,NULL,'2023-03-21 16:49:01','2023-03-21 16:49:01',0,'$$$mp4',1,'#街拍',0,0,0,0,NULL,14),(32528,1,'街拍8',1,0,NULL,'2023-03-21 16:49:03','2023-03-21 16:49:03',0,'$$$mp4',1,'#街拍',0,0,0,0,NULL,13),(32529,1,'街拍9',1,0,NULL,'2023-03-21 16:49:05','2023-03-21 16:49:05',0,'$$$mp4',1,'#街拍',0,0,0,0,NULL,12),(32530,7,'街拍10',1,0,NULL,'2023-03-21 16:49:06','2023-03-21 16:49:06',0,'$$$m3u8',1,'#街拍',393,0,0,0,NULL,11),(32531,1,'有男朋友还这么骚',1,26,'有男朋友还这么骚','2023-03-21 18:59:00','2023-03-21 19:04:46',14,'$$$mp4',1,'国产',0,0,0,60,'',22),(32532,3,'新到极品女神偷情大戏，当着老公',1,68,'新到极品女神偷情大戏，当着老公','2023-03-21 19:21:34','2023-03-21 19:21:47',14,'$$$m3u8',1,'#国产#偷情#绿帽',2221,0,0,60,'1,2,3',23);
/*!40000 ALTER TABLE `ntp_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_video_buy_user_video`
--

DROP TABLE IF EXISTS `ntp_video_buy_user_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_video_buy_user_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL COMMENT '视频ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `start_time` datetime NOT NULL COMMENT '购买开始时间',
  `end_time` datetime NOT NULL COMMENT '购买结束时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='单视频购买表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_video_buy_user_video`
--

LOCK TABLES `ntp_video_buy_user_video` WRITE;
/*!40000 ALTER TABLE `ntp_video_buy_user_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_video_buy_user_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_video_comment`
--

DROP TABLE IF EXISTS `ntp_video_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_video_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL COMMENT '评论内容的id 比如视频id',
  `content_title` varchar(255) DEFAULT NULL COMMENT '评论内容的id 比如视频标题',
  `uid` int(11) DEFAULT NULL COMMENT '用户id。，评论者id',
  `unickname` varchar(255) DEFAULT NULL COMMENT '评论者昵称',
  `uhead` text COMMENT '评论者头像地址',
  `ucontent` text COMMENT '评论内容',
  `create_time` datetime DEFAULT NULL COMMENT '评论时间',
  `comment_id` int(11) DEFAULT NULL COMMENT '评论 ID',
  `is_read` int(255) NOT NULL DEFAULT '0' COMMENT '0 没读。1已读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='视频评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_video_comment`
--

LOCK TABLES `ntp_video_comment` WRITE;
/*!40000 ALTER TABLE `ntp_video_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_video_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_video_detail`
--

DROP TABLE IF EXISTS `ntp_video_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_video_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vod_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `vod_name` varchar(255) NOT NULL COMMENT '名称',
  `vod_en` varchar(255) DEFAULT NULL,
  `vod_status` int(11) DEFAULT NULL,
  `vod_tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `vod_pic` text COMMENT '封面图',
  `vod_pic_thumb` text,
  `vod_blurb` text,
  `vod_remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `vod_pubdate` varchar(255) DEFAULT NULL,
  `vod_total` int(255) DEFAULT NULL COMMENT '节数',
  `vod_area` varchar(255) DEFAULT NULL COMMENT '国家',
  `vod_lang` varchar(255) DEFAULT NULL COMMENT '语言',
  `vod_year` varchar(255) DEFAULT NULL COMMENT '出版时间',
  `vod_version` varchar(255) DEFAULT NULL,
  `vod_state` varchar(255) DEFAULT NULL,
  `vod_time` datetime DEFAULT NULL,
  `vod_content` text COMMENT '内容介绍',
  `vod_play_from` varchar(255) DEFAULT NULL COMMENT '播放格式 $$$ 三个分隔符',
  `vod_play_url` longtext COMMENT '播放地址',
  `type_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12544 DEFAULT CHARSET=utf8mb4 COMMENT='视频详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_video_detail`
--

LOCK TABLES `ntp_video_detail` WRITE;
/*!40000 ALTER TABLE `ntp_video_detail` DISABLE KEYS */;
INSERT INTO `ntp_video_detail` VALUES (12356,32344,1,0,'猫耳朵装扮可爱女友','manbeiwenshenmengmengdashuangmaweimeiniuwuliaohepaoyoulaiyipaotexieshenhouxishunhenmailizhudongshangweiqichengfuzhuopiguyidunmengcao',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:00','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','素人自拍'),(12357,32345,1,0,'璃欢.の遥欢','maoerduozhuangbankeainvyouwoshizhongrichangxingshenghuobeishuaiqinanyouwutaopapaduozishicaoxue',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:00','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','台湾辣妹'),(12358,32346,1,0,'笙歌叹离愁づ','laogeyuenanyueliaogegaoyanzhimeizipapatiaowuniudongyifankaiganTPhouruqichengbaoqilaidalimengcaoshenyinfeichangyouren',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:00','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','恋腿狂魔'),(12359,32347,1,0,'雾非雾丶╮の迷惘','mamazuijiuhouzhijieshangliaozuihoumamakuliao2',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:00','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','古装扮演'),(12360,32348,1,0,'\r\n剪不断愁绪吹','lianxuyueduogemeizizhongtuhuanchaojiaAVshijiaoshafakuangganquanchengjilu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:00','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','可爱学生'),(12361,32349,1,0,'云殇淡千愁','kouzhaomengmeiziqingquzhuangtoushizhuangheisidaojuziweiyizishangzimobibidaojuJJchouchashenyinjiaochuanhenshiyouhuoxihuanbuyaocuoguo',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:00','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','剧情介绍'),(12362,32350,1,0,'散小散の糖妞妞','meijiaochuniangmumuyazheyangdenvrennihuiqumaxiadechufangyindetingfabianchichaohaodecaibianziweiyinjiaotaiyouhuolarenbuzhulu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:00','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','自拍偷拍'),(12363,32351,1,0,'真实の幻梦','kanchengzuiwanmeishencaideGnaifengyaojuruchaogaoyanzhinvshenUnicornyongchibiandediyicixingaizipaishebaozuopindanaichengjiejingye',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:00','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','古装扮演'),(12364,32352,1,0,'散小散の糖妞妞','laolichengmingzhizhanmodudaquansiwuqianyipaojipinchemogaoyanzhinvshenfengsaomeihuorenjianyouwu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','精品推荐'),(12365,32353,1,0,'挥霍黑白青春','laogeyuenanyueliaogeduanfayanzhibucuoshaofupapaqichengluguankoujiaohourumengcaobaoqilaicaohenshiyouhuoxihuanbuyaocuoguo',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','欺辱凌辱'),(12366,32354,1,0,'喜留厌走别回头','lounaiqingquzhuangmiliqingchunyanzhijiqingdaxiuzhibogensaonvPKziweisaoxuerounaizibeihaoguimiyongdaojuchouchasaoxuelangjiaoshenyinbuzhi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','恋腿狂魔'),(12367,32355,1,0,'深海未蓝天空微暗','liangchanghejidiyichanggaoyanzhiqizhibucuomeizipapashewenhumotexiekoujiaoshangweiqichengdalimengcaodierchangchangxiangqingchunluoliqunmeizipapatuodiaobaixuetexiekoujiaoshangweiqichengchouchamengcao',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','精品推荐'),(12368,32356,1,0,'等海枯 等石烂','liangjiarenqijiazhongbeilianganliangpaochengshunvrenyuwangqiangshewenchabijikexujiuyichaomanzubuyi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','国产色情'),(12369,32357,1,0,'忘不了 忘不了。','maweibianbaorunvshenzhizhuxiaqingkaidangquzhuangxiongqiangekailunaizimitaomeiruqiaoqibaixueruyundilajiduyinsaodiaodaiheisigengshiyouren',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','韩国御姐'),(12370,32358,2,0,'沧桑未改 心愈默','lvqidashenjilujipinyindangjiaoqihenglifuqidiaodaiheisiqingqusihoudannanquanzidongzhazhiyouwukoubaojipinyinqi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','台湾辣妹'),(12371,32359,2,0,'ゞ迷途不知回返','meiguo9cundadiaonanyouhexianggangchangtuinenmonvyoufengkuangxingaishikunbangshoujiaonuecaozhidinghuaxin',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','可爱学生'),(12372,32360,2,0,'多情不予长相守','laogezhaoxiaojiezhibopapayugangxizaokoujiaochouchashangweiqichengfeichangyourenhenshiyouhuoxihuanbuyaocuoguo',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','瑜伽裤'),(12373,32361,2,0,'不破楼兰终不还','mamadainveryiqizhibodaxiuzhengqianquanchenglulianheisiqingqunaizishangdewenshenhuanyiyangweinverchinaiwanbishuangtoudaojuchouchagaochaobuduan',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','韩国御姐'),(12374,32362,2,0,'寂寞寒窗空守寡','meinvchuchagoudanantongshijiudianjiqingpaparangxiaogecaozuichuangxiacaodaochuangshanggezhongzishiroulinchoucha',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','精品推荐'),(12375,32363,2,0,'不雨花犹落','laogeyuepaoxiaofumeizikaifangpapamiaotiaoshencaihourumengcaozhanlichouchafeichangyourenhenshiyouhuoxihuanbuyaocuoguo',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','瑜伽裤'),(12376,32364,2,0,'如今沧桑冷为霜','kechunkefengsaodeshaonvyouhuoquanchengluliangaoyanzhixiganjingliaopeilangyoufasaoganjingdebibimeiyoujigenmaorounaiziweitexiezhanshihaociji',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','精品推荐'),(12377,32365,2,0,'浮云生死身何惧','keaidebaisi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','国产色情'),(12378,32366,2,0,'青春荒唐不忍欺。','laogeyuenanyueliaogegaoyanzhimiaotiaomeiziyiqizhiboquanluoniudongshentikanzhuofeichangyourenhenshiyouhuoxihuanbuyaocuoguo',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','瑜伽裤'),(12379,32367,2,0,'憔悴此心 渐成尘','kanqilaitinglaoshidexiaoqingnianyanfubuqianlvdianyudiaozhongdanailiangjiarenqishaofutouqingjiaodesaohenjiqingyanshejingzitulianshuomeirongdeduibaijingcai',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','国产色情'),(12380,32368,2,0,'喜欢就活该失落','laozhubotaolubiaodiyishijiaobaixueziweidaojuchaxuehuojiliaobimaomailikouhuoshouchijingtoucaobizhijieneishe',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','欺辱凌辱'),(12381,32369,3,0,'乱世桃花逐水流','mahuabianqingchunwaibiaohensaomengmeidiandongjiadiaoqizuochaxuebaikaikandongdonghenxiaobabacaowosaobijinjinchuchumengchazhilangjiao',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','恋腿狂魔'),(12382,32370,3,0,'乱世桃花逐水流','lvshizhifudeyinyutiaodouhuarunzhishuimixuedingbuzhuliaoneishewumaomibao',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','欺辱凌辱'),(12383,32371,3,0,'乱世桃花逐水流','liujiweitoupaitoumingqingquzhuangnenmeipaoyijizhanbaolisicheqingquzhuangnucaoneisheduibaiyouqu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:03','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','网曝门'),(12384,32372,3,0,'乱世桃花逐水流','laogeyelangchujiyuenanyueliaogesaoqiduanfashaofukoujiaodiaoshangmoshangsuannaitiannongganjingfeichangyourenxihuanbuyaocuoguo',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','网曝门'),(12385,32373,3,0,'乱世桃花逐水流','lianyiqunqingchunpiaoliangxuemeiqingchunganshizudaidaojiudianpapaxiaoxuedubeiwanjuanbianliaorenmeiBshouzuia',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','韩国御姐'),(12386,32374,3,0,'乱世桃花逐水流','youma299EWDX29228suiao',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','巨乳美乳'),(12387,32375,3,0,'最愁莫过哀叹','manbeiwenshenshaofugendageshenyejiqingpapaquanchenglulianwenroudekoujiaodajibajiqingshangweitinglidesaonaizigezhongchouchalangjiaoshenyinbuduan',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','野外露出'),(12388,32376,3,0,'最愁莫过哀叹','youma371AHSHIRO116taozi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','巨乳美乳'),(12389,32377,3,0,'最愁莫过哀叹','youma328HMDN25220caidiaozichengSxiaoemoJDtaboqibiantaishizhiwomanxianjietupozhongfu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','巨乳美乳'),(12390,32378,3,0,'最愁莫过哀叹','liangzhifennenkeaidexiaoluoliyiqijingchangdaxiuquanchenglulianbibinaizidushihennentianbitianjiaowannaizijuezhuopigubaojuhuageilangyoukan',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','网红流出'),(12391,32379,3,0,'最愁莫过哀叹','lvboxiahaiwanmeishencaiqiaoqiaomeimeishencaigaotiaoquanshenxuebaifennentingbashencaisaoxuekouchubaidaihenyourendeo',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','野外露出'),(12392,32380,3,0,'最愁莫过哀叹','liangjiemeihuxiangseqingtianxifuwujiejiehuanchuanshangjiajibacaowo',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','女同性恋'),(12393,32381,4,0,'最愁莫过哀叹','meijiadianfengsaolaobanniangyanzhishaofuwozaitianjinkeyuekekongjiangquantaowozaidianlimiansuoyishenyinhenxiaogebiyouren',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','素人自拍'),(12394,32382,4,0,'孤单时眷念深重','lengyanxinggaoyanzhinvshendaizhuoyanjingyujiefengdiaodaishuiyimiaotiaoshencaimeituibaixueshouzhiroucuoyushixizaoshishenbainonggezhongzishi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','网曝门'),(12395,32383,4,0,'孤单时眷念深重','youma328HMDN257xiaxiuJx2renzuGETwangziyangdahaogerencuoyingchuchaotianguozhongchuyibushizhongsuren',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','巨乳美乳'),(12396,32384,4,0,'孤单时眷念深重','youma345SIMM32824',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','中文字幕'),(12397,32385,4,0,'猫耳朵装扮可爱女友','youma332NAMA086gerencuoying22suizhongRdaxuejingjixuebujudaodemeishaonvmeifenglvchang3fashekouneishejingx2',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','中文字幕'),(12398,32386,4,0,'猫耳朵装扮可爱女友','youma335ELDX061lanchuanyang',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12399,32387,4,0,'孤单时眷念深重','manbeiwenshenshuangmaweiqingchunmengmeixingfulaogecaodaozheyangjipinxishuntiandiaokouhuohenbangzhudongqichengniudongxiyaopazhuohourucaodelangjiao',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','野外露出'),(12400,32388,4,0,'猫耳朵装扮可爱女友','youma345SIMM355',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12401,32389,4,0,'猫耳朵装扮可爱女友','youma345SIMM330meiyaoshenglianxuguichuankuangnv',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','中文字幕'),(12402,32390,4,0,'不回首向前走','youma345SIMM341',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','中文字幕'),(12403,32391,4,0,'猫耳朵装扮可爱女友','youma345SIMM3437nianfannongchuanJ',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:06','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12404,32392,4,0,'不回首向前走','mamahaosaogoudasaoerzichinaitianbigeierzikoujiaodajibasiwagaogenyouhuojuezhuopigugeilangyoukanzhuobikoujiaorangerzishezuilichi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','野外露出'),(12405,32393,4,0,'猫耳朵装扮可爱女友','keaimengmeizinidexiaolaopowozhizhenglingqianbuyaoyaoqiutaigaowobizhiyouyigerencaoguofenshouhaojiuliaowoyigerenzhiboyoushihouhaogudana',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','自拍偷拍'),(12406,32394,5,0,'不回首向前走','keaiyoudaidianyaoyandexiaojiejiemitaobaixinaizijueshibaihufenbihuanhenjinxiaogecharuhennuanhendaijin',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','网红流出'),(12407,32395,5,0,'猫耳朵装扮可爱女友','youma299EWDX290tazi38suiyanjingsiheaoao',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12408,32396,5,0,'不回首向前走','youma345SIMM342xingyuSEXshengniangbaobian0002',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12409,32397,5,0,'猫耳朵装扮可爱女友','youma345SIMM34023',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12410,32398,5,0,'猫耳朵装扮可爱女友','youma302GERBM006renqi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12411,32399,5,0,'不回首向前走','youma345SIMM332charuxianyimeiyaoshengSEX',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12412,32400,5,0,'猫耳朵装扮可爱女友','youma345SIMM333jichaoniangmeiyaominganfaqingGzhongwai',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12413,32401,5,0,'钱袋轻时心事重','youma345SIMM311yi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12414,32402,5,0,'猫耳朵装扮可爱女友','youma332NAMA085meicanggerencuoying26suiheshiliaoliwuqinwuboduobian',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12415,32403,5,0,'猫耳朵装扮可爱女友','youma326NKR012liniangwuxukezhongjieshibanzunliniangchedidiaochachaozhongliangjikannengwuxukezhongchengbai',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','强奸乱伦'),(12416,32404,5,0,'钱袋轻时心事重','youma329EXMU036',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','人妻熟女'),(12417,32405,5,0,'光阴似水 流年尽','youma299EWDX28930suicuoliuchuHshuqi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','强奸乱伦'),(12418,32406,5,0,'猫耳朵装扮可爱女友','youma345SIMM338zhajingjishangzhongchuSEXerhuizhanqincharu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','强奸乱伦'),(12419,32407,6,0,'钱袋轻时心事重','youma330PER228',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','强奸乱伦'),(12420,32408,6,0,'钱袋轻时心事重','youma336KNB082quanguorenqitujianrenqiquanguomujichuzhangcuogongkaiyousha39suijiehun3niandannayuanyinyuqiubumanqingchuxiaoyangjiuzhenmengzhongganru',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','强奸乱伦'),(12421,32409,6,0,'光阴似水 流年尽','youma336KNB092quanguorenqitujianrenqiquanguomujichuzhangcuogongkaimali37suijiehun7nianmuqutuowuxiaoyansudiaoyangliuyuqiuAVfasanqiexiongchurushouhaoganduyinmaonongzhiloumuqiannangenmengzhongshimohoudaicharubinvlixingyiqibenghuai',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','强奸乱伦'),(12422,32410,6,0,'钱袋轻时心事重','youma320MMGH242gerencuoyinginhao21',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','强奸乱伦'),(12423,32411,6,0,'猫耳朵装扮可爱女友','youma345SIMM327juedarenqibaoyushibiyuanjieguowww',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:10','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','强奸乱伦'),(12424,32412,6,0,'光阴似水 流年尽','youma345SIMM326GmuxingzhengxiaoemobaoyushiganSEX',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','强奸乱伦'),(12425,32413,6,0,'猫耳朵装扮可爱女友','youma345SIMM336boqiquedingexiqinrunonghou',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','强奸乱伦'),(12426,32414,6,0,'光阴似水 流年尽','youma320MMGH241gerencuoyinginhao20',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12427,32415,6,0,'猫耳朵装扮可爱女友','wuma1Pondo061819001lihuasinvban',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲无码'),(12428,32416,6,0,'光阴似水 流年尽','youma335ELDX062shantianyang25sui',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12429,32417,6,0,'猫耳朵装扮可爱女友','youma302GERBM003niang',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12430,32418,6,0,'猫耳朵装扮可爱女友','youma326SPOR019JDnvzihannonghoushenzhuozhenmianmunvzidashengshengtuzhongchugubengyaoshipilu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12431,32419,6,0,'猫耳朵装扮可爱女友','youma336KNB096quanguorenqitujianrenqiquanguomujichuzhangcuogongkai30suijiehun2nianfuqidannashifanAVchuyanjuemeirenaoyangrushoutongshigongqichengweijiyaozhendannaqianjianjijideziqianyupilu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12432,32420,6,0,'猫耳朵装扮可爱女友','youma336KNB091quanguorenqitujianrenqiquanguomujichuzhangcuogongkai28suijiehun1nianyuqiubumanaoyangdannaneixuAVchuyanzhiqi0julizhiaotunonghoukannengbennengxingyujiefang',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12433,32421,6,0,'猫耳朵装扮可爱女友','youma336KNB084quanguorenqitujianrenqiquanguomujichuzhangcuogongkai28suijiehun3nianyuqiubumanwangxiangjiujiyaozhenluanqichichaochuigandongleiliu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12434,32422,7,0,'猫耳朵装扮可爱女友','youma336KNB094quanguorenqitujianrenqiquanguomujichuzhangcuogongkaiweiyou29suijiehun6niandannadanbodunganyuqiubumancijiqiuAVchuyannongmeijuedingyangfan',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12435,32423,7,0,'猫耳朵装扮可爱女友','youma326MTP010liuxingzhongchumeiyaoxiaojifaqinghedushouyuwangmanbiantaibaobiannvzi0002',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12436,32424,7,0,'猫耳朵装扮可爱女友','youma336KNB095quanguorenqitujianrenqiquanguomujichuzhangcuogongkaimeinaizi36suijiehun9niandannayanmanmantanyurenqidengchangbaoxindiliangganduliangyimijishangwei',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12437,32425,7,0,'猫耳朵装扮可爱女友','youma326AID004gecuowuxukezhongpeishenggualaidixiafancuoyinglianxipianmeishaonvcuoganxing',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12438,32426,7,0,'猫耳朵装扮可爱女友','youma345SIMM309niangyangzhuchechangdanmeinvsijian0002',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','萝莉少女'),(12439,32427,7,0,'猫耳朵装扮可爱女友','youma345SIMM339meikaobizhirenqimeijiao',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12440,32428,7,0,'猫耳朵装扮可爱女友','youma336KNB093quanguorenqitujianrenqiquanguomujichuzhangcuogongkai28suijiehun2nianbanquotjiejinfanjijinweiquotyanlousanlejuju2huizhanzhongchuxiaoxuwuchakuchaMrenqi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12441,32429,7,0,'猫耳朵装扮可爱女友','youma302GERBM001renqi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12442,32430,7,0,'猫耳朵装扮可爱女友','youma330PER232',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12443,32431,7,0,'猫耳朵装扮可爱女友','youma345SIMM300Gmingyuanqinvzishengrushouzeyunshou',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:13','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12444,32432,7,0,'猫耳朵装扮可爱女友','youma329EXMU035',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12445,32433,7,0,'猫耳朵装扮可爱女友','youma345SIMM347',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12446,32434,7,0,'猫耳朵装扮可爱女友','youma329EXMU046',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12447,32435,7,0,'猫耳朵装扮可爱女友','youma302GERBM007OL',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12448,32436,7,0,'猫耳朵装扮可爱女友','youma345SIMM314haorenqizhongchuzhihousaochuww',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12449,32437,7,0,'猫耳朵装扮可爱女友','youma326AID007gecuodixia1mei1000fu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','制服丝袜'),(12450,32438,7,0,'猫耳朵装扮可爱女友','youma302GERBM004OL',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12451,32439,8,0,'猫耳朵装扮可爱女友','youma336KNB085quanguorenqitujianrenqiquanguomujichuzhangcuogongkaicaiya32suijiehun5nianmuchangshenmeijiaozigongsiliangaoyangdannadatarenbangqichiji',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12452,32440,8,0,'猫耳朵装扮可爱女友','youma345SIMM321faqingmeirenbuxiaqizishangsizhongchuSEXaoduow0002',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12453,32441,8,0,'猫耳朵装扮可爱女友','riyuguannengshoucangjiariyuzhongzi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','伦理三级'),(12454,32442,8,0,'猫耳朵装扮可爱女友','youma326AID009dixiagerencuoyingzhongchutongyan',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12455,32443,8,0,'猫耳朵装扮可爱女友','youma330PER231',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12456,32444,8,0,'猫耳朵装扮可爱女友','youma318LADY325',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12457,32445,8,0,'猫耳朵装扮可爱女友','riyuheixieyouhuoriyuzhongzi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','伦理三级'),(12458,32446,8,0,'猫耳朵装扮可爱女友','youma371AHSHIRO100youmei',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12459,32447,8,0,'猫耳朵装扮可爱女友','youma371AHSHIRO102hezi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12460,32448,8,0,'猫耳朵装扮可爱女友','youma302GERBM008renqi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12461,32449,8,0,'猫耳朵装扮可爱女友','youma345SIMM31020',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12462,32450,8,0,'猫耳朵装扮可爱女友','wuma1Pondo060819859chaochujinsuoyouhaolinaosumei',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲无码'),(12463,32451,8,0,'猫耳朵装扮可爱女友','riyuhuakuiriyuzhongzi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:16','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','伦理三级'),(12464,32452,8,0,'猫耳朵装扮可爱女友','riyuduoluodongjingriyuwuzi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','伦理三级'),(12465,32453,8,0,'猫耳朵装扮可爱女友','youma299EWDX30245suiyoushuqiao',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12466,32454,8,0,'猫耳朵装扮可爱女友','riyuduzishenghuodenvrenriyuwuzi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','伦理三级'),(12467,32455,8,0,'猫耳朵装扮可爱女友','youma318LADY317',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','口交颜射'),(12468,32456,9,0,'猫耳朵装扮可爱女友','wuma1Pondo061319860zhichuiliu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲无码'),(12469,32457,9,0,'猫耳朵装扮可爱女友','youma330PER22723',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12470,32458,9,0,'猫耳朵装扮可爱女友','wuma1Pondo062019862007SPban',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲无码'),(12471,32459,9,0,'猫耳朵装扮可爱女友','youma335ELDX063jiatengyang27sui',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12472,32460,9,0,'猫耳朵装扮可爱女友','youma302GERBM009renqi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12473,32461,9,0,'猫耳朵装扮可爱女友','youma371AHSHIRO115jianglizi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12474,32462,9,0,'猫耳朵装扮可爱女友','wuma1Pondo061519861Mchinvmeiyueyouya',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲无码'),(12475,32463,9,0,'猫耳朵装扮可爱女友','youma371AHSHIRO090lisha',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12476,32464,9,0,'猫耳朵装扮可爱女友','youma345SIMM298',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12477,32465,9,0,'猫耳朵装扮可爱女友','youma328HMDN2533Pluanjiaogecuochuhuinanboqimoruzhongfugerencuoyingsuren',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12478,32466,9,0,'猫耳朵装扮可爱女友','youma302GERBM002nvzidasheng',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12479,32467,9,0,'猫耳朵装扮可爱女友','youma371AHSHIRO095',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12480,32468,9,0,'猫耳朵装扮可爱女友','youma335ELDX060yang',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','日本精品'),(12481,32469,9,0,'猫耳朵装扮可爱女友','youma326SPOR017wuxukezhongchujianyankeainvzizhenmianmudahaoniangcuojiukuaiganjingluan',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12482,32470,9,0,'猫耳朵装扮可爱女友','youma330PER229',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12483,32471,9,0,'猫耳朵装扮可爱女友','youma302GERBM005renqi',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:20','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12484,32472,9,0,'猫耳朵装扮可爱女友','youma302GERK213',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12485,32473,10,0,'猫耳朵装扮可爱女友','youma320MMGH244gerencuoyinginhao21',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12486,32474,10,0,'猫耳朵装扮可爱女友','youma371AHSHIRO099',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12487,32475,10,0,'猫耳朵装扮可爱女友','youma371AHSHIRO117molihua',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12488,32476,10,0,'猫耳朵装扮可爱女友','youma371AHSHIRO089',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12489,32477,10,0,'猫耳朵装扮可爱女友','youma320MMGH243gerencuoyinginhao19',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12490,32478,10,0,'猫耳朵装扮可爱女友','youma371AHSHIRO101naijinmei',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12491,32479,10,0,'猫耳朵装扮可爱女友','lizhientongxingxiangxitianbinvshenshejingbaihu',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','女同性恋'),(12492,32480,10,0,'猫耳朵装扮可爱女友','youma328HMDN246gerencuoyingchunvqingyuJD18sui3niandiaojiaozuihoushishangyaoINsichuzhifubaimuxiangsicunfenshizhonggerencuoyingchengnuoji',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12493,32481,10,0,'猫耳朵装扮可爱女友','youma371AHSHIRO097',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12494,32482,10,0,'猫耳朵装扮可爱女友','lianggenennenbidushiwomenxiangyaogandehuose',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','女同性恋'),(12495,32483,10,0,'猫耳朵装扮可爱女友','youma371AHSHIRO093shayejia',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12496,32484,10,0,'猫耳朵装扮可爱女友','youma371AHSHIRO092meinai',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12497,32485,10,0,'猫耳朵装扮可爱女友','youma345SIMM34921',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12498,32486,10,0,'猫耳朵装扮可爱女友','youma329EXMU045',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12499,32487,10,0,'猫耳朵装扮可爱女友','youma371AHSHIRO096',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12500,32488,10,0,'猫耳朵装扮可爱女友','youma371AHSHIRO098',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12501,32489,10,0,'猫耳朵装扮可爱女友','youma371AHSHIRO094youjia',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12502,32490,10,0,'猫耳朵装扮可爱女友','youma326NKR009liyinniangzhongchuchengbai6nianbishiyanniangmoliwanduo',1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','','猫耳朵装扮可爱女友','','',0,'','','2022','','','2022-12-03 18:05:23','猫耳朵装扮可爱女友','slm3u8','/m3u8/7/10/input.m3u8','亚洲有码'),(12518,32507,11,0,'猫耳朵装扮可爱女友',NULL,1,'#美女#武侠','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png',NULL,'猫耳朵装扮可爱女友',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'猫耳朵装扮可爱女友','$$slm3u8','/m3u8/7/10/input.m3u8','精品推荐'),(12519,32508,11,0,'猫耳朵装扮可爱女友1',NULL,1,'#国产','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png',NULL,'猫耳朵装扮可爱女友',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','$$slm3u8','https://upload.bxgtv.top/m3u8/7/10/input.m3u8','欧美精品'),(12530,32519,1,0,'测试视频1','',0,'#国风','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','',NULL,'','',0,'','','20230321','','','2023-03-21 10:17:35','','$$$mp4','/upload/7/12321.mp4',''),(12531,32520,2,0,'长视频测试1','',0,'#国风','/upload_image/7/20230321/8b59065ba19b2b67648b014c3912eeae.png','',NULL,'','',0,'','','20230321','','','2023-03-21 10:19:18','1','$$$m3u8','https://upload.bxgtv.top/m3u8/7/10/input.m3u8','精品推荐'),(12532,32521,5,0,'街拍1','',0,'#街拍','/upload_image/7/20230321/c87df2daf99bc6434ac9678a47d1d504.jpeg','',NULL,'','',0,'','','20230321','','','2023-03-21 16:48:47','','$$$mp4$$$m3u8','/upload/7/10.mp4',''),(12533,32522,3,0,'街拍2','',0,'#街拍','/upload_image/7/20230321/fdbb81ea6a047c81c5a7229c0ebb8d9c.jpeg','',NULL,'','',0,'','','20230321','','','2023-03-21 16:48:52','','$$$mp4$$$m3u8','/upload/7/9.mp4',''),(12534,32523,4,0,'街拍3','',0,'#街拍','/upload_image/7/20230321/c64eae134a785060b8670d1af8e1e7d0.jpeg','',NULL,'','',0,'','','20230321','','','2023-03-21 16:48:54','','$$$mp4$$$m3u8','/upload/7/8.mp4',''),(12535,32524,1,0,'街拍4','',0,'#街拍','/upload_image/7/20230321/472ec377fb86a4558626ac83cca22d4e.jpeg','',NULL,'','',0,'','','20230321','','','2023-03-21 16:48:56','','$$$mp4','/upload/7/7.mp4',''),(12536,32525,1,0,'街拍5','',0,'#街拍','/upload_image/7/20230321/89f9c8317c4f3b0044339b86dddc8c15.jpeg','',NULL,'','',0,'','','20230321','','','2023-03-21 16:48:58','','$$$mp4','/upload/7/6.mp4',''),(12537,32526,1,0,'街拍6','',0,'#街拍','/upload_image/7/20230321/6ebe2f122c297c55a6e6f1414096e2a1.jpeg','',NULL,'','',0,'','','20230321','','','2023-03-21 16:48:59','','$$$mp4','/upload/7/5.mp4',''),(12538,32527,1,0,'街拍7','',0,'#街拍','/upload_image/7/20230321/da926f694c51402e4a6f87ff9bba442b.jpeg','',NULL,'','',0,'','','20230321','','','2023-03-21 16:49:01','','$$$mp4','/upload/7/4.mp4',''),(12539,32528,1,0,'街拍8','',0,'#街拍','/upload_image/7/20230321/2736baa2e47804f58f5a3b35e86eeeeb.jpeg','',NULL,'','',0,'','','20230321','','','2023-03-21 16:49:03','','$$$mp4','/upload/7/3.mp4',''),(12540,32529,1,0,'街拍9','',0,'#街拍','/upload_image/7/20230321/3672338827c5f5a83c239756073ae5a8.jpeg','',NULL,'','',0,'','','20230321','','','2023-03-21 16:49:05','','$$$mp4','/upload/7/2.mp4',''),(12541,32530,7,0,'街拍10','',0,'#街拍','/upload_image/7/20230321/8296073a5744ba5a9d2d5f15cebf5dc1.jpeg','',NULL,'','',0,'','','20230321','','','2023-03-21 16:49:06','','$$$m3u8','/m3u8/7/11/input.m3u8',''),(12542,32531,1,0,'有男朋友还这么骚','',0,'国产','/upload_image/14/20230321/54e1d9cd031a3f55eed5319881ecd6ec.png','','有男朋友还这么骚','','',0,'','','20230321','','','2023-03-21 18:59:00','1','$$$mp4','https://upload.bxgtv.top/upload/14/【更多福利视频电报搜索_@niuav】_有男朋友还这么骚.mp4','默认分类'),(12543,32532,3,0,'新到极品女神偷情大戏，当着老公','',0,'#国产#偷情#绿帽','/upload_image/14/20230321/569866f99151339272596f938006fb4c.jpg','','新到极品女神偷情大戏，当着老公','','',0,'','','20230321','','','2023-03-21 19:21:34','1','$$$m3u8','/m3u8/14/23/input.m3u8','国产色情');
/*!40000 ALTER TABLE `ntp_video_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_video_fabulous`
--

DROP TABLE IF EXISTS `ntp_video_fabulous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_video_fabulous` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL COMMENT '评论内容的id 比如视频id',
  `content_title` varchar(255) DEFAULT NULL COMMENT '评论内容的id 比如视频标题',
  `uid` int(11) DEFAULT NULL COMMENT '用户id。，评论者id',
  `unickname` varchar(255) DEFAULT NULL COMMENT '评论者昵称',
  `uhead` text COMMENT '评论者头像地址',
  `create_time` datetime DEFAULT NULL COMMENT '评论时间',
  `is_read` tinyint(255) NOT NULL DEFAULT '0' COMMENT '0 没读。1已读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='视频点赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_video_fabulous`
--

LOCK TABLES `ntp_video_fabulous` WRITE;
/*!40000 ALTER TABLE `ntp_video_fabulous` DISABLE KEYS */;
INSERT INTO `ntp_video_fabulous` VALUES (5,32519,'测试视频1',77,'新用户3683','','2023-03-21 16:06:48',0),(6,32532,'新到极品女神偷情大戏，当着老公',67,'cs:3511','','2023-03-22 14:27:03',0),(7,32530,'街拍10',80,'cs:1376','','2023-03-22 16:12:12',0),(9,32532,'新到极品女神偷情大戏，当着老公',83,'cs:2988','','2023-03-23 18:37:09',0);
/*!40000 ALTER TABLE `ntp_video_fabulous` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_video_to_vip`
--

DROP TABLE IF EXISTS `ntp_video_to_vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_video_to_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `types` varchar(255) DEFAULT NULL COMMENT '1,2,3，  属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='视频  vip关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_video_to_vip`
--

LOCK TABLES `ntp_video_to_vip` WRITE;
/*!40000 ALTER TABLE `ntp_video_to_vip` DISABLE KEYS */;
INSERT INTO `ntp_video_to_vip` VALUES (1,32491,NULL),(2,32492,NULL),(3,32493,NULL),(4,32494,NULL),(5,32495,NULL),(6,32496,NULL),(7,32497,NULL),(8,32498,NULL),(9,32499,NULL),(10,32500,NULL),(11,32501,NULL),(12,32502,NULL),(13,32503,NULL),(14,32504,NULL),(15,32506,NULL),(16,32507,NULL),(17,32508,NULL),(18,32520,'1,2,3,');
/*!40000 ALTER TABLE `ntp_video_to_vip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_video_type`
--

DROP TABLE IF EXISTS `ntp_video_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_video_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL,
  `thumb_url` varchar(255) DEFAULT NULL COMMENT '图标',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 正常',
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '前台是否显示',
  `is_size` int(11) NOT NULL COMMENT '是否是大视频，0小视频。1大视频',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COMMENT='视频分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_video_type`
--

LOCK TABLES `ntp_video_type` WRITE;
/*!40000 ALTER TABLE `ntp_video_type` DISABLE KEYS */;
INSERT INTO `ntp_video_type` VALUES (1,0,'默认分类','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,0),(2,0,'精品推荐','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,1),(3,0,'国产色情','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,1),(4,0,'主播直播','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,1),(5,0,'亚洲无码','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,1),(6,0,'亚洲有码','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,1),(7,0,'中文字幕','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,1),(8,0,'巨乳美乳','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,1),(9,0,'人妻熟女','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,1),(10,0,'强奸乱伦','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,1),(11,0,'欧美精品','/upload_image/1/20230313/7a7f8e33a44f70c56c628845174ce1d1.png',1,0,1,1);
/*!40000 ALTER TABLE `ntp_video_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_video_user_level`
--

DROP TABLE IF EXISTS `ntp_video_user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_video_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `market_uid` int(11) NOT NULL DEFAULT '0',
  `admin_uid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `vip_level` int(11) NOT NULL DEFAULT '0' COMMENT '用户vip等级',
  `vip_start_time` datetime NOT NULL COMMENT '购买时间',
  `vip_end_time` datetime NOT NULL COMMENT '购买结束时间',
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='视频与对应用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_video_user_level`
--

LOCK TABLES `ntp_video_user_level` WRITE;
/*!40000 ALTER TABLE `ntp_video_user_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `ntp_video_user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_video_user_set_validity_period`
--

DROP TABLE IF EXISTS `ntp_video_user_set_validity_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_video_user_set_validity_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID 序号 自增',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `end_time` datetime NOT NULL COMMENT '有效期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='会员套餐有效期';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_video_user_set_validity_period`
--

LOCK TABLES `ntp_video_user_set_validity_period` WRITE;
/*!40000 ALTER TABLE `ntp_video_user_set_validity_period` DISABLE KEYS */;
INSERT INTO `ntp_video_user_set_validity_period` VALUES (6,67,'2024-12-03 16:14:52'),(7,3,'2023-01-09 10:41:26'),(8,5,'2023-01-08 10:57:49');
/*!40000 ALTER TABLE `ntp_video_user_set_validity_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_video_vip_level`
--

DROP TABLE IF EXISTS `ntp_video_vip_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_video_vip_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `price_single` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `price_vip` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '套餐价格',
  `validity_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效期秒',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1 视频购买套餐。2 充值套餐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='视频套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_video_vip_level`
--

LOCK TABLES `ntp_video_vip_level` WRITE;
/*!40000 ALTER TABLE `ntp_video_vip_level` DISABLE KEYS */;
INSERT INTO `ntp_video_vip_level` VALUES (1,'包天',0.00,1.00,86400,1,1),(2,'包月',0.00,18.00,2592000,1,1),(3,'包年',0.00,88.00,31536000,1,1),(4,'1元体验充',0.00,1.00,0,1,2),(5,'18元包月充',0.00,18.00,0,1,2),(6,'88元包年充',0.00,88.00,0,1,2),(7,'100元任性充',0.00,100.00,0,1,2);
/*!40000 ALTER TABLE `ntp_video_vip_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ntp_vodeo_browse_log`
--

DROP TABLE IF EXISTS `ntp_vodeo_browse_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ntp_vodeo_browse_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `video_type` int(11) NOT NULL COMMENT '视频分类',
  `video_id` int(11) NOT NULL COMMENT '视频ID',
  `create_time` datetime DEFAULT NULL COMMENT '浏览时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ntp_vodeo_browse_log`
--

LOCK TABLES `ntp_vodeo_browse_log` WRITE;
/*!40000 ALTER TABLE `ntp_vodeo_browse_log` DISABLE KEYS */;
INSERT INTO `ntp_vodeo_browse_log` VALUES (39,77,2,32364,'2023-03-22 08:39:53'),(40,77,10,32490,'2023-03-21 10:24:18'),(41,67,1,32344,'2023-03-27 18:30:28'),(42,67,2,32520,'2023-03-21 16:30:45'),(43,77,2,32520,'2023-03-21 14:22:34'),(44,77,11,32508,'2023-03-21 14:22:33'),(45,77,1,32519,'2023-03-21 16:06:48'),(46,67,10,32490,'2023-03-21 16:25:07'),(47,67,11,32508,'2023-03-21 16:30:31'),(48,67,2,32364,'2023-03-21 16:23:51'),(49,67,7,32530,'2023-03-28 12:53:42'),(50,67,3,32522,'2023-03-22 14:20:22'),(51,67,5,32521,'2023-03-28 12:53:49'),(52,73,1,32344,'2023-03-21 17:00:56'),(53,78,1,32344,'2023-03-21 18:09:21'),(54,75,1,32344,'2023-03-21 20:03:21'),(55,75,3,32532,'2023-03-21 19:22:54'),(56,67,3,32532,'2023-03-28 12:49:10'),(57,77,7,32530,'2023-03-27 09:57:22'),(58,77,4,32523,'2023-03-27 09:07:07'),(59,77,3,32532,'2023-03-27 13:52:09'),(60,67,10,32486,'2023-03-22 09:29:13'),(61,67,10,32480,'2023-03-22 10:01:37'),(62,3,3,32532,'2023-03-22 14:19:20'),(63,79,10,32480,'2023-03-22 14:44:33'),(64,80,3,32532,'2023-03-24 10:09:21'),(65,80,7,32530,'2023-03-24 08:11:03'),(66,80,3,32522,'2023-03-24 08:14:18'),(67,80,5,32521,'2023-03-24 08:14:22'),(68,80,4,32523,'2023-03-23 10:01:45'),(69,81,3,32532,'2023-03-23 14:58:48'),(70,82,3,32532,'2023-03-23 14:56:58'),(71,82,7,32530,'2023-03-23 14:25:06'),(72,61,3,32522,'2023-03-23 15:13:13'),(73,83,3,32532,'2023-03-23 18:39:20'),(74,84,3,32532,'2023-03-23 19:46:10'),(75,85,1,32344,'2023-03-24 10:36:10'),(76,85,7,32530,'2023-03-24 09:05:38'),(77,85,3,32522,'2023-03-24 09:05:39'),(78,77,3,32522,'2023-03-27 09:07:59'),(79,15,10,32483,'2023-03-27 13:53:07'),(80,5,1,32344,'2023-03-27 16:25:19'),(81,15,10,32473,'2023-03-27 14:16:28'),(82,15,2,32364,'2023-03-27 14:25:53'),(83,15,3,32532,'2023-03-27 18:16:46'),(84,15,2,32520,'2023-03-27 14:29:14'),(85,15,4,32523,'2023-03-27 14:57:11'),(86,15,7,32530,'2023-03-27 18:10:09'),(87,15,3,32522,'2023-03-27 14:53:00'),(88,15,11,32508,'2023-03-27 14:38:37'),(89,15,10,32490,'2023-03-27 17:05:53'),(90,15,5,32521,'2023-03-27 14:57:54'),(91,15,10,32487,'2023-03-27 14:56:24'),(92,96,1,32344,'2023-03-27 14:59:42'),(93,98,3,32532,'2023-03-27 19:18:13'),(94,98,3,32532,'2023-03-27 19:18:13'),(95,99,3,32532,'2023-03-28 11:43:20'),(96,98,4,32523,'2023-03-28 10:04:37'),(97,98,3,32522,'2023-03-27 19:17:51'),(98,99,11,32508,'2023-03-27 19:47:28'),(99,98,7,32530,'2023-03-27 19:51:39'),(100,100,3,32532,'2023-03-28 08:48:56'),(101,100,7,32530,'2023-03-27 20:40:29'),(102,100,3,32522,'2023-03-27 20:35:51'),(103,100,4,32523,'2023-03-27 20:42:11'),(104,102,1,32344,'2023-03-28 08:28:30'),(105,103,3,32532,'2023-03-28 11:42:43'),(106,102,7,32530,'2023-03-28 08:28:33'),(107,102,3,32532,'2023-03-28 08:28:41'),(108,102,3,32522,'2023-03-28 08:31:15'),(109,103,7,32530,'2023-03-28 11:42:23'),(110,104,1,32344,'2023-03-28 09:19:36'),(111,99,7,32530,'2023-03-28 10:09:51'),(112,107,3,32532,'2023-03-28 10:30:19'),(113,106,3,32532,'2023-03-28 10:29:19'),(114,107,7,32530,'2023-03-28 10:29:23'),(115,108,3,32532,'2023-03-28 11:22:29'),(116,114,3,32532,'2023-03-28 13:13:27'),(117,116,1,32344,'2023-03-28 11:27:01'),(118,116,3,32532,'2023-03-28 11:27:06'),(119,114,7,32530,'2023-03-28 12:47:07'),(120,67,4,32523,'2023-03-28 12:53:45'),(121,67,10,32485,'2023-03-28 12:53:53');
/*!40000 ALTER TABLE `ntp_vodeo_browse_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ntp_video'
--

--
-- Dumping routines for database 'ntp_video'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-28 13:39:57
