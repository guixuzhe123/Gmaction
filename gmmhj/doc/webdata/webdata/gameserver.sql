/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50130
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2014-12-06 01:08:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `create_account_time` datetime DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('80', '2014-12-04 09:49:44');
INSERT INTO `account` VALUES ('test17', '2014-12-04 09:54:58');
INSERT INTO `account` VALUES ('81', '2014-12-04 10:42:29');
INSERT INTO `account` VALUES ('lelenia', '2014-12-04 10:45:49');
INSERT INTO `account` VALUES ('82', '2014-12-04 10:49:01');
INSERT INTO `account` VALUES ('821', '2014-12-04 15:16:41');
INSERT INTO `account` VALUES ('test13331', '2014-12-05 20:06:18');
INSERT INTO `account` VALUES ('wwww4', '2014-12-05 20:33:06');
INSERT INTO `account` VALUES ('83', '2014-12-06 00:02:54');
INSERT INTO `account` VALUES ('84', '2014-12-06 00:04:22');

-- ----------------------------
-- Table structure for `achievement`
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `achievementstatus` binary(255) DEFAULT NULL,
  `designstatus` binary(255) DEFAULT NULL,
  `point` int(10) unsigned DEFAULT '0',
  `weardesign` int(10) unsigned DEFAULT '0',
  `moneytotalget` bigint(20) unsigned DEFAULT '0',
  `guilddonationmoney` bigint(20) unsigned DEFAULT '0',
  `combat` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of achievement
-- ----------------------------
INSERT INTO `achievement` VALUES ('1', 0x868080808080808080808080808080808080808080808080808180C08180A08088808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, 0x808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, '135', '0', '25782705', '2000000', '77');
INSERT INTO `achievement` VALUES ('3', 0x868080809080818080F88080808080808080808084808080808080C08780808098908080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, 0x808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, '475', '0', '115043482', '10000000', '462');
INSERT INTO `achievement` VALUES ('5', 0x8E8080808080808080808080808080808080808080808080808080808080808080908080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, 0x808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, '95', '0', '964543', '0', '77');
INSERT INTO `achievement` VALUES ('2', 0x828080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, 0x808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, '10', '0', '0', '0', '0');
INSERT INTO `achievement` VALUES ('4', 0x828080808080808080808080808080808080808080808080808080C08080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, 0x808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, '30', '0', '5517934', '0', '0');
INSERT INTO `achievement` VALUES ('7', 0x868080808080808080888080808080808080808080888080808080C081C0808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, 0x808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, '125', '0', '10979672', '0', '77');
INSERT INTO `achievement` VALUES ('8', 0x828080809080808080F88080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, 0x808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, '90', '0', '2013500', '0', '77');
INSERT INTO `achievement` VALUES ('9', 0x868080809080808080F880808080808080A0A08080888080808080C081C0808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, 0x808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808000, '215', '0', '15855282', '0', '231');

-- ----------------------------
-- Table structure for `achievementinfo`
-- ----------------------------
DROP TABLE IF EXISTS `achievementinfo`;
CREATE TABLE `achievementinfo` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `achievementtype` int(10) unsigned NOT NULL DEFAULT '0',
  `completetimes` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`characterid`,`achievementtype`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of achievementinfo
-- ----------------------------
INSERT INTO `achievementinfo` VALUES ('1', '22', '17');
INSERT INTO `achievementinfo` VALUES ('1', '24', '6');
INSERT INTO `achievementinfo` VALUES ('3', '62', '2');
INSERT INTO `achievementinfo` VALUES ('5', '62', '5');
INSERT INTO `achievementinfo` VALUES ('3', '44', '3');
INSERT INTO `achievementinfo` VALUES ('3', '74', '1');
INSERT INTO `achievementinfo` VALUES ('1', '67', '2');
INSERT INTO `achievementinfo` VALUES ('1', '37', '7');
INSERT INTO `achievementinfo` VALUES ('9', '44', '1');
INSERT INTO `achievementinfo` VALUES ('9', '22', '20');
INSERT INTO `achievementinfo` VALUES ('9', '66', '1');
INSERT INTO `achievementinfo` VALUES ('9', '30', '1');
INSERT INTO `achievementinfo` VALUES ('9', '24', '10');
INSERT INTO `achievementinfo` VALUES ('7', '22', '12');
INSERT INTO `achievementinfo` VALUES ('7', '66', '1');
INSERT INTO `achievementinfo` VALUES ('7', '30', '1');

-- ----------------------------
-- Table structure for `activitycommon`
-- ----------------------------
DROP TABLE IF EXISTS `activitycommon`;
CREATE TABLE `activitycommon` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `answerrewardget` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activitycommon
-- ----------------------------
INSERT INTO `activitycommon` VALUES ('1', '0');
INSERT INTO `activitycommon` VALUES ('2', '0');
INSERT INTO `activitycommon` VALUES ('3', '0');
INSERT INTO `activitycommon` VALUES ('4', '0');
INSERT INTO `activitycommon` VALUES ('5', '0');
INSERT INTO `activitycommon` VALUES ('6', '0');
INSERT INTO `activitycommon` VALUES ('7', '0');
INSERT INTO `activitycommon` VALUES ('8', '0');
INSERT INTO `activitycommon` VALUES ('9', '0');

-- ----------------------------
-- Table structure for `activitypack`
-- ----------------------------
DROP TABLE IF EXISTS `activitypack`;
CREATE TABLE `activitypack` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `packtimes` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activitypack
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_auction`
-- ----------------------------
DROP TABLE IF EXISTS `activity_auction`;
CREATE TABLE `activity_auction` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bopen` int(20) unsigned NOT NULL DEFAULT '0',
  `curactivitydayid` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_auction
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_auction_one`
-- ----------------------------
DROP TABLE IF EXISTS `activity_auction_one`;
CREATE TABLE `activity_auction_one` (
  `curactivityid` int(20) unsigned NOT NULL DEFAULT '0',
  `oneid` int(20) unsigned NOT NULL DEFAULT '0',
  `endtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auctionthingstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`curactivityid`,`oneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_auction_one
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_barter`
-- ----------------------------
DROP TABLE IF EXISTS `activity_barter`;
CREATE TABLE `activity_barter` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bopen` int(20) unsigned NOT NULL DEFAULT '0',
  `curactivitydayid` int(10) unsigned NOT NULL DEFAULT '0',
  `begintime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_barter
-- ----------------------------
INSERT INTO `activity_barter` VALUES ('1', '1', '6', '2014-12-06 00:00:00');

-- ----------------------------
-- Table structure for `activity_circulamoney`
-- ----------------------------
DROP TABLE IF EXISTS `activity_circulamoney`;
CREATE TABLE `activity_circulamoney` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bopen` int(20) unsigned NOT NULL DEFAULT '0',
  `curactivityid` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_circulamoney
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_consumegift`
-- ----------------------------
DROP TABLE IF EXISTS `activity_consumegift`;
CREATE TABLE `activity_consumegift` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bopen` int(20) unsigned NOT NULL DEFAULT '0',
  `begintime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_consumegift
-- ----------------------------
INSERT INTO `activity_consumegift` VALUES ('1', '1', '2014-12-06 00:00:00');

-- ----------------------------
-- Table structure for `activity_eightday`
-- ----------------------------
DROP TABLE IF EXISTS `activity_eightday`;
CREATE TABLE `activity_eightday` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bopen` int(20) unsigned NOT NULL DEFAULT '0',
  `curactivityid` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `topcharacterids` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_eightday
-- ----------------------------
INSERT INTO `activity_eightday` VALUES ('1', '1', '3', '2014-12-07 00:00:00', '');

-- ----------------------------
-- Table structure for `activity_freebarter`
-- ----------------------------
DROP TABLE IF EXISTS `activity_freebarter`;
CREATE TABLE `activity_freebarter` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bopen` int(20) unsigned NOT NULL DEFAULT '0',
  `curactivitydayid` int(10) unsigned NOT NULL DEFAULT '0',
  `begintime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_freebarter
-- ----------------------------
INSERT INTO `activity_freebarter` VALUES ('1', '1', '6', '2014-12-06 00:00:00');

-- ----------------------------
-- Table structure for `activity_luckytoken`
-- ----------------------------
DROP TABLE IF EXISTS `activity_luckytoken`;
CREATE TABLE `activity_luckytoken` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bopen` int(20) unsigned NOT NULL DEFAULT '0',
  `begintime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_luckytoken
-- ----------------------------
INSERT INTO `activity_luckytoken` VALUES ('1', '1', '2014-12-06 00:00:00');

-- ----------------------------
-- Table structure for `activity_rechargegift`
-- ----------------------------
DROP TABLE IF EXISTS `activity_rechargegift`;
CREATE TABLE `activity_rechargegift` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bopen` int(20) unsigned NOT NULL DEFAULT '0',
  `curactivitydayid` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_rechargegift
-- ----------------------------
INSERT INTO `activity_rechargegift` VALUES ('1', '1', '3', '2014-12-07 00:00:00');

-- ----------------------------
-- Table structure for `activity_upday`
-- ----------------------------
DROP TABLE IF EXISTS `activity_upday`;
CREATE TABLE `activity_upday` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bopen` int(20) unsigned NOT NULL DEFAULT '0',
  `curactivityid` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_upday
-- ----------------------------

-- ----------------------------
-- Table structure for `antiaddition`
-- ----------------------------
DROP TABLE IF EXISTS `antiaddition`;
CREATE TABLE `antiaddition` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `onlinetime` int(10) unsigned DEFAULT NULL,
  `offlinetime` int(10) unsigned DEFAULT NULL,
  `birthday` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of antiaddition
-- ----------------------------
INSERT INTO `antiaddition` VALUES ('1', '8129', '0', '0');
INSERT INTO `antiaddition` VALUES ('3', '19508', '0', '0');
INSERT INTO `antiaddition` VALUES ('2', '25462', '0', '0');
INSERT INTO `antiaddition` VALUES ('5', '18000', '0', '0');
INSERT INTO `antiaddition` VALUES ('4', '11384', '0', '0');
INSERT INTO `antiaddition` VALUES ('6', '1289', '0', '0');
INSERT INTO `antiaddition` VALUES ('8', '74', '0', '0');
INSERT INTO `antiaddition` VALUES ('7', '3600', '0', '0');
INSERT INTO `antiaddition` VALUES ('9', '3600', '0', '0');

-- ----------------------------
-- Table structure for `arenacharacter`
-- ----------------------------
DROP TABLE IF EXISTS `arenacharacter`;
CREATE TABLE `arenacharacter` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `challengenum` int(10) unsigned DEFAULT NULL,
  `cdtime` bigint(10) unsigned DEFAULT NULL,
  `time_reward_num` int(10) unsigned DEFAULT '0',
  `need_check_cd` int(10) unsigned DEFAULT '0',
  `beat_num` int(10) unsigned DEFAULT '0',
  `can_get_rank_reward` int(10) unsigned DEFAULT '0',
  `reward_rank` int(10) unsigned DEFAULT '0',
  `honor` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of arenacharacter
-- ----------------------------
INSERT INTO `arenacharacter` VALUES ('1', '10', '1417785318', '0', '0', '0', '0', '1', '1900');
INSERT INTO `arenacharacter` VALUES ('3', '10', '0', '0', '0', '0', '1', '2', '20');
INSERT INTO `arenacharacter` VALUES ('5', '10', '0', '0', '0', '0', '1', '3', '0');
INSERT INTO `arenacharacter` VALUES ('7', '10', '0', '0', '0', '0', '1', '4', '0');
INSERT INTO `arenacharacter` VALUES ('9', '10', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `arenacharacter` VALUES ('4', '10', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `arenahistory`
-- ----------------------------
DROP TABLE IF EXISTS `arenahistory`;
CREATE TABLE `arenahistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `characterid` int(10) unsigned DEFAULT NULL,
  `sourcecharacterid` int(10) unsigned NOT NULL DEFAULT '0',
  `targetcharacterid` int(10) unsigned NOT NULL DEFAULT '0',
  `winnercharacterid` int(10) unsigned NOT NULL DEFAULT '0',
  `old_rank` int(10) unsigned DEFAULT NULL,
  `new_rank` int(10) unsigned DEFAULT NULL,
  `target_name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `characterid` (`characterid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of arenahistory
-- ----------------------------
INSERT INTO `arenahistory` VALUES ('1', '1', '1', '5', '1', '1', '1', '巨人※壮候');
INSERT INTO `arenahistory` VALUES ('2', '5', '1', '5', '1', '3', '3', '莲忆');
INSERT INTO `arenahistory` VALUES ('3', '1', '1', '3', '1', '1', '1', '天马※时');
INSERT INTO `arenahistory` VALUES ('4', '3', '1', '3', '1', '2', '2', '莲忆');

-- ----------------------------
-- Table structure for `arenaranking`
-- ----------------------------
DROP TABLE IF EXISTS `arenaranking`;
CREATE TABLE `arenaranking` (
  `ranking` int(10) unsigned NOT NULL DEFAULT '0',
  `characterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ranking`),
  KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of arenaranking
-- ----------------------------
INSERT INTO `arenaranking` VALUES ('1', '1');
INSERT INTO `arenaranking` VALUES ('2', '3');
INSERT INTO `arenaranking` VALUES ('3', '5');
INSERT INTO `arenaranking` VALUES ('4', '7');
INSERT INTO `arenaranking` VALUES ('5', '9');
INSERT INTO `arenaranking` VALUES ('6', '4');

-- ----------------------------
-- Table structure for `artifact`
-- ----------------------------
DROP TABLE IF EXISTS `artifact`;
CREATE TABLE `artifact` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `artifactlevs` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of artifact
-- ----------------------------

-- ----------------------------
-- Table structure for `auctiongoods`
-- ----------------------------
DROP TABLE IF EXISTS `auctiongoods`;
CREATE TABLE `auctiongoods` (
  `id` int(20) unsigned NOT NULL DEFAULT '0',
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `charactername` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodstype` int(20) unsigned NOT NULL DEFAULT '0',
  `data` int(20) unsigned NOT NULL DEFAULT '0',
  `mainfilter` int(20) unsigned NOT NULL DEFAULT '0',
  `subfilter` int(20) unsigned NOT NULL DEFAULT '0',
  `quality` int(20) unsigned NOT NULL DEFAULT '0',
  `level` int(20) unsigned NOT NULL DEFAULT '0',
  `selltype` int(20) unsigned NOT NULL DEFAULT '0',
  `price` int(20) unsigned NOT NULL DEFAULT '0',
  `perprice` float unsigned NOT NULL DEFAULT '0',
  `name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buylock` int(20) unsigned NOT NULL DEFAULT '0',
  `attributetype` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `characterid` (`characterid`),
  KEY `mainfilter` (`mainfilter`),
  KEY `subfilter` (`subfilter`),
  KEY `quality` (`quality`),
  KEY `level` (`level`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auctiongoods
-- ----------------------------
INSERT INTO `auctiongoods` VALUES ('1', '1', '莲忆', '2', '2', '7', '1', '1', '3', '2', '211', '6.20588', '1级元液', '0', '0');

-- ----------------------------
-- Table structure for `auctionincome`
-- ----------------------------
DROP TABLE IF EXISTS `auctionincome`;
CREATE TABLE `auctionincome` (
  `id` int(20) unsigned NOT NULL DEFAULT '0',
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `charactername` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodstype` int(20) unsigned NOT NULL DEFAULT '0',
  `data` int(20) unsigned NOT NULL DEFAULT '0',
  `selltype` int(20) unsigned NOT NULL DEFAULT '0',
  `price` int(20) unsigned NOT NULL DEFAULT '0',
  `characterid_buyer` int(20) unsigned NOT NULL DEFAULT '0',
  `buyername` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `openup` int(20) unsigned NOT NULL DEFAULT '0',
  `incometype` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `characterid` (`characterid`),
  KEY `characterid_buyer` (`characterid_buyer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auctionincome
-- ----------------------------

-- ----------------------------
-- Table structure for `bank`
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `investmentTime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monthrewardstatus` int(20) unsigned NOT NULL DEFAULT '0',
  `levelinvestmentstatus` int(20) unsigned NOT NULL DEFAULT '0',
  `levelstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('3', '2014-12-05 20:42:07', '2', '128', '[7,3]');
INSERT INTO `bank` VALUES ('9', '2014-12-06 01:01:48', '0', '0', '');

-- ----------------------------
-- Table structure for `bankpersonal`
-- ----------------------------
DROP TABLE IF EXISTS `bankpersonal`;
CREATE TABLE `bankpersonal` (
  `serialnumber` int(10) unsigned NOT NULL DEFAULT '0',
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processtype` int(10) unsigned NOT NULL DEFAULT '0',
  `banktype` int(10) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serialnumber`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bankpersonal
-- ----------------------------
INSERT INTO `bankpersonal` VALUES ('1', '3', '2014-12-05 20:42:07', '1', '1', '300');
INSERT INTO `bankpersonal` VALUES ('2', '3', '2014-12-05 20:42:09', '2', '1', '1300');
INSERT INTO `bankpersonal` VALUES ('3', '3', '2014-12-05 20:42:27', '1', '2', '10000');
INSERT INTO `bankpersonal` VALUES ('4', '3', '2014-12-05 20:42:29', '2', '2', '20000');
INSERT INTO `bankpersonal` VALUES ('5', '3', '2014-12-05 20:42:30', '2', '2', '2000');
INSERT INTO `bankpersonal` VALUES ('6', '9', '2014-12-06 01:01:48', '1', '1', '300');

-- ----------------------------
-- Table structure for `bankrecord`
-- ----------------------------
DROP TABLE IF EXISTS `bankrecord`;
CREATE TABLE `bankrecord` (
  `serialnumber` int(10) unsigned NOT NULL DEFAULT '0',
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processtype` int(10) unsigned NOT NULL DEFAULT '0',
  `banktype` int(10) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serialnumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bankrecord
-- ----------------------------
INSERT INTO `bankrecord` VALUES ('1', '3', '天马※时', '1', '1', '300');
INSERT INTO `bankrecord` VALUES ('2', '3', '天马※时', '2', '1', '1300');
INSERT INTO `bankrecord` VALUES ('3', '3', '天马※时', '1', '2', '10000');
INSERT INTO `bankrecord` VALUES ('4', '3', '天马※时', '2', '2', '20000');
INSERT INTO `bankrecord` VALUES ('5', '3', '天马※时', '2', '2', '2000');
INSERT INTO `bankrecord` VALUES ('6', '9', '上官★强乾', '1', '1', '300');

-- ----------------------------
-- Table structure for `barter`
-- ----------------------------
DROP TABLE IF EXISTS `barter`;
CREATE TABLE `barter` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `barterstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of barter
-- ----------------------------

-- ----------------------------
-- Table structure for `blacker`
-- ----------------------------
DROP TABLE IF EXISTS `blacker`;
CREATE TABLE `blacker` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `characterid_target` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`,`characterid_target`),
  KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of blacker
-- ----------------------------

-- ----------------------------
-- Table structure for `cdkey`
-- ----------------------------
DROP TABLE IF EXISTS `cdkey`;
CREATE TABLE `cdkey` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `cdkey` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`characterid`,`cdkey`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cdkey
-- ----------------------------

-- ----------------------------
-- Table structure for `character`
-- ----------------------------
DROP TABLE IF EXISTS `character`;
CREATE TABLE `character` (
  `characterid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `experience` bigint(19) unsigned DEFAULT '0',
  `hp` int(10) unsigned DEFAULT '9999999',
  `maxhp` int(10) unsigned DEFAULT '1000',
  `attack` int(10) unsigned DEFAULT '0',
  `defence` int(10) DEFAULT '0',
  `hit` int(10) DEFAULT '0',
  `dodge` int(10) DEFAULT '0',
  `crit` int(10) DEFAULT '0',
  `toughness` int(10) DEFAULT '0',
  `move_speed_second` int(10) DEFAULT '0',
  `sceneid` int(10) unsigned DEFAULT NULL,
  `posx` float DEFAULT NULL,
  `posy` float DEFAULT NULL,
  `offlinetime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `create_character_time` datetime DEFAULT NULL,
  `combat` int(10) unsigned DEFAULT NULL,
  `sex` int(10) unsigned DEFAULT '0',
  `loginIP` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `profession` int(10) unsigned DEFAULT NULL,
  `body_avatar` int(10) unsigned DEFAULT NULL,
  `wing_avatar` int(10) unsigned DEFAULT '0',
  `weapon_avatar` int(10) unsigned DEFAULT NULL,
  `stamp_avatar` int(10) unsigned DEFAULT '0',
  `shield_avatar` int(10) unsigned DEFAULT '0',
  `talisman_avatar` int(10) unsigned DEFAULT '0',
  `ride_avatar` int(10) unsigned DEFAULT '0',
  `serverid` int(10) unsigned NOT NULL DEFAULT '0',
  `super_power` int(10) unsigned DEFAULT '0',
  `vice` int(10) unsigned DEFAULT '0',
  `body_balance` int(10) unsigned DEFAULT '0',
  `unit_power` int(10) unsigned DEFAULT '0',
  `lv_item_use_num` int(10) unsigned DEFAULT '0',
  `vice_remain_time` int(10) unsigned DEFAULT '0',
  `online` int(10) unsigned DEFAULT '0',
  `realm` int(10) unsigned DEFAULT '0',
  `stageid` int(10) unsigned DEFAULT '0',
  `realmcombat` int(10) unsigned DEFAULT '0',
  `levelcombat` int(10) unsigned DEFAULT '0',
  `itemexpid` int(10) unsigned DEFAULT '0',
  `itemexptime` int(10) unsigned DEFAULT '0',
  `levelupitem` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`),
  KEY `combat` (`combat`),
  KEY `level` (`level`),
  KEY `account_serverid` (`account`,`serverid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of character
-- ----------------------------
INSERT INTO `character` VALUES ('1', '80', '莲忆', '60', '69661536', '7689331', '7689331', '0', '0', '0', '0', '0', '0', '0', '6007', '41.8587', '177.7', '2014-12-06 01:04:23', '2014-12-06 01:04:23', '2014-12-04 09:49:49', '93138643', '0', '192.168.1.103', '2014-12-06 01:03:12', '1', '2000002', '0', '2000013', '0', '0', '0', '0', '1', '500', '0', '5', '1034680', '0', '0', '0', '2', '1', '5410', '111830', '0', '0', null);
INSERT INTO `character` VALUES ('2', 'test17', '荒の夫', '33', '339895', '72211', '65952', '0', '0', '0', '0', '0', '0', '0', '6001', '26.75', '70.25', '2014-12-06 00:57:22', '2014-12-06 00:57:22', '2014-12-04 09:55:03', '47715', '0', '192.168.1.153', '2014-12-06 00:23:00', '0', '2000001', '0', '2000001', '0', '0', '0', '0', '1', '500', '0', '5', '16099', '0', '0', '0', '1', '1', '0', '46760', '0', '0', null);
INSERT INTO `character` VALUES ('3', '81', '天马※时', '51', '1290701', '181500', '181500', '0', '0', '0', '0', '0', '0', '0', '6008', '71.0313', '135.719', '2014-12-06 00:52:41', '2014-12-06 00:52:41', '2014-12-04 10:42:32', '147463', '0', '192.168.1.103', '2014-12-06 00:51:56', '0', '2000003', '0', '2000002', '0', '0', '2000004', '0', '1', '500', '0', '5', '2126811', '0', '0', '0', '3', '1', '12920', '87427', '0', '0', null);
INSERT INTO `character` VALUES ('4', 'lelenia', '雷影※豹', '49', '2857933', '7636402', '69813', '0', '0', '0', '0', '0', '0', '0', '6006', '41.3821', '98.4421', '2014-12-06 00:09:33', '2014-12-06 01:01:14', '2014-12-04 10:46:50', '93096290', '0', '192.168.1.152', '2014-12-06 00:36:14', '0', '2000002', '0', '2000002', '0', '0', '0', '0', '1', '234', '0', '5', '539855', '0', '0', '1', '2', '1', '5410', '82345', '0', '0', null);
INSERT INTO `character` VALUES ('5', '82', '巨人※壮候', '73', '9738351', '195451', '233757', '0', '0', '0', '0', '0', '0', '0', '6008', '132.375', '187.5', '2014-12-05 20:45:01', '2014-12-05 20:45:01', '2014-12-04 10:49:03', '157298', '0', '192.168.1.117', '2014-12-05 21:02:00', '0', '2000013', '0', '2000002', '0', '0', '0', '0', '1', '500', '0', '5', '431088', '0', '0', '0', '1', '1', '0', '151992', '0', '0', null);
INSERT INTO `character` VALUES ('6', 'test13331', '妖精※城', '3', '342', '4635', '1543', '0', '0', '0', '0', '0', '0', '0', '6003', '35.786', '210.109', '2014-12-05 20:27:54', '2014-12-05 20:27:54', '2014-12-05 20:06:20', '3204', '0', '192.168.1.102', '2014-12-05 20:06:25', '0', '2000000', '0', '2000001', '0', '0', '0', '0', '1', '500', '0', '5', '0', '0', '0', '0', '0', '0', '0', '3043', '0', '0', null);
INSERT INTO `character` VALUES ('7', 'wwww4', '天', '55', '34250682', '7664134', '123261', '0', '0', '0', '0', '0', '0', '0', '6005', '130.405', '120.541', null, '2014-12-06 01:04:30', '2014-12-05 20:33:19', '93116669', '0', '192.168.1.155', '2014-12-05 23:59:30', '0', '2000002', '0', '2000002', '0', '0', '0', '0', '1', '411', '0', '5', '957348', '0', '0', '1', '2', '1', '5410', '98274', '0', '0', null);
INSERT INTO `character` VALUES ('8', '83', '惩罚者※阳苑', '34', '609109', '7577732', '1543', '0', '0', '0', '0', '0', '0', '0', '6001', '104.641', '81.9128', '2014-12-06 00:04:15', '2014-12-06 00:04:15', '2014-12-06 00:03:00', '93052549', '0', '192.168.1.117', '2014-12-06 00:03:01', '0', '2000001', '0', '2000001', '0', '0', '2000004', '0', '1', '130', '0', '5', '501647', '0', '0', '0', '1', '1', '0', '48792', '0', '0', null);
INSERT INTO `character` VALUES ('9', '84', '上官★强乾', '60', '7182750', '7707341', '1543', '0', '0', '0', '0', '0', '0', '0', '6004', '18.8947', '130.093', null, '2014-12-06 01:04:29', '2014-12-06 00:04:25', '93157284', '0', '192.168.1.117', '2014-12-06 00:04:29', '0', '2000003', '0', '2000002', '0', '0', '0', '0', '1', '468', '0', '5', '1480025', '0', '0', '1', '3', '1', '12920', '111830', '0', '0', null);

-- ----------------------------
-- Table structure for `characterskill`
-- ----------------------------
DROP TABLE IF EXISTS `characterskill`;
CREATE TABLE `characterskill` (
  `characterid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `base_skill` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lv_item_use_num` int(10) unsigned DEFAULT '0',
  `skill_breakout` int(10) unsigned DEFAULT '0',
  `skillcombat` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of characterskill
-- ----------------------------
INSERT INTO `characterskill` VALUES ('1', '[11,11,0][12,11,0][13,3,0][14,8,0][51,1,2]', '0', '0', '1320');
INSERT INTO `characterskill` VALUES ('2', '[1,1,0][2,1,0][3,1,0][4,1,0][41,1,0]', '0', '0', '160');
INSERT INTO `characterskill` VALUES ('3', '[1,1,0][2,1,0][3,1,0][4,1,0][41,1,0]', '0', '0', '160');
INSERT INTO `characterskill` VALUES ('4', '[1,1,0][2,1,0][3,1,0][4,1,0][41,1,0]', '0', '0', '160');
INSERT INTO `characterskill` VALUES ('5', '[1,1,0][2,1,0][3,1,0][4,1,0][41,1,0]', '0', '0', '160');
INSERT INTO `characterskill` VALUES ('6', '[1,1,0][2,1,0][3,1,0][4,1,0][41,1,0]', '0', '0', '160');
INSERT INTO `characterskill` VALUES ('7', '[1,1,0][2,1,4][3,1,2][4,1,0][41,1,0]', '0', '0', '160');
INSERT INTO `characterskill` VALUES ('8', '[1,1,0][2,1,1][3,1,1][4,1,0][41,1,0]', '0', '0', '160');
INSERT INTO `characterskill` VALUES ('9', '[1,4,0][2,1,6][3,1,1][4,1,3][41,1,0]', '0', '0', '280');

-- ----------------------------
-- Table structure for `characterstatus`
-- ----------------------------
DROP TABLE IF EXISTS `characterstatus`;
CREATE TABLE `characterstatus` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `statusinfo` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of characterstatus
-- ----------------------------
INSERT INTO `characterstatus` VALUES ('1', '');
INSERT INTO `characterstatus` VALUES ('2', '');
INSERT INTO `characterstatus` VALUES ('3', '');
INSERT INTO `characterstatus` VALUES ('4', '');
INSERT INTO `characterstatus` VALUES ('5', '');
INSERT INTO `characterstatus` VALUES ('6', '');
INSERT INTO `characterstatus` VALUES ('7', '');
INSERT INTO `characterstatus` VALUES ('8', '');
INSERT INTO `characterstatus` VALUES ('9', '');

-- ----------------------------
-- Table structure for `charge`
-- ----------------------------
DROP TABLE IF EXISTS `charge`;
CREATE TABLE `charge` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `number` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of charge
-- ----------------------------
INSERT INTO `charge` VALUES ('3', '1000');
INSERT INTO `charge` VALUES ('8', '1000');
INSERT INTO `charge` VALUES ('9', '1000');

-- ----------------------------
-- Table structure for `circulamoney`
-- ----------------------------
DROP TABLE IF EXISTS `circulamoney`;
CREATE TABLE `circulamoney` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `rechargenum` int(10) unsigned NOT NULL DEFAULT '0',
  `rewardstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of circulamoney
-- ----------------------------

-- ----------------------------
-- Table structure for `citywartime`
-- ----------------------------
DROP TABLE IF EXISTS `citywartime`;
CREATE TABLE `citywartime` (
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of citywartime
-- ----------------------------
INSERT INTO `citywartime` VALUES ('2014-12-04 09:49:39');

-- ----------------------------
-- Table structure for `consumegift`
-- ----------------------------
DROP TABLE IF EXISTS `consumegift`;
CREATE TABLE `consumegift` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `costemoney` int(20) unsigned NOT NULL DEFAULT '0',
  `rewardstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exchangestatus` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of consumegift
-- ----------------------------
INSERT INTO `consumegift` VALUES ('9', '300', '', '0');

-- ----------------------------
-- Table structure for `containercombat`
-- ----------------------------
DROP TABLE IF EXISTS `containercombat`;
CREATE TABLE `containercombat` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `backpackcombat` int(10) unsigned DEFAULT NULL,
  `clothescombat` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of containercombat
-- ----------------------------
INSERT INTO `containercombat` VALUES ('1', '13', '93010634');
INSERT INTO `containercombat` VALUES ('5', '26', '0');
INSERT INTO `containercombat` VALUES ('3', '24', '15244');

-- ----------------------------
-- Table structure for `containers`
-- ----------------------------
DROP TABLE IF EXISTS `containers`;
CREATE TABLE `containers` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `size` int(4) unsigned NOT NULL DEFAULT '0',
  `thing` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`characterid`,`type`),
  KEY `id_type` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of containers
-- ----------------------------
INSERT INTO `containers` VALUES ('1', '1', '45', '[24][341][78][48][14][60][401][33][11][25][22][57][65][76][64][75][34][504][85][37][306][67][313][38][39][50][17][247][248][301][293][464][462][380][511][512][563][][][][][][][]');
INSERT INTO `containers` VALUES ('1', '2', '42', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('1', '3', '12', '[79][][80][506][27][40][66][4][49][326][][]');
INSERT INTO `containers` VALUES ('2', '1', '54', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('2', '2', '50', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('3', '1', '51', '[89][111][114][118][112][109][218][144][149][147][141][140][145][151][155][158][166][197][161][214][168][220][174][213][][226][237][][][234][235][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('3', '2', '47', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('4', '1', '48', '[120][317][119][137][128][334][130][645][325][135][351][554][548][552][551][123][318][634][610][613][627][631][603][641][639][606][668][121][673][556][358][679][684][131][690][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('4', '2', '45', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('5', '1', '52', '[97][90][95][94][][98][100][102][105][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('5', '2', '47', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('5', '3', '12', '[][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('4', '3', '12', '[555][][353][687][678][677][642][671][667][122][][]');
INSERT INTO `containers` VALUES ('6', '1', '37', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('6', '2', '36', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('7', '1', '42', '[279][290][562][604][608][545][533][416][359][540][339][249][253][291][287][567][596][570][240][243][][239][268][192][217][269][270][573][281][579][245][576][][578][660][657][][][][][][]');
INSERT INTO `containers` VALUES ('7', '2', '40', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('7', '3', '12', '[531][385][598][198][258][271][572][417][280][537][][]');
INSERT INTO `containers` VALUES ('3', '3', '12', '[159][][160][185][229][][][][][][][]');
INSERT INTO `containers` VALUES ('8', '1', '35', '[324][323][327][328][329][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('8', '2', '35', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('8', '3', '12', '[322][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('9', '1', '40', '[468][336][369][403][398][453][448][475][485][496][373][376][492][530][372][527][444][414][490][389][488][434][442][426][406][602][605][620][437][479][648][651][662][][][][][][][]');
INSERT INTO `containers` VALUES ('9', '2', '39', '[427][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('9', '3', '12', '[338][][425][508][557][466][472][644][622][501][][]');
INSERT INTO `containers` VALUES ('9', '102', '189', '[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');
INSERT INTO `containers` VALUES ('7', '102', '189', '[553][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]');

-- ----------------------------
-- Table structure for `container_gridcd`
-- ----------------------------
DROP TABLE IF EXISTS `container_gridcd`;
CREATE TABLE `container_gridcd` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `cd` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`,`type`),
  KEY `id_type` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of container_gridcd
-- ----------------------------
INSERT INTO `container_gridcd` VALUES ('1', '1', '789');
INSERT INTO `container_gridcd` VALUES ('1', '2', '669');
INSERT INTO `container_gridcd` VALUES ('2', '1', '38');
INSERT INTO `container_gridcd` VALUES ('2', '2', '368');
INSERT INTO `container_gridcd` VALUES ('3', '1', '52');
INSERT INTO `container_gridcd` VALUES ('3', '2', '562');
INSERT INTO `container_gridcd` VALUES ('4', '1', '1380');
INSERT INTO `container_gridcd` VALUES ('5', '1', '1661');
INSERT INTO `container_gridcd` VALUES ('4', '2', '1800');
INSERT INTO `container_gridcd` VALUES ('5', '2', '311');
INSERT INTO `container_gridcd` VALUES ('6', '1', '691');
INSERT INTO `container_gridcd` VALUES ('6', '2', '601');
INSERT INTO `container_gridcd` VALUES ('7', '1', '1020');
INSERT INTO `container_gridcd` VALUES ('7', '2', '1350');
INSERT INTO `container_gridcd` VALUES ('8', '1', '526');
INSERT INTO `container_gridcd` VALUES ('8', '2', '826');
INSERT INTO `container_gridcd` VALUES ('9', '1', '746');
INSERT INTO `container_gridcd` VALUES ('9', '2', '1045');

-- ----------------------------
-- Table structure for `coronapersonal`
-- ----------------------------
DROP TABLE IF EXISTS `coronapersonal`;
CREATE TABLE `coronapersonal` (
  `serialnumber` int(10) unsigned NOT NULL DEFAULT '0',
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lotteryid` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serialnumber`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of coronapersonal
-- ----------------------------
INSERT INTO `coronapersonal` VALUES ('1', '9', '2014-12-06 00:25:12', '126');
INSERT INTO `coronapersonal` VALUES ('2', '7', '2014-12-06 00:45:40', '53');

-- ----------------------------
-- Table structure for `coronarecord`
-- ----------------------------
DROP TABLE IF EXISTS `coronarecord`;
CREATE TABLE `coronarecord` (
  `serialnumber` int(10) unsigned NOT NULL DEFAULT '0',
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lotteryId` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serialnumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of coronarecord
-- ----------------------------

-- ----------------------------
-- Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `money` bigint(20) unsigned NOT NULL DEFAULT '0',
  `emoney` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vouchers` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`),
  KEY `money` (`money`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES ('1', '14643949', '8901', '2750');
INSERT INTO `currency` VALUES ('2', '0', '0', '0');
INSERT INTO `currency` VALUES ('3', '104528491', '1800', '24250');
INSERT INTO `currency` VALUES ('4', '5515334', '0', '750');
INSERT INTO `currency` VALUES ('5', '274543', '0', '1000');
INSERT INTO `currency` VALUES ('6', '0', '0', '0');
INSERT INTO `currency` VALUES ('7', '10129872', '0', '1710');
INSERT INTO `currency` VALUES ('8', '2013500', '1000', '0');
INSERT INTO `currency` VALUES ('9', '15644356', '700', '1755');

-- ----------------------------
-- Table structure for `dbversion`
-- ----------------------------
DROP TABLE IF EXISTS `dbversion`;
CREATE TABLE `dbversion` (
  `version_number` int(11) NOT NULL DEFAULT '0',
  `db_key` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`version_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dbversion
-- ----------------------------
INSERT INTO `dbversion` VALUES ('0', 'cc7cfde0-7b57-11e4-9ffc-11e95c103d04');

-- ----------------------------
-- Table structure for `eightday`
-- ----------------------------
DROP TABLE IF EXISTS `eightday`;
CREATE TABLE `eightday` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `rewardstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eightday
-- ----------------------------

-- ----------------------------
-- Table structure for `enemies`
-- ----------------------------
DROP TABLE IF EXISTS `enemies`;
CREATE TABLE `enemies` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `characterid_target` int(20) unsigned NOT NULL DEFAULT '0',
  `record` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`,`characterid_target`),
  KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of enemies
-- ----------------------------

-- ----------------------------
-- Table structure for `equipment`
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `thingcfgid` int(20) unsigned NOT NULL DEFAULT '0',
  `bind` int(4) unsigned NOT NULL DEFAULT '0',
  `timemode` int(4) NOT NULL DEFAULT '0',
  `expiredTime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `strengthen` int(4) NOT NULL DEFAULT '0',
  `combat` int(4) unsigned NOT NULL DEFAULT '0',
  `realm` int(4) NOT NULL DEFAULT '0',
  `stage` int(4) NOT NULL DEFAULT '0',
  `level` int(4) NOT NULL DEFAULT '0',
  `qualitybless` int(4) NOT NULL DEFAULT '0',
  `leveluptimes` int(4) NOT NULL DEFAULT '0',
  `additional` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `randomfactor` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id` (`characterid`)
) ENGINE=MyISAM AUTO_INCREMENT=691 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('80', '1', '1040038', '1', '0', '0', '4', '3671', '2', '2', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('4', '1', '1001088', '1', '0', '0', '0', '36', '1', '2', '1', '0', '0', '', '4');
INSERT INTO `equipment` VALUES ('90', '5', '799911', '0', '0', '0', '0', '92999987', '1', '1', '1', '0', '0', '', '1,2,3,4,5,6,7');
INSERT INTO `equipment` VALUES ('121', '4', '1001088', '1', '0', '0', '0', '36', '1', '2', '1', '0', '0', '', '6');
INSERT INTO `equipment` VALUES ('123', '4', '1001078', '1', '0', '0', '0', '139', '1', '2', '1', '0', '0', '', '5');
INSERT INTO `equipment` VALUES ('14', '1', '1001048', '1', '0', '0', '0', '32', '1', '2', '1', '0', '0', '', '');
INSERT INTO `equipment` VALUES ('122', '4', '1001108', '1', '0', '0', '0', '40', '1', '2', '1', '0', '0', '', '2');
INSERT INTO `equipment` VALUES ('119', '4', '1001018', '1', '0', '0', '0', '84', '1', '2', '1', '0', '0', '', '5');
INSERT INTO `equipment` VALUES ('24', '1', '1020018', '1', '0', '0', '0', '207', '2', '3', '20', '0', '0', '', '2');
INSERT INTO `equipment` VALUES ('27', '1', '1020058', '1', '0', '0', '0', '95', '2', '3', '20', '0', '0', '', '7');
INSERT INTO `equipment` VALUES ('33', '1', '1020108', '1', '0', '0', '4', '236', '2', '1', '20', '0', '0', '', '5');
INSERT INTO `equipment` VALUES ('40', '1', '1020068', '1', '0', '0', '0', '122', '2', '3', '20', '0', '0', '', '7');
INSERT INTO `equipment` VALUES ('79', '1', '799911', '0', '0', '0', '0', '92999987', '1', '1', '1', '0', '0', '', '1,2,3,4,5,6,7');
INSERT INTO `equipment` VALUES ('48', '1', '1020038', '1', '0', '0', '0', '8', '2', '3', '20', '0', '0', '', '3');
INSERT INTO `equipment` VALUES ('49', '1', '1020098', '1', '0', '0', '0', '16', '2', '3', '20', '0', '0', '', '4');
INSERT INTO `equipment` VALUES ('78', '1', '2040038', '1', '0', '0', '0', '191', '4', '4', '40', '0', '0', '6,6', '6');
INSERT INTO `equipment` VALUES ('66', '1', '1040078', '1', '0', '0', '3', '2226', '2', '2', '40', '0', '0', '4,4', '4');
INSERT INTO `equipment` VALUES ('60', '1', '2040078', '1', '0', '0', '0', '1635', '4', '4', '40', '0', '0', '7,7', '7');
INSERT INTO `equipment` VALUES ('130', '4', '1001038', '1', '0', '0', '0', '3', '1', '2', '1', '0', '0', '', '');
INSERT INTO `equipment` VALUES ('131', '4', '1001048', '1', '0', '0', '0', '32', '1', '2', '1', '0', '0', '', '');
INSERT INTO `equipment` VALUES ('137', '4', '1020018', '1', '0', '0', '0', '207', '2', '3', '20', '0', '0', '', '5');
INSERT INTO `equipment` VALUES ('610', '4', '1020058', '0', '0', '0', '0', '95', '2', '3', '20', '0', '0', '', '5');
INSERT INTO `equipment` VALUES ('159', '3', '2040011', '1', '0', '0', '10', '7155', '4', '5', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('160', '3', '2040031', '1', '0', '0', '10', '3771', '4', '5', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('642', '4', '2040078', '1', '0', '0', '0', '1491', '4', '4', '40', '0', '0', '6,6', '6');
INSERT INTO `equipment` VALUES ('166', '3', '1020038', '1', '0', '0', '3', '18', '2', '3', '20', '0', '0', '', '6');
INSERT INTO `equipment` VALUES ('613', '4', '1020058', '0', '0', '0', '0', '95', '2', '3', '20', '0', '0', '', '1');
INSERT INTO `equipment` VALUES ('622', '9', '1040098', '1', '0', '0', '0', '131', '2', '2', '40', '0', '0', '2,2', '2');
INSERT INTO `equipment` VALUES ('648', '9', '1040108', '0', '0', '0', '2', '4039', '2', '1', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('185', '3', '1020048', '1', '0', '0', '2', '140', '2', '2', '20', '0', '0', '', '1');
INSERT INTO `equipment` VALUES ('198', '7', '1001048', '1', '0', '0', '0', '32', '1', '2', '1', '0', '0', '', '');
INSERT INTO `equipment` VALUES ('229', '3', '1040058', '1', '0', '0', '1', '3957', '2', '4', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('644', '9', '1040088', '1', '0', '0', '5', '1032', '2', '1', '40', '0', '0', '4,4', '4');
INSERT INTO `equipment` VALUES ('620', '9', '1040078', '0', '0', '0', '3', '5364', '2', '1', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('603', '4', '1020078', '1', '0', '0', '0', '349', '2', '3', '20', '0', '0', '', '2');
INSERT INTO `equipment` VALUES ('258', '7', '1020058', '1', '0', '0', '0', '95', '2', '3', '20', '0', '0', '', '5');
INSERT INTO `equipment` VALUES ('604', '7', '1040088', '1', '0', '0', '2', '803', '2', '2', '40', '0', '0', '4,4', '4');
INSERT INTO `equipment` VALUES ('271', '7', '1020068', '1', '0', '0', '0', '122', '2', '3', '20', '0', '0', '', '4');
INSERT INTO `equipment` VALUES ('608', '7', '1040088', '0', '0', '0', '0', '655', '2', '1', '40', '0', '0', '1,1', '1');
INSERT INTO `equipment` VALUES ('279', '7', '1020038', '1', '0', '0', '0', '8', '2', '3', '20', '0', '0', '', '6');
INSERT INTO `equipment` VALUES ('280', '7', '1020098', '1', '0', '0', '0', '16', '2', '3', '20', '0', '0', '', '7');
INSERT INTO `equipment` VALUES ('606', '4', '1020098', '1', '0', '0', '0', '16', '2', '3', '20', '0', '0', '', '1');
INSERT INTO `equipment` VALUES ('605', '9', '1040078', '1', '0', '0', '2', '1836', '2', '3', '40', '0', '0', '7,7', '7');
INSERT INTO `equipment` VALUES ('290', '7', '2040078', '1', '0', '0', '0', '1785', '4', '5', '40', '0', '0', '7,7', '7');
INSERT INTO `equipment` VALUES ('563', '1', '1040018', '0', '0', '0', '1', '4276', '2', '1', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('318', '4', '1001098', '1', '0', '0', '0', '6', '1', '2', '1', '0', '0', '', '1');
INSERT INTO `equipment` VALUES ('322', '8', '799911', '0', '0', '0', '0', '92999987', '1', '1', '1', '0', '0', '', '1,2,3,4,5,6,7');
INSERT INTO `equipment` VALUES ('323', '8', '1001018', '0', '0', '0', '0', '84', '1', '2', '1', '0', '0', '', '7');
INSERT INTO `equipment` VALUES ('325', '4', '1001058', '1', '0', '0', '0', '37', '1', '2', '1', '0', '0', '', '5');
INSERT INTO `equipment` VALUES ('326', '1', '1040108', '1', '0', '0', '0', '3867', '2', '2', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('327', '8', '2040011', '0', '0', '0', '10', '3840', '4', '5', '40', '0', '0', '7,7', '7');
INSERT INTO `equipment` VALUES ('328', '8', '2040031', '0', '0', '0', '10', '3771', '4', '5', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('540', '7', '5011568', '1', '0', '0', '4', '36', '1', '4', '1', '0', '0', '2', '2');
INSERT INTO `equipment` VALUES ('338', '9', '799911', '0', '0', '0', '0', '92999987', '1', '1', '1', '0', '0', '', '1,2,3,4,5,6,7');
INSERT INTO `equipment` VALUES ('341', '1', '1040018', '0', '0', '0', '4', '1683', '2', '1', '40', '0', '0', '1,1', '1');
INSERT INTO `equipment` VALUES ('353', '4', '1020038', '1', '0', '0', '0', '8', '2', '3', '20', '0', '0', '', '4');
INSERT INTO `equipment` VALUES ('358', '4', '1020058', '1', '0', '0', '0', '95', '2', '3', '20', '0', '0', '', '5');
INSERT INTO `equipment` VALUES ('359', '7', '5011518', '1', '0', '0', '1', '61', '1', '4', '1', '0', '0', '1', '1');
INSERT INTO `equipment` VALUES ('548', '4', '1020018', '1', '0', '0', '5', '549', '2', '1', '20', '0', '0', '', '4');
INSERT INTO `equipment` VALUES ('545', '7', '5011438', '1', '0', '0', '2', '577', '1', '4', '1', '0', '0', '7', '7');
INSERT INTO `equipment` VALUES ('501', '9', '1040108', '1', '0', '0', '3', '961', '2', '2', '40', '0', '0', '4,4', '4');
INSERT INTO `equipment` VALUES ('511', '1', '1040078', '0', '0', '0', '1', '1202', '2', '1', '40', '0', '0', '2,2', '2');
INSERT INTO `equipment` VALUES ('553', '7', '4041728', '1', '0', '0', '0', '926', '4', '1', '1', '0', '0', '7,7,7,7', '7');
INSERT INTO `equipment` VALUES ('380', '1', '1040048', '1', '0', '0', '0', '287', '2', '1', '40', '0', '0', '2,2', '2');
INSERT INTO `equipment` VALUES ('562', '7', '2040078', '1', '0', '0', '0', '1413', '4', '1', '40', '0', '0', '7,7', '7');
INSERT INTO `equipment` VALUES ('385', '7', '1040028', '1', '0', '0', '2', '2679', '2', '2', '40', '0', '0', '1,1', '1');
INSERT INTO `equipment` VALUES ('508', '9', '1040048', '1', '0', '0', '2', '471', '2', '3', '40', '0', '0', '2,2', '2');
INSERT INTO `equipment` VALUES ('572', '7', '1040078', '1', '0', '0', '5', '2862', '2', '2', '40', '0', '0', '4,4', '4');
INSERT INTO `equipment` VALUES ('458', '7', '1060018', '0', '0', '0', '0', '11710', '3', '1', '60', '0', '0', '3,3,3,3', '3');
INSERT INTO `equipment` VALUES ('401', '1', '1040078', '1', '0', '0', '3', '2101', '2', '2', '40', '0', '0', '7,7', '7');
INSERT INTO `equipment` VALUES ('468', '9', '5011568', '1', '0', '0', '3', '32', '1', '4', '1', '0', '0', '2', '2');
INSERT INTO `equipment` VALUES ('406', '9', '1020058', '1', '0', '0', '2', '150', '2', '1', '20', '0', '0', '', '5');
INSERT INTO `equipment` VALUES ('479', '9', '1040088', '1', '0', '0', '3', '745', '2', '1', '40', '0', '0', '7,7', '7');
INSERT INTO `equipment` VALUES ('416', '7', '5011438', '1', '0', '0', '0', '327', '1', '3', '1', '0', '0', '6', '6');
INSERT INTO `equipment` VALUES ('417', '7', '1040088', '1', '0', '0', '5', '1046', '2', '2', '40', '0', '0', '4,4', '4');
INSERT INTO `equipment` VALUES ('531', '7', '799911', '0', '0', '0', '0', '92999987', '1', '1', '1', '0', '0', '', '1,2,3,4,5,6,7');
INSERT INTO `equipment` VALUES ('472', '9', '1040078', '1', '0', '0', '5', '6105', '2', '3', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('457', '7', '2080018', '0', '0', '0', '0', '2356', '6', '1', '80', '0', '0', '2,2,2,2,2,2', '2');
INSERT INTO `equipment` VALUES ('425', '9', '2040031', '1', '0', '0', '10', '609', '4', '5', '40', '0', '0', '1,1', '1');
INSERT INTO `equipment` VALUES ('506', '1', '1040048', '1', '0', '0', '3', '612', '2', '4', '40', '0', '0', '5,5', '5');
INSERT INTO `equipment` VALUES ('437', '9', '1020098', '1', '0', '0', '0', '16', '2', '3', '20', '0', '0', '', '6');
INSERT INTO `equipment` VALUES ('598', '7', '2040038', '1', '0', '0', '0', '460', '4', '4', '40', '0', '0', '4,4', '4');
INSERT INTO `equipment` VALUES ('466', '9', '1040068', '1', '0', '0', '4', '4365', '2', '2', '40', '0', '0', '3,3', '3');
INSERT INTO `equipment` VALUES ('533', '7', '5011418', '1', '0', '0', '0', '43', '1', '3', '1', '0', '0', '6', '6');
INSERT INTO `equipment` VALUES ('537', '7', '1040108', '1', '0', '0', '1', '630', '2', '1', '40', '0', '0', '7,7', '7');
INSERT INTO `equipment` VALUES ('555', '4', '799911', '0', '0', '0', '0', '92999987', '1', '1', '1', '0', '0', '', '1,2,3,4,5,6,7');
INSERT INTO `equipment` VALUES ('556', '4', '1020068', '1', '0', '0', '0', '122', '2', '3', '20', '0', '0', '', '2');
INSERT INTO `equipment` VALUES ('557', '9', '1040058', '1', '0', '0', '2', '558', '2', '2', '40', '0', '0', '6,6', '6');
INSERT INTO `equipment` VALUES ('662', '9', '1040018', '0', '0', '0', '2', '1006', '2', '1', '40', '0', '0', '6,6', '6');
INSERT INTO `equipment` VALUES ('667', '4', '1040098', '1', '0', '0', '2', '502', '2', '4', '40', '0', '0', '4,4', '4');
INSERT INTO `equipment` VALUES ('668', '4', '5011418', '1', '0', '0', '4', '109', '1', '4', '1', '0', '0', '5', '5');
INSERT INTO `equipment` VALUES ('671', '4', '1040088', '1', '0', '0', '3', '624', '2', '4', '40', '0', '0', '5,5', '5');
INSERT INTO `equipment` VALUES ('673', '4', '5011348', '1', '0', '0', '1', '57', '1', '3', '1', '0', '0', '7', '7');
INSERT INTO `equipment` VALUES ('677', '4', '1040068', '1', '0', '0', '1', '845', '2', '1', '40', '0', '0', '1,1', '1');
INSERT INTO `equipment` VALUES ('678', '4', '1040058', '1', '0', '0', '1', '404', '2', '2', '40', '0', '0', '2,2', '2');
INSERT INTO `equipment` VALUES ('679', '4', '5011538', '1', '0', '0', '5', '924', '1', '4', '1', '0', '0', '6', '6');
INSERT INTO `equipment` VALUES ('687', '4', '1040048', '1', '0', '0', '0', '689', '2', '4', '40', '0', '0', '1,1', '1');
INSERT INTO `equipment` VALUES ('690', '4', '1040068', '0', '0', '0', '3', '773', '2', '1', '40', '0', '0', '6,6', '6');

-- ----------------------------
-- Table structure for `escort`
-- ----------------------------
DROP TABLE IF EXISTS `escort`;
CREATE TABLE `escort` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `todayescorttimes` int(10) unsigned DEFAULT '0',
  `todayattacktimes` int(10) unsigned DEFAULT '0',
  `carlev` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of escort
-- ----------------------------
INSERT INTO `escort` VALUES ('1', '0', '0', '2');
INSERT INTO `escort` VALUES ('2', '0', '0', '2');
INSERT INTO `escort` VALUES ('3', '0', '0', '2');
INSERT INTO `escort` VALUES ('4', '0', '0', '2');
INSERT INTO `escort` VALUES ('5', '0', '0', '2');
INSERT INTO `escort` VALUES ('6', '0', '0', '2');
INSERT INTO `escort` VALUES ('7', '0', '0', '2');
INSERT INTO `escort` VALUES ('8', '0', '0', '2');
INSERT INTO `escort` VALUES ('9', '0', '0', '2');

-- ----------------------------
-- Table structure for `firstcharge`
-- ----------------------------
DROP TABLE IF EXISTS `firstcharge`;
CREATE TABLE `firstcharge` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `nowtimes` int(10) unsigned DEFAULT NULL,
  `toptimes` int(10) unsigned DEFAULT NULL,
  `recharge` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of firstcharge
-- ----------------------------
INSERT INTO `firstcharge` VALUES ('3', '1', '1', '0');
INSERT INTO `firstcharge` VALUES ('8', '1', '1', '1');
INSERT INTO `firstcharge` VALUES ('9', '1', '1', '1');

-- ----------------------------
-- Table structure for `forbidtalk`
-- ----------------------------
DROP TABLE IF EXISTS `forbidtalk`;
CREATE TABLE `forbidtalk` (
  `charactername` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`charactername`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of forbidtalk
-- ----------------------------

-- ----------------------------
-- Table structure for `freebarter`
-- ----------------------------
DROP TABLE IF EXISTS `freebarter`;
CREATE TABLE `freebarter` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `barterstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of freebarter
-- ----------------------------

-- ----------------------------
-- Table structure for `friend`
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `characterid_target` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`,`characterid_target`),
  KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of friend
-- ----------------------------

-- ----------------------------
-- Table structure for `goddessfigure`
-- ----------------------------
DROP TABLE IF EXISTS `goddessfigure`;
CREATE TABLE `goddessfigure` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `goddessid` int(10) unsigned NOT NULL DEFAULT '0',
  `combat` int(10) unsigned NOT NULL DEFAULT '0',
  `discountvalue` int(10) unsigned NOT NULL DEFAULT '0',
  `discountendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `critvalue` int(10) unsigned NOT NULL DEFAULT '0',
  `critendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goddessfigure
-- ----------------------------
INSERT INTO `goddessfigure` VALUES ('1', '0', '0', '0', '1970-01-01 08:00:00', '0', '1970-01-01 08:00:00');
INSERT INTO `goddessfigure` VALUES ('3', '37', '1898', '0', '1970-01-01 08:00:00', '0', '1970-01-01 08:00:00');
INSERT INTO `goddessfigure` VALUES ('2', '0', '0', '0', '1970-01-01 08:00:00', '0', '1970-01-01 08:00:00');
INSERT INTO `goddessfigure` VALUES ('5', '0', '0', '0', '1970-01-01 08:00:00', '0', '1970-01-01 08:00:00');
INSERT INTO `goddessfigure` VALUES ('4', '0', '0', '0', '1970-01-01 08:00:00', '0', '1970-01-01 08:00:00');
INSERT INTO `goddessfigure` VALUES ('7', '0', '0', '0', '1970-01-01 08:00:00', '0', '1970-01-01 08:00:00');
INSERT INTO `goddessfigure` VALUES ('8', '0', '0', '0', '1970-01-01 08:00:00', '0', '1970-01-01 08:00:00');
INSERT INTO `goddessfigure` VALUES ('9', '10', '238', '0', '1970-01-01 08:00:00', '0', '1970-01-01 08:00:00');

-- ----------------------------
-- Table structure for `guardbattle`
-- ----------------------------
DROP TABLE IF EXISTS `guardbattle`;
CREATE TABLE `guardbattle` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `topround` int(4) unsigned NOT NULL DEFAULT '0',
  `nowround` int(4) unsigned NOT NULL DEFAULT '0',
  `resettimes` int(10) unsigned NOT NULL DEFAULT '0',
  `roundreward` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of guardbattle
-- ----------------------------
INSERT INTO `guardbattle` VALUES ('1', '1', '1', '0', '');
INSERT INTO `guardbattle` VALUES ('3', '2', '2', '0', '');
INSERT INTO `guardbattle` VALUES ('5', '0', '0', '0', '');
INSERT INTO `guardbattle` VALUES ('2', '0', '0', '0', '');
INSERT INTO `guardbattle` VALUES ('4', '1', '1', '0', '');
INSERT INTO `guardbattle` VALUES ('7', '2', '2', '0', '');
INSERT INTO `guardbattle` VALUES ('9', '1', '1', '0', '');

-- ----------------------------
-- Table structure for `guild`
-- ----------------------------
DROP TABLE IF EXISTS `guild`;
CREATE TABLE `guild` (
  `id` int(20) unsigned NOT NULL DEFAULT '0',
  `name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(20) unsigned NOT NULL DEFAULT '0',
  `bannerid` int(20) unsigned NOT NULL DEFAULT '0',
  `bannername` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `declaretime` datetime DEFAULT NULL,
  `unactive` int(20) unsigned NOT NULL DEFAULT '0',
  `announce` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autoaccept` int(20) unsigned NOT NULL DEFAULT '0',
  `money` bigint(20) unsigned NOT NULL DEFAULT '0',
  `token` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taoistlevel` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of guild
-- ----------------------------
INSERT INTO `guild` VALUES ('1', '第一宗', '1', '1', '就只是这么', '2014-12-04 10:23:45', '2014-12-04 10:23:45', '2', null, '1', '1000000', '[0][0][0][0]', '0');
INSERT INTO `guild` VALUES ('2', '等等', '1', '1', '我', '2014-12-04 10:46:36', '2014-12-04 10:46:36', '2', null, '1', '9000000', '[0][0][0][0]', '0');

-- ----------------------------
-- Table structure for `guildbattle`
-- ----------------------------
DROP TABLE IF EXISTS `guildbattle`;
CREATE TABLE `guildbattle` (
  `guildid` int(20) unsigned NOT NULL DEFAULT '0',
  `nowbattle` int(20) unsigned NOT NULL DEFAULT '0',
  `deadboss` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`guildid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of guildbattle
-- ----------------------------
INSERT INTO `guildbattle` VALUES ('1', '1', '');
INSERT INTO `guildbattle` VALUES ('2', '1', '');

-- ----------------------------
-- Table structure for `guildbossreward`
-- ----------------------------
DROP TABLE IF EXISTS `guildbossreward`;
CREATE TABLE `guildbossreward` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `reward` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of guildbossreward
-- ----------------------------

-- ----------------------------
-- Table structure for `guildcommon`
-- ----------------------------
DROP TABLE IF EXISTS `guildcommon`;
CREATE TABLE `guildcommon` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `acceptinvite` int(20) unsigned NOT NULL DEFAULT '0',
  `story` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of guildcommon
-- ----------------------------
INSERT INTO `guildcommon` VALUES ('1', '0', '206');
INSERT INTO `guildcommon` VALUES ('2', '0', '0');
INSERT INTO `guildcommon` VALUES ('3', '0', '1000');
INSERT INTO `guildcommon` VALUES ('4', '0', '0');
INSERT INTO `guildcommon` VALUES ('5', '0', '0');
INSERT INTO `guildcommon` VALUES ('6', '0', '0');
INSERT INTO `guildcommon` VALUES ('7', '0', '0');
INSERT INTO `guildcommon` VALUES ('8', '0', '0');
INSERT INTO `guildcommon` VALUES ('9', '0', '10');

-- ----------------------------
-- Table structure for `guildherocleantime`
-- ----------------------------
DROP TABLE IF EXISTS `guildherocleantime`;
CREATE TABLE `guildherocleantime` (
  `guildid` int(10) unsigned NOT NULL DEFAULT '0',
  `battleid` int(10) unsigned NOT NULL DEFAULT '0',
  `charactername` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cleantime` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`battleid`),
  KEY `guild` (`guildid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of guildherocleantime
-- ----------------------------
INSERT INTO `guildherocleantime` VALUES ('2', '1', '天马※时', '22');

-- ----------------------------
-- Table structure for `guildmember`
-- ----------------------------
DROP TABLE IF EXISTS `guildmember`;
CREATE TABLE `guildmember` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `guildid` int(20) unsigned NOT NULL DEFAULT '0',
  `rank` int(20) unsigned NOT NULL DEFAULT '0',
  `jointime` datetime DEFAULT NULL,
  `contribution` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`),
  KEY `guild` (`guildid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of guildmember
-- ----------------------------
INSERT INTO `guildmember` VALUES ('1', '1', '4', '2014-12-04 10:23:46', '200');
INSERT INTO `guildmember` VALUES ('3', '2', '1', '2014-12-04 10:46:36', '1100');
INSERT INTO `guildmember` VALUES ('5', '2', '4', '2014-12-04 14:19:25', '100');
INSERT INTO `guildmember` VALUES ('9', '1', '1', '2014-12-06 00:26:17', '0');

-- ----------------------------
-- Table structure for `guildquest`
-- ----------------------------
DROP TABLE IF EXISTS `guildquest`;
CREATE TABLE `guildquest` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `taskid` int(20) unsigned NOT NULL DEFAULT '0',
  `progress` int(4) unsigned NOT NULL DEFAULT '0',
  `acceptlevel` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of guildquest
-- ----------------------------
INSERT INTO `guildquest` VALUES ('1', '9', '0', '60');
INSERT INTO `guildquest` VALUES ('3', '6', '0', '51');
INSERT INTO `guildquest` VALUES ('5', '3', '0', '73');
INSERT INTO `guildquest` VALUES ('9', '10', '0', '60');

-- ----------------------------
-- Table structure for `guildskill`
-- ----------------------------
DROP TABLE IF EXISTS `guildskill`;
CREATE TABLE `guildskill` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `skilllevel` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of guildskill
-- ----------------------------

-- ----------------------------
-- Table structure for `heaven`
-- ----------------------------
DROP TABLE IF EXISTS `heaven`;
CREATE TABLE `heaven` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `activestatus` int(20) unsigned NOT NULL DEFAULT '0',
  `wearheavenid` int(20) unsigned NOT NULL DEFAULT '0',
  `onlinetime` int(20) unsigned NOT NULL DEFAULT '0',
  `logindays` int(20) unsigned NOT NULL DEFAULT '0',
  `specialskillstatus` int(20) unsigned NOT NULL DEFAULT '0',
  `heavenbar` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of heaven
-- ----------------------------
INSERT INTO `heaven` VALUES ('1', '0', '0', '8128', '3', '240', '0,0,0,0,0', '0');
INSERT INTO `heaven` VALUES ('2', '0', '0', '2062', '3', '240', '0,0,0,0,0', '0');
INSERT INTO `heaven` VALUES ('3', '30', '4', '17096', '4', '240', '1,4,3,2,0', '9503');
INSERT INTO `heaven` VALUES ('4', '0', '0', '8674', '3', '240', '0,0,0,0,0', '0');
INSERT INTO `heaven` VALUES ('5', '0', '0', '6696', '2', '240', '0,0,0,0,0', '0');
INSERT INTO `heaven` VALUES ('6', '0', '0', '1289', '1', '240', '0,0,0,0,0', '0');
INSERT INTO `heaven` VALUES ('7', '2', '0', '0', '2', '240', '1,0,0,0,0', '2066');
INSERT INTO `heaven` VALUES ('8', '16', '4', '74', '1', '240', '4,0,0,0,0', '2687');
INSERT INTO `heaven` VALUES ('9', '18', '0', '0', '1', '240', '1,4,0,0,0', '4753');

-- ----------------------------
-- Table structure for `heavenimprove`
-- ----------------------------
DROP TABLE IF EXISTS `heavenimprove`;
CREATE TABLE `heavenimprove` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `heavenid` int(20) unsigned NOT NULL DEFAULT '0',
  `attributedata` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hasunsave` int(20) unsigned NOT NULL DEFAULT '0',
  `unsaveattribute` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character` (`characterid`),
  KEY `heavenitem` (`characterid`,`heavenid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of heavenimprove
-- ----------------------------
INSERT INTO `heavenimprove` VALUES ('1', '3', '1', '0,0,0,0,0,0,0', '0', '0,0,0,0,0,0,0');
INSERT INTO `heavenimprove` VALUES ('2', '3', '4', '0,0,0,0,0,0,0', '0', '0,0,0,0,0,0,0');
INSERT INTO `heavenimprove` VALUES ('3', '3', '3', '0,0,0,0,0,0,0', '0', '0,0,0,0,0,0,0');
INSERT INTO `heavenimprove` VALUES ('4', '3', '2', '0,0,0,0,0,0,0', '0', '0,0,0,0,0,0,0');
INSERT INTO `heavenimprove` VALUES ('5', '7', '1', '0,0,0,0,0,0,0', '0', '0,0,0,0,0,0,0');
INSERT INTO `heavenimprove` VALUES ('6', '8', '4', '0,0,0,0,0,0,0', '0', '0,0,0,0,0,0,0');
INSERT INTO `heavenimprove` VALUES ('7', '9', '1', '0,0,0,0,0,0,0', '0', '0,0,0,0,0,0,0');
INSERT INTO `heavenimprove` VALUES ('8', '9', '4', '0,0,0,0,0,0,0', '0', '0,0,0,0,0,0,0');

-- ----------------------------
-- Table structure for `herobattle`
-- ----------------------------
DROP TABLE IF EXISTS `herobattle`;
CREATE TABLE `herobattle` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `topbattle` int(4) unsigned NOT NULL DEFAULT '0',
  `dailytimes` int(4) unsigned NOT NULL DEFAULT '0',
  `helptimes` int(4) unsigned NOT NULL DEFAULT '0',
  `cleantime` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of herobattle
-- ----------------------------
INSERT INTO `herobattle` VALUES ('1', '1', '0', '0', '[1,49]');
INSERT INTO `herobattle` VALUES ('3', '1', '0', '0', '[1,22]');
INSERT INTO `herobattle` VALUES ('5', '0', '0', '0', '');
INSERT INTO `herobattle` VALUES ('2', '0', '0', '0', '');
INSERT INTO `herobattle` VALUES ('4', '1', '1', '0', '[1,1]');
INSERT INTO `herobattle` VALUES ('7', '0', '0', '0', '');
INSERT INTO `herobattle` VALUES ('9', '1', '1', '0', '[1,1]');

-- ----------------------------
-- Table structure for `herocleantime`
-- ----------------------------
DROP TABLE IF EXISTS `herocleantime`;
CREATE TABLE `herocleantime` (
  `battleid` int(10) unsigned NOT NULL DEFAULT '0',
  `charactername` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cleantime` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of herocleantime
-- ----------------------------
INSERT INTO `herocleantime` VALUES ('1', '上官★强乾', '1');

-- ----------------------------
-- Table structure for `hook`
-- ----------------------------
DROP TABLE IF EXISTS `hook`;
CREATE TABLE `hook` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `hookconfig` text COLLATE utf8_unicode_ci,
  `normalquickbar` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `musequickbar` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forbidbusiness` int(4) unsigned NOT NULL DEFAULT '0',
  `forbidaddtoguild` int(4) unsigned NOT NULL DEFAULT '0',
  `forbidaddteam` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hook
-- ----------------------------
INSERT INTO `hook` VALUES ('1', '{\"1\":1,\"2\":70,\"3\":0,\"4\":0,\"5\":1,\"6\":2,\"7\":1,\"8\":[0,0,0,0],\"9\":1,\"10\":1,\"11\":1,\"12\":1,\"13\":1,\"14\":1,\"15\":1,\"16\":1,\"17\":1,\"18\":0,\"19\":600,\"20\":1,\"21\":1,\"22\":0,\"24\":100,\"25\":100,\"26\":0,\"27\":0,\"28\":0,\"29\":0,\"30\":0,\"31\":1,\"32\":0,\"33\":0,\"34\":0,\"35\":0,\"36\":0,\"37\":0,\"38\":0}', '1|1|11,2|1|12,3|1|13,4|1|14', '', '0', '0', '0');
INSERT INTO `hook` VALUES ('2', '{\"1\":1,\"2\":70,\"3\":0,\"4\":0,\"5\":1,\"6\":2,\"7\":1,\"8\":[0,0,0,0],\"9\":1,\"10\":1,\"11\":1,\"12\":1,\"13\":1,\"14\":1,\"15\":1,\"16\":1,\"17\":1,\"18\":0,\"19\":2000,\"20\":1,\"21\":1,\"22\":0,\"24\":100,\"25\":100,\"26\":0,\"27\":0,\"28\":0,\"29\":0,\"30\":0,\"31\":1,\"32\":0,\"33\":0,\"34\":0,\"35\":0,\"36\":0,\"37\":0,\"38\":0}', '1|1|1,2|1|2,3|1|3,4|1|4', '', '0', '0', '0');
INSERT INTO `hook` VALUES ('3', '{\"1\":1,\"2\":70,\"3\":0,\"4\":0,\"5\":1,\"6\":2,\"7\":1,\"8\":[0,0,0,0],\"9\":1,\"10\":1,\"11\":1,\"12\":1,\"13\":1,\"14\":1,\"15\":1,\"16\":1,\"17\":1,\"18\":0,\"19\":600,\"20\":1,\"21\":1,\"22\":0,\"24\":100,\"25\":100,\"26\":0,\"27\":0,\"28\":0,\"29\":0,\"30\":0,\"31\":1,\"32\":0,\"33\":0,\"34\":0,\"35\":0,\"36\":0,\"37\":0,\"38\":0}', '1|1|1,2|1|2,3|1|3,4|1|4', '', '0', '0', '0');
INSERT INTO `hook` VALUES ('4', '{\"1\":1,\"2\":70,\"3\":0,\"4\":0,\"5\":1,\"6\":2,\"7\":1,\"8\":[0,0,0,0],\"9\":1,\"10\":1,\"11\":1,\"12\":1,\"13\":1,\"14\":1,\"15\":1,\"16\":1,\"17\":1,\"18\":0,\"19\":2000,\"20\":1,\"21\":1,\"22\":0,\"24\":100,\"25\":100,\"26\":0,\"27\":0,\"28\":0,\"29\":0,\"30\":0,\"31\":1,\"32\":0,\"33\":0,\"34\":0,\"35\":0,\"36\":0,\"37\":0,\"38\":0}', '1|1|1,2|1|2,3|1|3,4|1|4', '', '0', '0', '0');
INSERT INTO `hook` VALUES ('5', '{\"1\":1,\"2\":70,\"3\":0,\"4\":0,\"5\":1,\"6\":2,\"7\":1,\"8\":[0,0,0,0],\"9\":1,\"10\":1,\"11\":1,\"12\":1,\"13\":1,\"14\":1,\"15\":1,\"16\":1,\"17\":1,\"18\":0,\"19\":2000,\"20\":1,\"21\":1,\"22\":0,\"24\":100,\"25\":100,\"26\":0,\"27\":0,\"28\":0,\"29\":0,\"30\":0,\"31\":1,\"32\":0,\"33\":0,\"34\":0,\"35\":0,\"36\":0,\"37\":0,\"38\":0}', '1|1|1,2|1|2,3|1|3,4|1|4', '', '0', '0', '0');
INSERT INTO `hook` VALUES ('6', '{\"1\":1,\"2\":70,\"3\":0,\"4\":0,\"5\":1,\"6\":2,\"7\":1,\"8\":[0,0,0,0],\"9\":1,\"10\":1,\"11\":1,\"12\":1,\"13\":1,\"14\":1,\"15\":1,\"16\":1,\"17\":1,\"18\":0,\"19\":2000,\"20\":1,\"21\":1,\"22\":0,\"24\":100,\"25\":100,\"26\":0,\"27\":0,\"28\":0,\"29\":0,\"30\":0,\"31\":1,\"32\":0,\"33\":0,\"34\":0,\"35\":0,\"36\":0,\"37\":0,\"38\":0}', '1|1|1,2|1|2,3|1|3,4|1|4', '', '0', '0', '0');
INSERT INTO `hook` VALUES ('7', '{\"1\":1,\"2\":70,\"3\":0,\"4\":0,\"5\":1,\"6\":2,\"7\":1,\"8\":[0,0,0,0],\"9\":1,\"10\":1,\"11\":1,\"12\":1,\"13\":1,\"14\":1,\"15\":1,\"16\":1,\"17\":1,\"18\":0,\"19\":2000,\"20\":1,\"21\":1,\"22\":0,\"24\":100,\"25\":100,\"26\":0,\"27\":0,\"28\":0,\"29\":0,\"30\":0,\"31\":1,\"32\":0,\"33\":0,\"34\":0,\"35\":0,\"36\":0,\"37\":0,\"38\":0}', '1|1|1,2|1|2,3|1|3,4|1|4,5|2|100003,6|2|100002,7|2|100001', '', '0', '0', '0');
INSERT INTO `hook` VALUES ('8', '{\"1\":1,\"2\":70,\"3\":0,\"4\":0,\"5\":1,\"6\":2,\"7\":1,\"8\":[0,0,0,0],\"9\":1,\"10\":1,\"11\":1,\"12\":1,\"13\":1,\"14\":1,\"15\":1,\"16\":1,\"17\":1,\"18\":0,\"19\":2000,\"20\":1,\"21\":1,\"22\":0,\"24\":100,\"25\":100,\"26\":0,\"27\":0,\"28\":0,\"29\":0,\"30\":0,\"31\":0,\"32\":0,\"33\":0,\"34\":0,\"35\":0,\"36\":0,\"37\":0,\"38\":0}', '1|1|1,2|1|2,3|1|3,4|1|4', '', '0', '0', '0');
INSERT INTO `hook` VALUES ('9', '{\"1\":1,\"2\":70,\"3\":0,\"4\":0,\"5\":1,\"6\":2,\"7\":1,\"8\":[0,0,0,0],\"9\":1,\"10\":1,\"11\":1,\"12\":1,\"13\":1,\"14\":1,\"15\":1,\"16\":1,\"17\":1,\"18\":0,\"19\":2000,\"20\":1,\"21\":1,\"22\":0,\"24\":100,\"25\":100,\"26\":0,\"27\":0,\"28\":0,\"29\":0,\"30\":0,\"31\":0,\"32\":0,\"33\":0,\"34\":0,\"35\":0,\"36\":0,\"37\":0,\"38\":0}', '1|1|1,2|1|2,3|1|3,4|1|4', '', '0', '0', '0');

-- ----------------------------
-- Table structure for `horse`
-- ----------------------------
DROP TABLE IF EXISTS `horse`;
CREATE TABLE `horse` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `ride` int(4) unsigned NOT NULL DEFAULT '0',
  `steplev` int(4) unsigned NOT NULL DEFAULT '0',
  `potentialnum` int(4) unsigned NOT NULL DEFAULT '0',
  `illusionnum` int(4) unsigned NOT NULL DEFAULT '0',
  `bless` int(4) unsigned NOT NULL DEFAULT '0',
  `countdown` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skillslot` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `honorid` int(4) unsigned NOT NULL DEFAULT '0',
  `advancedtimes` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolvalue` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of horse
-- ----------------------------
INSERT INTO `horse` VALUES ('1', '1', '2', '0', '0', '6', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '0', '1', '0', '1970-01-01 08:00:00', '5569');
INSERT INTO `horse` VALUES ('3', '1', '3', '0', '0', '0', '1970-01-01 08:00:00', '0,0,-1,-1,-1,-1', '0', '0', '0', '1970-01-01 08:00:00', '14083');
INSERT INTO `horse` VALUES ('5', '1', '1', '0', '0', '0', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '0', '0', '0', '1970-01-01 08:00:00', '1207');
INSERT INTO `horse` VALUES ('7', '1', '1', '0', '0', '0', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '0', '0', '0', '1970-01-01 08:00:00', '1207');
INSERT INTO `horse` VALUES ('9', '1', '2', '0', '0', '9', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '0', '1', '0', '1970-01-01 08:00:00', '1790');
INSERT INTO `horse` VALUES ('4', '1', '1', '0', '0', '0', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '0', '0', '0', '1970-01-01 08:00:00', '1207');

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `thingcfgid` int(20) unsigned NOT NULL DEFAULT '0',
  `bind` int(4) unsigned NOT NULL DEFAULT '0',
  `timemode` int(4) NOT NULL DEFAULT '0',
  `expiredTime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `overlap` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`characterid`)
) ENGINE=MyISAM AUTO_INCREMENT=685 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('2', '1', '100001', '0', '0', '0', '34');
INSERT INTO `item` VALUES ('37', '1', '105201', '0', '0', '0', '11');
INSERT INTO `item` VALUES ('38', '1', '101001', '1', '0', '0', '2');
INSERT INTO `item` VALUES ('11', '1', '100001', '1', '0', '0', '77');
INSERT INTO `item` VALUES ('22', '1', '100002', '1', '0', '0', '198');
INSERT INTO `item` VALUES ('67', '1', '105001', '0', '0', '0', '20');
INSERT INTO `item` VALUES ('17', '1', '106501', '0', '0', '0', '3');
INSERT INTO `item` VALUES ('34', '1', '100581', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('25', '1', '100002', '0', '0', '0', '202');
INSERT INTO `item` VALUES ('39', '1', '101501', '0', '0', '0', '10');
INSERT INTO `item` VALUES ('95', '5', '105201', '1', '0', '0', '10');
INSERT INTO `item` VALUES ('97', '5', '104001', '1', '0', '0', '4');
INSERT INTO `item` VALUES ('57', '1', '100003', '1', '0', '0', '297');
INSERT INTO `item` VALUES ('112', '3', '104007', '1', '0', '0', '4');
INSERT INTO `item` VALUES ('50', '1', '102001', '0', '0', '0', '2');
INSERT INTO `item` VALUES ('65', '1', '100003', '0', '0', '0', '127');
INSERT INTO `item` VALUES ('64', '1', '100590', '0', '0', '0', '2');
INSERT INTO `item` VALUES ('76', '1', '100582', '1', '0', '0', '6');
INSERT INTO `item` VALUES ('75', '1', '100591', '1', '0', '0', '3');
INSERT INTO `item` VALUES ('120', '4', '100001', '0', '0', '0', '95');
INSERT INTO `item` VALUES ('85', '1', '105101', '1', '0', '0', '33');
INSERT INTO `item` VALUES ('490', '9', '101501', '0', '0', '0', '3');
INSERT INTO `item` VALUES ('89', '3', '100001', '0', '0', '0', '997');
INSERT INTO `item` VALUES ('94', '5', '105001', '1', '0', '0', '10');
INSERT INTO `item` VALUES ('111', '3', '104002', '1', '0', '0', '6');
INSERT INTO `item` VALUES ('98', '5', '104004', '1', '0', '0', '6');
INSERT INTO `item` VALUES ('100', '5', '104006', '1', '0', '0', '4');
INSERT INTO `item` VALUES ('102', '5', '104008', '1', '0', '0', '2');
INSERT INTO `item` VALUES ('105', '5', '104003', '1', '0', '0', '4');
INSERT INTO `item` VALUES ('109', '3', '105201', '1', '0', '0', '31');
INSERT INTO `item` VALUES ('220', '3', '107757', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('376', '9', '100599', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('114', '3', '104004', '1', '0', '0', '4');
INSERT INTO `item` VALUES ('118', '3', '104006', '1', '0', '0', '2');
INSERT INTO `item` VALUES ('147', '3', '105101', '0', '0', '0', '2');
INSERT INTO `item` VALUES ('128', '4', '100001', '1', '0', '0', '98');
INSERT INTO `item` VALUES ('192', '7', '105001', '0', '0', '0', '21');
INSERT INTO `item` VALUES ('144', '3', '100599', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('139', '7', '100001', '0', '0', '0', '59');
INSERT INTO `item` VALUES ('135', '4', '100002', '1', '0', '0', '197');
INSERT INTO `item` VALUES ('149', '3', '600012', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('141', '3', '100591', '1', '0', '0', '2');
INSERT INTO `item` VALUES ('140', '3', '107504', '1', '0', '0', '16');
INSERT INTO `item` VALUES ('145', '3', '100582', '0', '0', '0', '1');
INSERT INTO `item` VALUES ('151', '3', '105101', '1', '0', '0', '22');
INSERT INTO `item` VALUES ('155', '3', '103501', '1', '0', '0', '3');
INSERT INTO `item` VALUES ('158', '3', '102501', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('161', '3', '600027', '0', '0', '0', '1');
INSERT INTO `item` VALUES ('247', '1', '600010', '0', '0', '0', '9');
INSERT INTO `item` VALUES ('168', '3', '101001', '1', '0', '0', '11');
INSERT INTO `item` VALUES ('269', '7', '101001', '1', '0', '0', '5');
INSERT INTO `item` VALUES ('174', '3', '600011', '0', '0', '0', '1');
INSERT INTO `item` VALUES ('182', '7', '100001', '1', '0', '0', '98');
INSERT INTO `item` VALUES ('245', '7', '106501', '0', '0', '0', '10');
INSERT INTO `item` VALUES ('243', '7', '100599', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('237', '3', '105001', '1', '0', '0', '5');
INSERT INTO `item` VALUES ('217', '7', '101001', '0', '0', '0', '10');
INSERT INTO `item` VALUES ('226', '3', '107003', '1', '0', '0', '2');
INSERT INTO `item` VALUES ('218', '3', '100004', '0', '0', '0', '8');
INSERT INTO `item` VALUES ('197', '3', '101451', '1', '0', '0', '2');
INSERT INTO `item` VALUES ('214', '3', '100592', '1', '0', '0', '2');
INSERT INTO `item` VALUES ('240', '7', '100591', '1', '0', '0', '5');
INSERT INTO `item` VALUES ('213', '3', '100594', '1', '0', '0', '4');
INSERT INTO `item` VALUES ('235', '3', '600011', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('234', '3', '101501', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('239', '7', '107504', '1', '0', '0', '5');
INSERT INTO `item` VALUES ('248', '1', '107003', '0', '0', '0', '976');
INSERT INTO `item` VALUES ('249', '7', '100002', '0', '0', '0', '201');
INSERT INTO `item` VALUES ('306', '1', '105201', '1', '0', '0', '4');
INSERT INTO `item` VALUES ('253', '7', '100002', '1', '0', '0', '198');
INSERT INTO `item` VALUES ('291', '7', '100003', '0', '0', '0', '127');
INSERT INTO `item` VALUES ('270', '7', '101501', '0', '0', '0', '13');
INSERT INTO `item` VALUES ('329', '8', '600027', '0', '0', '0', '1');
INSERT INTO `item` VALUES ('268', '7', '105201', '0', '0', '0', '1');
INSERT INTO `item` VALUES ('287', '7', '100003', '1', '0', '0', '296');
INSERT INTO `item` VALUES ('281', '7', '102001', '0', '0', '0', '10');
INSERT INTO `item` VALUES ('639', '4', '100003', '1', '0', '0', '99');
INSERT INTO `item` VALUES ('301', '1', '600012', '1', '0', '0', '5');
INSERT INTO `item` VALUES ('293', '1', '200014', '0', '0', '0', '7');
INSERT INTO `item` VALUES ('313', '1', '105001', '1', '0', '0', '4');
INSERT INTO `item` VALUES ('317', '4', '101001', '0', '0', '0', '10');
INSERT INTO `item` VALUES ('596', '7', '100582', '1', '0', '0', '3');
INSERT INTO `item` VALUES ('324', '8', '100001', '0', '0', '0', '99');
INSERT INTO `item` VALUES ('337', '7', '100001', '0', '0', '0', '998');
INSERT INTO `item` VALUES ('336', '9', '100001', '0', '0', '0', '99');
INSERT INTO `item` VALUES ('334', '4', '100002', '0', '0', '0', '200');
INSERT INTO `item` VALUES ('339', '7', '100001', '0', '0', '0', '890');
INSERT INTO `item` VALUES ('645', '4', '105001', '0', '0', '0', '20');
INSERT INTO `item` VALUES ('351', '4', '107003', '1', '0', '0', '16');
INSERT INTO `item` VALUES ('369', '9', '100001', '1', '0', '0', '99');
INSERT INTO `item` VALUES ('373', '9', '100591', '1', '0', '0', '5');
INSERT INTO `item` VALUES ('426', '9', '600027', '0', '0', '0', '1');
INSERT INTO `item` VALUES ('389', '9', '106501', '0', '0', '0', '3');
INSERT INTO `item` VALUES ('448', '9', '100003', '1', '0', '0', '297');
INSERT INTO `item` VALUES ('372', '9', '107504', '1', '0', '0', '5');
INSERT INTO `item` VALUES ('398', '9', '100002', '1', '0', '0', '198');
INSERT INTO `item` VALUES ('427', '9', '108105', '0', '0', '0', '10');
INSERT INTO `item` VALUES ('475', '9', '100004', '0', '0', '0', '7');
INSERT INTO `item` VALUES ('403', '9', '100002', '0', '0', '0', '201');
INSERT INTO `item` VALUES ('414', '9', '101001', '1', '0', '0', '5');
INSERT INTO `item` VALUES ('464', '1', '100592', '1', '0', '0', '2');
INSERT INTO `item` VALUES ('434', '9', '107003', '1', '0', '0', '19');
INSERT INTO `item` VALUES ('442', '9', '107003', '0', '0', '0', '2');
INSERT INTO `item` VALUES ('492', '9', '100581', '1', '0', '0', '2');
INSERT INTO `item` VALUES ('444', '9', '105001', '0', '0', '0', '11');
INSERT INTO `item` VALUES ('485', '9', '100582', '1', '0', '0', '3');
INSERT INTO `item` VALUES ('462', '1', '100004', '1', '0', '0', '99');
INSERT INTO `item` VALUES ('453', '9', '100003', '0', '0', '0', '118');
INSERT INTO `item` VALUES ('567', '7', '100004', '0', '0', '0', '4');
INSERT INTO `item` VALUES ('527', '9', '105101', '1', '0', '0', '10');
INSERT INTO `item` VALUES ('488', '9', '600015', '1', '0', '0', '3');
INSERT INTO `item` VALUES ('496', '9', '100590', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('530', '9', '108985', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('512', '1', '107003', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('504', '1', '100004', '0', '0', '0', '3');
INSERT INTO `item` VALUES ('551', '4', '105201', '0', '0', '0', '11');
INSERT INTO `item` VALUES ('552', '4', '101001', '1', '0', '0', '5');
INSERT INTO `item` VALUES ('554', '4', '101501', '0', '0', '0', '4');
INSERT INTO `item` VALUES ('634', '4', '100003', '0', '0', '0', '111');
INSERT INTO `item` VALUES ('570', '7', '100590', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('573', '7', '102001', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('576', '7', '600010', '1', '0', '0', '2');
INSERT INTO `item` VALUES ('578', '7', '600011', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('579', '7', '106001', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('641', '4', '108983', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('631', '4', '106501', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('602', '9', '105201', '0', '0', '0', '2');
INSERT INTO `item` VALUES ('627', '4', '100590', '0', '0', '0', '1');
INSERT INTO `item` VALUES ('657', '7', '105101', '1', '0', '0', '10');
INSERT INTO `item` VALUES ('660', '7', '108985', '1', '0', '0', '1');
INSERT INTO `item` VALUES ('651', '9', '100594', '0', '0', '0', '1');
INSERT INTO `item` VALUES ('684', '4', '100004', '0', '0', '0', '3');

-- ----------------------------
-- Table structure for `lockaccount`
-- ----------------------------
DROP TABLE IF EXISTS `lockaccount`;
CREATE TABLE `lockaccount` (
  `account` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of lockaccount
-- ----------------------------

-- ----------------------------
-- Table structure for `luckyquest`
-- ----------------------------
DROP TABLE IF EXISTS `luckyquest`;
CREATE TABLE `luckyquest` (
  `id` int(20) unsigned NOT NULL DEFAULT '0',
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `taskid` int(20) unsigned NOT NULL DEFAULT '0',
  `progress` int(4) unsigned NOT NULL DEFAULT '0',
  `acceptlevel` int(4) unsigned NOT NULL DEFAULT '0',
  `quality` int(20) unsigned NOT NULL DEFAULT '0',
  `additional` float DEFAULT NULL,
  `things` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of luckyquest
-- ----------------------------

-- ----------------------------
-- Table structure for `luckytoken`
-- ----------------------------
DROP TABLE IF EXISTS `luckytoken`;
CREATE TABLE `luckytoken` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `rechargenum` int(20) unsigned NOT NULL DEFAULT '0',
  `rewardstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of luckytoken
-- ----------------------------
INSERT INTO `luckytoken` VALUES ('8', '1000', '');
INSERT INTO `luckytoken` VALUES ('9', '1000', '');

-- ----------------------------
-- Table structure for `maid`
-- ----------------------------
DROP TABLE IF EXISTS `maid`;
CREATE TABLE `maid` (
  `characterid` int(10) NOT NULL,
  `maidid` int(10) NOT NULL,
  `theterm` bigint(20) NOT NULL DEFAULT '0',
  `maidskill` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `hp` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` int(10) NOT NULL DEFAULT '0',
  `stageid` int(10) NOT NULL DEFAULT '0',
  `bless` int(4) unsigned NOT NULL DEFAULT '0',
  `countdown` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advancedtimes` int(4) unsigned NOT NULL DEFAULT '0',
  `appendage` smallint(2) NOT NULL DEFAULT '0',
  `appendagecdendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dannum` int(10) NOT NULL DEFAULT '0',
  `revive_time` int(11) NOT NULL DEFAULT '0',
  `fitcdendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `critsymbolvalue` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`,`maidid`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of maid
-- ----------------------------
INSERT INTO `maid` VALUES ('1', '1', '1417660829', '', '1068', '1', '2', '0', '1970-01-01 08:00:00', '0', '0', null, '0', '0', null, '0', null, '363');
INSERT INTO `maid` VALUES ('3', '1', '0', '', '495', '1', '1', '0', null, '0', '0', null, '0', '0', null, '0', null, '156');
INSERT INTO `maid` VALUES ('5', '1', '1417664991', '', '592', '1', '1', '0', null, '0', '0', null, '0', '0', null, '0', null, '0');
INSERT INTO `maid` VALUES ('7', '1', '1417786059', '', '510', '1', '1', '0', null, '0', '0', null, '0', '0', null, '0', null, '130');
INSERT INTO `maid` VALUES ('8', '1', '0', '', '287', '1', '1', '0', null, '0', '0', null, '0', '0', null, '0', null, '85');
INSERT INTO `maid` VALUES ('9', '1', '0', '', '1068', '1', '2', '0', '1970-01-01 08:00:00', '0', '0', null, '0', '0', null, '0', null, '420');
INSERT INTO `maid` VALUES ('4', '1', '1417799958', '', '996', '1', '2', '49', '1970-01-01 08:00:00', '4', '0', null, '0', '0', null, '0', null, '307');

-- ----------------------------
-- Table structure for `mail`
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `id` int(20) unsigned NOT NULL DEFAULT '0',
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `textid` int(20) unsigned NOT NULL DEFAULT '0',
  `textvalue` int(20) unsigned NOT NULL DEFAULT '0',
  `money` int(20) unsigned NOT NULL DEFAULT '0',
  `emoney` int(20) unsigned NOT NULL DEFAULT '0',
  `content` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `things` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of mail
-- ----------------------------

-- ----------------------------
-- Table structure for `maincityguild`
-- ----------------------------
DROP TABLE IF EXISTS `maincityguild`;
CREATE TABLE `maincityguild` (
  `sceneid` int(10) unsigned NOT NULL DEFAULT '0',
  `guildid` int(10) unsigned DEFAULT NULL,
  `occupytime` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`sceneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of maincityguild
-- ----------------------------

-- ----------------------------
-- Table structure for `maketeam`
-- ----------------------------
DROP TABLE IF EXISTS `maketeam`;
CREATE TABLE `maketeam` (
  `characterid` int(10) NOT NULL,
  `groupid` int(10) NOT NULL,
  `autoinviteintogroup` smallint(2) NOT NULL DEFAULT '0',
  `autoqueryintogroup` smallint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of maketeam
-- ----------------------------
INSERT INTO `maketeam` VALUES ('1', '0', '1', '1');
INSERT INTO `maketeam` VALUES ('2', '0', '1', '1');
INSERT INTO `maketeam` VALUES ('3', '0', '1', '1');
INSERT INTO `maketeam` VALUES ('4', '0', '1', '1');
INSERT INTO `maketeam` VALUES ('5', '0', '1', '1');
INSERT INTO `maketeam` VALUES ('6', '0', '1', '1');
INSERT INTO `maketeam` VALUES ('7', '0', '1', '1');
INSERT INTO `maketeam` VALUES ('8', '0', '1', '1');
INSERT INTO `maketeam` VALUES ('9', '0', '1', '1');

-- ----------------------------
-- Table structure for `metals`
-- ----------------------------
DROP TABLE IF EXISTS `metals`;
CREATE TABLE `metals` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `grownvalue` int(10) unsigned NOT NULL DEFAULT '0',
  `growntimes` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of metals
-- ----------------------------
INSERT INTO `metals` VALUES ('3', '7000', '[6,2]', '396');

-- ----------------------------
-- Table structure for `monthsign`
-- ----------------------------
DROP TABLE IF EXISTS `monthsign`;
CREATE TABLE `monthsign` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `dailysignstatus` int(4) unsigned NOT NULL DEFAULT '0',
  `totalsignstatus` int(4) unsigned NOT NULL DEFAULT '0',
  `resigntimes` int(4) unsigned NOT NULL DEFAULT '0',
  `totalsignnum` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of monthsign
-- ----------------------------
INSERT INTO `monthsign` VALUES ('1', '0', '0', '0', '0');
INSERT INTO `monthsign` VALUES ('2', '0', '0', '0', '0');
INSERT INTO `monthsign` VALUES ('3', '19', '2', '2', '3');
INSERT INTO `monthsign` VALUES ('4', '0', '0', '0', '0');
INSERT INTO `monthsign` VALUES ('5', '0', '0', '0', '0');
INSERT INTO `monthsign` VALUES ('6', '0', '0', '0', '0');
INSERT INTO `monthsign` VALUES ('7', '0', '0', '0', '0');
INSERT INTO `monthsign` VALUES ('8', '0', '0', '0', '0');
INSERT INTO `monthsign` VALUES ('9', '32', '0', '0', '1');

-- ----------------------------
-- Table structure for `multipleexp`
-- ----------------------------
DROP TABLE IF EXISTS `multipleexp`;
CREATE TABLE `multipleexp` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `multipleexp` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buffdesc` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of multipleexp
-- ----------------------------

-- ----------------------------
-- Table structure for `muse`
-- ----------------------------
DROP TABLE IF EXISTS `muse`;
CREATE TABLE `muse` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `musetype` int(4) unsigned NOT NULL DEFAULT '0',
  `realm` int(4) unsigned NOT NULL DEFAULT '0',
  `stageid` int(4) unsigned NOT NULL DEFAULT '0',
  `bless` int(4) unsigned NOT NULL DEFAULT '0',
  `countdown` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `musecdendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advancedtimes` int(4) unsigned NOT NULL DEFAULT '0',
  `potentialnum` int(4) unsigned NOT NULL DEFAULT '0',
  `illusionnum` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolvalue` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of muse
-- ----------------------------
INSERT INTO `muse` VALUES ('3', '0', '1', '1', '0', '1970-01-01 08:00:00', null, '0', '0', '0', '0', '1970-01-01 08:00:00', '2115');
INSERT INTO `muse` VALUES ('9', '0', '1', '1', '0', '1970-01-01 08:00:00', null, '0', '0', '0', '0', '1970-01-01 08:00:00', '2115');

-- ----------------------------
-- Table structure for `newguild`
-- ----------------------------
DROP TABLE IF EXISTS `newguild`;
CREATE TABLE `newguild` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `completenewguildids` binary(255) DEFAULT NULL,
  `newguildrecord` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of newguild
-- ----------------------------
INSERT INTO `newguild` VALUES ('1', 0x8080808080808080808080808080808FFE8080808080808080808080B0FC808080808080808080808080C08080808080808080808080808080FE83F7818080808080808080808098000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '');
INSERT INTO `newguild` VALUES ('2', 0x80808080808080808080808080808080C280808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '');
INSERT INTO `newguild` VALUES ('3', 0x8080808080808080808080808080808FF68080808080808080808080B0FC808080808080808080808080C08080808080808080808080808080FEC1FF818080808080808080808098000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '');
INSERT INTO `newguild` VALUES ('4', 0x8080808080808080808080808080808DF68080808080808080808080B09C808080808080808080808080C08080808080808080808080808080FE81F3808080808080808080808098000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '');
INSERT INTO `newguild` VALUES ('5', 0x8080808080808080808080808080808FF68080808080808080808080B0FC808080808080808080808080C08080808080808080808080808080FE81F3818080808080808080808098000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '');
INSERT INTO `newguild` VALUES ('6', 0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '');
INSERT INTO `newguild` VALUES ('7', 0x8080808080808080808080808080808FF68080808080808080808080B0FC808080808080808080808080C08080808080808080808080808080FE81F7818080808080808080808098000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '');
INSERT INTO `newguild` VALUES ('8', 0x80808080808080808080808080808080C280808080808080808080808080808080808080808080808080808080808080808080808080808080908080808080808080808080808088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '');
INSERT INTO `newguild` VALUES ('9', 0x8080808080808080808080808080808FFE8080808080808080808080B0BC808080808080808080808080C08080808080808080808080808080FEC3FF818080808080808080808098000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '');

-- ----------------------------
-- Table structure for `noviceprocess`
-- ----------------------------
DROP TABLE IF EXISTS `noviceprocess`;
CREATE TABLE `noviceprocess` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `completetask` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of noviceprocess
-- ----------------------------

-- ----------------------------
-- Table structure for `onlinereward`
-- ----------------------------
DROP TABLE IF EXISTS `onlinereward`;
CREATE TABLE `onlinereward` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `onlinetime` int(4) unsigned NOT NULL DEFAULT '0',
  `rewardstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of onlinereward
-- ----------------------------
INSERT INTO `onlinereward` VALUES ('1', '3618', '[-1][-1][-1][-1]');
INSERT INTO `onlinereward` VALUES ('2', '2062', '[-1][-1][-1][-1]');
INSERT INTO `onlinereward` VALUES ('3', '45', '[-1][-1][-1][-1]');
INSERT INTO `onlinereward` VALUES ('4', '573', '[-1][-1][-1][-1]');
INSERT INTO `onlinereward` VALUES ('5', '3559', '[-1][-1][-1][-1]');
INSERT INTO `onlinereward` VALUES ('6', '1289', '[-1][-1][-1][-1]');
INSERT INTO `onlinereward` VALUES ('7', '0', '[-1][-1][-1][-1]');
INSERT INTO `onlinereward` VALUES ('8', '74', '[-1][-1][-1][-1]');
INSERT INTO `onlinereward` VALUES ('9', '0', '[1][12][2][17]');

-- ----------------------------
-- Table structure for `plotbattle`
-- ----------------------------
DROP TABLE IF EXISTS `plotbattle`;
CREATE TABLE `plotbattle` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `topbattle` int(4) unsigned NOT NULL DEFAULT '0',
  `battletimes` text COLLATE utf8_unicode_ci,
  `cleantime` text COLLATE utf8_unicode_ci,
  `raidsbattle` int(10) unsigned NOT NULL DEFAULT '0',
  `raidstime` int(4) unsigned NOT NULL DEFAULT '0',
  `autoraids` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of plotbattle
-- ----------------------------
INSERT INTO `plotbattle` VALUES ('1', '1', '', '[1,86]', '0', '33', '0');
INSERT INTO `plotbattle` VALUES ('3', '2', '', '[1,27][2,57]', '0', '1', '0');
INSERT INTO `plotbattle` VALUES ('5', '0', '', '', '0', '0', '0');
INSERT INTO `plotbattle` VALUES ('2', '0', '', '', '0', '0', '0');
INSERT INTO `plotbattle` VALUES ('4', '1', '[1,1,1]', '[1,111]', '0', '313', '0');
INSERT INTO `plotbattle` VALUES ('7', '1', '', '[1,133]', '0', '30', '0');
INSERT INTO `plotbattle` VALUES ('9', '1', '[1,1,1]', '[1,22]', '0', '513', '0');

-- ----------------------------
-- Table structure for `plotquest`
-- ----------------------------
DROP TABLE IF EXISTS `plotquest`;
CREATE TABLE `plotquest` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `taskid` int(20) unsigned NOT NULL DEFAULT '0',
  `progress` int(4) unsigned NOT NULL DEFAULT '0',
  `taskflag` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of plotquest
-- ----------------------------
INSERT INTO `plotquest` VALUES ('1', '110013', '0', '1');
INSERT INTO `plotquest` VALUES ('2', '10001', '0', '2');
INSERT INTO `plotquest` VALUES ('3', '110007', '0', '1');
INSERT INTO `plotquest` VALUES ('4', '110001', '0', '1');
INSERT INTO `plotquest` VALUES ('5', '10094', '0', '1');
INSERT INTO `plotquest` VALUES ('6', '10001', '0', '2');
INSERT INTO `plotquest` VALUES ('7', '110007', '0', '1');
INSERT INTO `plotquest` VALUES ('8', '10007', '0', '1');
INSERT INTO `plotquest` VALUES ('9', '10105', '0', '1');

-- ----------------------------
-- Table structure for `prizebox`
-- ----------------------------
DROP TABLE IF EXISTS `prizebox`;
CREATE TABLE `prizebox` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `battletype` int(10) unsigned NOT NULL DEFAULT '0',
  `battleid` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `emoney` int(10) unsigned NOT NULL DEFAULT '0',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  `unitpower` int(10) unsigned NOT NULL DEFAULT '0',
  `vouchers` int(10) unsigned NOT NULL DEFAULT '0',
  `story` int(10) unsigned NOT NULL DEFAULT '0',
  `scorereward` int(10) NOT NULL DEFAULT '0',
  `vipreward` int(10) NOT NULL DEFAULT '0',
  `thing` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of prizebox
-- ----------------------------

-- ----------------------------
-- Table structure for `puppet`
-- ----------------------------
DROP TABLE IF EXISTS `puppet`;
CREATE TABLE `puppet` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` int(4) unsigned NOT NULL DEFAULT '0',
  `stageid` int(4) unsigned NOT NULL DEFAULT '0',
  `potentialnum` int(4) unsigned NOT NULL DEFAULT '0',
  `illusionnum` int(4) unsigned NOT NULL DEFAULT '0',
  `bless` int(4) unsigned NOT NULL DEFAULT '0',
  `countdown` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skillslot` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advancedtimes` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolvalue` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of puppet
-- ----------------------------
INSERT INTO `puppet` VALUES ('1', '1', '2', '0', '0', '0', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '0', '0', '1970-01-01 08:00:00', '1393');
INSERT INTO `puppet` VALUES ('3', '1', '1', '0', '0', '0', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '0', '0', '1970-01-01 08:00:00', '678');
INSERT INTO `puppet` VALUES ('5', '1', '1', '0', '0', '0', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '0', '0', '1970-01-01 08:00:00', '678');
INSERT INTO `puppet` VALUES ('7', '1', '1', '0', '0', '0', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '0', '0', '1970-01-01 08:00:00', '678');
INSERT INTO `puppet` VALUES ('9', '1', '2', '0', '0', '56', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '4', '0', '1970-01-01 08:00:00', '1393');
INSERT INTO `puppet` VALUES ('4', '1', '2', '0', '0', '53', '1970-01-01 08:00:00', '0,-1,-1,-1,-1,-1', '4', '0', '1970-01-01 08:00:00', '1393');

-- ----------------------------
-- Table structure for `questtimes`
-- ----------------------------
DROP TABLE IF EXISTS `questtimes`;
CREATE TABLE `questtimes` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `times` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`,`type`),
  KEY `userId` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of questtimes
-- ----------------------------
INSERT INTO `questtimes` VALUES ('1', '2', '9');
INSERT INTO `questtimes` VALUES ('1', '3', '2');
INSERT INTO `questtimes` VALUES ('3', '2', '0');
INSERT INTO `questtimes` VALUES ('3', '3', '0');
INSERT INTO `questtimes` VALUES ('3', '4', '0');
INSERT INTO `questtimes` VALUES ('5', '2', '0');
INSERT INTO `questtimes` VALUES ('5', '3', '0');
INSERT INTO `questtimes` VALUES ('5', '4', '0');
INSERT INTO `questtimes` VALUES ('2', '2', '0');
INSERT INTO `questtimes` VALUES ('2', '3', '0');
INSERT INTO `questtimes` VALUES ('2', '4', '0');
INSERT INTO `questtimes` VALUES ('4', '2', '0');
INSERT INTO `questtimes` VALUES ('4', '3', '0');
INSERT INTO `questtimes` VALUES ('4', '4', '0');
INSERT INTO `questtimes` VALUES ('1', '4', '0');
INSERT INTO `questtimes` VALUES ('7', '2', '12');
INSERT INTO `questtimes` VALUES ('7', '3', '0');
INSERT INTO `questtimes` VALUES ('7', '4', '0');
INSERT INTO `questtimes` VALUES ('9', '2', '20');
INSERT INTO `questtimes` VALUES ('9', '3', '10');

-- ----------------------------
-- Table structure for `realmbattle`
-- ----------------------------
DROP TABLE IF EXISTS `realmbattle`;
CREATE TABLE `realmbattle` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `battletimes` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of realmbattle
-- ----------------------------
INSERT INTO `realmbattle` VALUES ('1', '[1,0,1]');
INSERT INTO `realmbattle` VALUES ('3', '[1,0,1][2,0,1]');
INSERT INTO `realmbattle` VALUES ('7', '[1,0,1]');
INSERT INTO `realmbattle` VALUES ('4', '[1,0,1]');
INSERT INTO `realmbattle` VALUES ('9', '[1,0,1][2,0,1]');

-- ----------------------------
-- Table structure for `rechargegift`
-- ----------------------------
DROP TABLE IF EXISTS `rechargegift`;
CREATE TABLE `rechargegift` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `rechargenum` int(20) unsigned NOT NULL DEFAULT '0',
  `rewardstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rechargegift
-- ----------------------------
INSERT INTO `rechargegift` VALUES ('8', '1000', '');
INSERT INTO `rechargegift` VALUES ('9', '1000', '');

-- ----------------------------
-- Table structure for `refine`
-- ----------------------------
DROP TABLE IF EXISTS `refine`;
CREATE TABLE `refine` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` int(4) unsigned NOT NULL DEFAULT '0',
  `stageid` int(4) unsigned NOT NULL DEFAULT '0',
  `potentialnum` int(4) unsigned NOT NULL DEFAULT '0',
  `illusionnum` int(4) unsigned NOT NULL DEFAULT '0',
  `bless` int(4) unsigned NOT NULL DEFAULT '0',
  `countdown` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skillslot` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advancedtimes` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolvalue` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of refine
-- ----------------------------

-- ----------------------------
-- Table structure for `relationer`
-- ----------------------------
DROP TABLE IF EXISTS `relationer`;
CREATE TABLE `relationer` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `fansnum` int(20) unsigned NOT NULL DEFAULT '0',
  `showoffline` int(20) unsigned NOT NULL DEFAULT '0',
  `showhead` int(20) unsigned NOT NULL DEFAULT '0',
  `mappublic` int(20) unsigned NOT NULL DEFAULT '0',
  `shieldenemies` int(20) unsigned NOT NULL DEFAULT '0',
  `mood` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autorefuse` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of relationer
-- ----------------------------
INSERT INTO `relationer` VALUES ('1', '0', '1', '1', '1', '0', '', '0');
INSERT INTO `relationer` VALUES ('2', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `relationer` VALUES ('3', '0', '1', '1', '1', '0', '', '0');
INSERT INTO `relationer` VALUES ('4', '0', '1', '1', '1', '0', '', '0');
INSERT INTO `relationer` VALUES ('5', '0', '1', '1', '1', '0', '', '0');
INSERT INTO `relationer` VALUES ('6', '0', '1', '1', '1', '0', '', '0');
INSERT INTO `relationer` VALUES ('7', '0', '0', '0', '0', '0', null, '0');
INSERT INTO `relationer` VALUES ('8', '0', '1', '1', '1', '0', '', '0');
INSERT INTO `relationer` VALUES ('9', '0', '0', '0', '0', '0', null, '0');

-- ----------------------------
-- Table structure for `repocontainer`
-- ----------------------------
DROP TABLE IF EXISTS `repocontainer`;
CREATE TABLE `repocontainer` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `repothing` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of repocontainer
-- ----------------------------
INSERT INTO `repocontainer` VALUES ('7', '[139,1418400288][182,1418400290][337,1418400299][458,1418401255][457,1418401255]');

-- ----------------------------
-- Table structure for `restriction`
-- ----------------------------
DROP TABLE IF EXISTS `restriction`;
CREATE TABLE `restriction` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `shopid` int(20) unsigned NOT NULL DEFAULT '0',
  `shelfid` int(20) unsigned NOT NULL DEFAULT '0',
  `goodsid` int(20) unsigned NOT NULL DEFAULT '0',
  `buynum` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of restriction
-- ----------------------------
INSERT INTO `restriction` VALUES ('7', '1', '6', '1', '600012', '5');
INSERT INTO `restriction` VALUES ('8', '1', '6', '1', '105201', '4');
INSERT INTO `restriction` VALUES ('9', '1', '6', '1', '105101', '3');
INSERT INTO `restriction` VALUES ('10', '1', '6', '1', '105001', '4');

-- ----------------------------
-- Table structure for `sevendays`
-- ----------------------------
DROP TABLE IF EXISTS `sevendays`;
CREATE TABLE `sevendays` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `continueddays` int(4) unsigned NOT NULL DEFAULT '0',
  `refreshcontinueddaytime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rewardstatus` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sevendays
-- ----------------------------
INSERT INTO `sevendays` VALUES ('1', '3', '2014-12-06 00:00:00', '0');
INSERT INTO `sevendays` VALUES ('2', '3', '2014-12-06 00:23:00', '0');
INSERT INTO `sevendays` VALUES ('3', '4', '2014-12-06 00:51:56', '14');
INSERT INTO `sevendays` VALUES ('4', '3', '2014-12-06 00:00:00', '0');
INSERT INTO `sevendays` VALUES ('5', '2', '2014-12-05 19:45:42', '0');
INSERT INTO `sevendays` VALUES ('6', '1', '2014-12-05 20:06:25', '0');
INSERT INTO `sevendays` VALUES ('7', '2', '2014-12-06 00:00:00', '2');
INSERT INTO `sevendays` VALUES ('8', '1', '2014-12-06 00:03:01', '0');
INSERT INTO `sevendays` VALUES ('9', '1', '2014-12-06 00:04:29', '2');

-- ----------------------------
-- Table structure for `shrinebattle`
-- ----------------------------
DROP TABLE IF EXISTS `shrinebattle`;
CREATE TABLE `shrinebattle` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `godpoint` int(10) unsigned NOT NULL DEFAULT '0',
  `todaypoint` int(10) unsigned NOT NULL DEFAULT '0',
  `cleanbattle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `daycleanbattle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shrinebattle
-- ----------------------------
INSERT INTO `shrinebattle` VALUES ('1', '0', '0', '', '');
INSERT INTO `shrinebattle` VALUES ('2', '0', '0', '', '');
INSERT INTO `shrinebattle` VALUES ('3', '0', '0', '', '');
INSERT INTO `shrinebattle` VALUES ('4', '20', '0', '[1]', '[1]');
INSERT INTO `shrinebattle` VALUES ('5', '0', '0', '', '');
INSERT INTO `shrinebattle` VALUES ('6', '0', '0', null, null);
INSERT INTO `shrinebattle` VALUES ('7', '40', '0', '[1]', '[1]');
INSERT INTO `shrinebattle` VALUES ('8', '0', '0', null, null);
INSERT INTO `shrinebattle` VALUES ('9', '20', '0', '[1]', '[1]');

-- ----------------------------
-- Table structure for `smeltvalue`
-- ----------------------------
DROP TABLE IF EXISTS `smeltvalue`;
CREATE TABLE `smeltvalue` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `equipsmelt` int(4) unsigned NOT NULL DEFAULT '0',
  `highsmelt` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of smeltvalue
-- ----------------------------
INSERT INTO `smeltvalue` VALUES ('1', '450', '0');
INSERT INTO `smeltvalue` VALUES ('2', '0', '0');
INSERT INTO `smeltvalue` VALUES ('3', '0', '0');
INSERT INTO `smeltvalue` VALUES ('4', '0', '0');
INSERT INTO `smeltvalue` VALUES ('5', '0', '0');
INSERT INTO `smeltvalue` VALUES ('6', '0', '0');
INSERT INTO `smeltvalue` VALUES ('7', '0', '0');
INSERT INTO `smeltvalue` VALUES ('8', '0', '0');
INSERT INTO `smeltvalue` VALUES ('9', '240', '0');

-- ----------------------------
-- Table structure for `stamp`
-- ----------------------------
DROP TABLE IF EXISTS `stamp`;
CREATE TABLE `stamp` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` int(4) unsigned NOT NULL DEFAULT '0',
  `stageid` int(4) unsigned NOT NULL DEFAULT '0',
  `bless` int(4) unsigned NOT NULL DEFAULT '0',
  `countdown` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skillslot` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advancedtimes` int(4) unsigned NOT NULL DEFAULT '0',
  `potentialnum` int(4) unsigned NOT NULL DEFAULT '0',
  `illusionnum` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolvalue` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stamp
-- ----------------------------

-- ----------------------------
-- Table structure for `stranger`
-- ----------------------------
DROP TABLE IF EXISTS `stranger`;
CREATE TABLE `stranger` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `characterid_target` int(20) unsigned NOT NULL DEFAULT '0',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`,`characterid_target`),
  KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stranger
-- ----------------------------

-- ----------------------------
-- Table structure for `swallowtimes`
-- ----------------------------
DROP TABLE IF EXISTS `swallowtimes`;
CREATE TABLE `swallowtimes` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `times` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of swallowtimes
-- ----------------------------
INSERT INTO `swallowtimes` VALUES ('3', '0');
INSERT INTO `swallowtimes` VALUES ('5', '0');
INSERT INTO `swallowtimes` VALUES ('2', '0');
INSERT INTO `swallowtimes` VALUES ('4', '0');
INSERT INTO `swallowtimes` VALUES ('1', '0');
INSERT INTO `swallowtimes` VALUES ('7', '0');

-- ----------------------------
-- Table structure for `sword`
-- ----------------------------
DROP TABLE IF EXISTS `sword`;
CREATE TABLE `sword` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `emoneytimes` int(10) unsigned NOT NULL DEFAULT '0',
  `moneytimes` int(10) unsigned NOT NULL DEFAULT '0',
  `emoneytimestotals` int(10) unsigned NOT NULL DEFAULT '0',
  `joinactivitystatus` int(10) unsigned NOT NULL DEFAULT '0',
  `lastemoneytime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sword
-- ----------------------------
INSERT INTO `sword` VALUES ('3', '0', '0', '0', '0', '1970-01-01 08:00:00');
INSERT INTO `sword` VALUES ('5', '0', '0', '0', '0', '1970-01-01 08:00:00');
INSERT INTO `sword` VALUES ('2', '0', '0', '0', '0', '1970-01-01 08:00:00');
INSERT INTO `sword` VALUES ('4', '0', '0', '0', '0', '1970-01-01 08:00:00');
INSERT INTO `sword` VALUES ('1', '0', '0', '0', '0', '1970-01-01 08:00:00');
INSERT INTO `sword` VALUES ('7', '0', '0', '0', '0', '1970-01-01 08:00:00');

-- ----------------------------
-- Table structure for `system`
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `openservertime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closeservertime` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`openservertime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES ('2014-12-04 09:49:38', '0');

-- ----------------------------
-- Table structure for `talisman`
-- ----------------------------
DROP TABLE IF EXISTS `talisman`;
CREATE TABLE `talisman` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `bshow` int(4) unsigned NOT NULL DEFAULT '0',
  `realm` int(4) unsigned NOT NULL DEFAULT '0',
  `stageid` int(4) unsigned NOT NULL DEFAULT '0',
  `potentialnum` int(4) unsigned NOT NULL DEFAULT '0',
  `illusionnum` int(4) unsigned NOT NULL DEFAULT '0',
  `bless` int(4) unsigned NOT NULL DEFAULT '0',
  `countdown` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skillslot` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advancedtimes` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolvalue` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of talisman
-- ----------------------------

-- ----------------------------
-- Table structure for `teambattletimes`
-- ----------------------------
DROP TABLE IF EXISTS `teambattletimes`;
CREATE TABLE `teambattletimes` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `wingsnake` int(10) unsigned NOT NULL DEFAULT '0',
  `guardcloudcity` int(10) unsigned NOT NULL DEFAULT '0',
  `guardvein` int(10) unsigned NOT NULL DEFAULT '0',
  `dragonarray` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of teambattletimes
-- ----------------------------
INSERT INTO `teambattletimes` VALUES ('1', '0', '0', '0', '0');
INSERT INTO `teambattletimes` VALUES ('2', '0', '0', '0', '0');
INSERT INTO `teambattletimes` VALUES ('3', '0', '0', '0', '0');
INSERT INTO `teambattletimes` VALUES ('4', '0', '0', '0', '0');
INSERT INTO `teambattletimes` VALUES ('5', '0', '0', '0', '0');
INSERT INTO `teambattletimes` VALUES ('6', '0', '0', '0', '0');
INSERT INTO `teambattletimes` VALUES ('7', '1', '0', '0', '0');
INSERT INTO `teambattletimes` VALUES ('8', '0', '0', '0', '0');
INSERT INTO `teambattletimes` VALUES ('9', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `territoryguild`
-- ----------------------------
DROP TABLE IF EXISTS `territoryguild`;
CREATE TABLE `territoryguild` (
  `sceneid` int(10) unsigned NOT NULL DEFAULT '0',
  `guildid` int(10) unsigned DEFAULT NULL,
  `occupytime` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`sceneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of territoryguild
-- ----------------------------
INSERT INTO `territoryguild` VALUES ('6008', '1', '1417796357');

-- ----------------------------
-- Table structure for `territoryreward`
-- ----------------------------
DROP TABLE IF EXISTS `territoryreward`;
CREATE TABLE `territoryreward` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `territory` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of territoryreward
-- ----------------------------
INSERT INTO `territoryreward` VALUES ('3', '');
INSERT INTO `territoryreward` VALUES ('5', '');
INSERT INTO `territoryreward` VALUES ('2', '');
INSERT INTO `territoryreward` VALUES ('4', '');
INSERT INTO `territoryreward` VALUES ('1', '');
INSERT INTO `territoryreward` VALUES ('7', '');

-- ----------------------------
-- Table structure for `todayquest`
-- ----------------------------
DROP TABLE IF EXISTS `todayquest`;
CREATE TABLE `todayquest` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `taskid` int(20) unsigned NOT NULL DEFAULT '0',
  `progress` int(4) unsigned NOT NULL DEFAULT '0',
  `acceptlevel` int(4) unsigned NOT NULL DEFAULT '0',
  `difficulty` int(4) unsigned NOT NULL DEFAULT '0',
  `repay` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of todayquest
-- ----------------------------
INSERT INTO `todayquest` VALUES ('1', '11', '0', '60', '3', '8');
INSERT INTO `todayquest` VALUES ('3', '2', '0', '51', '3', '8');
INSERT INTO `todayquest` VALUES ('5', '5', '0', '73', '3', '8');
INSERT INTO `todayquest` VALUES ('7', '1', '20', '55', '3', '8');
INSERT INTO `todayquest` VALUES ('4', '3', '0', '49', '3', '8');

-- ----------------------------
-- Table structure for `treasure`
-- ----------------------------
DROP TABLE IF EXISTS `treasure`;
CREATE TABLE `treasure` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `times` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of treasure
-- ----------------------------
INSERT INTO `treasure` VALUES ('3', '0,0,0');
INSERT INTO `treasure` VALUES ('5', '0,0,0');
INSERT INTO `treasure` VALUES ('2', '0,0,0');
INSERT INTO `treasure` VALUES ('4', '0,0,0');
INSERT INTO `treasure` VALUES ('1', '0,0,0');
INSERT INTO `treasure` VALUES ('7', '0,0,0');

-- ----------------------------
-- Table structure for `turntablepersonal`
-- ----------------------------
DROP TABLE IF EXISTS `turntablepersonal`;
CREATE TABLE `turntablepersonal` (
  `serialnumber` int(10) unsigned NOT NULL DEFAULT '0',
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lotteryid` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serialnumber`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of turntablepersonal
-- ----------------------------

-- ----------------------------
-- Table structure for `turntablerecord`
-- ----------------------------
DROP TABLE IF EXISTS `turntablerecord`;
CREATE TABLE `turntablerecord` (
  `serialnumber` int(10) unsigned NOT NULL DEFAULT '0',
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lotteryId` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serialnumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of turntablerecord
-- ----------------------------

-- ----------------------------
-- Table structure for `vip`
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `viplev` int(10) unsigned NOT NULL DEFAULT '0',
  `vipexp` int(10) unsigned NOT NULL DEFAULT '0',
  `giftstatus` int(10) unsigned NOT NULL DEFAULT '0',
  `weekgiftstatus` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('3', '4', '1000', '16', '16');
INSERT INTO `vip` VALUES ('8', '4', '1000', '0', '0');
INSERT INTO `vip` VALUES ('9', '4', '1000', '0', '0');

-- ----------------------------
-- Table structure for `vipbattle`
-- ----------------------------
DROP TABLE IF EXISTS `vipbattle`;
CREATE TABLE `vipbattle` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `battletimes` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vipbattle
-- ----------------------------
INSERT INTO `vipbattle` VALUES ('3', '');
INSERT INTO `vipbattle` VALUES ('5', '');
INSERT INTO `vipbattle` VALUES ('2', '');
INSERT INTO `vipbattle` VALUES ('4', '');
INSERT INTO `vipbattle` VALUES ('1', '');
INSERT INTO `vipbattle` VALUES ('7', '');

-- ----------------------------
-- Table structure for `welfarecommon`
-- ----------------------------
DROP TABLE IF EXISTS `welfarecommon`;
CREATE TABLE `welfarecommon` (
  `characterid` int(20) unsigned NOT NULL DEFAULT '0',
  `coronausemoneytoday` int(20) unsigned NOT NULL DEFAULT '0',
  `offlineexp` int(20) unsigned NOT NULL DEFAULT '0',
  `turntablescore` int(20) unsigned NOT NULL DEFAULT '0',
  `updayrewardstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `findresourcestimes` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activestatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activerewardstatus` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of welfarecommon
-- ----------------------------
INSERT INTO `welfarecommon` VALUES ('1', '0', '720', '0', '(null)', '[1,0][2,1][3,1][4,0][5,2][6,4][7,2][8,1][9,0][10,10][11,16][12,18][13,0][14,0]', '[1,9][2,2]', '0');
INSERT INTO `welfarecommon` VALUES ('2', '0', '0', '0', '(null)', '[1,0][2,1][3,1][4,0][5,0][6,4][7,3][8,1][9,0][10,10][11,20][12,0][13,0][14,0]', '', '0');
INSERT INTO `welfarecommon` VALUES ('3', '0', '233', '0', '(null)', '[1,0][2,1][3,1][4,0][5,1][6,4][7,2][8,1][9,0][10,12][11,20][12,20][13,0][14,0]', '[15,4]', '0');
INSERT INTO `welfarecommon` VALUES ('4', '0', '203', '0', '(null)', '[1,0][2,1][3,1][4,0][5,0][6,4][7,3][8,1][9,0][10,10][11,20][12,0][13,0][14,0]', '[7,1][20,1][13,1][24,1]', '0');
INSERT INTO `welfarecommon` VALUES ('5', '0', '720', '0', '(null)', '[1,0][2,0][3,1][4,0][5,5][6,4][7,3][8,1][9,0][10,10][11,20][12,20][13,0][14,0]', '', '0');
INSERT INTO `welfarecommon` VALUES ('6', '0', '0', '0', '(null)', '(null)', '(null)', '0');
INSERT INTO `welfarecommon` VALUES ('7', '1', '176', '0', '(null)', '(null)', '[24,2][13,2][1,12][22,1][14,1][21,1]', '0');
INSERT INTO `welfarecommon` VALUES ('8', '0', '0', '0', '(null)', '(null)', '[15,4]', '0');
INSERT INTO `welfarecommon` VALUES ('9', '1', '0', '0', '(null)', '(null)', '[7,1][15,4][20,1][13,2][24,1][1,20][22,1][14,1][2,10][11,1][21,1]', '0');

-- ----------------------------
-- Table structure for `wing`
-- ----------------------------
DROP TABLE IF EXISTS `wing`;
CREATE TABLE `wing` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `bshow` int(4) unsigned NOT NULL DEFAULT '0',
  `realm` int(4) unsigned NOT NULL DEFAULT '0',
  `stageid` int(4) unsigned NOT NULL DEFAULT '0',
  `potentialnum` int(4) unsigned NOT NULL DEFAULT '0',
  `illusionnum` int(4) unsigned NOT NULL DEFAULT '0',
  `bless` int(4) unsigned NOT NULL DEFAULT '0',
  `countdown` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advancedtimes` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolvalue` int(4) unsigned NOT NULL DEFAULT '0',
  `critsymbolendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combat` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wing
-- ----------------------------
INSERT INTO `wing` VALUES ('1', '1', '1', '1', '0', '0', '0', '1970-01-01 08:00:00', '0', '0', '1970-01-01 08:00:00', '857');
INSERT INTO `wing` VALUES ('3', '1', '1', '1', '0', '0', '25', '1970-01-01 08:00:00', '2', '0', '1970-01-01 08:00:00', '857');
INSERT INTO `wing` VALUES ('5', '1', '1', '1', '0', '0', '0', '1970-01-01 08:00:00', '0', '0', '1970-01-01 08:00:00', '857');
INSERT INTO `wing` VALUES ('7', '1', '1', '1', '0', '0', '0', '1970-01-01 08:00:00', '0', '0', '1970-01-01 08:00:00', '857');
INSERT INTO `wing` VALUES ('9', '1', '1', '2', '0', '0', '12', '1970-01-01 08:00:00', '1', '0', '1970-01-01 08:00:00', '1766');
INSERT INTO `wing` VALUES ('4', '1', '1', '1', '0', '0', '72', '1970-01-01 08:00:00', '6', '0', '1970-01-01 08:00:00', '857');

-- ----------------------------
-- Table structure for `worldboss`
-- ----------------------------
DROP TABLE IF EXISTS `worldboss`;
CREATE TABLE `worldboss` (
  `bossid` int(10) unsigned NOT NULL DEFAULT '0',
  `killerid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bossid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of worldboss
-- ----------------------------
INSERT INTO `worldboss` VALUES ('1', '0');

-- ----------------------------
-- Table structure for `worshipcharacter`
-- ----------------------------
DROP TABLE IF EXISTS `worshipcharacter`;
CREATE TABLE `worshipcharacter` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `target` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of worshipcharacter
-- ----------------------------

-- ----------------------------
-- Table structure for `worshiptimes`
-- ----------------------------
DROP TABLE IF EXISTS `worshiptimes`;
CREATE TABLE `worshiptimes` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `times` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of worshiptimes
-- ----------------------------

-- ----------------------------
-- Table structure for `xnfaskill`
-- ----------------------------
DROP TABLE IF EXISTS `xnfaskill`;
CREATE TABLE `xnfaskill` (
  `characterid` int(10) NOT NULL,
  `xnfaiD` int(10) NOT NULL,
  `xnfalayer` smallint(2) NOT NULL DEFAULT '1',
  `xnfalevel` smallint(5) NOT NULL DEFAULT '1',
  `hasfailnum` smallint(2) NOT NULL DEFAULT '0',
  `epuratexnfa` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`characterid`,`xnfaiD`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of xnfaskill
-- ----------------------------

-- ----------------------------
-- Table structure for `xnfaskillcombat`
-- ----------------------------
DROP TABLE IF EXISTS `xnfaskillcombat`;
CREATE TABLE `xnfaskillcombat` (
  `characterid` int(10) NOT NULL,
  `combat` smallint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of xnfaskillcombat
-- ----------------------------
INSERT INTO `xnfaskillcombat` VALUES ('1', '0');
INSERT INTO `xnfaskillcombat` VALUES ('2', '0');
INSERT INTO `xnfaskillcombat` VALUES ('3', '0');
INSERT INTO `xnfaskillcombat` VALUES ('4', '0');
INSERT INTO `xnfaskillcombat` VALUES ('5', '0');
INSERT INTO `xnfaskillcombat` VALUES ('6', '0');
INSERT INTO `xnfaskillcombat` VALUES ('7', '0');
INSERT INTO `xnfaskillcombat` VALUES ('8', '0');
INSERT INTO `xnfaskillcombat` VALUES ('9', '0');

-- ----------------------------
-- Procedure structure for `GS_SP_BUYAUCTION`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_BUYAUCTION`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GS_SP_BUYAUCTION`(IN para_id INT UNSIGNED, IN para_characterid INT UNSIGNED, IN para_buycharacter INT UNSIGNED, IN para_equipid INT UNSIGNED, IN para_itemid INT UNSIGNED, IN para_money BIGINT UNSIGNED, IN para_emoney BIGINT UNSIGNED
, IN para_container text, IN para_container_type INT UNSIGNED, IN para_income_money INT UNSIGNED, IN para_income_emoney INT UNSIGNED)
begin
	declare d_income_money bigint unsigned default 0;
	declare d_income_emoney bigint unsigned default 0;
	
	update currency set money=para_money, emoney=para_emoney where characterid = para_buycharacter;
	if para_itemid > 0 then
		update item set characterid=para_buycharacter where id=para_itemid;
	end if;
	if para_equipid > 0 then
		update equipment set characterid=para_buycharacter where id=para_equipid;
	end if;
	if para_container<>'' then
		update containers set thing=para_container where characterid=para_buycharacter and type= para_container_type;
	end if;
	select money,emoney from currency where characterid=para_characterid into d_income_money,d_income_emoney;
	set d_income_money = d_income_money + para_income_money;
	set d_income_emoney = d_income_emoney + para_income_emoney;
	update currency set money=d_income_money, emoney=d_income_emoney where characterid = para_characterid;
	delete from auctiongoods where id = para_id;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GS_SP_CREATE_CHARACTER`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_CREATE_CHARACTER`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GS_SP_CREATE_CHARACTER`(IN para_account char(255), IN para_serverid INT UNSIGNED, IN para_name char(255), IN para_sex INT UNSIGNED, IN para_body_avatar INT UNSIGNED, IN para_weapon_avatar INT UNSIGNED, IN para_profession INT UNSIGNED, IN para_sceneid INT UNSIGNED, IN para_posx float, IN para_posy float,  IN para_nowtime datetime)
begin
declare  ret    int  DEFAULT 0;
declare character_num int default 0;
declare last_insert_id int unsigned default 0;
select count(*) from `character` where account = para_account and serverid = para_serverid into character_num;
if character_num = 0 then
	select count(*) from `character` where `character`.name = para_name into ret;
	if ret = 0 then
  		insert into `character` (account, serverid, name, level, sceneid, posx, posy, sex, profession, create_character_time, body_avatar, weapon_avatar) values (para_account, para_serverid, para_name, 1, para_sceneid, para_posx, para_posy, para_sex, para_profession, para_nowtime, para_body_avatar, para_weapon_avatar);
		set last_insert_id = LAST_INSERT_ID();
		insert into `characterskill` (`characterid`, `base_skill`, `lv_item_use_num`) values (last_insert_id, "", 0);
		insert into `characterstatus` (characterid, statusinfo) values (last_insert_id, "");
	end if;
	select ret, para_name, last_insert_id;
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GS_SP_CREATE_ROBOT`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_CREATE_ROBOT`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GS_SP_CREATE_ROBOT`(IN robotnum INT UNSIGNED)
begin
	declare nNum int default 0;
	declare idCharacter int unsigned default 0;
	declare account CHAR(32) default "";
	declare unLevel int unsigned default 99;
	declare unHp int unsigned default 999999999;
	declare unCombat int unsigned default 0;
	declare datetime1 datetime default date_sub(now(), interval 1 day);
	declare datetime2 datetime default date_add(now(), interval 1 day);
	declare cur_rank int unsigned default 1;
	select max(characterid) into idCharacter from `character`;
	if isnull(idCharacter)  then
		set idCharacter=0;
	end if;
	select max(ranking) into cur_rank from `arenaranking`;
	if isnull(cur_rank)  then
		set  cur_rank=0;
	end if;
	set nNum = 1;
	myloop: LOOP
		if nNum > robotnum then
			LEAVE myloop;
		end if;
		set account = CONCAT('robot', CAST(nNum as char));
		set unLevel = 50;
		set unCombat = 836;
		set idCharacter = idCharacter + 1;
		set cur_rank = cur_rank + 1;
		insert into `character` (characterid, account, name, level, sceneid, posx, posy, combat, profession, offlinetime, logintime, serverid, hp, body_avatar, weapon_avatar) values (idCharacter, account, account, unLevel, 3000, 31, 189, unCombat, 0, datetime1, datetime2, 1, unHp, 2000000, 2000001);
		insert into `horse`(characterid,steplev) values(idCharacter, 1);
		insert into `wing`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `refine`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `puppet`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `talisman`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `stamp`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `muse`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `worshiptimes`(characterid,times) values(idCharacter, 100);
		insert into `arenacharacter` (characterid, challengenum)  values  (idCharacter, 0);
		insert into `arenaranking` (ranking, characterid)  values (cur_rank, idCharacter);
     		set nNum = nNum + 1;
	end  LOOP  myloop;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GS_SP_INSERT_ARENA_HISTORY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_INSERT_ARENA_HISTORY`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GS_SP_INSERT_ARENA_HISTORY`(para_characterid int unsigned, para_sourcecharacterid int unsigned, para_targetcharacterid int unsigned, para_winner int unsigned, para_old_rank  int unsigned, para_new_rank int unsigned, para_target_name char(255))
begin
	declare history_num int unsigned;
	select count(*) from arenahistory where characterid = para_characterid into history_num;
	if history_num >= 5 then
		delete from arenahistory where characterid=para_characterid order by id limit 1;
	end if;
	insert into `arenahistory` (characterid, sourcecharacterid, targetcharacterid, winnercharacterid, old_rank, new_rank, target_name) values (para_characterid, para_sourcecharacterid, para_targetcharacterid, para_winner, para_old_rank, para_new_rank, para_target_name);
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GS_SP_LOCKAUCTION`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_LOCKAUCTION`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GS_SP_LOCKAUCTION`(IN para_id INT UNSIGNED, IN para_characterid INT UNSIGNED, IN para_price INT UNSIGNED, IN para_item INT UNSIGNED, IN para_equip INT UNSIGNED)
begin
	declare d_lock int unsigned default 0;
	declare d_price int unsigned default 0;
	declare d_res int unsigned default 1;
	select price,buylock from auctiongoods where id=para_id into d_price,d_lock;
	if d_lock <> 0 then
		set d_res = 0;
	elseif d_price <> para_price then
		set d_res = 0;
	end if;
	
	if d_res = 1 then
		update auctiongoods set buylock=para_characterid where id=para_id;
	end if;
	select a.id,a.characterid,a.charactername,a.goodstype,a.data,a.selltype,a.price,b.thingcfgid,b.overlap,c.thingcfgid,c.strengthen,c.realm,c.stage,a.buylock from auctiongoods a LEFT JOIN item b ON a.goodstype=para_item and a.data=b.id LEFT JOIN equipment c ON a.goodstype=para_equip and a.data=c.id  where a.id=para_id;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GS_SP_MERCHANDISE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_MERCHANDISE`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GS_SP_MERCHANDISE`(IN para_id INT UNSIGNED, IN para_things char(255), IN para_container text, IN para_emoney BIGINT UNSIGNED, IN para_other_id INT UNSIGNED, IN para_other_things char(255), IN para_other_container text, IN para_other_emoney BIGINT UNSIGNED, IN para_container_type INT UNSIGNED)
begin
declare str char(255);
if (length(para_things) > 0) then
	set str = concat('update item set characterid=', para_id, ' where id in(', para_things, ')');
	set @sql1 = str;
	prepare stmt_p from @sql1;
	execute stmt_p;
	set str = concat('update equipment set characterid=', para_id, ' where id in(', para_things, ' )');
	set @sql1 = str;
	prepare stmt_p from @sql1;
	execute stmt_p;
end if;
if (length(para_other_things) > 0) then
	set str = concat('update item set characterid=', para_other_id, ' where id in(', para_other_things, ' )');
	set @sql1 = str;
	prepare stmt_p from @sql1;
	execute stmt_p;
	set str = concat('update equipment set characterid=', para_other_id, ' where id in(', para_other_things, ' )');
	set @sql1 = str;
	prepare stmt_p from @sql1;
	execute stmt_p;
end if;
update currency set emoney=para_emoney  where characterid=para_id;
update currency set emoney=para_other_emoney where characterid=para_other_id;
update containers set thing=para_other_container where characterid=para_other_id and type=para_container_type;
update containers set thing=para_container where characterid=para_id and type= para_container_type;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GS_SP_REGISTER_ACCOUNT`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_REGISTER_ACCOUNT`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GS_SP_REGISTER_ACCOUNT`(IN para_account char(255), IN para_nowtime datetime)
begin
	declare account_num int DEFAULT 0;
	select count(*) from `account` where account = para_account into account_num;
	if account_num = 0 then
		insert into `account` values (para_account, para_nowtime);
	else
		select account_num;
	end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GS_SP_SEARCHAUCTION`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_SEARCHAUCTION`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GS_SP_SEARCHAUCTION`(IN para_mainfilter INT UNSIGNED, IN para_subfilter INT UNSIGNED, IN para_quality INT UNSIGNED, IN para_level INT UNSIGNED)
begin
declare str char(255);
if (length(para_things) > 0) then
	set str = concat('update item set characterid=', para_id, ' where id in(', para_things, ')');
	set @sql1 = str;
	prepare stmt_p from @sql1;
	execute stmt_p;
	set str = concat('update equipment set characterid=', para_id, ' where id in(', para_things, ' )');
	set @sql1 = str;
	prepare stmt_p from @sql1;
	execute stmt_p;
end if;
if (length(para_other_things) > 0) then
	set str = concat('update item set characterid=', para_other_id, ' where id in(', para_other_things, ' )');
	set @sql1 = str;
	prepare stmt_p from @sql1;
	execute stmt_p;
	set str = concat('update equipment set characterid=', para_other_id, ' where id in(', para_other_things, ' )');
	set @sql1 = str;
	prepare stmt_p from @sql1;
	execute stmt_p;
end if;
update currency set emoney=para_emoney  where characterid=para_id;
update currency set emoney=para_other_emoney where characterid=para_other_id;
update containers set thing=para_other_container where characterid=para_other_id and type=para_container_type;
update containers set thing=para_container where characterid=para_id and type= para_container_type;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GS_SP_UPDATEAUCTION`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_UPDATEAUCTION`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GS_SP_UPDATEAUCTION`(IN para_id INT UNSIGNED, IN para_price INT UNSIGNED)
begin
	declare d_lock int unsigned default 0;
	declare d_res int unsigned default 1;
	select buylock from auctiongoods where id=para_id into d_lock;
	if d_lock <> 0 then
		set d_res = 0;
	end if;
	
	if d_res = 1 then
		update auctiongoods set price=para_price where id=para_id;
	end if;
	select buylock from auctiongoods where id=para_id;
end
;;
DELIMITER ;
