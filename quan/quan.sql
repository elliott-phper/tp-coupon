-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 05 月 14 日 16:25
-- 服务器版本: 5.1.28
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `quan`
--

-- --------------------------------------------------------

--
-- 表的结构 `dbs_ad`
--

CREATE TABLE IF NOT EXISTS `dbs_ad` (
  `ad_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_code` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ad_id`),
  KEY `position_id` (`position_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `dbs_ad`
--

INSERT INTO `dbs_ad` (`ad_id`, `position_id`, `media_type`, `ad_name`, `ad_link`, `ad_code`, `start_time`, `end_time`, `click_count`, `enabled`) VALUES
(6, 3, 101, '最新优惠券列表页', 'http://www.quan.com', '201205/a232fb8f6987c1c4d1a6cf9f1c542ab5.jpg', 1335911040, 1338416640, 2, 1),
(7, 3, 102, '最新优惠券列表页淘宝Flash广告', '', '201205/0b9ad42b985425d74808814e33d4c541.swf', 1335916740, 1338422340, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_admin_role`
--

CREATE TABLE IF NOT EXISTS `dbs_admin_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `dbs_admin_role`
--

INSERT INTO `dbs_admin_role` (`role_id`, `role_name`) VALUES
(1, '网购优惠券管理员'),
(3, '线下优惠券管理员');

-- --------------------------------------------------------

--
-- 表的结构 `dbs_admin_users`
--

CREATE TABLE IF NOT EXISTS `dbs_admin_users` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(40) CHARACTER SET ucs2 NOT NULL,
  `password` char(32) NOT NULL,
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `msn` varchar(60) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `tel_phone` varchar(20) NOT NULL,
  `mobile_phone` varchar(20) NOT NULL,
  `addr` varchar(100) NOT NULL COMMENT '地址',
  `company` varchar(100) NOT NULL COMMENT '公司名称',
  `company_website` varchar(100) NOT NULL COMMENT '公司网站',
  `is_locked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '封锁',
  `is_super` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '超级管理员',
  PRIMARY KEY (`user_id`),
  KEY `email` (`email`),
  KEY `is_super` (`is_super`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `dbs_admin_users`
--

INSERT INTO `dbs_admin_users` (`user_id`, `email`, `user_name`, `name`, `password`, `last_login`, `last_ip`, `msn`, `qq`, `tel_phone`, `mobile_phone`, `addr`, `company`, `company_website`, `is_locked`, `is_super`) VALUES
(1, 'webmaster@ijiaqu.com', 'holobo', '肖安球', 'ba5a08cdf87443e912f5ec318f872989', 1336938710, '113.64.78.24', '', '', '020-22824212', '13416195878', '广州市天河区科新路8号', '嫁娶网', 'http://www.ijiaqu.com', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_admin_user_role`
--

CREATE TABLE IF NOT EXISTS `dbs_admin_user_role` (
  `userid` mediumint(8) unsigned NOT NULL,
  `roleid` smallint(5) unsigned NOT NULL,
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dbs_admin_user_role_priv`
--

CREATE TABLE IF NOT EXISTS `dbs_admin_user_role_priv` (
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` char(15) NOT NULL,
  `value` char(30) NOT NULL,
  `priv` char(50) NOT NULL,
  PRIMARY KEY (`roleid`,`field`,`value`,`priv`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dbs_admin_user_role_priv`
--

INSERT INTO `dbs_admin_user_role_priv` (`roleid`, `field`, `value`, `priv`) VALUES
(1, 'module', 'CouponCode', 'add'),
(1, 'module', 'CouponCode', 'best'),
(1, 'module', 'CouponCode', 'index'),
(1, 'module', 'CouponCode', 'is_active'),
(1, 'module', 'CouponCodeCategory', 'coupon_code_category_show_index'),
(1, 'module', 'CouponCodeCategory', 'index'),
(1, 'module', 'CouponCodeCategory', 'sort_order'),
(1, 'module', 'CouponCodeMall', 'coupon_mall_rec_sort_order'),
(1, 'module', 'CouponCodeMall', 'index'),
(1, 'module', 'CouponCodeMall', 'recs'),
(1, 'module', 'Member', 'index'),
(1, 'module', 'Member', 'User_is_locked');

-- --------------------------------------------------------

--
-- 表的结构 `dbs_ad_position`
--

CREATE TABLE IF NOT EXISTS `dbs_ad_position` (
  `position_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(60) NOT NULL DEFAULT '',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_desc` varchar(255) NOT NULL DEFAULT '',
  `position_style` text NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `dbs_ad_position`
--

INSERT INTO `dbs_ad_position` (`position_id`, `position_name`, `ad_width`, `ad_height`, `position_desc`, `position_style`) VALUES
(2, '首页通栏广告960*60', 990, 60, '', '&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n{foreach from=$ads item=ad}\r\n&lt;tr&gt;&lt;td&gt;{$ad}&lt;/td&gt;&lt;/tr&gt;\r\n{/foreach}\r\n&lt;/table&gt;'),
(3, '列表页右边第一块图片广告', 300, 250, '', '&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n{foreach from=$ads item=ad}\r\n&lt;tr&gt;&lt;td&gt;{$ad}&lt;/td&gt;&lt;/tr&gt;\r\n{/foreach}\r\n&lt;/table&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `dbs_article`
--

CREATE TABLE IF NOT EXISTS `dbs_article` (
  `article_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL COMMENT '文章别名',
  `content` text NOT NULL,
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `dbs_article`
--

INSERT INTO `dbs_article` (`article_id`, `cate_id`, `title`, `alias`, `content`, `addtime`) VALUES
(3, 3, '关于我们', 'about', '青番茄([url=http://www.qfanqie.com]www.qfanqie.com[/url])是一家以第三方身份向网络消费用户提供优惠券，优惠活动，打折促销以及免费试用等购物优惠省钱的信息平台。\r\n[b]青番茄[/b]凭借广阔的网络资源以及厚力的合作伙伴，并将行业覆盖至服装、电器、图书、化妆品、奢侈品、医疗教育等各行各业，涉足全国各大中小城市，随找各种消费形势的衍变，以及人们消费观念的改变，青番茄已经获得了成千上万资深人士的一致好评。\r\n平台原则：以消费者为核心，以商家为桥梁，建立三点一线的互动互助发展交流。\r\n\r\n[b]我们的优势\r\n\r\n我们拥有一套完整的规则制度\r\n青番茄[/b]拥有一套完善的商家促销以及消费者省钱购物的理念和经验，在青番茄，商家可以尽情促销，消费者可以自由筛选，青番茄会对所有信息进行核实把关，环环相扣，制度统一，执行统一！\r\n\r\n[b]我们拥有一支强大的技术团队[/b]\r\n通过强有力的技术手段，青番茄一方面不断完善用户体验，快速解决用户在网站使用过程中遇见的各种问题；另一方面，通过严格有效的审控机制，防止优惠券的恶意上传和下载，以保证电子优惠券散布的正确性、有效性和精准性。\r\n\r\n[b]我们拥有一支专业的营销队伍[/b]\r\n通过制定专业的市场营销策略，[b]青番茄[/b]适时推出了一系列有效的推广活动和商务洽谈活动。目前我们已经和麦包包、走秀网、乐淘、聚尚等知名的电子商务网站以及各行各业等网上购物商城，希望通过信息整合，将商家、消费者和青番茄三者结成不可分割的整体。', 1328565783),
(9, 3, '联系我们', 'contact', '[b]商务合作、产品建议[/b]\r\n如果您有广告投放、商务合作、产品建议，请 Email:business#qfanqie.com并简要介绍合作意向\r\n\r\n[b]在线服务[/b]\r\n如您在网站操作中遇到困难，请 直接通过网站意见建议 直接留言给我们\r\n[b]\r\n\r\n联系我们[/b]\r\n青番茄网\r\n地址：中国.广东.广州市天河区科新路8号\r\n\r\n邮编：510660\r\n电话：020-22824212', 1335463789),
(10, 5, '如何充值', 'pay', '[b]1.[/b]首先使用帐号登陆青番茄网\r\n                        \r\n[b]2.[/b]到青番茄的“账号充值”页面输入您要充值的金额， 然后点击“使用支付宝充值”去支付宝充值                        \r\n                        [img]http://www.quanmama.com/images/alipay-chongzhi.jpg[/img]                        \r\n [b]3.[/b]充值成功后，即可去您要买的券的页面购买优惠券', 1335463924);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_article_category`
--

CREATE TABLE IF NOT EXISTS `dbs_article_category` (
  `cate_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `dbs_article_category`
--

INSERT INTO `dbs_article_category` (`cate_id`, `cate_name`, `sort_order`) VALUES
(3, '关于我们', 1),
(4, '使用条款', 2),
(5, '帮助', 3);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_city`
--

CREATE TABLE IF NOT EXISTS `dbs_city` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '等级',
  `parent_id` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `code` varchar(30) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `admin_uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '站长ID',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `admin_uid` (`admin_uid`),
  KEY `level` (`level`,`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `dbs_city`
--

INSERT INTO `dbs_city` (`id`, `level`, `parent_id`, `code`, `name`, `admin_uid`, `sort_order`) VALUES
(1, 1, 0, 'gz', '广州', 2, 1),
(2, 1, 0, 'sz', '深圳', 3, 1),
(3, 1, 0, 'bj', '北京', 4, 1),
(7, 1, 0, 'sh', '上海', 6, 1),
(10, 2, 1, 'tianhe', '天河区', 0, 1),
(11, 2, 1, 'yuexiu', '越秀区', 0, 2),
(12, 2, 1, 'liwan', '荔湾区', 0, 3),
(13, 2, 2, 'luohu', '罗湖区', 0, 1),
(14, 2, 2, 'futian', '福田区', 0, 2),
(16, 2, 2, 'nanshan', '南山区', 0, 3),
(17, 2, 2, 'yantian', '盐田区', 0, 4),
(18, 2, 2, 'baoan', '宝安区', 0, 5),
(19, 2, 2, 'longgang', '龙岗区', 0, 6),
(20, 2, 7, 'huangpu', '黄浦区', 0, 1),
(21, 2, 7, 'xuhui', '徐汇区', 0, 2),
(22, 2, 7, 'changning', '长宁区', 0, 3),
(23, 2, 7, 'jingan', '静安区', 0, 4),
(24, 2, 7, 'putuo', '普陀区', 0, 5),
(25, 2, 7, 'zhabei', '闸北区', 0, 6),
(26, 2, 7, 'hongkou', '虹口区', 0, 7),
(27, 2, 7, 'yangpu', '杨浦区', 0, 8),
(28, 2, 7, 'minxing', '闵行区', 0, 9),
(29, 2, 7, 'baoshan', '宝山区', 0, 10),
(30, 2, 7, 'jiading', '嘉定区', 0, 11),
(31, 2, 7, 'pudong', '浦东新区', 0, 12),
(32, 2, 7, 'jinshan', '金山区', 0, 13),
(33, 2, 7, 'songjiang', '松江区', 0, 14),
(34, 2, 7, 'qingpu', '青浦区', 0, 15),
(35, 2, 7, 'fengxian', '奉贤区', 0, 16),
(36, 2, 7, 'chongming', '崇明县', 0, 17),
(40, 2, 1, 'haizhu', '海珠区', 0, 4),
(41, 2, 1, 'panyu', '番禺区', 0, 5),
(42, 2, 1, 'baiyun', '白云区', 0, 6),
(43, 2, 1, 'huangpu', '黄埔区', 0, 7),
(44, 2, 1, 'huadu', '花都区', 0, 8),
(45, 2, 1, 'nansha', '南沙区', 0, 9),
(46, 2, 1, 'luogang', '萝岗区', 0, 10),
(47, 2, 1, 'zengcheng', '增城市', 0, 11),
(48, 2, 1, 'conghua', '从化市', 0, 12),
(49, 2, 3, 'dongcheng', '东城区', 0, 1),
(50, 2, 3, 'xicheng', '西城区', 0, 2),
(51, 2, 3, 'chaoyang', '朝阳区', 0, 3),
(52, 2, 3, 'fengtai', '丰台区', 0, 4),
(53, 2, 3, 'shijingshan', '石景山区', 0, 5),
(54, 2, 3, 'haidian', '海淀区', 0, 6),
(55, 2, 3, 'mentougou', '门头沟区', 0, 7),
(56, 2, 3, 'fangshan', '房山区', 0, 8),
(57, 2, 3, 'tongzhou', '通州区', 0, 9),
(58, 2, 3, 'shunyi', '顺义区', 0, 10),
(59, 2, 3, 'changping', '昌平区', 0, 11),
(60, 2, 3, 'daxing', '大兴区', 0, 12),
(61, 2, 3, 'huairou', '怀柔区', 0, 13),
(62, 2, 3, 'pinggu', '平谷区', 0, 14),
(63, 2, 3, 'miyun', '密云县', 0, 15),
(64, 2, 3, 'yanqing', '延庆县', 0, 16);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_consume_records`
--

CREATE TABLE IF NOT EXISTS `dbs_consume_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` enum('spend','increase') NOT NULL,
  `money_type` enum('money','credit') NOT NULL,
  `amount` float unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `dbs_consume_records`
--

INSERT INTO `dbs_consume_records` (`id`, `user_id`, `type`, `money_type`, `amount`, `addtime`) VALUES
(1, 5, 'increase', 'credit', 1, 1335748190),
(2, 5, 'increase', 'credit', 2, 1335748251),
(3, 5, 'spend', 'credit', 1, 1335750031),
(4, 7, 'increase', 'credit', 100, 1335772050),
(5, 7, 'spend', 'credit', 1, 1335772079),
(6, 518, 'increase', 'money', 0, 1336009531),
(7, 518, 'increase', 'money', 0, 1336024853),
(8, 518, 'increase', 'money', 0.01, 1336025286),
(9, 518, 'increase', 'money', 0.01, 1336025412),
(10, 518, 'increase', 'money', 0.01, 1336094599),
(11, 665, 'increase', 'credit', 5, 1336678506),
(12, 665, 'spend', 'credit', 1, 1336678519),
(13, 665, 'increase', 'credit', 5, 1336678523),
(14, 665, 'increase', 'credit', 5, 1336679925),
(15, 665, 'increase', 'credit', 5, 1336680000),
(16, 674, 'increase', 'money', 0.01, 1336690115),
(17, 5, 'increase', 'money', 0.01, 1336892025),
(18, 5, 'increase', 'money', 0.01, 1336895202);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_coupon_code`
--

CREATE TABLE IF NOT EXISTS `dbs_coupon_code` (
  `c_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `m_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商家ID',
  `m_name` varchar(255) NOT NULL COMMENT '商家名称',
  `c_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `money_max` float unsigned NOT NULL DEFAULT '0',
  `money_reduce` float unsigned NOT NULL DEFAULT '0',
  `money_amount` float unsigned NOT NULL DEFAULT '0',
  `expiry_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `price_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `price` float unsigned NOT NULL DEFAULT '0',
  `amount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fetched_amount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '9999',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`),
  KEY `m_id` (`m_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `dbs_coupon_code`
--

INSERT INTO `dbs_coupon_code` (`c_id`, `title`, `m_id`, `m_name`, `c_type`, `money_max`, `money_reduce`, `money_amount`, `expiry_type`, `expiry`, `price_type`, `price`, `amount`, `fetched_amount`, `sort_order`, `is_active`, `addtime`) VALUES
(1, '', 2, '易迅', 1, 300, 20, 0, 1, 1338451199, 1, 10, 4, 4, 9999, 1, 1335283200),
(2, '', 2, '易迅', 1, 50, 5, 0, 1, 1343635199, 3, 1, 5, 1, 9999, 1, 1335377998),
(3, '满300元减100元', 6, 'TasteV品味汇', 1, 300, 100, 0, 1, 1339228799, 1, 0, 2, 2, 9999, 1, 1336808645),
(5, '', 7, '博洋家纺', 2, 0, 0, 5, 1, 1338451199, 1, 0, 2, 2, 9999, 1, 1336809763);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_coupon_code_best`
--

CREATE TABLE IF NOT EXISTS `dbs_coupon_code_best` (
  `c_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `sort_order` (`sort_order`),
  KEY `c_id` (`c_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dbs_coupon_code_best`
--

INSERT INTO `dbs_coupon_code_best` (`c_id`, `expiry`, `sort_order`) VALUES
(1, 1337068799, 10000);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_coupon_code_category`
--

CREATE TABLE IF NOT EXISTS `dbs_coupon_code_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `show_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_dept_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `dbs_coupon_code_category`
--

INSERT INTO `dbs_coupon_code_category` (`id`, `name`, `sort_order`, `parent_id`, `show_index`) VALUES
(1, '综合商城', 1, 0, 1),
(2, '服装服饰', 2, 0, 0),
(3, '箱包鞋帽', 3, 0, 0),
(4, '时尚名品', 4, 0, 0),
(5, '女装', 1, 2, 0),
(6, '男装', 2, 2, 0),
(8, '化妆品、个人护理', 5, 0, 0),
(9, '食品酒茶', 6, 0, 1),
(10, '日用百货', 7, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_coupon_code_codes`
--

CREATE TABLE IF NOT EXISTS `dbs_coupon_code_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `code` varchar(30) NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nick` varchar(50) NOT NULL,
  `fetch_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `c_id` (`c_id`,`user_id`),
  KEY `fetch_time` (`fetch_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `dbs_coupon_code_codes`
--

INSERT INTO `dbs_coupon_code_codes` (`id`, `c_id`, `code`, `user_id`, `nick`, `fetch_time`) VALUES
(1, 1, 'JD2012041201', 667, '321321', 1336679078),
(2, 1, 'JD2012041202', 668, 'han365', 1336679948),
(3, 1, 'JD2012041203', 673, '黄伟斌-datou88', 1336689638),
(4, 1, 'JD2012041204', 684, 'Sure', 1336710063),
(5, 2, 'AASS52652SS', 665, 'hao1234', 1336678519),
(6, 2, 'ASSD4454444', 0, '', 0),
(7, 2, 'ASS444SSS44', 0, '', 0),
(8, 2, 'SS44411SS44', 0, '', 0),
(9, 2, 'ASS7854S566', 0, '', 0),
(10, 3, '1082640049', 714, '淘最爱', 1336821896),
(11, 3, '1082656381', 741, 'seyou', 1336930230),
(15, 5, '1571392614', 715, '75641121', 1336841247),
(14, 5, '1571383481', 717, 'fuchangfc', 1336850482);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_coupon_code_data`
--

CREATE TABLE IF NOT EXISTS `dbs_coupon_code_data` (
  `c_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '优惠码ID',
  `fetch_limit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `directions` text NOT NULL COMMENT '使用说明',
  `prompt` text NOT NULL COMMENT '温馨提示',
  `yesterdayfetched` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dayfetched` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `weekfetched` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `monthfetched` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `c_id` (`c_id`),
  KEY `yesterdayfetched` (`yesterdayfetched`,`dayfetched`,`weekfetched`,`monthfetched`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dbs_coupon_code_data`
--

INSERT INTO `dbs_coupon_code_data` (`c_id`, `fetch_limit`, `directions`, `prompt`, `yesterdayfetched`, `dayfetched`, `weekfetched`, `monthfetched`, `updatetime`) VALUES
(1, 101, '面值：满300减20元（本券仅限大家电、生活电器类目商品，特价商品不能使用）\r\n注意：一个易迅网账号仅限使用一次优惠代码 ', '本券为“公用券”，直接提供一个公用的优惠券代码，一般不限定使用次数，每个人都可以使用该公用券代码。', 0, 4, 4, 4, 1336710063),
(2, 101, '面值：满50减5元（特价商品不能使用）\r\n注意：一个易迅网账号仅限使用一次优惠代码', '本券为“公用券”，直接提供一个公用的优惠券代码，一般不限定使用次数，每个人都可以使用该公用券代码.\r\n不支持批发，代购，倒卖优惠券等违规方式，如果发现此类违规行为或其它恶意领取优惠券行为，我们将公开优惠券，购买的券也会不退款，并封掉支付宝账号！', 0, 1, 1, 1, 1336678519),
(3, 101, '全场商品均可使用现金抵用券（闪购商品除外）', '', 0, 1, 1, 2, 1336930230),
(5, 101, '全场通用', '', 0, 2, 2, 2, 1336850482);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_coupon_code_mall`
--

CREATE TABLE IF NOT EXISTS `dbs_coupon_code_mall` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL,
  `name_match` varchar(255) NOT NULL,
  `website` varchar(200) NOT NULL,
  `gourl` varchar(150) NOT NULL DEFAULT '' COMMENT '购买跳转地址',
  `tel` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `how2use` text NOT NULL,
  `logo` varchar(100) NOT NULL,
  `figure_image` varchar(100) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '9999',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitnum` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `yesterdaysearched` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `daysearched` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `weeksearched` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `monthsearched` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `c_id` (`c_id`),
  KEY `is_active` (`is_active`),
  KEY `yesterdaysearched` (`yesterdaysearched`,`daysearched`,`weeksearched`,`monthsearched`),
  FULLTEXT KEY `name_match` (`name_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `dbs_coupon_code_mall`
--

INSERT INTO `dbs_coupon_code_mall` (`id`, `c_id`, `name`, `name_match`, `website`, `gourl`, `tel`, `description`, `how2use`, `logo`, `figure_image`, `sort_order`, `is_active`, `hitnum`, `yesterdaysearched`, `daysearched`, `weeksearched`, `monthsearched`, `updatetime`) VALUES
(1, 1, '红孩子', '红 孩子', 'http://www.redbaby.com.cn', 'http://www.redbaby.com.cn', '010-88499999', '红孩子优惠券提供最新2011年红孩子优惠券,红孩子优惠卷，红孩子电子优惠券，红孩子优惠券2011，红孩子10元免费优惠券等。 红孩子(redbaby.com.cn)-专业的母婴网上商场，商品包括：奶粉、纸尿裤、化妆品、玩具、数码、家电、手机、等数万种商品直销, 便捷，诚信的服务，为您提供方便快捷的购物方式和价廉物美的产品', '首先：', '201204/a6504c30db5481e8ce67c947c94224b7.jpg', '201204/6ad7cd72f6bdfc119f8dba4e1e0c45a8.jpg', 2, 1, 1, 0, 1, 1, 1, 1335588145),
(2, 1, '易迅', '易迅', 'http://www.icson.com', 'http://p.yiqifa.com/c?s=8b2225fb&w=452248&c=4330&i=4984&l=0&e=&t=http://www.51buy.com', '400 640 1878', '易迅网由上海易迅电子商务发展有限公司于2006年创建，并通过强大的大规模集约采购优势、丰富的电子商务管理服务经验和最先进的互联网技术为用户提供最新最好的时尚精选商品。\r\n易迅网一直以来以“诚信”作为公司和每位员工的行为准则，以“超越客户期望”为目标，致力于为用户提供丰富的商品选择、便捷的购物方式和完善的售后服务，打造更好的E时代购物体验。', '将商品加入购物车，点击“去结算”，在“填写核对订单”—订单结算中，输入正确的优惠券密码，\r\n\r\n点击“使用”按钮，则会提示“成功使用优惠券”，订单提交后优惠券即被使用成功。\r\n\r\n[img]http://www.quanmama.com/shiyongimg/51buy.jpg[/img]', '201204/ab8c91c79a2aa3f54122540845d505d7.jpg', '201204/ab8c91c79a2aa3f54122540845d505d7.jpg', 9999, 1, 1, 0, 1, 2, 2, 1336879384),
(3, 2, '凡客诚品', '', 'http://www.vancl.com', 'http://www.vancl.com', '400-650-7099', '凡客诚品是网上服装商城，在线销售全棉衬衫、牛津纺衬衫、免烫衬衫、T恤、POLO、休闲裤、卡其裤、牛仔裤、棉线衫、外套、卫衣、毛衣、背心、短裤、鞋、领带、内衣、袜子、家居。凡客提供优质服务。全场购物免费送货上门。无条件退换货。凡客优惠券提供最新凡客诚品优惠券,vancl优惠券,凡客优惠卷,2010凡客优惠券，凡客代金券,凡客现金券，凡客礼品卡等。', '凡客优惠券就是凡客礼品卡，登陆凡客网站后，选好东西加入购物车，结算提交订单前使用凡客优惠券(凡客礼品卡)。\r\n\r\n礼品卡是在订单结算的时候使用的，在支付方式的地方选中礼品卡支付，会显示出账户获得的未使用的礼品卡，\r\n\r\n选中要使用的礼品卡后点击“使用礼品卡”即可验证使用，如果想要使用通过其他渠道获得的礼品卡，\r\n\r\n可以选择填写其他礼品卡，手动输入卡号、密码后也可以直接验证使用，具体使用方法请看下图：\r\n\r\n[img]http://www.quanmama.com/shiyongimg/vancl.jpg[/img]', '201205/b16fa6ce3ce448421454089bbf489162.png', '201205/4f21de81001172370eb4b77672ae960d.jpg', 9999, 1, 1, 0, 1, 2, 2, 1336878203),
(4, 3, '麦包包', '', 'http://www.mbaobao.com', 'http://www.mbaobao.com', '4006-528-528', '麦包包诞生于2007年9月，由意大利近百年历史的箱包家族集团VISCONTI DIFFUSIONE SNC提供天使基金设立而成。麦包包致力于打造箱包快速时尚新模式，为中国的消费者提供高性价比的多品牌时尚箱包产品。目前，麦包包拥有多个时尚品牌，如浪美、飞扬空间、DUDU、JAMIE MOORE、戈尔本等；并独家网络代理香港薇茉、台湾哈森等国际国内知名品牌产品。网站拥有近万款箱包品种及数量，产品线涉及时尚、商务、休闲、户外运动等多个系列。', '[b]1、如何使用麦包包优惠券[/b]\r\n\r\n     在购物车"填写核对订单信息"页面中的"使用优惠券/现金券"区域输入您的优惠券/现金券编号，并点击"使用"按钮\r\n     （请留意橘黄色线框中的内容），同时可通过点击右侧的"查看可用优惠券"快速找到您当前可用的优惠券/现金券；\r\n\r\n[img]http://www.quanmama.com/shiyongimg/mbaobao1.jpg[/img]\r\n\r\n[b]2、查看我的麦包包优惠券[/b]\r\n     登录"我的麦包包"，点击"我的优惠券"查看。\r\n[img]http://www.quanmama.com/shiyongimg/mbaobao2.png[/img]\r\n\r\n[b]3、如何使用麦包包礼品券[/b]\r\n\r\n  在"填写核对订单信息"页面中的"礼品券"区域输入您的礼品券，并点击"使用"按钮（请留意橘黄色线框中的内容）；\r\n\r\n[list][*][img]http://www.quanmama.com/shiyongimg/mbaobao3.jpg[/img][/list]', '201205/04f302f36319816cdc746a385c051674.jpg', '201205/ee75ffe9bd13e3ce3e8fda98507a1eac.jpg', 9999, 1, 1, 0, 2, 2, 2, 1336724517),
(5, 8, '聚美优品', '', 'http://www.jumei.com', 'http://p.yiqifa.com/c?s=79b91157&w=452247&c=5227&i=10462&l=0&e=&t=http://www.jumei.com/', '4000-123-888', '聚美优品：聚集美丽，成人之美。\r\n\r\n聚美优品的前身是团美网，中国第一家专业化妆品团购网站，也是中国最大的化妆品团购网站。在2010年9月，为了进一步强调团美在女性团购网站领域的领头地位，深度拓展品牌内涵与外延，团美网正式全面启用聚美优品新品牌，并且启用Jumei.com全新顶级域名。', '[font=宋体][color=#000000]注册并成功登陆聚美优品，选购商品，下单后进入订单确认页面，右边“输入优惠卡代码”，输入优惠券编码，即可优惠。[/font][/color]\r\n\r\n[img]http://www.quanmama.com/shiyongimg/jumei.jpg[/img]', '201205/85a7231805a4ae2deed3952805e3d45f.jpg', '201205/627c92fd245ab99186c483f6443d5dce.jpg', 9999, 1, 1, 0, 0, 0, 0, 0),
(6, 9, 'TasteV品味汇', '', 'http://www.tastev.com', 'http://www.tastev.com', '4000099085', 'TasteV品味汇是国际选酒俱乐部。它区别于传统酒类B2C，采用社会化酒品筛选的模式，为特定用户群推荐定量的精品红酒。TasteV 品味汇是国际选酒俱乐部。会员有全球美酒大师、商界领袖和爱好者。宗旨是让会员1.选最好的酒（TasteV 组织所有会员一起选出最值得购买的酒，对口感、来源、品质和价格有严格筛选标准；不会推荐最贵，但要品质和性价比最好。），2.享受最低价格保证 （TasteV 为会员提供购买服务，并承诺所有商品价格低于国内正规零售价）。是目前国内最具代表性的会员制红酒电商！', '登陆一号店，并选好要购买的商品，加入到购物车然后“确认结账”，\r\n\r\n在提交订单前，在商品清单下方，点击“使用折扣券抵扣”一栏，\r\n\r\n在“折扣券编码”框填入您的折扣编码，点击“使用”，并确认您的折扣券金额是否正确\r\n\r\n[img]http://www.quanmama.com/shiyongimg/yihaodian.jpg[/img]', '201205/fa46a199fda2aab63b9683a50e3f390e.jpg', '201205/fa46a199fda2aab63b9683a50e3f390e.jpg', 9999, 1, 1, 0, 0, 0, 0, 0),
(7, 10, '博洋家纺', '', 'http://www.beyond.cn', 'http://www.beyond.cn', '0574-83892158', '博洋家纺所属宁波博洋控股集团前身是宁波永丰布厂，创立于1958年，是中国纺织行业的先行者。作为宁波纺织产业改革的 示范企业，经过十几年的发展，现已成为一家拥有数十亿资产，16000多名员工，涉足家纺，服装两大产 业以及房产、商业、产业投资三大项目，控股旗下30余家企业的综合性集团公司。\r\n\r\n博洋定位“优秀的品牌运营者”和“优秀的投资者”角色。近几年，相继完成多次收购重组投资行为， 企业发展保持稳步持续的增长势头。2005年，博洋在全国交通辐射中心地——安徽宿州收购了人员规模达 到6000余人的、当地最大的纺织企业，建立了自身可控的高效运作的纺织面料、家纺生产和物流配送基地， 并拓展了其他关联产业，打通了纺织服装行业上下游的产业链。与此同时，集团业务的投资板块也推进迅 猛，房产、商业、旅游、金融都取得重大进展。', '[img]http://upload.beyond.cn/upload/Image/jhq_03.gif[/img]\r\n\r\n[img]http://upload.beyond.cn/upload/Image/jhq_05.gif[/img]', '201205/a319fbb9e8557b81e1291696379ac03e.jpg', '201205/a319fbb9e8557b81e1291696379ac03e.jpg', 9999, 1, 1, 0, 1, 1, 1, 1336809919);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_coupon_mall_rec`
--

CREATE TABLE IF NOT EXISTS `dbs_coupon_mall_rec` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` smallint(5) unsigned NOT NULL,
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '10000',
  PRIMARY KEY (`id`),
  KEY `position` (`position`,`sort_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `dbs_coupon_mall_rec`
--

INSERT INTO `dbs_coupon_mall_rec` (`id`, `c_id`, `position`, `sort_order`) VALUES
(6, 1, 102, 1),
(8, 1, 101, 1),
(9, 5, 101, 10000),
(10, 7, 101, 10000),
(11, 6, 101, 10000);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_friend_link`
--

CREATE TABLE IF NOT EXISTS `dbs_friend_link` (
  `link_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(100) NOT NULL,
  `position_id` tinyint(3) unsigned NOT NULL,
  `link_type` tinyint(1) unsigned NOT NULL,
  `link_url` varchar(200) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '1',
  `link_code` varchar(150) NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `position_id` (`position_id`,`link_type`,`sort_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `dbs_friend_link`
--

INSERT INTO `dbs_friend_link` (`link_id`, `site_name`, `position_id`, `link_type`, `link_url`, `sort_order`, `link_code`) VALUES
(1, '嫁娶网', 101, 2, 'http://www.ijiaqu.com', 1, '201205/4af9d6b41ca3f500557af918c39462e5.png'),
(3, '极好居', 101, 1, 'http://www.jihaoju.com', 2, '极好居'),
(4, '青番茄', 101, 1, 'http://www.qfanqie.com', 3, '青番茄');

-- --------------------------------------------------------

--
-- 表的结构 `dbs_payment`
--

CREATE TABLE IF NOT EXISTS `dbs_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nick` varchar(50) NOT NULL,
  `out_trade_no` varchar(50) NOT NULL,
  `trade_no` varchar(50) NOT NULL,
  `amount` float unsigned NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '101',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`addtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `dbs_payment`
--

INSERT INTO `dbs_payment` (`id`, `user_id`, `nick`, `out_trade_no`, `trade_no`, `amount`, `content`, `addtime`, `status`) VALUES
(22, 518, '极好居网', '201205031008260862', '2012050352710715', 0.01, '在线充值', 1336025306, 104),
(2, 64, '极好居网', '201204281202046140', '', 0.01, '在线充值', 1335513724, 104),
(3, 64, '极好居网', '201204281205429480', '', 0.01, '在线充值', 1335513942, 104),
(15, 5, '嫁娶网', '201205030222051685', '2012050343649915', 0.01, '在线充值', 1335997325, 104),
(5, 5, '极好居网', '201204281016345237', '', 0.01, '在线充值', 1335550594, 104),
(6, 5, '极好居网', '201204281019453122', '', 0.01, '在线充值', 1335550785, 104),
(20, 518, '极好居网', '201205030956198255', '2012050352428215', 0.01, '在线充值', 1336024579, 104),
(21, 518, '极好居网', '201205031004572287', '2012050352632115', 0.01, '在线充值', 1336025097, 104),
(14, 5, '嫁娶网', '201205030120340651', '2012050342380015', 0.01, '在线充值', 1335993634, 104),
(19, 518, '极好居网', '201205030404581410', '2012050345797115', 0.01, '在线充值', 1336003498, 104),
(23, 518, '极好居网', '201205040521482665', '2012050466288015', 0.01, '在线充值', 1336094508, 104),
(24, 5, '流星的美', '201205060245180167', '', 2, '在线充值', 1336257918, 103),
(25, 581, 'ahtt', '201205070147374756', '', 2, '在线充值', 1336340857, 103),
(26, 598, 'zhuojie15', '201205080918590129', '', 2, '在线充值', 1336411139, 103),
(27, 653, 'igobang', '201205100348518434', '', 2, '在线充值', 1336607331, 103),
(28, 674, 'hao123456', '201205110245227013', '2012051131795715', 0.01, '在线充值', 1336689922, 104),
(29, 684, 'Sure', '201205110823436155', '', 0.01, '在线充值', 1336710223, 103),
(30, 738, '莆田美食网', '201205131125582837', '', 2, '在线充值', 1336893958, 103);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_site_config`
--

CREATE TABLE IF NOT EXISTS `dbs_site_config` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `code` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL DEFAULT '',
  `store_range` varchar(255) NOT NULL DEFAULT '',
  `store_dir` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=952 ;

--
-- 转存表中的数据 `dbs_site_config`
--

INSERT INTO `dbs_site_config` (`id`, `parent_id`, `code`, `type`, `store_range`, `store_dir`, `value`, `sort_order`) VALUES
(1, 0, 'site_info', 'group', '', '', '', 1),
(5, 0, 'smtp', 'group', '', '', '', 1),
(6, 0, 'hidden', 'hidden', '', '', '', 1),
(101, 1, 'site_name', 'text', '', '', '青番茄', 1),
(501, 5, 'smtp_host', 'text', '', '', 'smtp.exmail.qq.com', 1),
(502, 5, 'smtp_port', 'text', '', '', '25', 1),
(503, 5, 'smtp_user', 'text', '', '', 'service@qfanqie.com', 1),
(504, 5, 'smtp_pass', 'password', '', '', 'xiaosa516', 1),
(505, 5, 'smtp_mail', 'text', '', '', 'service@qfanqie.com', 1),
(506, 5, 'mail_charset', 'select', 'UTF8,GB2312,BIG5', '', 'UTF8', 1),
(507, 5, 'mail_service', 'select', '0,1', '', '1', 0),
(919, 1, 'site_keywords', 'textarea', '', '', '网购 优惠券 京东优惠券 当当优惠券 凡客优惠券', 3),
(617, 6, 'captcha', 'hidden', '', '', '61', 1),
(618, 6, 'captcha_width', 'hidden', '', '', '100', 1),
(619, 6, 'captcha_height', 'hidden', '', '', '35', 1),
(912, 1, 'time_format', 'text', '', '', 'Y-m-d H:i:s', 6),
(913, 1, 'date_format', 'text', '', '', 'Y-m-d', 5),
(914, 1, 'timezone', 'options', '-12,-11,-10,-9,-8,-7,-6,-5,-4,-3.5,-3,-2,-1,0,1,2,3,3.5,4,4.5,5,5.5,5.75,6,6.5,7,8,9,9.5,10,11,12', '', '8', 7),
(917, 1, 'open_gzip', 'select', '0,1', '', '1', 8),
(918, 1, 'site_title', 'text', '', '', '中国领先的优惠券平台', 2),
(920, 1, 'site_description', 'textarea', '', '', '中国领先的优惠券平台', 4),
(7, 0, 'sms', 'group', '', '', '', 1),
(921, 7, 'sms_url_send', 'text', '', '', '', 1),
(922, 7, 'sms_url_sendtime', 'text', '', '', '', 1),
(923, 7, 'sms_url_get', 'text', '', '', '', 1),
(924, 7, 'sms_cdkey', 'text', '', '', '', 1),
(925, 7, 'sms_password', 'text', '', '', '', 1),
(926, 1, 'thumb_width', 'text', '', '', '75', 9),
(927, 1, 'thumb_height', 'text', '', '', '75', 10),
(928, 1, 'image_water_path', 'text', '', '', './Public/Images/logo.png', 11),
(929, 1, 'site_domain', 'text', '', '', 'www.qfanqie.com', 12),
(930, 1, 'data_cache_time', 'text', '', '', '2', 13),
(931, 1, 'service_qq', 'text', '', '', '1227996308', 14),
(932, 1, 'weibo_sina', 'text', '', '', 'jihaoju', 15),
(933, 1, 'weibo_qq', 'text', '', '', 'jihaoju', 16),
(934, 0, 'payment', 'group', '', '', '', 1),
(935, 934, 'alipay_partner', 'text', '', '', '2088002371935242', 16),
(936, 934, 'alipay_key', 'password', '', '', 'h7fcf11udovtf3qta83cwfcfqtqp0tws', 17),
(937, 934, 'alipay_seller_email', 'text', '', '', 'xaq516@hotmail.com', 18),
(938, 1, 'icp_number', 'text', '', '', '浙ICP备11023469号', 19),
(939, 934, 'alipay_type', 'options', 'direct,warrant', '', 'warrant', 20),
(940, 1, 'url_rewrite', 'options', '0,1', '', '1', 21),
(941, 1, 'code_in_secret', 'text', '', '', '60', 22),
(942, 1, 'invite_credit', 'text', '', '', '5', 23),
(943, 1, 'statis_code', 'textarea', '', '', '', 23),
(944, 0, 'open_platform', 'group', '', '', '', 24),
(945, 944, 'qq_appid', 'text', '', '', '', 25),
(946, 944, 'qq_appkey', 'text', '', '', '', 26),
(947, 944, 'qq_open', 'select', '0,1', '', '1', 27),
(948, 944, 'sina_wb_akey', 'text', '', '', '', 28),
(949, 944, 'sina_wb_skey', 'text', '', '', '', 29),
(950, 944, 'sina_wb_office_id', 'text', '', '', '', 30),
(951, 944, 'sina_wb_open', 'select', '0,1', '', '1', 31);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_user`
--

CREATE TABLE IF NOT EXISTS `dbs_user` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '',
  `nick` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(40) CHARACTER SET ucs2 NOT NULL,
  `password` char(32) NOT NULL,
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `msn` varchar(60) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `tel_phone` varchar(20) NOT NULL,
  `mobile_phone` varchar(20) NOT NULL,
  `addr` varchar(100) NOT NULL COMMENT '地址',
  `is_locked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '封锁',
  `money` float unsigned NOT NULL DEFAULT '0' COMMENT '金额',
  `credit` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `invite` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `invite` (`invite`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=760 ;

--
-- 转存表中的数据 `dbs_user`
--

INSERT INTO `dbs_user` (`user_id`, `email`, `nick`, `name`, `password`, `last_login`, `last_ip`, `msn`, `qq`, `tel_phone`, `mobile_phone`, `addr`, `is_locked`, `money`, `credit`, `addtime`, `invite`) VALUES
(518, 'service@jihaoju.com', '极好居网', '', '10f8eda38280fa5d7e6bfd8922fac6ca', 1336255723, '116.255.188.64', '', '', '', '', '', 0, 0.05, 0, 0, 0),
(2, '76214@126.com', '情迷布拉格', '', '9baf246be54709399a827a46f6ba9637', 1336356191, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(553, 'cnxadj@163.com', '23117', '', '512bf3008bfeca357aa14d2ec71729e4', 1336171318, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(555, '174674109@qq.com', '肖安球', '', '10f8eda38280fa5d7e6bfd8922fac6ca', 1336192961, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(556, 'ironhot@sina.com', 'ironhot', '', 'f379eaf3c831b04de153469d1bec345e', 1336196165, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(559, '562923839@qq.com', '562923839', '', 'a430e8ad38d62f0dc5d72aa98d27aefc', 1336197294, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(560, 'guo0537@qq.com', 'guo0537', '', '60d00c30bd223ddef610c3daebb4f313', 1336200779, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(561, 'test@test.com', 'test', '', '3ba3102443fac2807b5d15106d582e79', 1336242969, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(562, 'rhlady@163.com', 'rhlady', '', '7cbb3252ba6b7e9c422fac5334d22054', 1336255482, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(5, '76255@126.com', '流星的美', '', '9baf246be54709399a827a46f6ba9637', 1336256436, '116.255.188.64', '', '', '', '', '', 0, 0.02, 0, 0, 0),
(565, 'a@vancld.com', 'gingko', '', 'cbd368688983cc838def8adc80bc73c7', 1336258250, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(573, '32233232@qq.com', 'hao123', '', 'e10adc3949ba59abbe56e057f20f883e', 1336340658, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(575, '1833935644@qq.com', '网络部肖安球', '', '10f8eda38280fa5d7e6bfd8922fac6ca', 1336331970, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(576, '4444444@qq.com', '一杰2012', '', '7395facf829e2c33f6883a5e86313581', 1336337768, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(578, 'mobilpress@gmail.com', 'mobilpress', '', 'e628955042334a240d02607622ace5a4', 1336338164, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(579, 'lexiqi@vip.qq.com', '乐稀奇', '', '091bd2311657b2034446e3740a06ae66', 1336338332, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(581, '31598805@qq.com', 'ahtt', '', '6733eb5f605d09eaede9845835d71c4e', 1336340846, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(582, '492433559@qq.com', 'lhkill', '', 'ed57e28074cb93ff37e7f9f9f2a39e1c', 1336341723, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(583, 'llbin2@qq.com', 'torome', '', '21218cca77804d2ba1922c33e0151105', 1336342565, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(585, 'saladaaa@126.com', 'Googler', '', '3dbe00a167653a1aaee01d93e77e730e', 1336344073, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(586, 'kankan@126.com', 'kankanba', '', '96e79218965eb72c92a549dd5a330112', 1336344755, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(587, '5134780@qq.com', '阿根根', '', '9be6ab91c76c77831d9a190d1e486023', 1336345234, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(588, 'meihun@vip.163.com', '婚纱摄影团购', '', 'e9fd7392f2313f5256ed0aee1b50175e', 1336348542, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(589, 'ssss@sss.com', '蓝星-郑欢欢', '', 'bd065f00263c0b4d78be0c9e834d0542', 1336349941, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(590, '9uchina@gmail.com', '桃花岛主', '', '4297f44b13955235245b2497399d7a93', 1336350561, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(591, '499052318@qq.com', '河北网盟', '', 'f705944ef0c75a25aa9cd9330c504de2', 1336354382, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(592, 'vip@iscall.com', 'vip', '', 'e10adc3949ba59abbe56e057f20f883e', 1336358368, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(593, 'jzfm@163.com', '锦州交友网', '', 'a5bcad59f337132671699bf5bd762f5a', 1336366879, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(595, '25954567@qq.com', 'XEnWu', '', 'e7a51e8b0225fa87402b3829c0c0089b', 1336373173, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(597, 'iliang@yahoo.cn', 'iliang', '', '152b1d2a023cfb3251ca4fa0e2a3163e', 1336410960, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(598, 'zhuojie15@163.com', 'zhuojie15', '', '386c65772f40e6d430d7945dd47358c8', 1336411114, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(599, 'boyfig@21cn.com', 'boyfig', '', '81f1f82103c8a60e49f0fcece29f6be3', 1336411577, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(604, 'uiasu@1212.com', 'cctv', '', '1f16949511751bccdaea2648f11769e6', 1336428348, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(605, 'webyouxi001@163.com', 'Walke', '', '9ee263a1ee86872bff4a96ded9c349b1', 1336435253, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(610, '4758484@qq.com', 'a14747', '', '1adde7ec9c0b796578d44d1371090fe2', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0),
(611, '4768602@qq.com', '3515111', '', '1adde7ec9c0b796578d44d1371090fe2', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0),
(612, 'monkey_cici@qq.com', 'monkey_cici', '', '3321b9f03e94fbe8d5b1624ca784b39d', 1336441728, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(615, 'dafdf@h.com', 'hhhhh', '', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0),
(622, '394829128@qq.com', '123456', '', '6ed85a488dbb099d70e56247575adea0', 1336466379, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(632, 'yrf999@gmail.com', '大正123', '', 'c955143b9bcbbab289e962577e15eda5', 1336495149, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(639, 'ffffffff@fgg.ll', 'ffffffff', '', '3028879ab8d5c87dc023049fa5bb5c1a', 1336531807, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(642, '1070672@qq.com', '   Oyen.', '', 'd68cde35d0de9437f474738e63f00d47', 1336552935, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(646, 'df6@126.com', '1234', '', 'e10adc3949ba59abbe56e057f20f883e', 1336589169, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(648, '111@111.com', 'hdnjlb', '', 'e10adc3949ba59abbe56e057f20f883e', 1336597647, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(651, 'daowuqiao@163.com', 'daowuqiao', '', 'a2d7a1c190c1f04dd1bb1eead49aa65f', 1336605339, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(652, 'af@126.cm', 'myuanj32', '', '226b06c65d7877ee0faf192079e6a6f3', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0),
(653, '12@126.com', 'igobang', '', '96e79218965eb72c92a549dd5a330112', 1336607177, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(654, '409534726@qq.com', 'lpsyy', '', '947be53c732d897161a2ccacac727e18', 1336609907, '182.124.35.178', '', '', '', '', '', 0, 0, 0, 0, 0),
(655, 'admin@mcbang.com', '淘米乐', '', 'daa73b62b1aea283ddb4bbc1f24adf57', 1336610152, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 0, 0),
(665, 'hao1234@qq.com', 'hao1234', '', 'ad7cb4de8b24e6a91f5bf2c3a079af82', 1336678436, '116.255.188.64', '', '', '', '', '', 0, 0, 19, 1336678418, 0),
(666, 'no@qq.com', 'nonono', '', 'e10adc3949ba59abbe56e057f20f883e', 1336678542, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336678506, 665),
(667, '123@123.com', '321321', '', '4297f44b13955235245b2497399d7a93', 1336678556, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336678523, 665),
(668, 'h-an@qq.com', 'han365', '', '131624eb713191a7c6c0b13c8ab99b7b', 1336679943, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336679925, 665),
(669, '89750755@qq.com', '89750755', '', '1c9f253eccf6d02b0d10c038df1ec1e2', 1336680010, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336680000, 665),
(670, '267782@qq.com', 'wang508', '', '8a36595641175ad75fa3e53e1bcef900', 1336683121, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336683111, 0),
(673, '554136874@qq.com', '黄伟斌-datou88', '', '02eb516a3a39234bef6ad390d0fcec0f', 1336689630, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336689624, 0),
(674, 'hao123456@qq.com', 'hao123456', '', 'e10adc3949ba59abbe56e057f20f883e', 1336689883, '116.255.188.64', '', '', '', '', '', 0, 0.01, 0, 1336689873, 0),
(680, 'abcd1234@qq.com', 'abcd1234', '', 'e10adc3949ba59abbe56e057f20f883e', 1336698110, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336698092, 0),
(684, '12321@QQ.COM', 'Sure', '', 'cf828df69f24c744a08832b5465bf0be', 1336710040, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336710032, 0),
(685, 'keepstupid@qq.com', 'keepstupid', '', '40481ac35b915ce451229b487f5f5aed', 1336710346, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336710336, 0),
(688, 'haochi123@qq.com', 'haochi123', '', 'e10adc3949ba59abbe56e057f20f883e', 1336724459, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336724445, 0),
(690, 'hao1234567@qq.com', 'hao1234567', '', 'e10adc3949ba59abbe56e057f20f883e', 1336725179, '112.94.54.20', '', '', '', '', '', 0, 0, 0, 1336725166, 0),
(693, 'diycp@qq.com', 'diycp', '', '29c3eea3f305d6b823f562ac4be35217', 1336754485, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336754476, 0),
(696, 'me@mailcc.net', '蓝冰123', '', 'c17b343e2a746f7dc9aeb710232813d3', 1336770175, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336770170, 0),
(697, '706847745@qq.com', 'wbsjsjr', '', '1d8c3d308787db9bfc3812aea8b989e9', 1336771441, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336771419, 0),
(698, 'unemail@qq.com', 'unemail', '', '723d505516e0c197e42a6be3c0af910e', 1336778792, '222.240.189.186', '', '', '', '', '', 0, 0, 0, 1336778770, 0),
(700, '244503474@qq.com', '萝言枫语', '', 'ad9a797526e878d26f9b768a6bafa551', 1336779649, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336779635, 0),
(701, 'wudi@vip.163.com', '六安红网', '', 'e10adc3949ba59abbe56e057f20f883e', 1336783826, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336783816, 0),
(703, 'hack715@qq.com', 'God·健', '', '3b1127cd9a446baa87035fb89d230712', 1336790169, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336790164, 0),
(704, 'fuwulin@gmail.com', 'lucky50', '', '30ea8e361f6ba8fa1246e4b69e43afc1', 1336798160, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336798156, 0),
(707, 'vip595@qq.com', '有心的木头人', '', '558a3475bd8c9d974e8d6cf466c9e162', 1336807204, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336807194, 0),
(712, 'winfancn@gmail.com', 'winfancn', '', '327bbe514f639f762ff998f875fd56e9', 1336816166, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336816145, 0),
(714, '635337792@qq.com', '淘最爱', '', '5e75c3f611275c11f1a78b0477c4d119', 1336821865, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336821136, 0),
(715, '75641121@qq.com', '75641121', '', '70a0f9894d2df18c2507d231a94caee8', 1336841224, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336841206, 0),
(717, 'fuchangfc@qq.com', 'fuchangfc', '', '686f446d771f66500d669fcbcec4bb0e', 1336850476, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336850457, 0),
(731, '287639556@qq.com', '@三藏', '', '08a7ef477aa7c59aa34e2c1c17918c84', 1336878431, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336878421, 0),
(735, '6258888@QQ.COM', '俞仁寿', '', 'e10adc3949ba59abbe56e057f20f883e', 1336886335, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336886321, 0),
(738, 'ptccc@vip.qq.com', '莆田美食网', '', '315eb115d98fcbad39ffc5edebd669c9', 1336893941, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336893936, 0),
(741, 'seyou@seyou.com', 'seyou', '', 'e10adc3949ba59abbe56e057f20f883e', 1336930199, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336930178, 0),
(742, 'liguoguo163@163.com', 'liguoguo163', '', 'b9cbe8d1dfc7c2d531dedfcd4467bf1a', 1336930987, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336930967, 0),
(743, '781832744@qq.com', '博云2', '', 'e10adc3949ba59abbe56e057f20f883e', 1336931808, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336931803, 0),
(744, '303625516@qq.com', 'test1', '', '87e02add22d22c1945f92da4c05d673f', 1336933085, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336933009, 0),
(746, '364559132@qq.com', '蛋蛋的路过', '', '8b302a8136e55a6b9bd61bd90863689a', 1336937949, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336937932, 0),
(747, '123@sohu.com', '落叶飘零', '', 'e10adc3949ba59abbe56e057f20f883e', 1336944986, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336944978, 0),
(759, '35154646@qq.com', 'qq123', '', 'e10adc3949ba59abbe56e057f20f883e', 1336975608, '116.255.188.64', '', '', '', '', '', 0, 0, 0, 1336975605, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dbs_user_platform`
--

CREATE TABLE IF NOT EXISTS `dbs_user_platform` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `openid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员与开发平台帐号关联表' AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `dbs_user_platform`
--

INSERT INTO `dbs_user_platform` (`id`, `user_id`, `type`, `openid`) VALUES
(1, 518, 'sina', '2507337250'),
(2, 555, 'qq', 'B11562861783EE2DF8B9095F43629FE1'),
(3, 575, 'qq', '22922F1B2A3ED8386BDF7BFF496642DD'),
(4, 576, 'qq', '5FC67CB821C767E36C68B5D22FA46FFE'),
(5, 579, 'sina', '1747086821'),
(6, 583, 'sina', '1083092080'),
(7, 585, 'sina', '1894627571'),
(8, 587, 'qq', '23F8866B03EFAA8A7E02E5FEB8FDE340'),
(9, 588, 'qq', 'AE637700D92B60657A82BE08F4A8D4F2'),
(10, 589, 'qq', '75BF9990DF6B568536CC22F47EB765AC'),
(11, 590, 'qq', '8FC545F91454147614D6BA2215448263'),
(12, 591, 'qq', '2FD08AC6F6D6A5D01E42CB4E39E19E6E'),
(13, 593, 'qq', '4D0999004E211163AC61E6AD6E1CABF6'),
(14, 595, 'qq', 'FABAD720C71D6490623DCAD7472DCB6D'),
(15, 605, 'qq', 'DAC1A831A61DF4D57E0A64BA47C980D2'),
(16, 612, 'qq', 'E7C4D17252000AD5970A1C43482FE7EE'),
(17, 622, 'qq', '1720412097A4DB5ABA1F53CEE7B4CD8A'),
(18, 632, 'qq', 'BFD00EBE6ADF50D8ABA71B3BD5A99E7A'),
(19, 642, 'qq', '24A0B31C97361F48CB640AE8A158DAF1'),
(20, 655, 'qq', 'AF4668C3B9D26FF1F180E6A2109C079A'),
(21, 670, 'qq', '8966BBF45E3EF64036806E86BC81F288'),
(22, 673, 'sina', '1722596757'),
(23, 684, 'qq', '6BE90ECA0CBB186A9B2702E2B5335D20'),
(24, 696, 'qq', '80EEF64DF26F7B434572DB504BA36799'),
(25, 701, 'qq', 'B04808FF46A2B0C9EF537992CB051E2C'),
(26, 703, 'qq', 'B4F0D136D502BB0C0B738371955882DD'),
(27, 704, 'qq', '7C8BAE97F7912D14EC5A8E1AC1E9FA49'),
(28, 707, 'qq', '677F1A2BCAE02F424C08CCFFBBE039E0'),
(29, 714, 'qq', '44404091358EC1A5B14D70E9200AC947'),
(30, 731, 'qq', 'A1C589125E0689CFC849D653947FE73D'),
(31, 735, 'qq', '52866E6FFC58B73D6CA0D27E72868EB4'),
(32, 738, 'qq', 'B15B71D5ED481AB1EEA8CEC696E57300'),
(33, 743, 'qq', '6C4BEFF99783F1BC071CB84A9DACF6C3'),
(34, 747, 'qq', '4591ED98F9474BC7FF0C4D3564168D07'),
(35, 759, 'qq', '3462C001CA030DE1FF0D7B365040CBE0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;