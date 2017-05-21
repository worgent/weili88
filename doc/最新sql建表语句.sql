/*
Navicat MySQL Data Transfer

Source Server         : 
Source Server Version : 50616
Source Host           : 192.155.87.49:3306
Source Database       : weili88

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-08 15:56:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad`
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`TITLE`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题' ,
`TYPE`  smallint(6) NULL DEFAULT NULL COMMENT '类型 1:贴片2:软文 10:微信互推' ,
`PRICE`  decimal(8,2) NULL DEFAULT NULL COMMENT '价格（/千粉）' ,
`INDUSTRYIDS`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业要求（行业ID用逗号隔开）空表示无要求' ,
`AREAIDS`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区要求(地区ID用逗号隔开) 空表示无要求' ,
`MIN_FANS`  int(11) NULL DEFAULT NULL COMMENT '粉丝数最低要求' ,
`MAX_FANS`  int(11) NULL DEFAULT NULL COMMENT '粉丝数最高要求' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '状态 1有效-1无效' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`UPDATE_TIME`  datetime NULL DEFAULT NULL COMMENT '修改时间(指状态修改)' ,
`CONTENT`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容' ,
`PHOTO`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贴片广告时图片' ,
`USER_ID`  int(11) NULL DEFAULT NULL COMMENT '创建者ID' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='广告'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of ad
-- ----------------------------
BEGIN;
INSERT INTO `ad` VALUES ('1', '行业广告', '1', '30.00', '0', '0', '1000', '999999999', '1', '2015-04-20 14:20:19', null, null, '/ckupload/images/1429510819254.jpg', '10'), ('2', '行业第一', '2', '100.00', '0', '0', '1000', '999999999', '1', '2015-04-20 14:26:38', null, '<p>复反反复复反反复复反反复复反反复复反反复复<img alt=\"\" style=\"width: 854px; height: 379px;\" _cke_saved_src=\"/ckupload/images/201517/1429511178505.jpg\" src=\"/ckupload/images/201517/1429511178505.jpg\"></p>', null, '10'), ('3', 'fgf', '10', '100.00', '0', '0', '1000', '999999999', '-1', '2015-04-20 14:59:14', null, '<p>gggggggggggggggggggggggggggggggg</p>', null, '6'), ('4', 'fff', '10', '10.00', '0', '0', '1000', '999999999', '1', '2015-04-20 15:00:42', null, '<p>ggggggggggggggggggggggggggggggggggggggggggggggggggggggggvvvvvvvvvvv</p>', null, '6');
COMMIT;

-- ----------------------------
-- Table structure for `ad_order`
-- ----------------------------
DROP TABLE IF EXISTS `ad_order`;
CREATE TABLE `ad_order` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`AD_ID`  int(11) NULL DEFAULT NULL COMMENT '广告ID' ,
`USER_WXZ_ID`  int(11) NULL DEFAULT NULL COMMENT '微信主ID' ,
`USER_GGZ_ID`  int(11) NULL DEFAULT NULL COMMENT '广告主ID(微信互推时指发布者ID)' ,
`AMOUNT`  decimal(15,2) NULL DEFAULT NULL COMMENT '订单金额' ,
`POSITION`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置如1,2,3' ,
`PLAN_DAY`  date NULL DEFAULT NULL COMMENT '计划发布日期' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`APPLY_TIME`  datetime NULL DEFAULT NULL COMMENT '申请对账时间' ,
`CONFIRM_TIME`  datetime NULL DEFAULT NULL COMMENT '确认时间' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '1:接单 2:申请对账 11:广告主确认通过 12:管理员确认通过  21:广告主确认不通过 22:管理员确认不通过' ,
`ZHIFU_ID`  int(11) NULL DEFAULT NULL COMMENT '支付ID,对应zhifu_order表ID' ,
`AD_TYPE`  smallint(6) NULL DEFAULT NULL COMMENT '广告类型' ,
`AD_PRICE`  decimal(15,2) NULL DEFAULT NULL COMMENT '广告价格' ,
`NUM_FANS`  int(11) NULL DEFAULT NULL COMMENT '接单时刻粉丝数' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='广告订单'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of ad_order
-- ----------------------------
BEGIN;
INSERT INTO `ad_order` VALUES ('1', '1', '6', '10', '366.00', null, '2015-04-20', '2015-04-20 14:45:36', '2015-04-23 16:01:00', '2015-04-23 17:10:37', '21', null, '1', '30.00', '12200'), ('2', '2', '6', '10', '1220.00', null, '2015-04-20', '2015-04-20 14:46:24', '2015-04-20 14:48:05', '2015-04-20 14:56:17', '21', '1', '2', '100.00', '12200'), ('3', '4', '7', '6', '52.60', null, '2015-04-20', '2015-04-20 15:53:11', '2015-04-23 17:03:58', '2015-04-23 17:10:19', '21', null, '10', '10.00', '5260');
COMMIT;

-- ----------------------------
-- Table structure for `ad_order_url`
-- ----------------------------
DROP TABLE IF EXISTS `ad_order_url`;
CREATE TABLE `ad_order_url` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`AD_ORDER_ID`  int(11) NULL DEFAULT NULL COMMENT '订单ID' ,
`TITLE`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题' ,
`URL`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址' ,
`PHOTO`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图文分析截图' ,
`IP`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`UPDATE_TIME`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
`MESSAGE`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='由微信主填写URL，申请对账时候用'
AUTO_INCREMENT=10

;

-- ----------------------------
-- Records of ad_order_url
-- ----------------------------
BEGIN;
INSERT INTO `ad_order_url` VALUES ('1', '2', '1111111', '1111111', '/ckupload/images/1429512485251.jpg', '123.115.136.230', '2015-04-20 14:48:05', null, null), ('2', '1', 'gg', 'http://weibo.com/ajaxlogin.php?framelogin=1&callback=parent.sinaSSOController.feedBackUrlCallBack', '/ckupload/images/1429776060874.png', '123.115.141.107', '2015-04-23 16:01:00', null, null), ('3', '1', 'cc', 'http://weibo.com/ajaxlogin.php?framelogin=1&callback=parent.sinaSSOController.feedBackUrlCallBack', '/ckupload/images/1429776060881.png', '123.115.141.107', '2015-04-23 16:01:00', null, null), ('4', '1', 'cccv', 'http://weibo.com/ajaxlogin.php?framelogin=1&callback=parent.sinaSSOController.feedBackUrlCallBack', '/ckupload/images/1429776060881.png', '123.115.141.107', '2015-04-23 16:01:00', null, null), ('5', '1', 'vv', 'http://weibo.com/ajaxlogin.php?framelogin=1&callback=parent.sinaSSOController.feedBackUrlCallBack', '/ckupload/images/1429776060882.png', '123.115.141.107', '2015-04-23 16:01:00', null, null), ('6', '3', 'cc', 'http://weibo.com/ajaxlogin.php?framelogin=1&callback=parent.sinaSSOController.feedBackUrlCallBack', '/ckupload/images/1429779838638.png', '123.115.141.107', '2015-04-23 17:03:58', null, null), ('7', '3', '00000000', 'http://weibo.com/ajaxlogin.php?framelogin=1&callback=parent.sinaSSOController.feedBackUrlCallBack', '/ckupload/images/1429779838638.png', '123.115.141.107', '2015-04-23 17:03:58', null, null), ('8', '3', 'ccc', 'http://weibo.com/ajaxlogin.php?framelogin=1&callback=parent.sinaSSOController.feedBackUrlCallBack', '/ckupload/images/1429779838638.png', '123.115.141.107', '2015-04-23 17:03:58', null, null), ('9', '3', 'cc', 'http://weibo.com/ajaxlogin.php?framelogin=1&callback=parent.sinaSSOController.feedBackUrlCallBack', '/ckupload/images/1429779838639.png', '123.115.141.107', '2015-04-23 17:03:58', null, null);
COMMIT;

-- ----------------------------
-- Table structure for `chongzhi_order`
-- ----------------------------
DROP TABLE IF EXISTS `chongzhi_order`;
CREATE TABLE `chongzhi_order` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USER_ID`  int(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`MONEY`  decimal(15,2) NULL DEFAULT NULL COMMENT '充值金额' ,
`MONEY_BEFORE`  decimal(15,2) NULL DEFAULT NULL COMMENT '充值前账户余额' ,
`MONEY_AFTER`  decimal(15,2) NULL DEFAULT NULL COMMENT '充值成功后账户余额' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '参考：枚举类' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`USER_IP`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP' ,
`SERVER_INFO`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器信息,为了将来集群环境排查错误' ,
`PAY_TYPE`  int(11) NULL DEFAULT NULL COMMENT '支付方式1:支付宝' ,
`VERTIFY`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '防DBA直接修改数据库串改位' ,
`TRADE_NO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号' ,
`TOTAL_FEE`  decimal(15,2) NULL DEFAULT NULL COMMENT '传给支付宝的金额,支付宝也会回传回来,作为校验的依据' ,
`BUYER_EMAIL`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝回传回来的用户支付宝账户' ,
`NOTIFY_TIME`  datetime NULL DEFAULT NULL COMMENT '支付宝回调时间' ,
`MSG`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='充值订单'
AUTO_INCREMENT=8

;

-- ----------------------------
-- Records of chongzhi_order
-- ----------------------------
BEGIN;
INSERT INTO `chongzhi_order` VALUES ('1', '9', '1000.00', '0.00', '1000.00', '12', '2015-04-17 14:30:28', '123.116.214.61', null, '1', '1622a68babf94ffd091d7365f2b82fef', null, null, null, '2015-04-17 14:41:56', '管理员:weili_admin 后台手工开通'), ('2', '9', '1000.00', '0.00', '3000.00', '12', '2015-04-17 14:35:10', '123.116.214.61', null, '1', '3d23de20d484a32ccc1c43d645266f7b', null, null, null, '2015-04-17 14:42:08', '管理员:weili_admin 后台手工开通'), ('3', '9', '1000.00', '0.00', '2000.00', '12', '2015-04-17 14:36:11', '123.116.214.61', null, '1', 'b4f805b7f612e7e88a67d3f829b60a5a', null, null, null, '2015-04-17 14:42:02', '管理员:weili_admin 后台手工开通'), ('4', '9', '1.00', '0.00', '3002.00', '12', '2015-04-17 14:38:28', '123.116.214.61', null, '1', '8024f5387ba84fc89ec9849ffce837ff', null, null, null, '2015-04-17 14:42:26', '管理员:weili_admin 后台手工开通'), ('5', '9', '1.00', '0.00', '3001.00', '12', '2015-04-17 14:38:56', '123.116.214.61', null, '1', '4a1463a8b0439b94422fc3f69a29c247', null, null, null, '2015-04-17 14:42:18', '管理员:weili_admin 后台手工开通'), ('6', '10', '10000.00', '0.00', '20000.00', '12', '2015-04-17 14:43:35', '123.116.214.61', null, '1', 'cc9335b582e727c9cd8dd89acb0733ae', null, null, null, '2015-04-17 14:50:05', '管理员:weili_admin 后台手工开通'), ('7', '10', '10000.00', '0.00', '10000.00', '12', '2015-04-17 14:44:35', '123.116.214.61', null, '1', 'b3d2c086f8941404d83f4cd039ba863c', null, null, null, '2015-04-17 14:50:00', '管理员:weili_admin 后台手工开通');
COMMIT;

-- ----------------------------
-- Table structure for `cms`
-- ----------------------------
DROP TABLE IF EXISTS `cms`;
CREATE TABLE `cms` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`CATEGORY_ID`  int(11) NULL DEFAULT NULL COMMENT '分类ID' ,
`TITLE`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题' ,
`TYPE`  smallint(6) NULL DEFAULT NULL COMMENT '1:资讯 2:画廊' ,
`CONTENT`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容' ,
`PHOTO`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片' ,
`URL`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址' ,
`SEQ`  int(11) NULL DEFAULT NULL COMMENT '排序' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '状态1:有效 -1无效' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`CREATE_USER_ID`  int(11) NULL DEFAULT NULL COMMENT '创建者ID' ,
`UPDATE_TIME`  datetime NULL DEFAULT NULL COMMENT '修改时间' ,
`UPDATE_USER_ID`  int(11) NULL DEFAULT NULL COMMENT '修改者' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='资讯'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of cms
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `content_url`
-- ----------------------------
DROP TABLE IF EXISTS `content_url`;
CREATE TABLE `content_url` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`WEIXIN_ID`  int(11) NULL DEFAULT NULL COMMENT '微信ID' ,
`URL`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容地址' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '状态1：有效' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`TITLE`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题' ,
`PHOTO`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片' ,
`BRIEF`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介' ,
`READ_DAY`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '读取日期' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='微信连接地址'
AUTO_INCREMENT=64

;

-- ----------------------------
-- Records of content_url
-- ----------------------------
BEGIN;
INSERT INTO `content_url` VALUES ('6', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203798695&idx=5&sn=3466dff57d8074a3b233cdb46564eeb6#rd', '1', '2015-04-09 08:53:01', '搞笑段子，药效一整天，受不了啊！', 'content/images/1428540781084.jpg', '有一个人问他的朋友：“ 你为什么一抽烟就笑， 是不是烟很香啊？ ” 朋友回答：“ 我看到书上说， 抽一支香烟减寿5秒； 笑一笑长寿10秒， 所以每次抽烟我就要笑一笑， 为生命赚回5秒钟。”', '2015-04-09'), ('7', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931757&idx=2&sn=9a43b653311e438416fb2f079139c287#rd', '1', '2015-04-09 09:15:10', '后面女人抽的不是烟是寂寞', 'content/images/1428542110836.jpg', '妖精，快快现出原形！表情是什么意思？妹子，进去摘就行了啊！你们还在玩什么呼啦圈？吸烟区！好守规则的小伙子！这就是我的完美的一天！大自然的风，永远都是男人的好朋友姑娘，你真是深不可测妹子就这么喜欢大炮看完了这幅图，我整个人都泥垢了骚年，你的眼睛出卖了你抛球也要凹个造型生病了一听到要拍照，剪刀手马上摆出来真是个爱学习的好孩子不要看轻了女汉子的力量妹子坐那上面不凉吗？妈的一开手机蒙圈了，山寨机太雷了！', '2015-04-09'), ('8', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931757&idx=4&sn=71bc2432de148108f1af3c9421e4cb49#rd', '1', '2015-04-09 10:11:03', '史上最牛的小偷', 'content/images/1428545463899.jpg', '史上最牛的火车。史上最牛的摄影师。史上最牛的拖车。史上最牛的公文候车亭。史上最牛的婚宴。史上最牛的自行车。史上最牛的汽车。央上最牛的红绿灯。看激情小电影～请加微信号：nvshen58和yujiehys史上最牛的堵车。史上最牛的火车站广场。史上最牛的军犬。史上最牛的邮寄员。史上最牛的修车。史上最牛的扫路车。史上最牛的拖拉机。史上最牛的理发。史上最牛的迎亲车队。', '2015-04-09'), ('9', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931757&idx=5&sn=18213ffb0b1dcd464175b844c13a0e7f#rd', '1', '2015-04-09 10:12:39', '20条神秘野史', 'content/images/1428545559341.jpg', '【老舍】1966年某日的凌晨，被打得遍体鳞伤的老舍欲回家，然而，家人坚决拒绝他进门要其好好反醒。他独自来到了太平湖，在湖边坐了整整一天，几乎没动过，最后步入湖水自尽。死后，连骨灰也未保留。老舍曾说：我想写一出最悲的悲剧，里面充满了无耻的笑声。', '2015-04-09'), ('10', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931757&idx=3&sn=d596c38f2c81024e9d5ff4f6ffbd4cf9#rd', '1', '2015-04-09 10:16:44', '一女正在厕所小便', 'content/images/1428545804822.jpg', '一女女正在厕所小便，一位喝的醉醺醺的酒鬼误入，听到嘘嘘的尿声，连忙说：别倒了，我真喝不下了！女女吓坏了，不敢在尿，憋不住放了个屁，酒鬼说：兄弟！怎么又起了一瓶？！', '2015-04-09'), ('11', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931862&idx=5&sn=2c5c4f6444c4fddefd7bf3a23069f1d9#rd', '1', '2015-04-09 14:54:09', '小明居然骂我是屎壳郎', 'content/images/1428562449331.jpg', '昨天上课，小明居然骂我是屎壳郎 ，我当时特别机智 一点都没生气~ B：为什么？ 揍他丫的 ，居然敢骂你！A：我就推了他一下~', '2015-04-09'), ('12', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931862&idx=4&sn=dfe3681a4c26b313e2e754bec23416d2#rd', '1', '2015-04-09 14:56:22', '经典幽默个性搞笑语句25条', 'content/images/1428562582038.jpg', '1、真正的恐龙，关了灯都是夜光的。2、每个人都有不得不吃屎的时候，只是不要细嚼 3、不管是李宇春还是曾轶可都是我的哥我的哥。 4、脸不见血身不见伤四下无人。', '2015-04-09'), ('13', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931862&idx=3&sn=663b2968075a281a1d1e14de36924b97#rd', '1', '2015-04-09 14:57:07', '笑话8则', 'content/images/1428562627231.jpg', '两名山友一同去登山，其中一位不慎跌下山谷……另一个喊道:“你受伤了吗?”只听见深渊传来回声：“不知道呀,我还在往下掉……”', '2015-04-09'), ('14', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931862&idx=2&sn=2d1686c6134d55151601adfd18860337#rd', '1', '2015-04-09 15:00:04', '史上最淫.荡的谜语，看一个笑一次', 'content/images/1428562804983.jpg', '1、 掀开热被窝，就往腿上摸，掰开两条腿，就往眼上搁（打一日常用品）答案 眼镜 2、 男人小便(打一通讯工具) 答案 手提机（鸡） 3、长腿男人(打一食物)答案 蛋糕（高） 4、乳罩(打一社会现象) 答案 包二奶 5、妓女罢工(历史用语) 答案 抗日', '2015-04-09'), ('15', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931954&idx=5&sn=f4aa1184a240f1bb4617d02120ca4f8a#rd', '1', '2015-04-09 15:01:01', '带一点黄的笑话，慎入...', 'content/images/1428562861404.jpg', '一个活了百岁的老妓女和只有一个睾丸的 男人做爱，由于过于激烈，双双归西。警察验 尸完后，恨感慨的说：这就是血的教训啊，百 年大妓毁于一旦啊。', '2015-04-09'), ('16', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931954&idx=4&sn=aff4128297112772b6eb6105d06953be#rd', '1', '2015-04-09 15:03:07', '二货媳妇', 'content/images/1428562987100.jpg', '、老公居然骗我在工地加班呢！于是我连夜坐车赶到工地查看，坐在车里远远望去，看到老公认真工作的样子，我终于放心了。然后我扭头对着车里的男人说道：“走吧，我们去宾馆！”', '2015-04-09'), ('17', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931954&idx=3&sn=84cee3bcd7b3fc1ed53ad4ef728ee79f#rd', '1', '2015-04-09 15:04:01', '很机智，确实很机智', 'content/images/1428563041896.png', '又一次被人叫住问路，换作是以前，我定会指一条相反的方向告诉他，然后沾沾自喜地感觉自己整蛊到人了。\r\n但是现在我没有，也许是已经过了幼稚的年纪，我耐心地告诉他：“前面过两个红绿灯，第二个十字路口左转，再走50米会看到一个步行街。那条街上人多，你问问他们怎么走。”', '2015040920'), ('18', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203931954&idx=2&sn=911da01409f82516d84fc6a3368c12d0#rd', '1', '2015-04-09 15:04:47', '丈夫嫖娼,妻子匆匆赶到派出所', 'content/images/1428563087568.jpg', '妻子接着又一耳光再问：“各种姿势能满足你不”\r\n答曰：“能”', '2015041108'), ('19', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203932097&idx=5&sn=003e4195164dec47cf000e8989a39459#rd', '1', '2015-04-09 15:07:03', '小学生【✔爆笑】日记', 'content/images/1428563223526.jpg', '一列火车经过，况且况且况且况且况且', '2015041109'), ('20', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203932097&idx=4&sn=295270bb0cd88ed33718ed7add816626#rd', '1', '2015-04-09 15:07:43', '大嘴姐姐，笑成这样，啥好事呀！', 'content/images/1428563263631.jpg', '姐，无语呀，没那么热吧，多穿一件小衣服就那么麻烦吗！', '2015041110'), ('21', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203932097&idx=3&sn=34fc65684a34459a6c66a0dcc18dfa50#rd', '1', '2015-04-09 15:08:28', '开店就该取这样的名字', 'content/images/1428563308628.jpg', '是“孙子”开的？还是谁去吃谁是孙子……', '2015041111'), ('22', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203932097&idx=2&sn=e76e56e39c4bd81ef1a04b9770f4bae3#rd', '1', '2015-04-09 15:09:16', '超级搞笑，经典！', 'content/images/1428563356952.jpg', '01：人活着真累，所以叫人类。02：狐狸未成精，纯属太年轻。03：农夫山泉有点甜，男人说话有点悬。04：我在马路边，看到一分钱，刚要弯腰捡，原来是口痰，我靠...谁吐这么圆。05：女人混的好是嫂子，混的不好是婊子。', '2015041112'), ('23', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203981175&idx=5&sn=30060670d2b725fb55531a8dd08eb914#rd', '1', '2015-04-09 15:10:09', '广场舞大妈的新玩法', 'content/images/1428563409252.jpg', '强哥，小心熊大熊二来找茬啊', '2015041113'), ('24', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203981175&idx=4&sn=dfe94734439ae3322aba7afca5d3d5dc#rd', '1', '2015-04-09 15:11:07', '弟弟的衣服，雷爆了', 'content/images/1428563467093.jpg', '今天逛街看见一家服装店的玻璃门上贴着：“不管买不买，进门就有礼！”我心想这家服装店门面也不怎么样，怎么那么牛气？所以决定去看看当我前脚踏进大门的时候，旁边的 一个漂亮的服务妹妹双膝一说道：“欢迎光临，小女子这厢有礼了。”', '2015041114'), ('25', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203981175&idx=3&sn=bb5ac1bb35792c766a63298497500388#rd', '1', '2015-04-09 15:11:53', '这是要毁我童年啊', 'content/images/1428563513047.jpg', '老板这店名。。。 瞧瞧这哥们。。。这多很专业呀！！！少说也练了好几年。。。 闺女，你醒醒啊！你睡成这样以后怎么嫁的出去啊？！', '2015041115'), ('26', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203981175&idx=2&sn=a7e933b03ccac6dd3512767acd84eef8#rd', '1', '2015-04-09 15:12:38', '论绅士的灭亡', 'content/images/1428563558689.jpg', '1.全球变暖的铁证 2.论绅士的灭亡 3.观察宇宙的正确方式 4.原始人的迷思', '2015041116'), ('27', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203981175&idx=1&sn=af3aae7b05af3b3a432307831a505611#rd', '1', '2015-04-09 15:13:14', '什么时候擦屁股？', 'content/images/1428563594500.jpg', '女生嫁不出去的原因，真实又搞笑~~', '2015041117'), ('28', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203981719&idx=5&sn=337fe303fea22e1593f9ae5854e761a6#rd', '1', '2015-04-09 15:14:02', '佛祖来沙滩洗澡来了！', 'content/images/1428563642789.jpg', '都有女朋友了。我还是.... 大妈，你今年贵庚啊？15有吗？ 多么销魂的豹纹裤子和睡姿 大妈，你今年贵庚啊？15有吗？ 佛祖来沙滩洗澡来了！', '2015041210'), ('29', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203981719&idx=4&sn=e7bb88239b9b16db0bcaf101695e2858#rd', '1', '2015-04-09 15:15:41', '吓尿了？是吗？', 'content/images/1428563741622.jpg', '爱美是要付出代价的。。 吓尿了？是吗？ 看到了我要的结果 妹子你……太重口了！！! 这就是装逼的下场。。。 韩国人滚个床单就那么难吗？ 妹纸你这是在演戏吗', '2015041211'), ('30', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203981719&idx=3&sn=bd6ee6b7cf7da9d461a5b2dfded43eb6#rd', '1', '2015-04-09 15:16:23', '骚年，好大的口气啊', 'content/images/1428563783066.jpg', '骚年，好大的口气啊 昨晚去买衣架，结果看到了这神器，瞬间觉得这世界太奇妙了。 看你还敢不敢乱拉屎 老板这店名略叼丫', '2015041212'), ('31', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203981719&idx=2&sn=eee7be18a51e3b1baad460ccb95dc41a#rd', '1', '2015-04-09 15:17:09', '斗牛有风险，装X需谨慎啊', 'content/images/1428563829326.jpg', '好梦幻！！！！ 妹纸桥不是这样过的 史上最牛的引体向上…… 歪国人太能搞了 这这这。。。 斗牛有风险，装X需谨慎啊', '2015041213'), ('32', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203981719&idx=1&sn=9914dd6baf530d5c50badd7b1e00c880#rd', '1', '2015-04-09 15:17:36', '停电摸黑进厕所', 'content/images/1428563856484.jpg', '记得高中停电那会，摸索着进了厕所，找到了个坑位正准备蹲下，突然，被一双沉重而有力的大手托住，后面传来一个声音：有人～', '2015041214'), ('33', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204042597&idx=2&sn=d0a47aa3136f1c527123c24b617b9090#rd', '1', '2015-04-12 11:01:53', '看完不准笑，群发一下，给大家减减压...', 'content/images/1428807713695.jpg', '一天中午，建行储蓄大厅里没有顾客，我正坐在存取柜台的窗口内发呆，这时一个女顾客走进大厅，来到我的窗口，她递给我一张纸条说是要取钱。', '2015041215'), ('34', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204042597&idx=3&sn=7d9ef7da890406ccf03ed6c6ff1667fe#rd', '1', '2015-04-12 11:04:43', '中国各地骗子地图-各省有各省的特色，神准！', 'content/images/1428807883311.jpg', '在改革开放之初，东北人是最淳朴的，但被南方的浙江人、福建人、广东人欺骗多了，开始变聪明了，而且还青出于蓝胜于蓝，骗术不但高明还人才辈出。', '2015041216'), ('35', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204042597&idx=4&sn=af4ea1384c0d433a9c1c82fc94cae495#rd', '1', '2015-04-12 11:17:19', '流氓不可怕，就怕流氓有文化（最新版）', 'content/images/1428808639703.jpg', '古时候打劫是这样的：此山是我开，此树是我栽。要想从此过，留下买路财！这语言多么粗鲁～霸道！经过上千年的文明洗礼，到了现代社会，语言变得文明贴心：', '2015041217'), ('36', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204042597&idx=5&sn=6cfb74cbf02c546b232e969460712b82#rd', '1', '2015-04-12 11:20:52', '\"毕姥爷的晚餐\"与\"最后的晚餐\"的惊人相似', 'content/images/1428808852748.jpg', '小编对“姥爷”其实无感，更不认为他是圣人，但既然发现了有趣的相似点，不分享说不过去啊。接下来是网友在这件事之后，分享的心得，为了大家的幸福，一定要看：', '2015041218'), ('37', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204044301&idx=2&sn=df63bf80b39430a116006cfda8a66934#rd', '1', '2015-04-12 11:24:35', '全国最搞笑的名字，不准笑！！', 'content/images/1428809075020.jpg', '秦寿生（亏他父母想得出） 庞光 杜琦燕 魏生津 矫厚根 沈京兵 杜子腾 排名第一的：', '2015041219'), ('38', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204044301&idx=3&sn=a0a11abc8a9e3a82f3288836592322b8#rd', '1', '2015-04-12 11:26:46', '搞笑小学生日记（爆笑）', 'content/images/1428809206447.jpg', '题目：先……再……，例题：先吃饭，再洗澡。小朋友写：先生，再见!老师批语：想象力超过了地球人的智慧。', '2015041220'), ('39', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204044301&idx=4&sn=65d32fc133073b998de3de62483cfc3d#rd', '1', '2015-04-12 11:29:41', '亲爱的，下辈子我做男的你做女的，换我养你好吗？得到的回答竟是...', 'content/images/1428809381311.jpg', '突然心血来潮学电视里的女主角温柔的对男朋友：亲爱的你对我太好了，你太辛苦，如果有下辈子，我做男的你做女的，换我养你好吗？男朋友：', '2015041221'), ('40', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204050644&idx=2&sn=66ee3e45640c0ae5462394f283d0400b#rd', '1', '2015-04-12 11:31:22', '学校，我炸了', 'content/images/1428809482905.png', '早上男生给女生打电话，男生：昨晚做梦梦到你了，今早起来裤裆湿了一大片。女生害羞的答到：讨厌，梦到我什么了？男生：', '2015041222'), ('41', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204050644&idx=3&sn=f9a81a18ddbfd8a27fa2fd91c5822d0f#rd', '1', '2015-04-12 11:34:32', '第一次接吻、拍床戏，哈哈', 'content/images/1428809672564.jpg', '第一次飚车，第一次喝醉，第一次住宾馆...太搞笑了！', '2015041308'), ('42', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204050644&idx=4&sn=1fcd4f37f72beea160055335d164f665#rd', '1', '2015-04-12 11:36:30', '妈，我西藏骑行回来了。。。笑得胃疼', 'content/images/1428809790993.jpg', '女同学喝多，占着我的床不走。我要怎么办？', '2015041309'), ('43', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204050644&idx=5&sn=64bd35ece6f0a09e5500b8175de8350c#rd', '1', '2015-04-12 11:37:45', '最新解答 : 我和你妈掉水里,你先救谁?', 'content/images/1428809865024.jpg', '女问：我和你妈跳进水里，你先救谁？男：我只有一个妈！女泪奔，转身说：再见！男提高声音说：', '2015041310'), ('44', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=203771322&idx=1&sn=1b9921a369a0be83b951b0736273898f#rd', '1', '2015-04-12 12:26:02', '桃花村的女人', 'content/images/1428812762675.jpg', '女神，你脱光了要干嘛？', '2015041311'), ('45', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051028&idx=2&sn=48624ecc72890266d7fdb8e7cd1ce4c4#rd', '1', '2015-04-12 16:11:16', '老公用老婆的手机，群发一条短信“我怀孕了！”回复太精彩了！', 'content/images/1428826276275.jpg', '丈夫知道妻子终于怀孕后，喜出望外，他想把好消息告诉所有人。于是用妻子的手机群发了一条短信——“我怀孕了！”...', '2015041312'), ('46', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051028&idx=3&sn=5e696ebb58246c6312b24a8344cf82f2#rd', '1', '2015-04-12 16:13:18', '三十年里人民币和生活的变化，太精辟了！', 'content/images/1428826398825.jpg', '三十年前，背心和裤头，全是穿在最里面的； 三十年后，背心和裤头，也有穿在最外面的！三十年前，学校是收费的，五元钱就念书了!三十年后，学校是免费的，五万元还得走后门了！', '2015041313'), ('47', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051028&idx=4&sn=452955ce0e10ddc231a1d079b990d895#rd', '1', '2015-04-12 16:13:58', '珍贵的手影全集，留着教孩子吧', 'content/images/1428826438845.jpg', '珍贵的手影全集，留着教孩子吧', '2015041314'), ('48', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051028&idx=5&sn=d6d47466b381c92f27cdd7b93950d90e#rd', '1', '2015-04-12 16:15:20', '奶奶给孙子发微信，笑死我了，哈哈', 'content/images/1428826520147.jpg', '奶奶发微.信给孙子：你赶快躲起来，老师因为你逃学，现在来家里找你了！孙子回道：奶奶您快躲起来吧，我今天向老师请假，说您去世了。这时奶奶已经给老师开了门', '2015041315'), ('49', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051519&idx=2&sn=54ea9b5d69955df8a09988edd48532d4#rd', '1', '2015-04-12 16:18:31', '小两口对话太搞笑了…偷着乐吧！', 'content/images/1428826711667.jpg', '我和老婆闹别扭，就在小房间睡觉。她拿把大剪刀给我的蚊帐剪了个大口子，说：让蚊子咬死你！ 过了大概一个小时，老婆拿着透明胶来了，把刚刚剪坏的蚊帐黏在一起了！ 我的心啊，这个感动的啊，心想老婆就是刀子嘴豆腐心，还是很心疼自己的！ 我刚要说什么，她自言自语：蚊子进去的差不多的了，别让他们跑了。', '2015041316'), ('50', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051519&idx=3&sn=5954d21936711afd4fc63f9b0b9d8bd2#rd', '1', '2015-04-12 16:24:06', '情趣物品，差点认不出他们', 'content/images/1428827046858.png', '当不需要为《纽约客》、《时代周刊》等杂志设计封面的时候，Christoph Niemann就随手涂鸦。每个周末，这位柏林插画家都选择用一种新的方式来看平淡无奇的生活。2014年3月起，他开始在Instagram张贴这些围绕日常物品画下的涂鸦。', '2015041317'), ('51', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051519&idx=5&sn=c6950f81e7ecf28fc1cc7f8d968203cf#rd', '1', '2015-04-12 16:26:10', '简直就是只猫精，先森我吓到了……不笑是神人啊！', 'content/images/1428827170931.jpg', '主人说，多多锻炼身体好~1、2、3。。。', '2015041318'), ('52', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051689&idx=2&sn=5cf1c8809cfe6336c8b99a17fb66a738#rd', '1', '2015-04-12 16:28:37', '我媳妇儿经常这样，我在被窝里发现好几次了。。。', 'content/images/1428827317013.jpg', '“老板，这香蕉怎么这么青，放多久才能吃啊？” 老板：“拿回家放被窝里捂一晚就行了！” “你忽悠我的是吧？”', '2015041319'), ('53', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051689&idx=3&sn=064467a84f7876edfbc94f8d584b911b#rd', '1', '2015-04-12 16:31:38', '可惜美女，就这样被白摸了', 'content/images/1428827498041.jpg', '某美女,决定下重金,让自己瘦身.花十几万元以后,她觉得非常满意! 回家路上,在报摊,买了份报纸,找钱的时候,她问老板：“不好意思,你猜我几岁？”', '2015041320'), ('54', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051689&idx=4&sn=d9c006747dd93cbfb5c9307589bf5363#rd', '1', '2015-04-12 16:33:03', '弟，你怎么了，给我顶住呀！', 'content/images/1428827583600.jpg', '老婆怀孕，爸妈让我们分房睡，老婆大人怕我偷腥，让我去买个充气娃娃，我去了保健品店一看，便宜的二三百，贵的上千呢，回家问老婆能不能买个贵点的，老婆说：“贵的有啥好？”我回答：“贵点的会叫。”老婆当机立断: “那还是买便宜的吧。”我问：“为啥？”老婆说：“你买个便宜的回来，我叫。”', '2015041321'), ('55', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204051689&idx=5&sn=e0b756ce6268801e56fd65304b54c06b#rd', '1', '2015-04-12 16:35:44', '那些年考场上的糗事，都是绝世逗比啊！', 'content/images/1428827744662.jpg', '考试“惠”不会写，兴奋的打开瓶盖，妈的，再来一瓶...', '2015041322'), ('56', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204058754&idx=2&sn=210e80e02f27bb9d5954bf38f3f56148#rd', '1', '2015-04-12 16:37:25', '这才是真正的牛B！', 'content/images/1428827845055.jpeg', '这才是真正的牛人啊，都是高手！', '2015041408'), ('57', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204058754&idx=3&sn=27edccf7d3f3d874996210d3eeb0e84b#rd', '1', '2015-04-12 16:50:37', '老公，你嫌我丑不?', 'content/images/1428828637865.jpg', '一天早上，一位先生在湖边钓鱼，他等呀等，鱼就是不上钩。到了下午，他肚子有点饿了，就到附近的餐馆吃东西。先生：“你们这有什么东西吃?”服务员：“有糖醋鱼、红烧鱼、干炸鱼、清蒸鱼，还有……”那位先生自言自语地说：“怪不得湖里没鱼呢!”', '2015041409'), ('58', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204058754&idx=4&sn=43c3c4e1e55216aeff2b55c157497c38#rd', '1', '2015-04-12 16:53:30', '在ATM机取400元吐出40000元后......', 'content/images/1428828810960.jpg', '一美国老太在祖先遗物中找到一张200年前手写的存单，老祖宗在瑞士银行存了100美元。老太去该银行在美分行取钱，该行即报总行，总行即核对，查到该笔存款的底账。 总行行长到美国找到老太，举行兑现仪式，给老太兑现50万美元，并奖励她100万美元。行长说：“钱存在我们银行，只要地球在，你的钱就在。” 如果是在中国，银行会说：对不起，我们有规定，得您祖宗本人带有效身份证来领！ 太牛了，佩服，哈哈！！', '2015041410'), ('59', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204058754&idx=5&sn=30f455d4fd2e7e7b1d6b7e3e25270f2d#rd', '1', '2015-04-12 16:54:39', '老板，来一碗泪流满面！', 'content/images/1428828879156.jpg', '“那知己怎么卖？” “这个可贵了，一缘一份。” “来一份，哦！对了，在来份爱情，打包我带回家喂猪。”', '2015060815'), ('60', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204059953&idx=2&sn=a373c20ca1c1adf927d51372c593b2a7#rd', '1', '2015-04-12 16:58:18', '李世民好傻，如果当时他不安排唐僧去取经，而是把他吃了...', 'content/images/1428829098158.jpg', '一下班回到家二货老婆突然问我：是前任好看还是她好看。我幽幽回道...', '2015060815'), ('61', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204059953&idx=3&sn=2432a3939647558fd98b543110086a52#rd', '1', '2015-04-12 17:00:16', '为什么前女友还在关注我呢？（爆笑组图）', 'content/images/1428829216740.jpg', '搞笑组图，哪位大神做的图！笑死我了，全是大实话，哈哈', '2015060815'), ('62', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204059953&idx=4&sn=6f0c6d735f3b32ef28efefecba6a94bc#rd', '1', '2015-04-12 17:01:07', '艾玛，太牛B了，这才是绝世高手！！！', 'content/images/1428829267526.jpg', '看完不得不服，都是人才，都是高手啊！', '2015060815'), ('63', '1', 'http://mp.weixin.qq.com/s?__biz=MjM5MTI4MzY0MQ==&mid=204059953&idx=5&sn=9a0a6fd7c7878687857cccd3a0ed0f18#rd', '1', '2015-04-12 17:02:20', '春暖花开的季节，好想泡妹子。(爆笑屌丝泡妞记）', 'content/images/1428829340058.jpg', '前天相亲认识的女朋友刚刚打电话叫我去她家玩。第一次去她家，我就说：“我顺路给你带点东西吧？”她说：“不用，我家还有一盒呢”', '2015060815');
COMMIT;

-- ----------------------------
-- Table structure for `content_weixin`
-- ----------------------------
DROP TABLE IF EXISTS `content_weixin`;
CREATE TABLE `content_weixin` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`ENGLISH_NAME`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户' ,
`CHINESE_NAME`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信名称' ,
`PHOTO`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面' ,
`TYPE`  int(11) NULL DEFAULT NULL COMMENT '类型1：笑话' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '状态1：有效' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='微信'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of content_weixin
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`NAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字' ,
`TYPE`  smallint(6) NULL DEFAULT NULL COMMENT '类型 1:资讯 2:画廊 11：东北地区 12：华北地区 13：华东地区 14：华中地区 15：华南地区 16：西南地区 17：西北地区  18：港澳台  19：国外  51：资讯阅读 52:日常生活  53:影音娱乐  54:其它' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '状态1:有效 -1无效' ,
`SEQ`  int(11) NULL DEFAULT NULL COMMENT '顺序号' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='字典表'
AUTO_INCREMENT=105

;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
BEGIN;
INSERT INTO `dictionary` VALUES ('1', '公告', '1', '1', '1'), ('2', '通知', '1', '1', '2'), ('3', '新闻', '1', '1', '3'), ('4', '首页', '2', '1', '1'), ('5', '频道A', '2', '1', '2'), ('6', '频道B', '2', '1', '3'), ('7', '辽宁', '11', '1', '1'), ('8', '吉林', '11', '1', '2'), ('9', '黑龙江', '11', '1', '3'), ('10', '河北', '12', '1', '1'), ('11', '山西', '12', '1', '2'), ('12', '内蒙古', '12', '1', '3'), ('13', '北京', '12', '1', '4'), ('14', '天津', '12', '1', '5'), ('15', '山东', '13', '1', '1'), ('16', '江苏', '13', '1', '2'), ('17', '安徽', '13', '1', '3'), ('18', '浙江', '13', '1', '4'), ('19', '福建', '13', '1', '5'), ('20', '江西', '13', '1', '6'), ('21', '上海', '13', '1', '7'), ('22', '河南', '14', '1', '1'), ('23', '湖北', '14', '1', '2'), ('24', '湖南', '14', '1', '3'), ('25', '广东', '15', '1', '1'), ('26', '广西', '15', '1', '2'), ('27', '海南', '15', '1', '3'), ('28', '云南', '16', '1', '1'), ('29', '贵州', '16', '1', '2'), ('30', '四川', '16', '1', '3'), ('31', '西藏', '16', '1', '4'), ('32', '新疆', '17', '1', '1'), ('33', '陕西', '17', '1', '2'), ('34', '宁夏', '17', '1', '3'), ('35', '青海', '17', '1', '4'), ('36', '甘肃', '17', '1', '5'), ('37', '香港', '18', '1', '1'), ('38', '澳门', '18', '1', '2'), ('39', '台湾', '18', '1', '3'), ('40', '美国', '19', '1', '1'), ('41', '英国', '19', '1', '2'), ('42', '法国', '19', '1', '3'), ('43', '德国', '19', '1', '4'), ('44', '意大利', '19', '1', '5'), ('45', '加拿大', '19', '1', '6'), ('46', '澳大利亚', '19', '1', '7'), ('47', '新西兰', '19', '1', '8'), ('48', '俄罗斯', '19', '1', '9'), ('49', '日本', '19', '1', '10'), ('50', '韩国', '19', '1', '11'), ('51', '新闻', '21', '1', '1'), ('52', '体育', '21', '1', '2'), ('53', '科技', '21', '1', '3'), ('54', '小说', '21', '1', '4'), ('55', '军事', '21', '1', '5'), ('56', '财经', '21', '1', '6'), ('57', '汽车', '21', '1', '7'), ('58', '国际', '21', '1', '8'), ('59', '房产', '21', '1', '9'), ('60', '女性', '21', '1', '10'), ('61', '综合', '21', '1', '11'), ('62', '文化', '21', '1', '12'), ('63', '网络媒体', '21', '1', '13'), ('64', '电视媒体', '21', '1', '14'), ('65', '杂志报刊', '21', '1', '15'), ('66', 'IT', '21', '1', '16'), ('67', '医疗', '22', '1', '1'), ('68', '购物', '22', '1', '2'), ('69', '美食', '22', '1', '3'), ('70', '育儿', '22', '1', '4'), ('71', '时尚', '22', '1', '5'), ('72', '旅游', '22', '1', '6'), ('73', '健康', '22', '1', '7'), ('74', '职场', '22', '1', '8'), ('75', '家居', '22', '1', '9'), ('76', '创意', '22', '1', '10'), ('77', '宠物', '22', '1', '11'), ('78', '银行', '22', '1', '12'), ('79', '理财', '22', '1', '13'), ('80', '教育', '22', '1', '14'), ('81', '创业', '22', '1', '15'), ('82', '其它', '22', '1', '16'), ('83', '社区', '23', '1', '1'), ('84', '八卦', '23', '1', '2'), ('85', '游戏', '23', '1', '3'), ('86', '图片', '23', '1', '4'), ('87', '娱乐', '23', '1', '5'), ('88', '语录', '23', '1', '6'), ('89', '明星', '23', '1', '7'), ('90', '动漫', '23', '1', '8'), ('91', '音乐', '23', '1', '9'), ('92', '搞笑', '23', '1', '10'), ('93', '美女', '23', '1', '11'), ('94', '星座', '23', '1', '12'), ('95', '测试', '23', '1', '13'), ('96', '电影', '23', '1', '14'), ('97', '视频', '23', '1', '15'), ('98', '电视剧', '23', '1', '16'), ('99', '公共名人', '24', '1', '1'), ('100', '政府机构', '24', '1', '2');
INSERT INTO `dictionary` VALUES ('101', '公益组织', '24', '1', '3'), ('102', '企业品牌', '24', '1', '4'), ('103', '事业单位', '24', '1', '5'), ('104', '私人交友', '24', '1', '6');
COMMIT;

-- ----------------------------
-- Table structure for `jiesuan_history`
-- ----------------------------
DROP TABLE IF EXISTS `jiesuan_history`;
CREATE TABLE `jiesuan_history` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USER_ID`  int(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`MONEY`  decimal(15,2) NULL DEFAULT NULL COMMENT '结算金额' ,
`MONEY_REAL_BEFORE`  decimal(15,2) NULL DEFAULT NULL COMMENT '实际支付金额（税前）' ,
`MONEY_DEDUCT`  decimal(15,2) NULL DEFAULT NULL COMMENT '代扣税' ,
`MONEY_REAL_AFTER`  decimal(15,2) NULL DEFAULT NULL COMMENT '实际支付金额（税后）' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '状态1:未付款2已付款' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='结算历史记录'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of jiesuan_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `jifen_history`
-- ----------------------------
DROP TABLE IF EXISTS `jifen_history`;
CREATE TABLE `jifen_history` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USER_ID`  int(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`AMOUNT`  int(11) NULL DEFAULT NULL COMMENT '增加总额' ,
`TYPE`  smallint(6) NULL DEFAULT NULL COMMENT '类型' ,
`MSG`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`FID`  int(11) NULL DEFAULT NULL COMMENT '上游ID' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='积分增加历史记录'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of jifen_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `jifen_order`
-- ----------------------------
DROP TABLE IF EXISTS `jifen_order`;
CREATE TABLE `jifen_order` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USER_ID`  int(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`AMOUNT`  int(11) NULL DEFAULT NULL COMMENT '增加总额' ,
`TYPE`  smallint(6) NULL DEFAULT NULL COMMENT '类型' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`MSG`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`FID`  int(11) NULL DEFAULT NULL COMMENT '上游ID' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='积分增加历史记录'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of jifen_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`TITLE`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题' ,
`TYPE`  smallint(6) NULL DEFAULT NULL COMMENT '类型:<100问题咨询; >100系统消息' ,
`RECEIVER_ID`  int(11) NULL DEFAULT NULL COMMENT '收件人ID' ,
`SENDER_ID`  int(11) NULL DEFAULT NULL COMMENT '发件人ID' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '状态 1:有效 -1删除' ,
`CONTENT`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`READ_TIME`  datetime NULL DEFAULT NULL COMMENT '阅读时间' ,
`BACK`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复(问题咨询才有意义)' ,
`BACK_TIME`  datetime NULL DEFAULT NULL COMMENT '回复时间(问题咨询才有意义)' ,
`BACKER_ID`  int(11) NULL DEFAULT NULL COMMENT '回复人ID' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统消息和问题咨询表type<100是问题咨询,大于100是系统消息'
AUTO_INCREMENT=26

;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES ('1', '感谢您提交认证信息,我们会尽快安排专人与您联系', '401', '6', '4', '1', '感谢您提交认证信息,我们会尽快安排专人与您联系', '2015-04-17 10:51:28', null, null, null, null), ('2', '微信主:xuanbaoyichu提交认证申请', '401', '4', '6', '1', '微信主:xuanbaoyichu提交认证申请,请及时完成认证审核', '2015-04-17 10:51:28', null, null, null, null), ('3', '感谢您提交认证信息,我们会尽快安排专人与您联系', '401', '6', '4', '1', '感谢您提交认证信息,我们会尽快安排专人与您联系', '2015-04-17 10:51:30', null, null, null, null), ('4', '微信主:xuanbaoyichu提交认证申请', '401', '4', '6', '1', '微信主:xuanbaoyichu提交认证申请,请及时完成认证审核', '2015-04-17 10:51:30', null, null, null, null), ('5', '感谢您提交认证信息,我们会尽快安排专人与您联系', '401', '7', '4', '1', '感谢您提交认证信息,我们会尽快安排专人与您联系', '2015-04-17 10:56:42', null, null, null, null), ('6', '微信主:imtaoshenghuo提交认证申请', '401', '4', '7', '1', '微信主:imtaoshenghuo提交认证申请,请及时完成认证审核', '2015-04-17 10:56:42', null, null, null, null), ('7', '感谢您提交认证信息,我们会尽快安排专人与您联系', '401', '8', '4', '1', '感谢您提交认证信息,我们会尽快安排专人与您联系', '2015-04-17 13:50:15', null, null, null, null), ('8', '微信主:imchengzhu提交认证申请', '401', '4', '8', '1', '微信主:imchengzhu提交认证申请,请及时完成认证审核', '2015-04-17 13:50:15', null, null, null, null), ('9', '恭喜,您的粉丝数认证审核已经通过', '401', '8', '4', '1', '恭喜,您的粉丝数认证审核已经通过', '2015-04-17 14:22:31', null, null, null, null), ('10', '恭喜,您的粉丝数认证审核已经通过', '401', '7', '4', '1', '恭喜,您的粉丝数认证审核已经通过', '2015-04-17 14:22:37', null, null, null, null), ('11', '恭喜,您的粉丝数认证审核已经通过', '401', '6', '4', '1', '恭喜,您的粉丝数认证审核已经通过', '2015-04-17 14:22:41', null, null, null, null), ('12', '微信名称:萱宝的外贸衣橱 接单《行业广告》,预计发布日期2015-04-20', '1', '10', '6', '1', '微信名称:萱宝的外贸衣橱,微信号:xuanbaoyichu , 接单《行业广告》,预计发布日期2015-04-20请注意审核', '2015-04-20 14:45:36', null, null, null, null), ('13', '微信名称:萱宝的外贸衣橱 接单《行业第一》,预计发布日期2015-04-20', '1', '10', '6', '1', '微信名称:萱宝的外贸衣橱,微信号:xuanbaoyichu , 接单《行业第一》,预计发布日期2015-04-20请注意审核', '2015-04-20 14:46:24', null, null, null, null), ('14', '微信主:萱宝的外贸衣橱 提交了对账申请', '2', '10', '6', '1', '微信主:萱宝的外贸衣橱 提交了对账申请', '2015-04-20 14:48:05', null, null, null, null), ('15', '恭喜:2015-04-20 广告执行确认通过', '11', '6', '5', '1', '恭喜:2015-04-20 广告执行确认通过,广告收入已经划到您的平台账户,请注意查收', '2015-04-20 14:56:17', null, null, null, null), ('16', '2015-04-20发布的广告《行业第一》, 执行确认被管理员通过', '21', '10', '5', '1', '微信名称:萱宝的外贸衣橱,微信号:xuanbaoyichu 2015-04-20发布的广告《行业第一》, 执行确认被管理员通过,请知晓', '2015-04-20 14:56:17', null, null, null, null), ('17', 'xuanbaoyichu申请支付1220.00元', '51', '4', '6', '1', 'xuanbaoyichu申请支付1220.00元', '2015-04-20 14:58:01', null, null, null, null), ('18', '您2015-04-20 的支付申请审核已经通过', '61', '6', '4', '1', '您2015-04-20 的支付申请审核已经通过<br>我们会在近期将钱打到您支付宝账户上,请注意查收.', '2015-04-20 15:02:40', null, null, null, null), ('19', '微信名称:淘生活 接单《fff》,预计发布日期2015-04-20', '1', '6', '7', '1', '微信名称:淘生活,微信号:imtaoshenghuo , 接单《fff》,预计发布日期2015-04-20请注意审核', '2015-04-20 15:53:11', null, null, null, null), ('20', '微信主:萱宝的外贸衣橱 提交了对账申请', '2', '10', '6', '1', '微信主:萱宝的外贸衣橱 提交了对账申请', '2015-04-23 16:01:00', null, null, null, null), ('21', '微信主:淘生活 提交了对账申请', '2', '6', '7', '1', '微信主:淘生活 提交了对账申请', '2015-04-23 17:03:58', null, null, null, null), ('22', '恭喜:2015-04-20 广告执行确认通过', '11', '7', '5', '1', '恭喜:2015-04-20 广告执行确认通过,广告收入已经划到您的平台账户,请注意查收', '2015-04-23 17:10:19', null, null, null, null), ('23', '2015-04-20发布的广告《fff》, 执行确认被管理员通过', '21', '6', '5', '1', '微信名称:淘生活,微信号:imtaoshenghuo 2015-04-20发布的广告《fff》, 执行确认被管理员通过,请知晓', '2015-04-23 17:10:19', null, null, null, null), ('24', '恭喜:2015-04-20 广告执行确认通过', '11', '6', '5', '1', '恭喜:2015-04-20 广告执行确认通过,广告收入已经划到您的平台账户,请注意查收', '2015-04-23 17:10:37', null, null, null, null), ('25', '2015-04-20发布的广告《行业广告》, 执行确认被管理员通过', '21', '10', '5', '1', '微信名称:萱宝的外贸衣橱,微信号:xuanbaoyichu 2015-04-20发布的广告《行业广告》, 执行确认被管理员通过,请知晓', '2015-04-23 17:10:37', null, null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for `message_xtxx_read`
-- ----------------------------
DROP TABLE IF EXISTS `message_xtxx_read`;
CREATE TABLE `message_xtxx_read` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`MESSAGE_ID`  int(11) NULL DEFAULT NULL COMMENT '系统消息ID' ,
`RECEIVER_ID`  int(11) NULL DEFAULT NULL COMMENT '收件人ID' ,
`READ_TIME`  datetime NULL DEFAULT NULL COMMENT '阅读时间' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统消息有多个收件人时,用这个表示每个人阅读情况'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of message_xtxx_read
-- ----------------------------
BEGIN;
INSERT INTO `message_xtxx_read` VALUES ('1', '15', '6', '2015-04-23 15:59:30');
COMMIT;

-- ----------------------------
-- Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`MIN_PRICE_TIEPIAN`  decimal(8,2) NULL DEFAULT NULL COMMENT '贴片广告最低价' ,
`MIN_PRICE_RUANWEN`  decimal(8,2) NULL DEFAULT NULL COMMENT '软文广告最低价' ,
`MIN_PRICE_WXHT`  int(11) NULL DEFAULT NULL COMMENT '微信互推最低价' ,
`MIN_SXF`  decimal(8,2) NULL DEFAULT NULL COMMENT '平台手续费最低值' ,
`MAX_SXF`  decimal(8,2) NULL DEFAULT NULL COMMENT '平台手续费最高值' ,
`PERCENT_SXF`  decimal(4,2) NULL DEFAULT NULL COMMENT '平台手续费百分比' ,
`JIFEN_ZHUCE_WXZ`  int(11) NULL DEFAULT NULL COMMENT '微信主注册送多少积分' ,
`JIFEN_ZHUCE_GGZ`  int(11) NULL DEFAULT NULL COMMENT '广告主注册送多少积分' ,
`MIN_ZHIFU`  decimal(11,2) NULL DEFAULT NULL COMMENT '最低支付' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统设置'
AUTO_INCREMENT=21

;

-- ----------------------------
-- Records of setting
-- ----------------------------
BEGIN;
INSERT INTO `setting` VALUES ('1', '10.00', '100.00', '10', '100.00', '1000.00', '0.10', '500', '1000', '30.00'), ('20', '10.00', '100.00', '10', '100.00', '1000.00', '0.10', '500', '1000', null);
COMMIT;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`ENGLISH_NAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名' ,
`CHINESE_NAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名' ,
`PWD`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码' ,
`TYPE`  smallint(6) NULL DEFAULT NULL COMMENT '类型1:系统用户10:广告主20:微信主30管理员' ,
`PHONE`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机' ,
`QQ`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`EMAIL`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`WEIXIN`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号' ,
`BRIEF`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`UPDATE_TIME`  datetime NULL DEFAULT NULL COMMENT '修改时间' ,
`CREATE_IP`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时IP' ,
`UPDATE_IP`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时IP' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '状态1：有效-1无效' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户表'
AUTO_INCREMENT=12

;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'all', '所有人', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null, null, null, '2015-03-17 16:31:41', null, null, null, '1'), ('2', 'all_ggz', '所有广告主', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null, null, null, '2015-03-17 16:31:41', null, null, null, '1'), ('3', 'all_wxz', '所有微信主', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null, null, null, '2015-03-17 16:31:41', null, null, null, '1'), ('4', 'all_gly', '所有管理员', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null, null, null, '2015-03-17 16:31:41', null, null, null, '1'), ('5', 'weili_admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '30', null, null, null, null, null, '2015-03-17 16:31:41', null, null, null, '1'), ('6', 'xuanbaoyichu', '萱宝的外贸衣橱', '14e7a9cb8572d26e3428ce1b0e085eb7', '20', '13911366243', '120148740', '120148740@qq.com', null, null, '2015-04-17 10:49:38', null, null, null, '1'), ('7', 'imtaoshenghuo', '淘生活', '14e7a9cb8572d26e3428ce1b0e085eb7', '20', '13911366243', '11592438', '11592438@qq.com', null, null, '2015-04-17 10:56:15', null, null, null, '1'), ('8', 'imchengzhu', '城之主', '14e7a9cb8572d26e3428ce1b0e085eb7', '20', '13911366243', '120148740', '120148740@qq.com', null, null, '2015-04-17 13:49:28', null, null, null, '1'), ('9', '金粉世家', null, 'e10adc3949ba59abbe56e057f20f883e', '10', '13911366243', '270841699', '270841699@qq.com', null, null, '2015-04-17 14:00:54', null, null, null, '1'), ('10', '辉煌', null, 'e10adc3949ba59abbe56e057f20f883e', '10', '13911366243', '120148740', '120148740@qq.com', null, null, '2015-04-17 14:08:05', null, null, null, '1'), ('11', 'meinv_xiaohua', '美女笑话', 'af24d20c670c82c8bb35fa47060b93d4', '20', '15652627725', '357656849', '1@1.com', null, null, '2015-04-17 16:22:09', null, null, null, '1');
COMMIT;

-- ----------------------------
-- Table structure for `user_admin`
-- ----------------------------
DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USER_ID`  int(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`ROLE_COMMON`  smallint(6) NULL DEFAULT NULL COMMENT '普通管理员' ,
`ROLE_FINANCIAL`  smallint(6) NULL DEFAULT NULL COMMENT '财务管理员' ,
`ROLE_SUPER`  smallint(6) NULL DEFAULT NULL COMMENT '超级管理员' ,
`LOGIN_NUM`  int(11) NULL DEFAULT NULL COMMENT '登录次数' ,
`LAST_LOGIN_TIME`  datetime NULL DEFAULT NULL COMMENT '最后一次登录时间' ,
`LAST_LOGIN_IP`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后一次登录IP' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='管理员'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of user_admin
-- ----------------------------
BEGIN;
INSERT INTO `user_admin` VALUES ('1', '5', '1', '0', '0', null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for `user_ggz`
-- ----------------------------
DROP TABLE IF EXISTS `user_ggz`;
CREATE TABLE `user_ggz` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USER_ID`  int(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`LINK_MAN`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人' ,
`JIFEN_INPUT`  int(11) NULL DEFAULT NULL COMMENT '积分总收入' ,
`JIFEN_OUTPUT`  int(11) NULL DEFAULT NULL COMMENT '积分总支出' ,
`JIFEN_OUTPUT_LOCK`  int(11) NULL DEFAULT NULL COMMENT '锁定支出积分' ,
`MONEY_INPUT`  decimal(15,2) NULL DEFAULT NULL COMMENT '人民币总收入' ,
`MONEY_OUTPUT`  decimal(15,2) NULL DEFAULT NULL COMMENT '人民币总支出' ,
`MONEY_OUTPUT_LOCK`  decimal(15,2) NULL DEFAULT NULL COMMENT '锁定支出人民币' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='广告主表'
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of user_ggz
-- ----------------------------
BEGIN;
INSERT INTO `user_ggz` VALUES ('1', '9', null, '1000', '0', '0', '3002.00', '0.00', '0.00'), ('2', '10', null, '1000', '0', '0', '20000.00', '1586.00', '0.00');
COMMIT;

-- ----------------------------
-- Table structure for `user_wxz`
-- ----------------------------
DROP TABLE IF EXISTS `user_wxz`;
CREATE TABLE `user_wxz` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USER_ID`  int(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`NUM_FANS`  int(11) NULL DEFAULT NULL COMMENT '粉丝数' ,
`YDL`  decimal(8,2) NULL DEFAULT NULL COMMENT '阅读率' ,
`ERWEIMA`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码' ,
`TYPE`  smallint(6) NULL DEFAULT NULL COMMENT '类型1订阅号2公众号' ,
`INDUSTRY_ID`  int(11) NULL DEFAULT NULL COMMENT '行业' ,
`AREA_ID`  int(11) NULL DEFAULT NULL COMMENT '地区' ,
`JIFEN_INPUT`  int(11) NULL DEFAULT NULL COMMENT '积分总收入' ,
`JIFEN_OUTPUT`  int(11) NULL DEFAULT NULL COMMENT '积分总支出' ,
`JIFEN_OUTPUT_LOCK`  int(11) NULL DEFAULT NULL COMMENT '锁定支出积分' ,
`MONEY_INPUT`  decimal(15,2) NULL DEFAULT NULL COMMENT '人民币总收入合计' ,
`MONEY_OUTPUT`  decimal(15,2) NULL DEFAULT NULL COMMENT '人民币总支出合计' ,
`MONEY_OUTPUT_LOCK`  decimal(15,2) NULL DEFAULT NULL COMMENT '锁定支出人民币合计' ,
`MONEY_ZHIFU`  decimal(15,2) NULL DEFAULT NULL COMMENT '支付人民币合计(含扣费)' ,
`MONEY_ZHIFU_LOCK`  decimal(15,2) NULL DEFAULT NULL COMMENT '锁定支付人民币合计' ,
`MONEY_ZHIFU_REAL`  decimal(15,2) NULL DEFAULT NULL COMMENT '真实支付合计' ,
`MONEY_ZHIFU_KOU`  decimal(15,2) NULL DEFAULT NULL COMMENT '扣除的各种费用合计' ,
`MONEY_ZHIFU_REFUSE`  decimal(15,2) NULL DEFAULT NULL COMMENT '拒绝支付金额合计' ,
`ZFB_ACCOUNT`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账户用来收款' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='微信主表'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of user_wxz
-- ----------------------------
BEGIN;
INSERT INTO `user_wxz` VALUES ('1', '6', '12200', '0.00', null, null, '70', '0', '500', '52', '0', '1586.00', '0.00', '0.00', '1220.00', '0.00', '880.00', '220.00', '0.00', null), ('2', '7', '5260', '0.00', null, null, '68', '0', '552', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null), ('3', '8', '5600', '0.00', null, null, '102', '0', '500', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null), ('4', '11', '0', '0.00', null, null, '0', '0', '500', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null);
COMMIT;

-- ----------------------------
-- Table structure for `user_wxz_rz`
-- ----------------------------
DROP TABLE IF EXISTS `user_wxz_rz`;
CREATE TABLE `user_wxz_rz` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USER_ID`  int(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`NUM_FANS`  int(11) NULL DEFAULT NULL COMMENT '粉丝数' ,
`INDUSTRY_ID`  int(11) NULL DEFAULT NULL COMMENT '行业' ,
`AREA_ID`  int(11) NULL DEFAULT NULL COMMENT '地区' ,
`YDL`  float(8,2) NULL DEFAULT NULL COMMENT '阅读率' ,
`TYPE`  smallint(6) NULL DEFAULT NULL COMMENT '类型1订阅号2公众号' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '状态' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL ,
`UPDATE_TIME`  datetime NULL DEFAULT NULL ,
`SH_USER_ID`  int(11) NULL DEFAULT NULL COMMENT '审核人' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='微信主信息认证'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of user_wxz_rz
-- ----------------------------
BEGIN;
INSERT INTO `user_wxz_rz` VALUES ('1', '6', '12200', '70', '0', null, null, '2', '2015-04-17 10:51:28', '2015-04-17 14:22:41', null), ('2', '7', '5260', '68', '0', null, null, '2', '2015-04-17 10:56:42', '2015-04-17 14:22:37', null), ('3', '8', '5600', '102', '0', null, null, '2', '2015-04-17 13:50:15', '2015-04-17 14:22:31', null);
COMMIT;

-- ----------------------------
-- Table structure for `zhifu_order`
-- ----------------------------
DROP TABLE IF EXISTS `zhifu_order`;
CREATE TABLE `zhifu_order` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USER_ID`  int(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`MONEY`  decimal(15,2) NULL DEFAULT NULL COMMENT '结算金额' ,
`MONEY_SXF`  decimal(15,2) NULL DEFAULT NULL COMMENT '平台手续费' ,
`MONEY_TAX_BEFORE`  decimal(15,2) NULL DEFAULT NULL COMMENT '实际支付金额（税前）' ,
`MONEY_TAX`  decimal(15,2) NULL DEFAULT NULL COMMENT '代扣税' ,
`MONEY_TAX_AFTER`  decimal(15,2) NULL DEFAULT NULL COMMENT '实际支付金额（税后）' ,
`CREATE_TIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`STATUS`  smallint(6) NULL DEFAULT NULL COMMENT '状态1:未付款2已付款' ,
`SH_USER_ID`  int(11) NULL DEFAULT NULL COMMENT '审核人ID' ,
`SH_TIME`  datetime NULL DEFAULT NULL COMMENT '审核时间' ,
`MSG`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='支付订单表'
AUTO_INCREMENT=2

;
