-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: ershoutushu
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Current Database: `ershoutushu`
--

/*!40000 DROP DATABASE IF EXISTS `ershoutushu`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ershoutushu` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ershoutushu`;

--
-- Table structure for table `aboutus`
--

DROP TABLE IF EXISTS `aboutus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aboutus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='关于我们';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aboutus`
--

LOCK TABLES `aboutus` WRITE;
/*!40000 ALTER TABLE `aboutus` DISABLE KEYS */;
INSERT INTO `aboutus` VALUES (1,'2023-12-06 11:47:57','关于我们','ABOUT US','当你设想门外是寒冷可怕的世界时，你还应该开门出去看看，是否真的如此。如果你有信心，你对前途就不犹豫了。如果你有勇气，你就不怕前途是否有困难或危险了每个人心中都应有两盏灯，一盏是希望的灯，一盏是勇气的灯。有了这两盏灯，我们就不怕海上的黑暗和风涛的险恶了。人的一生很像是在雾中行走。远远望去，只是迷蒙一片，辨不出方向和吉凶。可是，当你鼓起勇气，放下恐惧和怀疑，一步一步向前走去的时候，你就会发现，每走一步，你都能把下一步路看得清楚一点。“往前走，别站在远远的地方观望！”你就可以找到你的方向。','upload/aboutus_picture1.jpg','upload/aboutus_picture2.jpg','upload/aboutus_picture3.jpg');
/*!40000 ALTER TABLE `aboutus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `name` varchar(200) NOT NULL COMMENT '收货人',
  `phone` varchar(200) NOT NULL COMMENT '电话',
  `isdefault` varchar(200) NOT NULL COMMENT '是否默认地址[是/否]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'2023-12-06 11:47:57',11,'宇宙银河系金星1号','金某','13823888881','是'),(2,'2023-12-06 11:47:57',12,'宇宙银河系木星1号','木某','13823888882','是'),(3,'2023-12-06 11:47:57',13,'宇宙银河系水星1号','水某','13823888883','是'),(4,'2023-12-06 11:47:57',14,'宇宙银河系火星1号','火某','13823888884','是'),(5,'2023-12-06 11:47:57',15,'宇宙银河系土星1号','土某','13823888885','是'),(6,'2023-12-06 11:47:57',16,'宇宙银河系月球1号','月某','13823888886','是'),(7,'2023-12-06 11:47:57',17,'宇宙银河系黑洞1号','黑某','13823888887','是'),(8,'2023-12-06 11:47:57',18,'宇宙银河系地球1号','地某','13823888888','是');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) DEFAULT 'tushuxinxi' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` longtext COMMENT '图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商户名称',
  `goodtype` varchar(200) DEFAULT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  `url` varchar(500) DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg',NULL),(2,'picture2','upload/picture2.jpg',NULL),(3,'picture3','upload/picture3.jpg',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussqiugouxinxi`
--

DROP TABLE IF EXISTS `discussqiugouxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussqiugouxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='求购信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussqiugouxinxi`
--

LOCK TABLES `discussqiugouxinxi` WRITE;
/*!40000 ALTER TABLE `discussqiugouxinxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussqiugouxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discusstushuxinxi`
--

DROP TABLE IF EXISTS `discusstushuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discusstushuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `score` double DEFAULT NULL COMMENT '评分',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图书信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discusstushuxinxi`
--

LOCK TABLES `discusstushuxinxi` WRITE;
/*!40000 ALTER TABLE `discusstushuxinxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `discusstushuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gonggaoxinxi`
--

DROP TABLE IF EXISTS `gonggaoxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gonggaoxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `fengmian` longtext COMMENT '封面',
  `neirong` longtext COMMENT '内容',
  `fabushijian` date DEFAULT NULL COMMENT '发布时间',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `storeupnum` int(11) DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='公告信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gonggaoxinxi`
--

LOCK TABLES `gonggaoxinxi` WRITE;
/*!40000 ALTER TABLE `gonggaoxinxi` DISABLE KEYS */;
INSERT INTO `gonggaoxinxi` VALUES (91,'2023-12-06 11:47:57','标题1','upload/gonggaoxinxi_fengmian1.jpg,upload/gonggaoxinxi_fengmian2.jpg,upload/gonggaoxinxi_fengmian3.jpg','内容1','2023-12-06',1,1,1),(92,'2023-12-06 11:47:57','标题2','upload/gonggaoxinxi_fengmian2.jpg,upload/gonggaoxinxi_fengmian3.jpg,upload/gonggaoxinxi_fengmian4.jpg','内容2','2023-12-06',2,2,2),(93,'2023-12-06 11:47:57','标题3','upload/gonggaoxinxi_fengmian3.jpg,upload/gonggaoxinxi_fengmian4.jpg,upload/gonggaoxinxi_fengmian5.jpg','内容3','2023-12-06',3,3,3),(94,'2023-12-06 11:47:57','标题4','upload/gonggaoxinxi_fengmian4.jpg,upload/gonggaoxinxi_fengmian5.jpg,upload/gonggaoxinxi_fengmian6.jpg','内容4','2023-12-06',4,4,4),(95,'2023-12-06 11:47:57','标题5','upload/gonggaoxinxi_fengmian5.jpg,upload/gonggaoxinxi_fengmian6.jpg,upload/gonggaoxinxi_fengmian7.jpg','内容5','2023-12-06',5,5,5),(96,'2023-12-06 11:47:57','标题6','upload/gonggaoxinxi_fengmian6.jpg,upload/gonggaoxinxi_fengmian7.jpg,upload/gonggaoxinxi_fengmian8.jpg','内容6','2023-12-06',6,6,6),(97,'2023-12-06 11:47:57','标题7','upload/gonggaoxinxi_fengmian7.jpg,upload/gonggaoxinxi_fengmian8.jpg,upload/gonggaoxinxi_fengmian9.jpg','内容7','2023-12-06',7,7,7),(98,'2023-12-06 11:47:57','标题8','upload/gonggaoxinxi_fengmian8.jpg,upload/gonggaoxinxi_fengmian9.jpg,upload/gonggaoxinxi_fengmian10.jpg','内容8','2023-12-06',8,8,8);
/*!40000 ALTER TABLE `gonggaoxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) DEFAULT 'tushuxinxi' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` longtext COMMENT '商品图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` double NOT NULL DEFAULT '0' COMMENT '价格',
  `total` double NOT NULL DEFAULT '0' COMMENT '总价格',
  `type` int(11) DEFAULT '1' COMMENT '支付类型',
  `status` varchar(200) DEFAULT NULL COMMENT '状态',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `tel` varchar(200) DEFAULT NULL COMMENT '电话',
  `consignee` varchar(200) DEFAULT NULL COMMENT '收货人',
  `logistics` longtext COMMENT '物流',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商户名称',
  `goodtype` varchar(200) DEFAULT NULL COMMENT '商品类型',
  `sfsh` varchar(200) DEFAULT '' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  `role` varchar(200) DEFAULT NULL COMMENT '用户角色',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiugouxinxi`
--

DROP TABLE IF EXISTS `qiugouxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qiugouxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qiugoubianhao` varchar(200) DEFAULT NULL COMMENT '求购编号',
  `tushumingcheng` varchar(200) DEFAULT NULL COMMENT '图书名称',
  `tushufenlei` varchar(200) DEFAULT NULL COMMENT '图书分类',
  `tushufengmian` longtext COMMENT '图书封面',
  `qiugoujiage` double DEFAULT NULL COMMENT '求购价格',
  `qiugoushuliang` int(11) DEFAULT NULL COMMENT '求购数量',
  `qiugoushijian` date DEFAULT NULL COMMENT '求购时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `qiugouxiangqing` longtext COMMENT '求购详情',
  `discussnum` int(11) DEFAULT '0' COMMENT '评论数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qiugoubianhao` (`qiugoubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='求购信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiugouxinxi`
--

LOCK TABLES `qiugouxinxi` WRITE;
/*!40000 ALTER TABLE `qiugouxinxi` DISABLE KEYS */;
INSERT INTO `qiugouxinxi` VALUES (71,'2023-12-06 11:47:57','1111111111','图书名称1','图书分类1','upload/qiugouxinxi_tushufengmian1.jpg,upload/qiugouxinxi_tushufengmian2.jpg,upload/qiugouxinxi_tushufengmian3.jpg',1,1,'2023-12-06','用户账号1','用户姓名1','求购详情1',0),(72,'2023-12-06 11:47:57','2222222222','图书名称2','图书分类2','upload/qiugouxinxi_tushufengmian2.jpg,upload/qiugouxinxi_tushufengmian3.jpg,upload/qiugouxinxi_tushufengmian4.jpg',2,2,'2023-12-06','用户账号2','用户姓名2','求购详情2',0),(73,'2023-12-06 11:47:57','3333333333','图书名称3','图书分类3','upload/qiugouxinxi_tushufengmian3.jpg,upload/qiugouxinxi_tushufengmian4.jpg,upload/qiugouxinxi_tushufengmian5.jpg',3,3,'2023-12-06','用户账号3','用户姓名3','求购详情3',0),(74,'2023-12-06 11:47:57','4444444444','图书名称4','图书分类4','upload/qiugouxinxi_tushufengmian4.jpg,upload/qiugouxinxi_tushufengmian5.jpg,upload/qiugouxinxi_tushufengmian6.jpg',4,4,'2023-12-06','用户账号4','用户姓名4','求购详情4',0),(75,'2023-12-06 11:47:57','5555555555','图书名称5','图书分类5','upload/qiugouxinxi_tushufengmian5.jpg,upload/qiugouxinxi_tushufengmian6.jpg,upload/qiugouxinxi_tushufengmian7.jpg',5,5,'2023-12-06','用户账号5','用户姓名5','求购详情5',0),(76,'2023-12-06 11:47:57','6666666666','图书名称6','图书分类6','upload/qiugouxinxi_tushufengmian6.jpg,upload/qiugouxinxi_tushufengmian7.jpg,upload/qiugouxinxi_tushufengmian8.jpg',6,6,'2023-12-06','用户账号6','用户姓名6','求购详情6',0),(77,'2023-12-06 11:47:57','7777777777','图书名称7','图书分类7','upload/qiugouxinxi_tushufengmian7.jpg,upload/qiugouxinxi_tushufengmian8.jpg,upload/qiugouxinxi_tushufengmian9.jpg',7,7,'2023-12-06','用户账号7','用户姓名7','求购详情7',0),(78,'2023-12-06 11:47:57','8888888888','图书名称8','图书分类8','upload/qiugouxinxi_tushufengmian8.jpg,upload/qiugouxinxi_tushufengmian9.jpg,upload/qiugouxinxi_tushufengmian10.jpg',8,8,'2023-12-06','用户账号8','用户姓名8','求购详情8',0);
/*!40000 ALTER TABLE `qiugouxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shangjia`
--

DROP TABLE IF EXISTS `shangjia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shangjia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangjiazhanghao` varchar(200) NOT NULL COMMENT '商家账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `shangjiaxingming` varchar(200) NOT NULL COMMENT '商家姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `touxiang` longtext COMMENT '头像',
  `money` double DEFAULT '0' COMMENT '余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shangjiazhanghao` (`shangjiazhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='商家';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shangjia`
--

LOCK TABLES `shangjia` WRITE;
/*!40000 ALTER TABLE `shangjia` DISABLE KEYS */;
INSERT INTO `shangjia` VALUES (21,'2023-12-06 11:47:57','商家账号1','123456','商家姓名1','男','13823888881','upload/shangjia_touxiang1.jpg',200),(22,'2023-12-06 11:47:57','商家账号2','123456','商家姓名2','男','13823888882','upload/shangjia_touxiang2.jpg',200),(23,'2023-12-06 11:47:57','商家账号3','123456','商家姓名3','男','13823888883','upload/shangjia_touxiang3.jpg',200),(24,'2023-12-06 11:47:57','商家账号4','123456','商家姓名4','男','13823888884','upload/shangjia_touxiang4.jpg',200),(25,'2023-12-06 11:47:57','商家账号5','123456','商家姓名5','男','13823888885','upload/shangjia_touxiang5.jpg',200),(26,'2023-12-06 11:47:57','商家账号6','123456','商家姓名6','男','13823888886','upload/shangjia_touxiang6.jpg',200),(27,'2023-12-06 11:47:57','商家账号7','123456','商家姓名7','男','13823888887','upload/shangjia_touxiang7.jpg',200),(28,'2023-12-06 11:47:57','商家账号8','123456','商家姓名8','男','13823888888','upload/shangjia_touxiang8.jpg',200);
/*!40000 ALTER TABLE `shangjia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsregistercode`
--

DROP TABLE IF EXISTS `smsregistercode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsregistercode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mobile` varchar(200) NOT NULL COMMENT '手机',
  `role` varchar(200) NOT NULL COMMENT '角色',
  `code` varchar(200) NOT NULL COMMENT '验证码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COMMENT='短信验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsregistercode`
--

LOCK TABLES `smsregistercode` WRITE;
/*!40000 ALTER TABLE `smsregistercode` DISABLE KEYS */;
INSERT INTO `smsregistercode` VALUES (161,'2023-12-06 11:47:57','手机1','角色1','验证码1'),(162,'2023-12-06 11:47:57','手机2','角色2','验证码2'),(163,'2023-12-06 11:47:57','手机3','角色3','验证码3'),(164,'2023-12-06 11:47:57','手机4','角色4','验证码4'),(165,'2023-12-06 11:47:57','手机5','角色5','验证码5'),(166,'2023-12-06 11:47:57','手机6','角色6','验证码6'),(167,'2023-12-06 11:47:57','手机7','角色7','验证码7'),(168,'2023-12-06 11:47:57','手机8','角色8','验证码8');
/*!40000 ALTER TABLE `smsregistercode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemintro`
--

DROP TABLE IF EXISTS `systemintro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemintro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='关于我们';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemintro`
--

LOCK TABLES `systemintro` WRITE;
/*!40000 ALTER TABLE `systemintro` DISABLE KEYS */;
INSERT INTO `systemintro` VALUES (1,'2023-12-06 11:47:57','系统简介','SYSTEM INTRODUCTION','在平静的海平面上，每个人都可以成为领航员。但如果只有阳光而没有阴影，只有欢乐而没有痛苦，那就不是完整的人生。就拿最幸福的人来说吧——他的幸福是一团纠结的纱线。痛苦和幸福轮番而至，让我们悲喜交集，甚至死亡都让人生更加可爱。人在生命的严肃时刻，在悲伤与丧亲的阴影下，才最接近真实的自我。在生活和事业的各个方面，才智的功能远不如性格，头脑的功能远不如心性，天分远不如自制力、毅力与教养。我始终认为内心开始过严肃生活的人，他外在的生活会开始变得更为俭朴。在一个奢侈浪费的年代，但愿我能让世人了解：人类真正的需求是多么的稀少。不重蹈覆辙才是真正的醒悟。比别人优秀并无任何高贵之处，真正的高贵在于超越从前的自我。','upload/systemintro_picture1.jpg','upload/systemintro_picture2.jpg','upload/systemintro_picture3.jpg');
/*!40000 ALTER TABLE `systemintro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tousuxinxi`
--

DROP TABLE IF EXISTS `tousuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tousuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `fengmian` longtext COMMENT '封面',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `tousuriqi` date DEFAULT NULL COMMENT '投诉日期',
  `tousuneirong` longtext COMMENT '投诉内容',
  `sfsh` varchar(200) DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='投诉信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tousuxinxi`
--

LOCK TABLES `tousuxinxi` WRITE;
/*!40000 ALTER TABLE `tousuxinxi` DISABLE KEYS */;
INSERT INTO `tousuxinxi` VALUES (81,'2023-12-06 11:47:57','标题1','upload/tousuxinxi_fengmian1.jpg,upload/tousuxinxi_fengmian2.jpg,upload/tousuxinxi_fengmian3.jpg','用户账号1','用户姓名1','2023-12-06','投诉内容1','是',''),(82,'2023-12-06 11:47:57','标题2','upload/tousuxinxi_fengmian2.jpg,upload/tousuxinxi_fengmian3.jpg,upload/tousuxinxi_fengmian4.jpg','用户账号2','用户姓名2','2023-12-06','投诉内容2','是',''),(83,'2023-12-06 11:47:57','标题3','upload/tousuxinxi_fengmian3.jpg,upload/tousuxinxi_fengmian4.jpg,upload/tousuxinxi_fengmian5.jpg','用户账号3','用户姓名3','2023-12-06','投诉内容3','是',''),(84,'2023-12-06 11:47:57','标题4','upload/tousuxinxi_fengmian4.jpg,upload/tousuxinxi_fengmian5.jpg,upload/tousuxinxi_fengmian6.jpg','用户账号4','用户姓名4','2023-12-06','投诉内容4','是',''),(85,'2023-12-06 11:47:57','标题5','upload/tousuxinxi_fengmian5.jpg,upload/tousuxinxi_fengmian6.jpg,upload/tousuxinxi_fengmian7.jpg','用户账号5','用户姓名5','2023-12-06','投诉内容5','是',''),(86,'2023-12-06 11:47:57','标题6','upload/tousuxinxi_fengmian6.jpg,upload/tousuxinxi_fengmian7.jpg,upload/tousuxinxi_fengmian8.jpg','用户账号6','用户姓名6','2023-12-06','投诉内容6','是',''),(87,'2023-12-06 11:47:57','标题7','upload/tousuxinxi_fengmian7.jpg,upload/tousuxinxi_fengmian8.jpg,upload/tousuxinxi_fengmian9.jpg','用户账号7','用户姓名7','2023-12-06','投诉内容7','是',''),(88,'2023-12-06 11:47:57','标题8','upload/tousuxinxi_fengmian8.jpg,upload/tousuxinxi_fengmian9.jpg,upload/tousuxinxi_fengmian10.jpg','用户账号8','用户姓名8','2023-12-06','投诉内容8','是','');
/*!40000 ALTER TABLE `tousuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tushufenlei`
--

DROP TABLE IF EXISTS `tushufenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tushufenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tushufenlei` varchar(200) DEFAULT NULL COMMENT '图书分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='图书分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tushufenlei`
--

LOCK TABLES `tushufenlei` WRITE;
/*!40000 ALTER TABLE `tushufenlei` DISABLE KEYS */;
INSERT INTO `tushufenlei` VALUES (31,'2023-12-06 11:47:57','图书分类1'),(32,'2023-12-06 11:47:57','图书分类2'),(33,'2023-12-06 11:47:57','图书分类3'),(34,'2023-12-06 11:47:57','图书分类4'),(35,'2023-12-06 11:47:57','图书分类5'),(36,'2023-12-06 11:47:57','图书分类6'),(37,'2023-12-06 11:47:57','图书分类7'),(38,'2023-12-06 11:47:57','图书分类8');
/*!40000 ALTER TABLE `tushufenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tushuxinxi`
--

DROP TABLE IF EXISTS `tushuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tushuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tushubianhao` varchar(200) DEFAULT NULL COMMENT '图书编号',
  `tushumingcheng` varchar(200) DEFAULT NULL COMMENT '图书名称',
  `tushufenlei` varchar(200) DEFAULT NULL COMMENT '图书分类',
  `tushufengmian` longtext COMMENT '图书封面',
  `zuozhe` varchar(200) DEFAULT NULL COMMENT '作者',
  `chubanshe` varchar(200) DEFAULT NULL COMMENT '出版社',
  `tushuxiangqing` longtext COMMENT '图书详情',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  `shangjiaxingming` varchar(200) DEFAULT NULL COMMENT '商家姓名',
  `onelimittimes` int(11) DEFAULT NULL COMMENT '单限',
  `alllimittimes` int(11) DEFAULT NULL COMMENT '库存',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  `discussnum` int(11) DEFAULT '0' COMMENT '评论数',
  `price` double NOT NULL COMMENT '价格',
  `storeupnum` int(11) DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tushubianhao` (`tushubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='图书信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tushuxinxi`
--

LOCK TABLES `tushuxinxi` WRITE;
/*!40000 ALTER TABLE `tushuxinxi` DISABLE KEYS */;
INSERT INTO `tushuxinxi` VALUES (41,'2023-12-06 11:47:57','1111111111','图书名称1','图书分类1','upload/tushuxinxi_tushufengmian1.jpg,upload/tushuxinxi_tushufengmian2.jpg,upload/tushuxinxi_tushufengmian3.jpg','作者1','出版社1','图书详情1','2023-12-06','商家账号1','商家姓名1',1,99,'2023-12-06 19:47:57',1,0,99.9,1),(42,'2023-12-06 11:47:57','2222222222','图书名称2','图书分类2','upload/tushuxinxi_tushufengmian2.jpg,upload/tushuxinxi_tushufengmian3.jpg,upload/tushuxinxi_tushufengmian4.jpg','作者2','出版社2','图书详情2','2023-12-06','商家账号2','商家姓名2',2,99,'2023-12-06 19:47:57',2,0,99.9,2),(43,'2023-12-06 11:47:57','3333333333','图书名称3','图书分类3','upload/tushuxinxi_tushufengmian3.jpg,upload/tushuxinxi_tushufengmian4.jpg,upload/tushuxinxi_tushufengmian5.jpg','作者3','出版社3','图书详情3','2023-12-06','商家账号3','商家姓名3',3,99,'2023-12-06 19:47:57',3,0,99.9,3),(44,'2023-12-06 11:47:57','4444444444','图书名称4','图书分类4','upload/tushuxinxi_tushufengmian4.jpg,upload/tushuxinxi_tushufengmian5.jpg,upload/tushuxinxi_tushufengmian6.jpg','作者4','出版社4','图书详情4','2023-12-06','商家账号4','商家姓名4',4,99,'2023-12-06 19:47:57',4,0,99.9,4),(45,'2023-12-06 11:47:57','5555555555','图书名称5','图书分类5','upload/tushuxinxi_tushufengmian5.jpg,upload/tushuxinxi_tushufengmian6.jpg,upload/tushuxinxi_tushufengmian7.jpg','作者5','出版社5','图书详情5','2023-12-06','商家账号5','商家姓名5',5,99,'2023-12-06 19:47:57',5,0,99.9,5),(46,'2023-12-06 11:47:57','6666666666','图书名称6','图书分类6','upload/tushuxinxi_tushufengmian6.jpg,upload/tushuxinxi_tushufengmian7.jpg,upload/tushuxinxi_tushufengmian8.jpg','作者6','出版社6','图书详情6','2023-12-06','商家账号6','商家姓名6',6,99,'2023-12-06 19:47:57',6,0,99.9,6),(47,'2023-12-06 11:47:57','7777777777','图书名称7','图书分类7','upload/tushuxinxi_tushufengmian7.jpg,upload/tushuxinxi_tushufengmian8.jpg,upload/tushuxinxi_tushufengmian9.jpg','作者7','出版社7','图书详情7','2023-12-06','商家账号7','商家姓名7',7,99,'2023-12-06 19:47:57',7,0,99.9,7),(48,'2023-12-06 11:47:57','8888888888','图书名称8','图书分类8','upload/tushuxinxi_tushufengmian8.jpg,upload/tushuxinxi_tushufengmian9.jpg,upload/tushuxinxi_tushufengmian10.jpg','作者8','出版社8','图书详情8','2023-12-06','商家账号8','商家姓名8',8,99,'2023-12-06 19:47:57',8,0,99.9,8);
/*!40000 ALTER TABLE `tushuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `image` varchar(200) DEFAULT NULL COMMENT '头像',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','upload/image1.jpg','管理员','2023-12-06 11:47:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `touxiang` longtext COMMENT '头像',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机号',
  `money` double DEFAULT '0' COMMENT '余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (11,'2023-12-06 11:47:57','用户账号1','123456','用户姓名1','男','upload/yonghu_touxiang1.jpg','13823888881',200),(12,'2023-12-06 11:47:57','用户账号2','123456','用户姓名2','男','upload/yonghu_touxiang2.jpg','13823888882',200),(13,'2023-12-06 11:47:57','用户账号3','123456','用户姓名3','男','upload/yonghu_touxiang3.jpg','13823888883',200),(14,'2023-12-06 11:47:57','用户账号4','123456','用户姓名4','男','upload/yonghu_touxiang4.jpg','13823888884',200),(15,'2023-12-06 11:47:57','用户账号5','123456','用户姓名5','男','upload/yonghu_touxiang5.jpg','13823888885',200),(16,'2023-12-06 11:47:57','用户账号6','123456','用户姓名6','男','upload/yonghu_touxiang6.jpg','13823888886',200),(17,'2023-12-06 11:47:57','用户账号7','123456','用户姓名7','男','upload/yonghu_touxiang7.jpg','13823888887',200),(18,'2023-12-06 11:47:57','11','11','张艺','女','upload/yonghu_touxiang8.jpg','13823888888',200);
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ziyuanfenlei`
--

DROP TABLE IF EXISTS `ziyuanfenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ziyuanfenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ziyuanfenlei` varchar(200) DEFAULT NULL COMMENT '资源分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='资源分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ziyuanfenlei`
--

LOCK TABLES `ziyuanfenlei` WRITE;
/*!40000 ALTER TABLE `ziyuanfenlei` DISABLE KEYS */;
INSERT INTO `ziyuanfenlei` VALUES (51,'2023-12-06 11:47:57','资源分类1'),(52,'2023-12-06 11:47:57','资源分类2'),(53,'2023-12-06 11:47:57','资源分类3'),(54,'2023-12-06 11:47:57','资源分类4'),(55,'2023-12-06 11:47:57','资源分类5'),(56,'2023-12-06 11:47:57','资源分类6'),(57,'2023-12-06 11:47:57','资源分类7'),(58,'2023-12-06 11:47:57','资源分类8');
/*!40000 ALTER TABLE `ziyuanfenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ziyuanfenxiang`
--

DROP TABLE IF EXISTS `ziyuanfenxiang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ziyuanfenxiang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ziyuanbianhao` varchar(200) DEFAULT NULL COMMENT '资源编号',
  `ziyuanmingcheng` varchar(200) DEFAULT NULL COMMENT '资源名称',
  `ziyuanfenlei` varchar(200) DEFAULT NULL COMMENT '资源分类',
  `ziyuantupian` longtext COMMENT '资源图片',
  `ziyuanwendang` longtext COMMENT '资源文档',
  `fabushijian` date DEFAULT NULL COMMENT '发布时间',
  `ziyuanxiangqing` longtext COMMENT '资源详情',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  `shangjiaxingming` varchar(200) DEFAULT NULL COMMENT '商家姓名',
  `storeupnum` int(11) DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ziyuanbianhao` (`ziyuanbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='资源分享';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ziyuanfenxiang`
--

LOCK TABLES `ziyuanfenxiang` WRITE;
/*!40000 ALTER TABLE `ziyuanfenxiang` DISABLE KEYS */;
INSERT INTO `ziyuanfenxiang` VALUES (61,'2023-12-06 11:47:57','1111111111','资源名称1','资源分类1','upload/ziyuanfenxiang_ziyuantupian1.jpg,upload/ziyuanfenxiang_ziyuantupian2.jpg,upload/ziyuanfenxiang_ziyuantupian3.jpg','','2023-12-06','资源详情1','商家账号1','商家姓名1',1),(62,'2023-12-06 11:47:57','2222222222','资源名称2','资源分类2','upload/ziyuanfenxiang_ziyuantupian2.jpg,upload/ziyuanfenxiang_ziyuantupian3.jpg,upload/ziyuanfenxiang_ziyuantupian4.jpg','','2023-12-06','资源详情2','商家账号2','商家姓名2',2),(63,'2023-12-06 11:47:57','3333333333','资源名称3','资源分类3','upload/ziyuanfenxiang_ziyuantupian3.jpg,upload/ziyuanfenxiang_ziyuantupian4.jpg,upload/ziyuanfenxiang_ziyuantupian5.jpg','','2023-12-06','资源详情3','商家账号3','商家姓名3',3),(64,'2023-12-06 11:47:57','4444444444','资源名称4','资源分类4','upload/ziyuanfenxiang_ziyuantupian4.jpg,upload/ziyuanfenxiang_ziyuantupian5.jpg,upload/ziyuanfenxiang_ziyuantupian6.jpg','','2023-12-06','资源详情4','商家账号4','商家姓名4',4),(65,'2023-12-06 11:47:57','5555555555','资源名称5','资源分类5','upload/ziyuanfenxiang_ziyuantupian5.jpg,upload/ziyuanfenxiang_ziyuantupian6.jpg,upload/ziyuanfenxiang_ziyuantupian7.jpg','','2023-12-06','资源详情5','商家账号5','商家姓名5',5),(66,'2023-12-06 11:47:57','6666666666','资源名称6','资源分类6','upload/ziyuanfenxiang_ziyuantupian6.jpg,upload/ziyuanfenxiang_ziyuantupian7.jpg,upload/ziyuanfenxiang_ziyuantupian8.jpg','','2023-12-06','资源详情6','商家账号6','商家姓名6',6),(67,'2023-12-06 11:47:57','7777777777','资源名称7','资源分类7','upload/ziyuanfenxiang_ziyuantupian7.jpg,upload/ziyuanfenxiang_ziyuantupian8.jpg,upload/ziyuanfenxiang_ziyuantupian9.jpg','','2023-12-06','资源详情7','商家账号7','商家姓名7',7),(68,'2023-12-06 11:47:57','8888888888','资源名称8','资源分类8','upload/ziyuanfenxiang_ziyuantupian8.jpg,upload/ziyuanfenxiang_ziyuantupian9.jpg,upload/ziyuanfenxiang_ziyuantupian10.jpg','','2023-12-06','资源详情8','商家账号8','商家姓名8',8);
/*!40000 ALTER TABLE `ziyuanfenxiang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-21 18:33:49
