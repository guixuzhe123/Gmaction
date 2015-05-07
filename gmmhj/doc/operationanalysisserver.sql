-- ----------------------------
-- Table structure for createcharacter
-- ----------------------------
DROP TABLE IF EXISTS `createcharacter`;
CREATE TABLE `createcharacter` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `mediaactivityid` char(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `submediaactivityid` char(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `pf` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for precreatecharacter
-- ----------------------------
DROP TABLE IF EXISTS `precreatecharacter`;
CREATE TABLE `precreatecharacter` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mediaactivityid` char(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `submediaactivityid` char(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `pf` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `autoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `viplev` int(10) unsigned DEFAULT NULL,
  `ip` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `username` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `money` bigint(20) unsigned DEFAULT NULL,
  `emoney` bigint(20) unsigned DEFAULT NULL,
  `emoney2` bigint(20) unsigned DEFAULT NULL,
  `pf` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for loginout
-- ----------------------------
DROP TABLE IF EXISTS `loginout`;
CREATE TABLE `loginout` (
  `autoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `viplev` int(10) unsigned DEFAULT NULL,
  `ip` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `username` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `money` bigint(20) unsigned DEFAULT NULL,
  `emoney` bigint(20) unsigned DEFAULT NULL,
  `emoney2` bigint(20) unsigned DEFAULT NULL,
  `onlinetime` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for soloserver_arena_fight
-- ----------------------------
DROP TABLE IF EXISTS `soloserver_arena_fight`;
CREATE TABLE `soloserver_arena_fight` (
  `autoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `user_lev` int(10) unsigned DEFAULT NULL,
  `user_fighting` int(10) unsigned DEFAULT NULL,
  `target_characterid` int(10) unsigned DEFAULT NULL,
  `target_user_lev` int(10) unsigned DEFAULT NULL,
  `target_user_fighting` int(10) unsigned DEFAULT NULL,
  `iswin` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for soloserver_arena_cleantime
-- ----------------------------
DROP TABLE IF EXISTS `soloserver_arena_cleantime`;
CREATE TABLE `soloserver_arena_cleantime` (
  `autoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `user_lev` int(10) unsigned DEFAULT NULL,
  `user_fighting` int(10) unsigned DEFAULT NULL,
  `rank` int(10) unsigned DEFAULT NULL,
  `time_before` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for mall_buy
-- ----------------------------
DROP TABLE IF EXISTS `mall_buy`;
CREATE TABLE `mall_buy` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `shopid` int(10) unsigned DEFAULT NULL,
  `counter` int(10) unsigned DEFAULT NULL,
  `goldtype` int(10) unsigned DEFAULT NULL,
  `itemid` int(10) unsigned DEFAULT NULL,
  `itemnum` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for equip_quality
-- ----------------------------
DROP TABLE IF EXISTS `equip_quality`;
CREATE TABLE `equip_quality` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `equip` int(10) unsigned DEFAULT NULL,
  `stage` int(10) unsigned DEFAULT NULL,
  `upstage` int(10) unsigned DEFAULT NULL,
  `realm` int(10) unsigned DEFAULT NULL,
  `uprealm` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for equip_seniorsmelt
-- ----------------------------
DROP TABLE IF EXISTS `equip_seniorsmelt`;
CREATE TABLE `equip_seniorsmelt` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `equipsmelt` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smelt` int(10) unsigned DEFAULT NULL,
  `smelt_after` int(10) unsigned DEFAULT NULL,
  `get_equip` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for equip_smelt
-- ----------------------------
DROP TABLE IF EXISTS `equip_smelt`;
CREATE TABLE `equip_smelt` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `equipsmelt` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smelt` int(10) unsigned DEFAULT NULL,
  `smelt_after` int(10) unsigned DEFAULT NULL,
  `get_equip` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for equip_strengthen
-- ----------------------------
DROP TABLE IF EXISTS `equip_strengthen`;
CREATE TABLE `equip_strengthen` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `equip` int(10) unsigned DEFAULT NULL,
  `strengthen_before` int(10) unsigned DEFAULT NULL,
  `strengthen_after` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for equip_levup
-- ----------------------------
DROP TABLE IF EXISTS `equip_levup`;
CREATE TABLE `equip_levup` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `equip` int(10) unsigned DEFAULT NULL,
  `equipid_before` int(10) unsigned DEFAULT NULL,
  `equipid_after` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for rolelvup
-- ----------------------------
DROP TABLE IF EXISTS `rolelvup`;
CREATE TABLE `rolelvup` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,  `uesrlev1` int(10) unsigned DEFAULT NULL,
  `uesrlev2` int(10) unsigned DEFAULT NULL,
  `updatetype` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for basicskill_levup
-- ----------------------------
DROP TABLE IF EXISTS `basicskill_levup`;
CREATE TABLE `basicskill_levup` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `orderid` int(10) unsigned DEFAULT NULL,
  `levuptype` int(10) unsigned DEFAULT NULL,
  `skilllv_before` int(10) unsigned DEFAULT NULL,
  `skilllv_after` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for moveskill_levup
-- ----------------------------
DROP TABLE IF EXISTS `moveskill_levup`;
CREATE TABLE `moveskill_levup` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `skillid` int(10) unsigned DEFAULT NULL,
  `skilllev` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for sweepinfo
-- ----------------------------
DROP TABLE IF EXISTS `sweepinfo`;
CREATE TABLE `sweepinfo` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `user_vip` int(10) unsigned DEFAULT NULL,
  `fbid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for singlefbfinish
-- ----------------------------
DROP TABLE IF EXISTS `singlefbfinish`;
CREATE TABLE `singlefbfinish` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `map_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for singlefbenter
-- ----------------------------
DROP TABLE IF EXISTS `singlefbenter`;
CREATE TABLE `singlefbenter` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `map_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for celebrityfbenter
-- ----------------------------
DROP TABLE IF EXISTS `celebrityfbenter`;
CREATE TABLE `celebrityfbenter` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `fb_id` int(10) unsigned DEFAULT NULL,
  `support` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for celebrityfbfinish
-- ----------------------------
DROP TABLE IF EXISTS `celebrityfbfinish`;
CREATE TABLE `celebrityfbfinish` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `fb_id` int(10) unsigned DEFAULT NULL,
  `support` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for vipfbfinish
-- ----------------------------
DROP TABLE IF EXISTS `vipfbfinish`;
CREATE TABLE `vipfbfinish` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `fb_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for realmfb
-- ----------------------------
DROP TABLE IF EXISTS `realmfb`;
CREATE TABLE `realmfb` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `fbID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for shrinefb
-- ----------------------------
DROP TABLE IF EXISTS `shrinefb`;
CREATE TABLE `shrinefb` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `fbID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for veinfb
-- ----------------------------
DROP TABLE IF EXISTS `veinfb`;
CREATE TABLE `veinfb` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for longfb
-- ----------------------------
DROP TABLE IF EXISTS `longfb`;
CREATE TABLE `longfb` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




-- ----------------------------
-- Table structure for teamfb
-- ----------------------------
DROP TABLE IF EXISTS `teamfb`;
CREATE TABLE `teamfb` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for vipfbenter
-- ----------------------------
DROP TABLE IF EXISTS `vipfbenter`;
CREATE TABLE `vipfbenter` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `fb_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for guild_contribute
-- ----------------------------
DROP TABLE IF EXISTS `guild_contribute`;
CREATE TABLE `guild_contribute` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `value_before` bigint(10) unsigned DEFAULT NULL,
  `value_after` bigint(10) unsigned DEFAULT NULL,
  `story_before` int(10) unsigned DEFAULT NULL,
  `story_after` int(10) unsigned DEFAULT NULL,
  `contribute_before` int(10) unsigned DEFAULT NULL,
  `contribute_after` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for guild_flagup
-- ----------------------------
DROP TABLE IF EXISTS `guild_flagup`;
CREATE TABLE `guild_flagup` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `flaglev_before` int(10) unsigned DEFAULT NULL,
  `flaglev_after` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for guild_skillbuildup
-- ----------------------------
DROP TABLE IF EXISTS `guild_skillbuildup`;
CREATE TABLE `guild_skillbuildup` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `lev_before` int(10) unsigned DEFAULT NULL,
  `lev_after` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for guild_changflagname
-- ----------------------------
DROP TABLE IF EXISTS `guild_changflagname`;
CREATE TABLE `guild_changflagname` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `flagname_before` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flagname_after` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for guild_changflagtype
-- ----------------------------
DROP TABLE IF EXISTS `guild_changflagtype`;
CREATE TABLE `guild_changflagtype` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `flagtype_before` int(10) unsigned DEFAULT NULL,
  `flagtype_after` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for guild_destroy
-- ----------------------------
DROP TABLE IF EXISTS `guild_destroy`;
CREATE TABLE `guild_destroy` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `typeid` int(10) unsigned DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for guild_create
-- ----------------------------
DROP TABLE IF EXISTS `guild_create`;
CREATE TABLE `guild_create` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `typeid` int(10) unsigned DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for money
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `vipLev` int(10) unsigned DEFAULT NULL,
  `amount1` bigint(20) unsigned DEFAULT NULL,
  `amount2` bigint(20) unsigned DEFAULT NULL,
  `useORget` int(10) unsigned DEFAULT NULL,
  `actionType` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for emoney
-- ----------------------------
DROP TABLE IF EXISTS `emoney`;
CREATE TABLE `emoney` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `vipLev` int(10) unsigned DEFAULT NULL,
  `amount1` bigint(20) unsigned DEFAULT NULL,
  `amount2` bigint(20) unsigned DEFAULT NULL,
  `useORget` int(10) unsigned DEFAULT NULL,
  `actionType` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for emoney2
-- ----------------------------
DROP TABLE IF EXISTS `emoney2`;
CREATE TABLE `emoney2` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `vipLev` int(10) unsigned DEFAULT NULL,
  `amount1` bigint(20) unsigned DEFAULT NULL,
  `amount2` bigint(20) unsigned DEFAULT NULL,
  `useORget` int(10) unsigned DEFAULT NULL,
  `actionType` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for exp
-- ----------------------------
DROP TABLE IF EXISTS `exp`;
CREATE TABLE `exp` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `vipLev` int(10) unsigned DEFAULT NULL,
  `levbefore` int(20) unsigned DEFAULT NULL,
  `levafter` int(20) unsigned DEFAULT NULL,
  `amount1` bigint(20) unsigned DEFAULT NULL,
  `amount2` bigint(20) unsigned DEFAULT NULL,
  `useORget` int(10) unsigned DEFAULT NULL,
  `actionType` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for skillpoint
-- ----------------------------
DROP TABLE IF EXISTS `skillpoint`;
CREATE TABLE `skillpoint` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `vipLev` int(10) unsigned DEFAULT NULL,
  `amount1` bigint(20) unsigned DEFAULT NULL,
  `amount2` bigint(20) unsigned DEFAULT NULL,
  `useORget` int(10) unsigned DEFAULT NULL,
  `actionType` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for story
-- ----------------------------
DROP TABLE IF EXISTS `story`;
CREATE TABLE `story` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `vipLev` int(10) unsigned DEFAULT NULL,
  `amount1` bigint(20) unsigned DEFAULT NULL,
  `amount2` bigint(20) unsigned DEFAULT NULL,
  `useORget` int(10) unsigned DEFAULT NULL,
  `actionType` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for contribute
-- ----------------------------
DROP TABLE IF EXISTS `contribute`;
CREATE TABLE `contribute` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `vipLev` int(10) unsigned DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `amount1` bigint(20) unsigned DEFAULT NULL,
  `amount2` bigint(20) unsigned DEFAULT NULL,
  `useORget` int(10) unsigned DEFAULT NULL,
  `actionType` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for horse_bless
-- ----------------------------
DROP TABLE IF EXISTS `horse_bless`;
CREATE TABLE `horse_bless` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `horselev_before` int(10) unsigned DEFAULT NULL,
  `horselev_after` int(10) unsigned DEFAULT NULL,
  `itemids` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_before` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_after` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blessnum_before` int(10) unsigned DEFAULT NULL,
  `blessnum_after` int(10) unsigned DEFAULT NULL,
  `money_before` bigint(20) unsigned DEFAULT NULL,
  `money_after` bigint(20) unsigned DEFAULT NULL,
  `emoney_before` bigint(20) unsigned DEFAULT NULL,
  `emoney_after` bigint(20) unsigned DEFAULT NULL,
  `emoney2_before` bigint(20) unsigned DEFAULT NULL,
  `emoney2_after` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for wing_bless
-- ----------------------------
DROP TABLE IF EXISTS `wing_bless`;
CREATE TABLE `wing_bless` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `realm_before` int(10) unsigned DEFAULT NULL,
  `stage_before` int(10) unsigned DEFAULT NULL,
  `realm_after` int(10) unsigned DEFAULT NULL,
  `stage_after` int(10) unsigned DEFAULT NULL,
  `itemids` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_before` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_after` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blessnum_before` int(10) unsigned DEFAULT NULL,
  `blessnum_after` int(10) unsigned DEFAULT NULL,
  `money_before` bigint(20) unsigned DEFAULT NULL,
  `money_after` bigint(20) unsigned DEFAULT NULL,
  `emoney_before` bigint(20) unsigned DEFAULT NULL,
  `emoney_after` bigint(20) unsigned DEFAULT NULL,
  `emoney2_before` bigint(20) unsigned DEFAULT NULL,
  `emoney2_after` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for refine_bless
-- ----------------------------
DROP TABLE IF EXISTS `refine_bless`;
CREATE TABLE `refine_bless` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `realm_before` int(10) unsigned DEFAULT NULL,
  `stage_before` int(10) unsigned DEFAULT NULL,
  `realm_after` int(10) unsigned DEFAULT NULL,
  `stage_after` int(10) unsigned DEFAULT NULL,
  `itemids` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_before` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_after` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blessnum_before` int(10) unsigned DEFAULT NULL,
  `blessnum_after` int(10) unsigned DEFAULT NULL,
  `money_before` bigint(20) unsigned DEFAULT NULL,
  `money_after` bigint(20) unsigned DEFAULT NULL,
  `emoney_before` bigint(20) unsigned DEFAULT NULL,
  `emoney_after` bigint(20) unsigned DEFAULT NULL,
  `emoney2_before` bigint(20) unsigned DEFAULT NULL,
  `emoney2_after` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for puppet_bless
-- ----------------------------
DROP TABLE IF EXISTS `puppet_bless`;
CREATE TABLE `puppet_bless` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `realm_before` int(10) unsigned DEFAULT NULL,
  `stage_before` int(10) unsigned DEFAULT NULL,
  `realm_after` int(10) unsigned DEFAULT NULL,
  `stage_after` int(10) unsigned DEFAULT NULL,
  `itemids` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_before` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_after` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blessnum_before` int(10) unsigned DEFAULT NULL,
  `blessnum_after` int(10) unsigned DEFAULT NULL,
  `money_before` bigint(20) unsigned DEFAULT NULL,
  `money_after` bigint(20) unsigned DEFAULT NULL,
  `emoney_before` bigint(20) unsigned DEFAULT NULL,
  `emoney_after` bigint(20) unsigned DEFAULT NULL,
  `emoney2_before` bigint(20) unsigned DEFAULT NULL,
  `emoney2_after` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for talisman_bless
-- ----------------------------
DROP TABLE IF EXISTS `talisman_bless`;
CREATE TABLE `talisman_bless` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `realm_before` int(10) unsigned DEFAULT NULL,
  `stage_before` int(10) unsigned DEFAULT NULL,
  `realm_after` int(10) unsigned DEFAULT NULL,
  `stage_after` int(10) unsigned DEFAULT NULL,
  `itemids` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_before` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_after` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blessnum_before` int(10) unsigned DEFAULT NULL,
  `blessnum_after` int(10) unsigned DEFAULT NULL,
  `money_before` bigint(20) unsigned DEFAULT NULL,
  `money_after` bigint(20) unsigned DEFAULT NULL,
  `emoney_before` bigint(20) unsigned DEFAULT NULL,
  `emoney_after` bigint(20) unsigned DEFAULT NULL,
  `emoney2_before` bigint(20) unsigned DEFAULT NULL,
  `emoney2_after` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for muse_bless
-- ----------------------------
DROP TABLE IF EXISTS `muse_bless`;
CREATE TABLE `muse_bless` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `realm_before` int(10) unsigned DEFAULT NULL,
  `stage_before` int(10) unsigned DEFAULT NULL,
  `realm_after` int(10) unsigned DEFAULT NULL,
  `stage_after` int(10) unsigned DEFAULT NULL,
  `itemids` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_before` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_after` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blessnum_before` int(10) unsigned DEFAULT NULL,
  `blessnum_after` int(10) unsigned DEFAULT NULL,
  `money_before` bigint(20) unsigned DEFAULT NULL,
  `money_after` bigint(20) unsigned DEFAULT NULL,
  `emoney_before` bigint(20) unsigned DEFAULT NULL,
  `emoney_after` bigint(20) unsigned DEFAULT NULL,
  `emoney2_before` bigint(20) unsigned DEFAULT NULL,
  `emoney2_after` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for stamp_bless
-- ----------------------------
DROP TABLE IF EXISTS `stamp_bless`;
CREATE TABLE `stamp_bless` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `realm_before` int(10) unsigned DEFAULT NULL,
  `stage_before` int(10) unsigned DEFAULT NULL,
  `realm_after` int(10) unsigned DEFAULT NULL,
  `stage_after` int(10) unsigned DEFAULT NULL,
  `itemids` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_before` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnum_after` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blessnum_before` int(10) unsigned DEFAULT NULL,
  `blessnum_after` int(10) unsigned DEFAULT NULL,
  `money_before` bigint(20) unsigned DEFAULT NULL,
  `money_after` bigint(20) unsigned DEFAULT NULL,
  `emoney_before` bigint(20) unsigned DEFAULT NULL,
  `emoney_after` bigint(20) unsigned DEFAULT NULL,
  `emoney2_before` bigint(20) unsigned DEFAULT NULL,
  `emoney2_after` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for puppet_learnskill
-- ----------------------------
DROP TABLE IF EXISTS `puppet_learnskill`;
CREATE TABLE `puppet_learnskill` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `skillslotid` int(10) unsigned DEFAULT NULL,
  `skill_before` int(10) unsigned DEFAULT NULL,
  `skill_after` int(10) unsigned DEFAULT NULL,
  `itemid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for refine_learnskill
-- ----------------------------
DROP TABLE IF EXISTS `refine_learnskill`;
CREATE TABLE `refine_learnskill` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `skillslotid` int(10) unsigned DEFAULT NULL,
  `skill_before` int(10) unsigned DEFAULT NULL,
  `skill_after` int(10) unsigned DEFAULT NULL,
  `itemid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for talisman_learnskill
-- ----------------------------
DROP TABLE IF EXISTS `talisman_learnskill`;
CREATE TABLE `talisman_learnskill` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `skillslotid` int(10) unsigned DEFAULT NULL,
  `skill_before` int(10) unsigned DEFAULT NULL,
  `skill_after` int(10) unsigned DEFAULT NULL,
  `itemid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for stamp_learnskill
-- ----------------------------
DROP TABLE IF EXISTS `stamp_learnskill`;
CREATE TABLE `stamp_learnskill` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `skillslotid` int(10) unsigned DEFAULT NULL,
  `skill_before` int(10) unsigned DEFAULT NULL,
  `skill_after` int(10) unsigned DEFAULT NULL,
  `itemid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for Land
-- ----------------------------
DROP TABLE IF EXISTS `Land`;
CREATE TABLE `Land` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `Landnum` int(10) unsigned DEFAULT NULL,
  `getitem` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for guildskill_levup
-- ----------------------------
DROP TABLE IF EXISTS `guildskill_levup`;
CREATE TABLE `guildskill_levup` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `skillid` int(10) unsigned DEFAULT NULL,
  `skilllev` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for heavenxnfa_active
-- ----------------------------
DROP TABLE IF EXISTS `heavenxnfa_active`;
CREATE TABLE `heavenxnfa_active` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userId` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `xnfaid` int(10) NOT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for heavenxnfa_levup
-- ----------------------------
DROP TABLE IF EXISTS `heavenxnfa_levup`;
CREATE TABLE `heavenxnfa_levup` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userId` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `xnfaid` int(10) NOT NULL,
  `layerlev` smallint(2) NOT NULL,
  `starid` smallint(2) NOT NULL,
  `result` smallint(2) NOT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for heavenxnfa_epurate
-- ----------------------------
DROP TABLE IF EXISTS `heavenxnfa_epurate`;
CREATE TABLE `heavenxnfa_epurate` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userId` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `xnfaid` int(10) NOT NULL,
  `layerlev` smallint(2) NOT NULL,
  `starid` smallint(2) NOT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for bossfb
-- ----------------------------
DROP TABLE IF EXISTS `bossfb`;
CREATE TABLE `bossfb` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `boss_id` int(10) unsigned DEFAULT NULL,
  `hurt` int(10) unsigned DEFAULT NULL,
  `rewardid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for quest_complete
-- ----------------------------
DROP TABLE IF EXISTS `quest_complete`;
CREATE TABLE `quest_complete` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `combat_ability` int(10) unsigned DEFAULT NULL,
  `questid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for task_daily_reset
-- ----------------------------
DROP TABLE IF EXISTS `task_daily_reset`;
CREATE TABLE `task_daily_reset` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `taskid` int(10) unsigned DEFAULT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `amount_before` int(10) unsigned DEFAULT NULL,
  `amount_after` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for quest_complete
-- ----------------------------
DROP TABLE IF EXISTS `quest_complete`;
CREATE TABLE `quest_complete` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `combat_ability` int(10) unsigned DEFAULT NULL,
  `questid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for task_daily_complete
-- ----------------------------
DROP TABLE IF EXISTS `task_daily_complete`;
CREATE TABLE `task_daily_complete` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `combat_ability` int(10) unsigned DEFAULT NULL,
  `taskid` int(10) unsigned DEFAULT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  `completetype` int(10) unsigned DEFAULT NULL,
  `difficulty_lev` int(10) unsigned DEFAULT NULL,
  `repay_lev` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for task_daily_fullcomplete
-- ----------------------------
DROP TABLE IF EXISTS `task_daily_fullcomplete`;
CREATE TABLE `task_daily_fullcomplete` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `vip` int(10) unsigned DEFAULT NULL,
  `tasknum` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for task_guild_fullcomplete
-- ----------------------------
DROP TABLE IF EXISTS `task_guild_fullcomplete`;
CREATE TABLE `task_guild_fullcomplete` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `vip` int(10) unsigned DEFAULT NULL,
  `tasknum` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for task_daily_allcomplete
-- ----------------------------
DROP TABLE IF EXISTS `task_daily_allcomplete`;
CREATE TABLE `task_daily_allcomplete` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for task_guild_complete
-- ----------------------------
DROP TABLE IF EXISTS `task_guild_complete`;
CREATE TABLE `task_guild_complete` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `combat_ability` int(10) unsigned DEFAULT NULL,
  `taskid` int(10) unsigned DEFAULT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  `completetype` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for task_guild_allcomplete
-- ----------------------------
DROP TABLE IF EXISTS `task_guild_allcomplete`;
CREATE TABLE `task_guild_allcomplete` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for task_random_accept
-- ----------------------------
DROP TABLE IF EXISTS `task_random_accept`;
CREATE TABLE `task_random_accept` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `combat_ability` int(10) unsigned DEFAULT NULL,
  `taskid` int(10) unsigned DEFAULT NULL,
  `quality` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for task_random_consume
-- ----------------------------
DROP TABLE IF EXISTS `task_random_consume`;
CREATE TABLE `task_random_consume` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `taskid` int(10) unsigned DEFAULT NULL,
  `quality` int(10) unsigned DEFAULT NULL,
  `taskid2` int(10) unsigned DEFAULT NULL,
  `quality2` int(10) unsigned DEFAULT NULL,
  `reward_before` int(10) unsigned DEFAULT NULL,
  `reward_after` int(10) unsigned DEFAULT NULL,
  `consumetype` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for task_random_complete
-- ----------------------------
DROP TABLE IF EXISTS `task_random_complete`;
CREATE TABLE `task_random_complete` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `combat_ability` int(10) unsigned DEFAULT NULL,
  `taskid` int(10) unsigned DEFAULT NULL,
  `completetype` int(10) unsigned DEFAULT NULL,
  `quity` int(10) unsigned DEFAULT NULL,
  `userlev_beore` int(10) unsigned DEFAULT NULL,
  `exp_before` int(10) unsigned DEFAULT NULL,
  `moeny_before` bigint(10) unsigned DEFAULT NULL,
  `userlev_after` int(10) unsigned DEFAULT NULL,
  `exp_after` int(10) unsigned DEFAULT NULL,
  `moeny_after` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for upday
-- ----------------------------
DROP TABLE IF EXISTS `upday`;
CREATE TABLE `upday` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `activityid` int(10) unsigned DEFAULT NULL,
  `getstep` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for find
-- ----------------------------
DROP TABLE IF EXISTS `find`;
CREATE TABLE `find` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `functionid` int(10) unsigned DEFAULT NULL,
  `findnum` int(10) unsigned DEFAULT NULL,
  `findtype` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for goddessfigure_levup
-- ----------------------------
DROP TABLE IF EXISTS `goddessfigure_levup`;
CREATE TABLE `goddessfigure_levup` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `before_stage` int(10) unsigned DEFAULT NULL,
  `after_stage` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for realm
-- ----------------------------
DROP TABLE IF EXISTS `realm`;
CREATE TABLE `realm` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `realm` int(10) unsigned DEFAULT NULL,
  `stage` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `vip` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for vipgift
-- ----------------------------
DROP TABLE IF EXISTS `vipgift`;
CREATE TABLE `vipgift` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `viplv` int(10) unsigned DEFAULT NULL,
  `gift` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for vipweek
-- ----------------------------
DROP TABLE IF EXISTS `vipweek`;
CREATE TABLE `vipweek` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `viplv` int(10) unsigned DEFAULT NULL,
  `weekgift` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for acitve
-- ----------------------------
DROP TABLE IF EXISTS `acitve`;
CREATE TABLE `acitve` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `acitveid` int(10) unsigned DEFAULT NULL,
  `total` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for active_reward
-- ----------------------------
DROP TABLE IF EXISTS `active_reward`;
CREATE TABLE `active_reward` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `reward` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for turntable_extract
-- ----------------------------
DROP TABLE IF EXISTS `turntable_extract`;
CREATE TABLE `turntable_extract` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `token_after` int(10) unsigned DEFAULT NULL,
  `getitemid` int(10) unsigned DEFAULT NULL,
  `getitemnum` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for turntable_score
-- ----------------------------
DROP TABLE IF EXISTS `turntable_score`;
CREATE TABLE `turntable_score` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `scoreitem` int(10) unsigned DEFAULT NULL,
  `scoretiemnum` int(10) unsigned DEFAULT NULL,
  `score_before` int(10) unsigned DEFAULT NULL,
  `score_after` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for get_reward
-- ----------------------------
DROP TABLE IF EXISTS `get_reward`;
CREATE TABLE `get_reward` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userLev` int(10) unsigned DEFAULT NULL,
  `fbid` int(10) unsigned DEFAULT NULL,
  `boss_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for guildfb
-- ----------------------------
DROP TABLE IF EXISTS `guildfb`;
CREATE TABLE `guildfb` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `guild_id` int(10) unsigned DEFAULT NULL,
  `map_id` int(10) unsigned DEFAULT NULL,
  `cleanboss_time` bigint(10) unsigned DEFAULT NULL,
  `boss_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for melkin
-- ----------------------------
DROP TABLE IF EXISTS `melkin`;
CREATE TABLE `melkin` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `cleanbossID` int(10) unsigned DEFAULT NULL,
  `guildid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for sendmail
-- ----------------------------
DROP TABLE IF EXISTS `sendmail`;
CREATE TABLE `sendmail` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `mailid` int(10) unsigned DEFAULT NULL,
  `item` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `userlev` int(10) unsigned DEFAULT NULL,
  `mailid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for rechange
-- ----------------------------
DROP TABLE IF EXISTS `rechange`;
CREATE TABLE `rechange` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `rewardtype` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for barter_success
-- ----------------------------
DROP TABLE IF EXISTS `barter_success`;
CREATE TABLE `barter_success` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for consumegift_get
-- ----------------------------
DROP TABLE IF EXISTS `consumegift_get`;
CREATE TABLE `consumegift_get` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `item` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for consumegift_change
-- ----------------------------
DROP TABLE IF EXISTS `consumegift_change`;
CREATE TABLE `consumegift_change` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `changeid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for luckytoken
-- ----------------------------
DROP TABLE IF EXISTS `luckytoken`;
CREATE TABLE `luckytoken` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `token_id` int(10) unsigned DEFAULT NULL,
  `times` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for barter
-- ----------------------------
DROP TABLE IF EXISTS `barter`;
CREATE TABLE `barter` (
  `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characterid` int(10) unsigned DEFAULT NULL,
  `id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoid`),KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;