/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : orangeblog

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 30/12/2023 22:48:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键，UUID作为键值',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标题',
  `blogAbstract` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '摘要',
  `blogAbstractText` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '摘要文字',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'markdown格式的内容，用于重新编辑',
  `commentNum` int NOT NULL DEFAULT 0 COMMENT '评论数',
  `heartNum` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `readNum` int NOT NULL DEFAULT 0 COMMENT '阅读数',
  `shareNum` int NULL DEFAULT 0 COMMENT '分享数',
  `categoryID` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文章类别ID',
  `publishTime` datetime NOT NULL COMMENT '文章创建时间',
  `lastUpdateTime` datetime NOT NULL COMMENT '文章上次修改时间',
  `path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '静态化的文件磁盘路径',
  `coverURL` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  `status` int NOT NULL DEFAULT 0 COMMENT '博文状态，0显示，1不显示，2草稿',
  `html` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'html格式的博文，主要用于重新静态化',
  `tags` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '博文标签，逗号分割',
  `lunbo` tinyint(1) NOT NULL COMMENT '是否轮播',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('0c6f4c65f8a94b9d87d71ae4adf46453', '[旅行]澳门旅游', '', '', '<img alt=\"Snipaste_2023-02-10_22-28-02.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/28/45a8b58f-3359-4af7-b222-cd001a18296b.jpg\" style=\"zoom: 70%;\">\n简单记录一下下澳门旅游的攻略 测试能不能增加一些东西！：\n测试 111111\n![](http://localhost:8080/uploads/image_1703682726876.jpeg)\n\n<img src=\"http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/02/10/21/51/c01a36db-c058-41e3-9491-cec533c73323.png\" style=\"zoom: 60%;\">\n\n一些攻略准备（密密麻麻的收藏）\n\n## 景点and打卡点\n\n### 澳门半岛\n\n我们的本岛旅游路线：\n<img src=\"http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/02/10/21/56/d46fa521-b16c-471d-8c14-038a209e049a.png\" style=\"zoom: 50%;\">\n基本覆盖了本岛的80%景点。\n\n#### 恋爱巷\n\n在大三巴的左下方，有一条小街人比较少，也比较出片：\n\n<img src=\"http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/02/10/22/15/590339df-e89f-4ce3-9a2f-346c4a317370.jpg\" style=\"zoom: 50%;\">\n\n<img alt=\"Snipaste_2023-02-10_22-16-27.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/16/1fe165ba-fd51-4e08-9187-9ec7b12e8c6b.jpg\" style=\"zoom:50%\">\n\n#### 东望洋新街\n\n国家地理的经典机位，定位到皇都酒店前面：\n\n<img alt=\"Snipaste_2023-02-10_22-21-56.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/22/6112db1d-9c14-4266-ad6f-26c1ff21fbf7.jpg\" style=\"zoom: 90%;\">\n\n#### 东望洋灯塔\n\n要爬十几分钟的山，很多本地人回来运动，推荐日落时分来：\n<img alt=\"Snipaste_2023-02-10_22-24-19.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/24/551696fa-c3c7-4cdc-80a9-3181ea3eb1ed.jpg\" style=\"zoom: 50%;\">\n\n### 氹仔\n\n夜景比较出片的就是永利皇宫和伦敦人前面，如果想要乘坐永利皇宫的缆车，最好是饭点过来排队，需要等待的时间会少很多。\n\n永利皇宫：\n<img alt=\"Snipaste_2023-02-10_22-28-02.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/28/45a8b58f-3359-4af7-b222-cd001a18296b.jpg\" style=\"zoom: 70%;\">\n\n伦敦人：\n\n<img alt=\"Snipaste_2023-02-10_22-28-15.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/28/c9f05404-7eba-4dbe-84ed-23e1f7d30fb9.jpg\" style=\"zoom: 80%;\">\n\n伦敦人的正门出来后可以看到那个红色巴士，然后它的后面有一个两层楼高的观光台，可以上去拍照\n\n<img alt=\"Snipaste_2023-02-10_22-28-26.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/28/8d96c8bd-e0b9-4f61-8e6f-350a246a371b.jpg\" style=\"zoom: 80%;\">\n\n## 美食\n\n澳门美食很多，我们的策略是宁可多走点去远一点地方吃，也不排队。\n\n#### 胜利茶餐厅：\n\n很经典的澳门茶餐厅，本地人也挺多的。\n<img alt=\"Snipaste_2023-02-10_23-00-56.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/23/01/b7ac7b33-bb43-4f30-bdf9-e1f8d283c072.jpg\" style=\"zoom: 70%;\">\n\n#### 蛋挞：\n\n玛嘉烈：有点过甜了，有点腻，只收现金，只有一家开在新葡京上面。\n安德鲁：甜度挺合适的，不过确实和kfc的蛋挞有点像，氹仔有很多家，可以wx支付宝。\n两家都是11块一个，可以都尝尝。\n\n#### 盛记白粥：\n\n推荐炸肠，烧卖和萝卜糕。\n烧卖真的很绝，便宜量大，三个人当午餐和早餐吃才吃了80人民币，\n炒粉不是很好吃，甜品的糖没有搅匀。\n![39cdb633a9201e7c1d2fd4a8d353b2a.jpg](http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/02/10/23/02/c239cd08-54de-4123-8c46-ef0674dfa24e.jpg)\n\n#### 咖喱荣：\n\n咖喱牛杂，煮的很烂，咖喱味非常香，50mop一份。\n\n#### 快乐蜂：\n\n炸鸡的快乐谁懂！！很多东亚人在吃，在店里干活的也多数是东南亚人，可能需要英语点餐。炸鸡炸的外焦里嫩。\n\n#### 泽贤记：\n\n鸡蛋仔里面包裹的葡挞或者是抹茶，需要刚做出来的时候吃，凉了就一般般了。\n\n#### 金利食店：\n\n量少，味道还可以，主要是咖喱米粉。\n\n## 交通\n\n### 前往澳门\n\n从深圳出发可以考虑从蛇口港坐邮轮过去，大概1个小时可以到，澳门有两个港口，一个在澳门半岛，一个在氹仔，可以根据酒店的位置定港口，同时订往返的票会有优惠。\n\n### 内部交通\n\n#### 公交车\n\n所有公交都是6元一次，外地旅客只能使用现金（澳门币，港币或者人民币都是6元），或者在七十一买澳门通，要交30澳门币办卡费，然后是3块乘坐一次。\n上车要招收，下车要按把手上的红色按钮，不然可能车就不停了。\n\n#### 发财车\n\n从各个口岸都有前往赌场的穿梭巴士，可以免费乘坐，但是返程时新葡京的发财车必须要住宿才能够乘坐。\n\n#### 出租车\n\n挺贵的，起步19，后备箱放一件行李加3元，从交通枢纽出发或者跨岛都需要加钱。\n\n## 住宿\n\n早点定，越晚基本上越贵，如果想体验豪华酒店，选择住在氹仔，如果想吃美食，可以住在本岛。\n\n## 其他\n\n1.现金要带一些，主要是公交，出租，酒店押金和一些店子只收现金，也可以直接换港币，汇率差不多，因为赌场只能使用港币。\n\n2.澳门半岛有点类似于重庆的山地地形，穿一双舒服的鞋来旅游。\n\n3.去之前可以支付宝搜索漫游流量，我买的大概是27元3g3天的4g本地流量，速度可以。\n\n4.点外卖下载澳门的软件mfood。\n\n5.赌场要满21周岁，不过像新葡京那种查的不严格的可以混进去（亲测有概率能混）\n', 0, 0, 83, 0, '', '2023-12-25 05:06:00', '2023-12-28 14:53:00', '/artical/2023/12/25/0c6f4c65f8a94b9d87d71ae4adf46453.html', 'http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/28/45a8b58f-3359-4af7-b222-cd001a18296b.jpg', 0, '<p><img alt=\"Snipaste_2023-02-10_22-28-02.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/28/45a8b58f-3359-4af7-b222-cd001a18296b.jpg\" style=\"zoom: 70%;\"><br>简单记录一下下澳门旅游的攻略 测试能不能增加一些东西！：<br>测试 111111<br><img src=\"http://localhost:8080/uploads/image_1703682726876.jpeg\" alt=\"\">\n</p><p><img src=\"http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/02/10/21/51/c01a36db-c058-41e3-9491-cec533c73323.png\" style=\"zoom: 60%;\">\n</p><p>一些攻略准备（密密麻麻的收藏）</p>\n<h2 id=\"h2--and-\"><a name=\"景点and打卡点\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>景点and打卡点</h2><h3 id=\"h3-u6FB3u95E8u534Au5C9B\"><a name=\"澳门半岛\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>澳门半岛</h3><p>我们的本岛旅游路线：<br><img src=\"http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/02/10/21/56/d46fa521-b16c-471d-8c14-038a209e049a.png\" style=\"zoom: 50%;\"><br>基本覆盖了本岛的80%景点。\n</p><h4 id=\"h4-u604Bu7231u5DF7\"><a name=\"恋爱巷\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>恋爱巷</h4><p>在大三巴的左下方，有一条小街人比较少，也比较出片：</p>\n<p><img src=\"http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/02/10/22/15/590339df-e89f-4ce3-9a2f-346c4a317370.jpg\" style=\"zoom: 50%;\">\n</p><p><img alt=\"Snipaste_2023-02-10_22-16-27.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/16/1fe165ba-fd51-4e08-9187-9ec7b12e8c6b.jpg\" style=\"zoom:50%\">\n</p><h4 id=\"h4-u4E1Cu671Bu6D0Bu65B0u8857\"><a name=\"东望洋新街\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>东望洋新街</h4><p>国家地理的经典机位，定位到皇都酒店前面：</p>\n<p><img alt=\"Snipaste_2023-02-10_22-21-56.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/22/6112db1d-9c14-4266-ad6f-26c1ff21fbf7.jpg\" style=\"zoom: 90%;\">\n</p><h4 id=\"h4-u4E1Cu671Bu6D0Bu706Fu5854\"><a name=\"东望洋灯塔\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>东望洋灯塔</h4><p>要爬十几分钟的山，很多本地人回来运动，推荐日落时分来：<br><img alt=\"Snipaste_2023-02-10_22-24-19.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/24/551696fa-c3c7-4cdc-80a9-3181ea3eb1ed.jpg\" style=\"zoom: 50%;\">\n</p><h3 id=\"h3-u6C39u4ED4\"><a name=\"氹仔\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>氹仔</h3><p>夜景比较出片的就是永利皇宫和伦敦人前面，如果想要乘坐永利皇宫的缆车，最好是饭点过来排队，需要等待的时间会少很多。</p>\n<p>永利皇宫：<br><img alt=\"Snipaste_2023-02-10_22-28-02.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/28/45a8b58f-3359-4af7-b222-cd001a18296b.jpg\" style=\"zoom: 70%;\">\n</p><p>伦敦人：</p>\n<p><img alt=\"Snipaste_2023-02-10_22-28-15.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/28/c9f05404-7eba-4dbe-84ed-23e1f7d30fb9.jpg\" style=\"zoom: 80%;\">\n</p><p>伦敦人的正门出来后可以看到那个红色巴士，然后它的后面有一个两层楼高的观光台，可以上去拍照</p>\n<p><img alt=\"Snipaste_2023-02-10_22-28-26.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/28/8d96c8bd-e0b9-4f61-8e6f-350a246a371b.jpg\" style=\"zoom: 80%;\">\n</p><h2 id=\"h2-u7F8Eu98DF\"><a name=\"美食\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>美食</h2><p>澳门美食很多，我们的策略是宁可多走点去远一点地方吃，也不排队。</p>\n<h4 id=\"h4--\"><a name=\"胜利茶餐厅：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>胜利茶餐厅：</h4><p>很经典的澳门茶餐厅，本地人也挺多的。<br><img alt=\"Snipaste_2023-02-10_23-00-56.jpg\" src=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/23/01/b7ac7b33-bb43-4f30-bdf9-e1f8d283c072.jpg\" style=\"zoom: 70%;\">\n</p><h4 id=\"h4--\"><a name=\"蛋挞：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>蛋挞：</h4><p>玛嘉烈：有点过甜了，有点腻，只收现金，只有一家开在新葡京上面。<br>安德鲁：甜度挺合适的，不过确实和kfc的蛋挞有点像，氹仔有很多家，可以wx支付宝。<br>两家都是11块一个，可以都尝尝。\n</p><h4 id=\"h4--\"><a name=\"盛记白粥：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>盛记白粥：</h4><p>推荐炸肠，烧卖和萝卜糕。<br>烧卖真的很绝，便宜量大，三个人当午餐和早餐吃才吃了80人民币，<br>炒粉不是很好吃，甜品的糖没有搅匀。<br><img src=\"http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/02/10/23/02/c239cd08-54de-4123-8c46-ef0674dfa24e.jpg\" alt=\"39cdb633a9201e7c1d2fd4a8d353b2a.jpg\">\n</p><h4 id=\"h4--\"><a name=\"咖喱荣：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>咖喱荣：</h4><p>咖喱牛杂，煮的很烂，咖喱味非常香，50mop一份。</p>\n<h4 id=\"h4--\"><a name=\"快乐蜂：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>快乐蜂：</h4><p>炸鸡的快乐谁懂！！很多东亚人在吃，在店里干活的也多数是东南亚人，可能需要英语点餐。炸鸡炸的外焦里嫩。</p>\n<h4 id=\"h4--\"><a name=\"泽贤记：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>泽贤记：</h4><p>鸡蛋仔里面包裹的葡挞或者是抹茶，需要刚做出来的时候吃，凉了就一般般了。</p>\n<h4 id=\"h4--\"><a name=\"金利食店：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>金利食店：</h4><p>量少，味道还可以，主要是咖喱米粉。</p>\n<h2 id=\"h2-u4EA4u901A\"><a name=\"交通\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>交通</h2><h3 id=\"h3-u524Du5F80u6FB3u95E8\"><a name=\"前往澳门\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>前往澳门</h3><p>从深圳出发可以考虑从蛇口港坐邮轮过去，大概1个小时可以到，澳门有两个港口，一个在澳门半岛，一个在氹仔，可以根据酒店的位置定港口，同时订往返的票会有优惠。</p>\n<h3 id=\"h3-u5185u90E8u4EA4u901A\"><a name=\"内部交通\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>内部交通</h3><h4 id=\"h4-u516Cu4EA4u8F66\"><a name=\"公交车\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>公交车</h4><p>所有公交都是6元一次，外地旅客只能使用现金（澳门币，港币或者人民币都是6元），或者在七十一买澳门通，要交30澳门币办卡费，然后是3块乘坐一次。<br>上车要招收，下车要按把手上的红色按钮，不然可能车就不停了。\n</p><h4 id=\"h4-u53D1u8D22u8F66\"><a name=\"发财车\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>发财车</h4><p>从各个口岸都有前往赌场的穿梭巴士，可以免费乘坐，但是返程时新葡京的发财车必须要住宿才能够乘坐。</p>\n<h4 id=\"h4-u51FAu79DFu8F66\"><a name=\"出租车\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>出租车</h4><p>挺贵的，起步19，后备箱放一件行李加3元，从交通枢纽出发或者跨岛都需要加钱。</p>\n<h2 id=\"h2-u4F4Fu5BBF\"><a name=\"住宿\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>住宿</h2><p>早点定，越晚基本上越贵，如果想体验豪华酒店，选择住在氹仔，如果想吃美食，可以住在本岛。</p>\n<h2 id=\"h2-u5176u4ED6\"><a name=\"其他\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>其他</h2><p>1.现金要带一些，主要是公交，出租，酒店押金和一些店子只收现金，也可以直接换港币，汇率差不多，因为赌场只能使用港币。</p>\n<p>2.澳门半岛有点类似于重庆的山地地形，穿一双舒服的鞋来旅游。</p>\n<p>3.去之前可以支付宝搜索漫游流量，我买的大概是27元3g3天的4g本地流量，速度可以。</p>\n<p>4.点外卖下载澳门的软件mfood。</p>\n<p>5.赌场要满21周岁，不过像新葡京那种查的不严格的可以混进去（亲测有概率能混）</p>\n', '旅行', 1);
INSERT INTO `blog` VALUES ('21103da7414e4479804c735894c1ed9d', '[开发记录]c++时钟', '<p>简单记录一下c++常用的时间函数</p>\n', '简单记录一下c++常用的时间函数\n', '![P1023264.jpg](http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/10/08/20/25/809fbff0-424e-432a-91d4-a4e2936080b6.jpg)\n\n### 时间工具chrono库\n\n**chrono定义了三种主要类型以及常用工具：**\n\n* **时钟**\n* **时长**\n* **时间点**\n\n**时钟(Clock)** 要求：\n\n**平凡时钟(TrivialClock)** 要求：\n\n**满足**时钟要求\n\n\n#### 时钟\n\n**时钟由起点（或纪元）及计次频率(1分钟，1秒或者1毫秒)组成。**\n\n##### system_clock\n\n**std::chrono::system_clock 表示系统范围的实时壁钟。其不一定单调，系统时间可以被调节，它是唯一有能力映射到c风格时间(ctime.h)的C++时钟，满足平凡时钟要求**\n\n***纪元***：从协调世界时 (UTC) 1970 年 1 月 1 日星期四 00:00:00 开始的时间，不计闰秒\n\n\n**成员函数：**\n\n `std::chrono::system_clock::now()`\n\n\n', 0, 0, 5, 0, '', '2023-12-25 05:03:00', '2023-12-28 14:48:00', '/artical/2023/12/25/21103da7414e4479804c735894c1ed9d.html', 'http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/10/08/20/25/809fbff0-424e-432a-91d4-a4e2936080b6.jpg', 0, '<p><img src=\"http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/10/08/20/25/809fbff0-424e-432a-91d4-a4e2936080b6.jpg\" alt=\"P1023264.jpg\">\n</p><h3 id=\"h3--chrono-\"><a name=\"时间工具chrono库\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>时间工具chrono库</h3><p><strong>chrono定义了三种主要类型以及常用工具：</strong></p>\n<ul>\n<li><strong>时钟</strong></li><li><strong>时长</strong></li><li><strong>时间点</strong></li></ul>\n<p><strong>时钟(Clock)</strong> 要求：</p>\n<p><strong>平凡时钟(TrivialClock)</strong> 要求：</p>\n<p><strong>满足</strong>时钟要求</p>\n<h4 id=\"h4-u65F6u949F\"><a name=\"时钟\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>时钟</h4><p><strong>时钟由起点（或纪元）及计次频率(1分钟，1秒或者1毫秒)组成。</strong></p>\n<h5 id=\"h5-system_clock\"><a name=\"system_clock\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>system_clock</h5><p><strong>std::chrono::system_clock 表示系统范围的实时壁钟。其不一定单调，系统时间可以被调节，它是唯一有能力映射到c风格时间(ctime.h)的C++时钟，满足平凡时钟要求</strong></p>\n<p><strong><em>纪元</em></strong>：从协调世界时 (UTC) 1970 年 1 月 1 日星期四 00:00:00 开始的时间，不计闰秒</p>\n<p><strong>成员函数：</strong></p>\n<p> <code>std::chrono::system_clock::now()</code></p>\n', 'c++,日期', 1);
INSERT INTO `blog` VALUES ('9532327fd6cb4d809cd633c4f524551d', 'linux nohup命令', '<p>nohup 命令使用</p>\n', 'nohup 命令使用\n', '![](http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/12/19/21/23/e31ffce8-4059-43f6-9cc6-b0809f434e67.jpg)\n\n# linux nohup命令\n\n**在深度学习中，经常会遇到需要远程训练的情况，如果使用普通的终端命令进行训练，一旦终端断开，训练的进程也会被终止，所以我们需要使用**`nohup`命令将进程与终端不绑定在一起\n\n**nohup** 英文全称 no hang up（不挂起）\n\n```\nnohup Command [ Arg … ] [　&amp; ]\n```\n\n**参数说明**：\n\n**Command**：要执行的命令。\n\n**Arg**：一些参数，可以指定输出文件。\n\n**&amp;**：让命令在后台执行，终端退出后命令仍旧执行。\n\n`nohup` 指令只是让运行命令与终端无关，&amp;才是实现后台运行的指令\n\n### 常用示例\n\n```\nnohup /root/runoob.sh &gt; runoob.log 2&gt;&amp;1 &amp;\n```\n\n**2&gt;&amp;1** 解释：\n\n**将标准错误 2 重定向到标准输出 &amp;1 ，标准输出 &amp;1 再被重定向输入到 runoob.log 文件中。**\n\n* **0 – stdin (standard input，标准输入)**\n* **1 – stdout (standard output，标准输出)**\n* **2 – stderr (standard error，标准错误输出)**\n\n### 如何关闭后台的程序\n\n**需要使用查找进程的指令先找到进程的PID**\n\n```\nps -aux | grep 进程关键字\nex:\nps -aux | grep \"runoob.sh\" \n​\n# kill进程\nkill -9  进程号PID\n```\n\n### 和python配合使用\n\n**python输出的时候会有一个缓冲，因此无法实时将输出存储到log文件中，因此需要在python运行命令中添加**`-u`参数，例如：\n\n```\nnohup python -u train.py &gt; train.py 2&gt;&amp;1 &amp;\n```\n\n1111\n', 0, 0, 3, 0, '', '2023-12-25 05:02:00', '2023-12-28 14:48:00', '/artical/2023/12/25/9532327fd6cb4d809cd633c4f524551d.html', 'http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/12/19/21/23/e31ffce8-4059-43f6-9cc6-b0809f434e67.jpg', 0, '<p><img src=\"http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/12/19/21/23/e31ffce8-4059-43f6-9cc6-b0809f434e67.jpg\" alt=\"\">\n</p><h1 id=\"h1-linux-nohup-\"><a name=\"linux nohup命令\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>linux nohup命令</h1><p><strong>在深度学习中，经常会遇到需要远程训练的情况，如果使用普通的终端命令进行训练，一旦终端断开，训练的进程也会被终止，所以我们需要使用</strong><code>nohup</code>命令将进程与终端不绑定在一起</p>\n<p><strong>nohup</strong> 英文全称 no hang up（不挂起）</p>\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pln\">nohup </span><span class=\"typ\">Command</span><span class=\"pln\"> </span><span class=\"pun\">[</span><span class=\"pln\"> </span><span class=\"typ\">Arg</span><span class=\"pln\"> </span><span class=\"pun\">…</span><span class=\"pln\"> </span><span class=\"pun\">]</span><span class=\"pln\"> </span><span class=\"pun\">[　&amp;</span><span class=\"pln\">amp</span><span class=\"pun\">;</span><span class=\"pln\"> </span><span class=\"pun\">]</span></code></li></ol></pre><p><strong>参数说明</strong>：</p>\n<p><strong>Command</strong>：要执行的命令。</p>\n<p><strong>Arg</strong>：一些参数，可以指定输出文件。</p>\n<p><strong>&amp;</strong>：让命令在后台执行，终端退出后命令仍旧执行。</p>\n<p><code>nohup</code> 指令只是让运行命令与终端无关，&amp;才是实现后台运行的指令</p>\n<h3 id=\"h3-u5E38u7528u793Au4F8B\"><a name=\"常用示例\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>常用示例</h3><pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pln\">nohup </span><span class=\"pun\">/</span><span class=\"pln\">root</span><span class=\"pun\">/</span><span class=\"pln\">runoob</span><span class=\"pun\">.</span><span class=\"pln\">sh </span><span class=\"pun\">&amp;</span><span class=\"pln\">gt</span><span class=\"pun\">;</span><span class=\"pln\"> runoob</span><span class=\"pun\">.</span><span class=\"pln\">log </span><span class=\"lit\">2</span><span class=\"pun\">&amp;</span><span class=\"pln\">gt</span><span class=\"pun\">;&amp;</span><span class=\"pln\">amp</span><span class=\"pun\">;</span><span class=\"lit\">1</span><span class=\"pln\"> </span><span class=\"pun\">&amp;</span><span class=\"pln\">amp</span><span class=\"pun\">;</span></code></li></ol></pre><p><strong>2&gt;&amp;1</strong> 解释：</p>\n<p><strong>将标准错误 2 重定向到标准输出 &amp;1 ，标准输出 &amp;1 再被重定向输入到 runoob.log 文件中。</strong></p>\n<ul>\n<li><strong>0 – stdin (standard input，标准输入)</strong></li><li><strong>1 – stdout (standard output，标准输出)</strong></li><li><strong>2 – stderr (standard error，标准错误输出)</strong></li></ul>\n<h3 id=\"h3-u5982u4F55u5173u95EDu540Eu53F0u7684u7A0Bu5E8F\"><a name=\"如何关闭后台的程序\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>如何关闭后台的程序</h3><p><strong>需要使用查找进程的指令先找到进程的PID</strong></p>\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pln\">ps </span><span class=\"pun\">-</span><span class=\"pln\">aux </span><span class=\"pun\">|</span><span class=\"pln\"> grep </span><span class=\"pun\">进程关键字</span></code></li><li class=\"L1\"><code><span class=\"pln\">ex</span><span class=\"pun\">:</span></code></li><li class=\"L2\"><code><span class=\"pln\">ps </span><span class=\"pun\">-</span><span class=\"pln\">aux </span><span class=\"pun\">|</span><span class=\"pln\"> grep </span><span class=\"str\">\"runoob.sh\"</span><span class=\"pln\"> </span></code></li><li class=\"L3\"><code><span class=\"pun\">​</span></code></li><li class=\"L4\"><code><span class=\"com\"># kill进程</span></code></li><li class=\"L5\"><code><span class=\"pln\">kill </span><span class=\"pun\">-</span><span class=\"lit\">9</span><span class=\"pln\">  </span><span class=\"pun\">进程号</span><span class=\"pln\">PID</span></code></li></ol></pre><h3 id=\"h3--python-\"><a name=\"和python配合使用\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>和python配合使用</h3><p><strong>python输出的时候会有一个缓冲，因此无法实时将输出存储到log文件中，因此需要在python运行命令中添加</strong><code>-u</code>参数，例如：</p>\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pln\">nohup python </span><span class=\"pun\">-</span><span class=\"pln\">u train</span><span class=\"pun\">.</span><span class=\"pln\">py </span><span class=\"pun\">&amp;</span><span class=\"pln\">gt</span><span class=\"pun\">;</span><span class=\"pln\"> train</span><span class=\"pun\">.</span><span class=\"pln\">py </span><span class=\"lit\">2</span><span class=\"pun\">&amp;</span><span class=\"pln\">gt</span><span class=\"pun\">;&amp;</span><span class=\"pln\">amp</span><span class=\"pun\">;</span><span class=\"lit\">1</span><span class=\"pln\"> </span><span class=\"pun\">&amp;</span><span class=\"pln\">amp</span><span class=\"pun\">;</span></code></li></ol></pre><p>1111</p>\n', 'linux,nohup', 1);

-- ----------------------------
-- Table structure for blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags`  (
  `tagID` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `blogID` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`tagID`, `blogID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tags
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cdate` datetime NULL DEFAULT NULL,
  `typeID` int NULL DEFAULT 1,
  `keywords` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  `blogNum` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('0deaf97437264ce69eac4f70cf8cb8f1', 'CCF', '2017-02-13 23:32:29', 6, '', 8);
INSERT INTO `category` VALUES ('178ebabf0fa54c73b5a42264455c1c1d', 'Layui', '2017-02-07 12:00:00', 1, '', 0);
INSERT INTO `category` VALUES ('17966703da9a4f9c8f5726e07a44b4c5', '求职', '2017-03-10 19:29:37', 3, '', 1);
INSERT INTO `category` VALUES ('18f3adde58d0497393f35e653b95aff8', 'Web开发', '2017-02-15 14:33:29', 1, '', 2);
INSERT INTO `category` VALUES ('2c4a47850cff4955b9a1c6b09b17ea2f', 'LeetCode', '2017-02-14 17:03:41', 6, '', 0);
INSERT INTO `category` VALUES ('330f029b812441db9bffa936f702071f', 'MySQL', '2017-02-07 12:00:00', 1, '', 2);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cdate` datetime NOT NULL,
  `blogId` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '是否合法，0未通过，1通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('20ab85cc32d74de2977b1145711bfb34', '1231', '21312', '2023-12-28 16:55:33', '0c6f4c65f8a94b9d87d71ae4adf46453', 0);
INSERT INTO `comment` VALUES ('f1c5cd054d61415780ff911d5e0464ee', '再试试', '1231231', '2023-12-28 16:49:58', '0c6f4c65f8a94b9d87d71ae4adf46453', 0);
INSERT INTO `comment` VALUES ('f40d5033fd564df1b34761213664fb03', '12312312', '312312312312', '2023-12-28 16:53:06', '0c6f4c65f8a94b9d87d71ae4adf46453', 0);
INSERT INTO `comment` VALUES ('fa10a777f0f5401983fc706bde7aa107', '1231', '312312', '2023-12-28 16:54:37', '0c6f4c65f8a94b9d87d71ae4adf46453', 0);
INSERT INTO `comment` VALUES ('fc0c0b15a9ab4329a5bb6081660d2a7d', '123123', '1231231231', '2023-12-28 16:53:04', '0c6f4c65f8a94b9d87d71ae4adf46453', 0);

-- ----------------------------
-- Table structure for lunbo
-- ----------------------------
DROP TABLE IF EXISTS `lunbo`;
CREATE TABLE `lunbo`  (
  `id` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `coverImg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `blogId` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blogId`(`blogId` ASC) USING BTREE,
  CONSTRAINT `lunbo_ibfk_1` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lunbo
-- ----------------------------
INSERT INTO `lunbo` VALUES ('135913ce4178456c842d469b6cd3a934', 'http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/12/19/21/23/e31ffce8-4059-43f6-9cc6-b0809f434e67.jpg', '/artical/2023/12/25/9532327fd6cb4d809cd633c4f524551d.html', '9532327fd6cb4d809cd633c4f524551d');
INSERT INTO `lunbo` VALUES ('4cbbee48408b422fa48287c8353c9dc2', 'http://120.133.136.23:8888//uploadImages/120/133/136/23/2023/10/08/20/25/809fbff0-424e-432a-91d4-a4e2936080b6.jpg', '/artical/2023/12/25/21103da7414e4479804c735894c1ed9d.html', '21103da7414e4479804c735894c1ed9d');
INSERT INTO `lunbo` VALUES ('d46cafb3071246afbd3aa0c098a5fdce', 'http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/22/28/45a8b58f-3359-4af7-b222-cd001a18296b.jpg', '/artical/2023/12/25/0c6f4c65f8a94b9d87d71ae4adf46453.html', '0c6f4c65f8a94b9d87d71ae4adf46453');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0,不可见，1可见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '欢迎来到小辰的博客', '2017-03-10 00:00:00', '2017-12-31 00:00:00', 1);

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cdate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for timeline
-- ----------------------------
DROP TABLE IF EXISTS `timeline`;
CREATE TABLE `timeline`  (
  `id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键',
  `createdDate` datetime NOT NULL COMMENT '创建时间',
  `displayName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '显示名称',
  `displayDate` datetime NULL DEFAULT NULL COMMENT '显示日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of timeline
-- ----------------------------

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cdate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '技术', '2017-02-13 15:41:25');
INSERT INTO `type` VALUES (2, '随笔', '2016-11-05 23:22:50');
INSERT INTO `type` VALUES (3, '杂谈', '2017-02-12 21:44:42');
INSERT INTO `type` VALUES (6, '算法', '2017-02-13 23:31:59');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nickname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '游客',
  `headurl` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 738 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (737, 'admin', '123', 'hunter', 'n');

-- ----------------------------
-- Table structure for youlian
-- ----------------------------
DROP TABLE IF EXISTS `youlian`;
CREATE TABLE `youlian`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `logo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cdate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youlian
-- ----------------------------
INSERT INTO `youlian` VALUES (3, '我的GitHub', NULL, 'https://github.com/hujianhong', '2017-02-05 19:57:53');
INSERT INTO `youlian` VALUES (4, '我的旅行', NULL, 'http://travel.huding.name', '2017-02-10 19:08:30');
INSERT INTO `youlian` VALUES (5, '我的码云', NULL, 'https://git.oschina.net/hujianhong', '2017-02-25 10:20:16');
INSERT INTO `youlian` VALUES (6, '51微投票', NULL, 'http://www.omlzz.com/', '2017-02-05 19:42:50');
INSERT INTO `youlian` VALUES (11, 'layui前端框架', NULL, 'http://www.layui.com', '2017-02-10 23:15:31');
INSERT INTO `youlian` VALUES (13, 'MonkeyBlog', NULL, 'http://www.houchaowei.com', '2017-03-09 09:29:47');
INSERT INTO `youlian` VALUES (14, 'Laychat即时通讯系统', NULL, 'http://lay.laychat.cn', '2017-04-14 14:03:42');
INSERT INTO `youlian` VALUES (15, 'ChenJY\'sBlog', NULL, 'http://chenjiayang.me/', '2017-08-30 09:32:15');

-- ----------------------------
-- View structure for blog_back_display
-- ----------------------------
DROP VIEW IF EXISTS `blog_back_display`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `blog_back_display` AS select `category`.`name` AS `categoryName`,`blog`.`id` AS `id`,`blog`.`title` AS `title`,`blog`.`author` AS `author`,`blog`.`commentNum` AS `commentNum`,`blog`.`readNum` AS `readNum`,`blog`.`url` AS `url`,`blog`.`publishTime` AS `publishTime`,`blog`.`type` AS `type`,`blog`.`status` AS `status`,`blog`.`statusName` AS `statusName`,`blog`.`heartNum` AS `heartNum` from (`category` join `blog`) where (`category`.`id` = `blog`.`categoryID`);

-- ----------------------------
-- View structure for blog_display
-- ----------------------------
DROP VIEW IF EXISTS `blog_display`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `blog_display` AS select `category`.`name` AS `categoryName`,`blog`.`id` AS `id`,`blog`.`title` AS `title`,`blog`.`author` AS `author`,`blog`.`summary` AS `summary`,`blog`.`commentNum` AS `commentNum`,`blog`.`readNum` AS `readNum`,`blog`.`url` AS `url`,`blog`.`publishTime` AS `publishTime`,`blog`.`type` AS `type`,`blog`.`status` AS `status`,`blog`.`coverURL` AS `coverURL`,`blog`.`heartNum` AS `heartNum`,`blog`.`tags` AS `tags`,`type`.`name` AS `typeName`,`type`.`id` AS `typeID`,`category`.`id` AS `categoryID`,`blog`.`content` AS `content` from ((`category` join `blog`) join `type`) where ((`category`.`id` = `blog`.`categoryID`) and (`category`.`typeID` = `type`.`id`));

-- ----------------------------
-- View structure for blog_display_by_tag
-- ----------------------------
DROP VIEW IF EXISTS `blog_display_by_tag`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `blog_display_by_tag` AS select `category`.`name` AS `categoryName`,`blog`.`id` AS `id`,`blog`.`title` AS `title`,`blog`.`author` AS `author`,`blog`.`summary` AS `summary`,`blog`.`commentNum` AS `commentNum`,`blog`.`readNum` AS `readNum`,`blog`.`url` AS `url`,`blog`.`publishTime` AS `publishTime`,`blog`.`type` AS `type`,`blog`.`status` AS `status`,`blog`.`coverURL` AS `coverURL`,`blog`.`heartNum` AS `heartNum`,`blog`.`tags` AS `tags`,`type`.`name` AS `typeName`,`type`.`id` AS `typeID`,`category`.`id` AS `categoryID`,`tags`.`id` AS `tagID`,`tags`.`name` AS `tagName` from ((((`category` join `blog`) join `type`) join `blog_tags`) join `tags`) where ((`category`.`id` = `blog`.`categoryID`) and (`category`.`typeID` = `type`.`id`) and (`blog_tags`.`blogID` = `blog`.`id`) and (`blog_tags`.`tagID` = `tags`.`id`));

SET FOREIGN_KEY_CHECKS = 1;
