create database miaosha;
use miaosha;

CREATE TABLE `miaosha`.`user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE `miaosha`.`miaosha_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `head` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `registerDate` datetime COMMENT '注册时间',
  `lastLoginDate` datetime COMMENT '上次登录时间',
  `loginCount` int(11) DEFAULT 0 COMMENT '登录次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

INSERT INTO `miaosha_user` VALUES (1,'13580465836', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c4d', NULL, NULL, NULL, 0);

#商品表
CREATE TABLE `miaosha`.`goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品详情介绍',
  `goods_price` decimal(10, 2) DEFAULT 0.00 COMMENT '商品单价',
  `goods_stock` int(11) DEFAULT 0 COMMENT '商品库存，-1表示没有限制',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

#秒杀商品表（把秒杀拉出来，单独做一个表，以后有其他活动在拉出来做一个表）
CREATE TABLE `miaosha`.`miaosha_goods`  (
  `id` bigint(20) NOT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `miaosha_price` decimal(10, 2) DEFAULT 0.00 COMMENT '秒杀价',
  `stock_count` int(11) DEFAULT NULL COMMENT '库存数量',
  `start_date` datetime DEFAULT NULL COMMENT '秒杀开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '秒杀结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

#订单表
CREATE TABLE `miaosha`.`order_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `delivery_addr_id` bigint(20) DEFAULT NULL COMMENT '收货地址ID',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_count` int(11) DEFAULT 0 COMMENT '商品数量',
  `goods_price` decimal(10, 2) DEFAULT 0.00 COMMENT '商品单价',
  `order_channel` tinyint(4) DEFAULT 0 COMMENT '渠道：1PC,2Android,3Ios',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态，0新建支付，1已支付，2已发货，3已收货，4已退款，5已完成',
  `create_date` datetime DEFAULT NULL COMMENT '订单创建时间',
  `pay_date` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

#秒杀订单表
CREATE TABLE `miaosha`.`miaosha_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

INSERT INTO `goods`
VALUES
	( 1, 'iphoneX', 'Apple iPhone X(A1865) 64G 银色 移动联通电信4G手机', '/images/iphonex.png', 'Apple iPhone X(A1865) 64G 银色 移动联通电信4G手机', 8765.00, 10000 ),
  ( 2, '华为Mate9', '华为Mate9 4GB+32GB版 月光银 移动联通电信4G手机 双卡双待', '/images/meta10.png', 'Apple iPhone X(A1865) 64G 银色 移动联通电信4G手机', 3212.00, 44 ),
  ( 3, '雨披', '旅行便携雨披', '/images/ad-003.jpg', '反光条半透明印花户外雨衣演唱会旅行便携雨披，采用环保材料制作，可自然降解', 55.00, 400 ),
  ( 4, '凉拖鞋', '浴室凉拖鞋', '/images/ad-002.jpg', '惠夫人拖鞋男室内夏季防滑软底洗澡家用情侣平跟女士家居家浴室凉拖鞋大码 新音', 45.00, 300 ),
  ( 5, '箭牌卫浴', '箭牌卫浴（ARROW）304不锈钢厨房水槽单槽洗菜盆', '/images/ad-001.jpg', '箭牌卫浴（ARROW）304不锈钢厨房水槽单槽洗菜盆 厨房洗手盆带龙头洗菜池水槽 AEO4B10558S先锋款580x', 545.00, 100 ),
  ( 6, '手表', '依伦瑞士表', '/images/ad-004.jpg', '依伦手表，瑞士手表厂商生产，采用石墨烯外壳，坚固耐用', 45.00, 50 );

INSERT INTO `miaosha_goods`
VALUES
	( 1, 1, 0.01, 4, '2019-01-04 15:18:00', '2018-01-04 19:18:00' ),
	( 2, 2, 0.01, 9, '2018-01-04 08:18:00', '2019-01-05 12:18:00' ),
	( 3, 3, 9.99, 9, '2018-01-04 08:18:00', '2019-01-05 23:18:00' ),
  ( 4, 4, 9.99, 8, '2018-01-04 08:18:00', '2019-01-05 23:18:00' ),
  ( 5, 5, 9.99, 9, '2018-01-04 08:18:00', '2019-01-05 23:18:00' ),
  ( 6, 6, 1999.99, 15, '2018-01-04 08:18:00', '2019-01-05 23:18:00' );
