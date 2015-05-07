/*
MySQL Data Transfer
Source Host: 127.0.0.1
Source Database: lightserver
Target Host: 127.0.0.1
Target Database: lightserver
Date: 2013-1-5 16:06:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dbversion
-- ----------------------------
DROP TABLE IF EXISTS `dbversion`;
CREATE TABLE `dbversion` (
  `version_number` int(11) DEFAULT 0,
`db_key` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`version_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
insert into `dbversion` values(0, NULL);

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for lockaccount
-- ----------------------------
DROP TABLE IF EXISTS `lockaccount`;
CREATE TABLE `lockaccount` (
  `account` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for character
-- ----------------------------
DROP TABLE IF EXISTS `character`;
CREATE TABLE `character` (
  `characterid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `experience` int(10) unsigned DEFAULT '0',
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
  `wing_avatar` int(10) unsigned DEFAULT 0,
  `weapon_avatar` int(10) unsigned DEFAULT NULL,
  `stamp_avatar` int(10) unsigned DEFAULT 0,
  `shield_avatar` int(10) unsigned DEFAULT 0,
  `talisman_avatar` int(10) unsigned DEFAULT 0,
  `ride_avatar` int(10) unsigned DEFAULT 0,
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
  PRIMARY KEY (`characterid`),
  KEY `combat` (`combat`),
  KEY `level` (`level`),
  KEY `account_serverid` (`account`,`serverid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for characterskill
-- ----------------------------
DROP TABLE IF EXISTS `characterskill`;
CREATE TABLE `characterskill` (
  `characterid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `base_skill` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lv_item_use_num` int(10) unsigned DEFAULT '0',
  `skill_breakout` int(10) unsigned DEFAULT '0',
PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `openservertime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closeservertime` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`openservertime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for forbidtalk
-- ----------------------------
DROP TABLE IF EXISTS `forbidtalk`;
CREATE TABLE `forbidtalk` (
  `charactername` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`charactername`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `money` bigint(20) unsigned NOT NULL DEFAULT '0',
 `emoney` bigint(20) unsigned NOT NULL DEFAULT '0',
 `vouchers` bigint(20) unsigned NOT NULL DEFAULT '0',
 PRIMARY KEY (`characterid`), KEY `money` (`money`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (`id` int(20) unsigned NOT NULL AUTO_INCREMENT
,`characterid` int(20) unsigned NOT NULL DEFAULT '0'
, `thingcfgid` int(20) unsigned NOT NULL DEFAULT '0'
,`bind` int(4) unsigned NOT NULL DEFAULT '0'
, `expiredTime` bigint(20) unsigned NOT NULL DEFAULT '0'
, `overlap` int(4) unsigned NOT NULL DEFAULT '0'
,PRIMARY KEY (`id`),KEY `id` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



  -- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (`id` int(20) unsigned NOT NULL AUTO_INCREMENT
, `characterid` int(20) unsigned NOT NULL DEFAULT '0'
, `thingcfgid` int(20) unsigned NOT NULL DEFAULT '0'
, `bind` int(4) unsigned NOT NULL DEFAULT '0'
, `expiredTime` bigint(20) unsigned NOT NULL DEFAULT '0'
, `strengthen` int(4) NOT NULL DEFAULT '0'
, `combat` int(4) unsigned NOT NULL DEFAULT '0'
, `realm` int(4) NOT NULL DEFAULT '0'
, `stage` int(4) NOT NULL DEFAULT '0'
, `level` int(4) NOT NULL DEFAULT '0'
, `qualitybless` int(4) NOT NULL DEFAULT '0'
, `leveluptimes` int(4) NOT NULL DEFAULT '0'
, `additional` char(255) COLLATE utf8_unicode_ci DEFAULT ''
, PRIMARY KEY (`id`),
  KEY `id` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for containers
-- ----------------------------
DROP TABLE IF EXISTS `containers`;
CREATE TABLE `containers` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `type` int(4) unsigned NOT NULL DEFAULT '0',
 `size` int(4) unsigned NOT NULL DEFAULT '0',
 `thing` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`characterid`, `type`),
  KEY `id_type` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for repocontainer
-- ----------------------------
DROP TABLE IF EXISTS `repocontainer`;
CREATE TABLE `repocontainer` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `repothing` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for container_gridcd
-- ----------------------------
DROP TABLE IF EXISTS `container_gridcd`;
CREATE TABLE `container_gridcd` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `type` int(4) unsigned NOT NULL DEFAULT '0',
 `cd` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`, `type`),
  KEY `id_type` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for maid
-- ----------------------------
DROP TABLE IF EXISTS `maid`;
CREATE TABLE `maid` (
`characterid` int(10) NOT NULL,
`maidid` int(10) NOT NULL,
`theterm` int(11) NOT NULL DEFAULT '0',
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
`lastdeadtime` int(11) NOT NULL DEFAULT '0',
`fitcdendtime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
PRIMARY KEY (`characterid`,`maidid`),
KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Procedure structure for GS_SP_CREATE_CHARACTER
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_CREATE_CHARACTER`;
DELIMITER ;;
CREATE PROCEDURE `GS_SP_CREATE_CHARACTER`(IN para_characterid INT UNSIGNED, IN para_account char(255), IN para_serverid INT UNSIGNED, IN para_name char(255), IN para_sex INT UNSIGNED, IN para_body_avatar INT UNSIGNED, IN para_weapon_avatar INT UNSIGNED, IN para_profession INT UNSIGNED, IN para_sceneid INT UNSIGNED, IN para_posx float, IN para_posy float,  IN para_nowtime datetime)
begin
declare  ret    int  DEFAULT 0;
declare character_num int default 0;

select count(*) from `character` where account = para_account and serverid = para_serverid into character_num;

if character_num = 0 then
	select count(*) from `character` where `character`.name = para_name into ret;

	if ret = 0 then
  		insert into `character` (characterid, account, serverid, name, level, sceneid, posx, posy, sex, profession, create_character_time, body_avatar, weapon_avatar) values (para_characterid, para_account, para_serverid, para_name, 1, para_sceneid, para_posx, para_posy, para_sex, para_profession, para_nowtime, para_body_avatar, para_weapon_avatar);
		insert into `characterskill` (`characterid`, `base_skill`, `lv_item_use_num`) values (para_characterid, "", 0);
		insert into `characterstatus` (characterid, statusinfo) values (para_characterid, "");
	end if;
	select ret, para_name;
end if;

end;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for GS_SP_REGISTER_ACCOUNT
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_REGISTER_ACCOUNT`;
DELIMITER ;;
CREATE PROCEDURE `GS_SP_REGISTER_ACCOUNT`(IN para_account char(255))
begin

	declare account_num int DEFAULT 0;

	select count(*) from `account` where account = para_account into account_num;

	if account_num = 0 then
		insert into `account` values (para_account);
	else
		select account_num;
	end if;
end;;
DELIMITER ;


-- ----------------------------
-- Table structure for cdkey
-- ----------------------------
DROP TABLE IF EXISTS `cdkey`;
CREATE TABLE `cdkey` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `cdkey` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`, `cdkey`),
  KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for questtimes
-- ----------------------------
DROP TABLE IF EXISTS `questtimes`;
CREATE TABLE `questtimes` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `type` int(4) unsigned NOT NULL DEFAULT '0',
 `times` int(4) unsigned NOT NULL DEFAULT '0',
 PRIMARY KEY (`characterid`, `type`),KEY `userId` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for swallowtimes
-- ----------------------------
DROP TABLE IF EXISTS `swallowtimes`;
CREATE TABLE `swallowtimes` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `times` int(4) unsigned NOT NULL DEFAULT '0',
 PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for plotquest
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
-- Table structure for todayquest
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
-- Table structure for guildquest
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
-- Table structure for luckyquest
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
 PRIMARY KEY (`id`), KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for monthsign
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
-- Table structure for onlinereward
-- ----------------------------
DROP TABLE IF EXISTS `onlinereward`;
CREATE TABLE `onlinereward` (
 `characterid` int(10) unsigned NOT NULL DEFAULT '0',  
 `onlinetime` int(4) unsigned NOT NULL DEFAULT '0',
 `rewardstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for sevendays
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
-- Table structure for coronarecord
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
-- Table structure for coronapersonal
-- ----------------------------
DROP TABLE IF EXISTS `coronapersonal`;
CREATE TABLE `coronapersonal` (
 `serialnumber` int(10) unsigned NOT NULL DEFAULT '0', 
 `characterid` int(10) unsigned NOT NULL DEFAULT '0', 
 `time` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
 `lotteryid` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serialnumber`),KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Procedure structure for GS_SP_MERCHANDISE
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_MERCHANDISE`;
DELIMITER ;;
CREATE PROCEDURE `GS_SP_MERCHANDISE`(IN para_id INT UNSIGNED, IN para_things char(255), IN para_container text, IN para_emoney BIGINT UNSIGNED, IN para_other_id INT UNSIGNED, IN para_other_things char(255), IN para_other_container text, IN para_other_emoney BIGINT UNSIGNED, IN para_container_type INT UNSIGNED)
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

end;;
DELIMITER ;


-- ----------------------------
-- Procedure structure for GS_SP_SEARCHAUCTION
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_SEARCHAUCTION`;
DELIMITER ;;
CREATE PROCEDURE `GS_SP_SEARCHAUCTION`(IN para_mainfilter INT UNSIGNED, IN para_subfilter INT UNSIGNED, IN para_quality INT UNSIGNED, IN para_level INT UNSIGNED)
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

end;;
DELIMITER ;


-- ----------------------------
-- Table structure for hook
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
-- Table structure for horse
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
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for wing
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
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for refine
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
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for puppet
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
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for talisman
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
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for stamp
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
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for smeltvalue
-- ----------------------------
DROP TABLE IF EXISTS `smeltvalue`;
CREATE TABLE `smeltvalue` (
 `characterid` int(10) unsigned NOT NULL DEFAULT '0', 
 `equipsmelt` int(4) unsigned NOT NULL DEFAULT '0',
 `highsmelt` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for treasure
-- ----------------------------
DROP TABLE IF EXISTS `treasure`;
CREATE TABLE `treasure` (
 `characterid` int(10) unsigned NOT NULL DEFAULT '0', 
 `times` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for muse
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
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0', 
 `characterid_target` int(20) unsigned NOT NULL DEFAULT '0',

  PRIMARY KEY (`characterid`,`characterid_target`),KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for blacker
-- ----------------------------
DROP TABLE IF EXISTS `blacker`;
CREATE TABLE `blacker` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0', 
 `characterid_target` int(20) unsigned NOT NULL DEFAULT '0',

  PRIMARY KEY (`characterid`,`characterid_target`),KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for stranger
-- ----------------------------
DROP TABLE IF EXISTS `stranger`;
CREATE TABLE `stranger` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0', 
 `characterid_target` int(20) unsigned NOT NULL DEFAULT '0',
 `time` bigint(20) unsigned NOT NULL DEFAULT '0',

  PRIMARY KEY (`characterid`,`characterid_target`),KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for enemies
-- ----------------------------
DROP TABLE IF EXISTS `enemies`;
CREATE TABLE `enemies` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0', 
 `characterid_target` int(20) unsigned NOT NULL DEFAULT '0',
 `record` int(20) NOT NULL DEFAULT '0',

  PRIMARY KEY (`characterid`,`characterid_target`),KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for relationer
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
-- Table structure for maketeam
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
-- Procedure structure for GS_SP_CREATE_ROBOT
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_CREATE_ROBOT`;
DELIMITER ;;
CREATE PROCEDURE `GS_SP_CREATE_ROBOT`(IN robotnum INT UNSIGNED)
begin
	declare nNum int default 0;
	declare idCharacter int unsigned default 0;
	declare account CHAR(32) default "";
	declare unLevel int unsigned default 99;
	declare unHp int unsigned default 999999999;
	declare unCombat int unsigned default 0;
	declare datetime1 datetime default date_sub(now(), interval 1 day);
	declare datetime2 datetime default date_add(now(), interval 1 day);
	
	select max(characterid) into idCharacter from `character`;

	if isnull(idCharacter)  then
		set idCharacter=0;
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


		insert into `character` (characterid, account, name, level, sceneid, posx, posy, combat, profession, offlinetime, logintime, serverid, hp) values (idCharacter, account, account, unLevel, 3000, 31, 189, unCombat, 2, datetime1, datetime2, 1, unHp);
		insert into `horse`(characterid,steplev) values(idCharacter, 1);
		insert into `wing`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `refine`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `puppet`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `talisman`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `stamp`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `muse`(characterid,realm,stageid) values(idCharacter, 3, 2);
		insert into `worshiptimes`(characterid,times) values(idCharacter, 100);

     		set nNum = nNum + 1;
	end  LOOP  myloop;

end;;
DELIMITER ;




-- ----------------------------
-- Table structure for heaven
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
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for heavenimprove
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for restriction
-- ----------------------------
DROP TABLE IF EXISTS `restriction`;
CREATE TABLE `restriction` (
 `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `shopid` int(20) unsigned NOT NULL DEFAULT '0',
 `shelfid` int(20) unsigned NOT NULL DEFAULT '0',
 `goodsid` int(20) unsigned NOT NULL DEFAULT '0',
 `buynum` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`), KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for artifact
-- ----------------------------
DROP TABLE IF EXISTS `artifact`;
CREATE TABLE `artifact` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `artifactlevs` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for guild
-- ----------------------------
DROP TABLE IF EXISTS `guild`;
CREATE TABLE `guild` (
 `id` int(20) unsigned NOT NULL DEFAULT '0',
 `name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
 `level` int(20) unsigned NOT NULL DEFAULT '0',
 `bannerid` int(20) unsigned NOT NULL DEFAULT '0',
 `bannername` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
 `createtime` datetime DEFAULT NULL,
 `unactive` int(20) unsigned NOT NULL DEFAULT '0',
 `announce` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
 `autoaccept` int(20) unsigned NOT NULL DEFAULT '0',
 `money` bigint(20) unsigned NOT NULL DEFAULT '0',
 `token` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
 `taoistlevel` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for guildmember
-- ----------------------------
DROP TABLE IF EXISTS `guildmember`;
CREATE TABLE `guildmember` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `guildid` int(20) unsigned NOT NULL DEFAULT '0',
 `rank` int(20) unsigned NOT NULL DEFAULT '0',
 `jointime` datetime DEFAULT NULL,
 `contribution` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`), KEY `guild` (`guildid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for auctiongoods
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
 `name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
 `buylock` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`), KEY `characterid` (`characterid`), KEY `mainfilter` (`mainfilter`),
  KEY `subfilter` (`subfilter`), KEY `quality` (`quality`), KEY `level` (`level`), KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for auctionincome
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
  PRIMARY KEY (`id`), KEY `characterid` (`characterid`), KEY `characterid_buyer` (`characterid_buyer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




-- ----------------------------
-- Table structure for guildskill
-- ----------------------------
DROP TABLE IF EXISTS `guildskill`;
CREATE TABLE `guildskill` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `skilllevel` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Procedure structure for GS_SP_UPDATEAUCTION
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_UPDATEAUCTION`;
DELIMITER ;;
CREATE PROCEDURE `GS_SP_UPDATEAUCTION`(IN para_id INT UNSIGNED, IN para_price INT UNSIGNED)
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
end;;
DELIMITER ;


-- ----------------------------
-- Procedure structure for GS_SP_LOCKAUCTION
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_LOCKAUCTION`;
DELIMITER ;;
CREATE PROCEDURE `GS_SP_LOCKAUCTION`(IN para_id INT UNSIGNED, IN para_characterid INT UNSIGNED, IN para_price INT UNSIGNED, IN para_item INT UNSIGNED, IN para_equip INT UNSIGNED)
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
	select a.id,a.characterid,a.charactername,a.type,a.data,a.selltype,a.price,b.thingcfgid,b.overlap,c.thingcfgid,c.strengthen,c.quality,a.buylock from auctiongoods a LEFT JOIN item b ON a.type=para_item and a.data=b.id LEFT JOIN equipment c ON a.type=para_equip and a.data=c.id  where a.id=para_id;
end;;
DELIMITER ;


-- ----------------------------
-- Procedure structure for GS_SP_BUYAUCTION
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_BUYAUCTION`;
DELIMITER ;;
CREATE PROCEDURE `GS_SP_BUYAUCTION`(IN para_id INT UNSIGNED, IN para_characterid INT UNSIGNED, IN para_buycharacter INT UNSIGNED, IN para_equipid INT UNSIGNED, IN para_itemid INT UNSIGNED, IN para_money BIGINT UNSIGNED, IN para_emoney BIGINT UNSIGNED
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

end;;
DELIMITER ;

-- ----------------------------
-- Table structure for guildcommon
-- ----------------------------
DROP TABLE IF EXISTS `guildcommon`;
CREATE TABLE `guildcommon` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `acceptinvite` int(20) unsigned NOT NULL DEFAULT '0',
 `story` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for guildbattle
-- ----------------------------
DROP TABLE IF EXISTS `guildbattle`;
CREATE TABLE `guildbattle` (
 `guildid` int(20) unsigned NOT NULL DEFAULT '0',
 `nowbattle` int(20) unsigned NOT NULL DEFAULT '0',
 `deadboss` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`guildid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for guildbossreward
-- ----------------------------
DROP TABLE IF EXISTS `guildbossreward`;
CREATE TABLE `guildbossreward` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `reward` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for welfarecommon
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
-- Table structure for xnfaskill
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
-- Table structure for turntablerecord
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
-- Table structure for turntablepersonal
-- ----------------------------
DROP TABLE IF EXISTS `turntablepersonal`;
CREATE TABLE `turntablepersonal` (
 `serialnumber` int(10) unsigned NOT NULL DEFAULT '0', 
 `characterid` int(10) unsigned NOT NULL DEFAULT '0', 
 `time` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
 `lotteryid` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serialnumber`),KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for herobattle
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
-- Table structure for herocleantime
-- ----------------------------
DROP TABLE IF EXISTS `herocleantime`;
CREATE TABLE `herocleantime` (
 `battleid` int(10) unsigned NOT NULL DEFAULT '0', 
 `charactername` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
 `cleantime` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for guildherocleantime
-- ----------------------------
DROP TABLE IF EXISTS `guildherocleantime`;
CREATE TABLE `guildherocleantime` (
 `guildid` int(10) unsigned NOT NULL DEFAULT '0', 
 `battleid` int(10) unsigned NOT NULL DEFAULT '0', 
 `charactername` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
 `cleantime` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`battleid`),KEY `guild` (`guildid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for guardbattle
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
-- Table structure for plotbattle
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
-- Table structure for realmbattle
-- ----------------------------
DROP TABLE IF EXISTS `realmbattle`;
CREATE TABLE `realmbattle` (
 `characterid` int(10) unsigned NOT NULL DEFAULT '0', 
 `battletimes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for vipbattle
-- ----------------------------
DROP TABLE IF EXISTS `vipbattle`;
CREATE TABLE `vipbattle` (
 `characterid` int(10) unsigned NOT NULL DEFAULT '0', 
 `battletimes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for worldboss
-- ----------------------------
DROP TABLE IF EXISTS `worldboss`;
CREATE TABLE `worldboss` (
 `bossid` int(10) unsigned NOT NULL DEFAULT '0', 
 `killerid` int(10) unsigned NOT NULL DEFAULT '0', 
  PRIMARY KEY (`bossid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for charge
-- ----------------------------
DROP TABLE IF EXISTS `charge`;
CREATE TABLE `charge` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `number` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for arenacharacter
-- ----------------------------
DROP TABLE IF EXISTS `arenacharacter`;
CREATE TABLE `arenacharacter` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `challengenum` int(10) unsigned DEFAULT NULL,
  `cdtime` bigint(10) unsigned DEFAULT NULL,
  `time_reward_num` int(10) unsigned DEFAULT 0,
  `need_check_cd` int(10) unsigned DEFAULT 0,
  `beat_num` int(10) unsigned DEFAULT 0,
  `can_get_rank_reward` int(10) unsigned DEFAULT 0,
  `reward_rank` int(10) unsigned DEFAULT 0,
  `honor` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for arenahistory
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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for arenaranking
-- ----------------------------
DROP TABLE IF EXISTS `arenaranking`;
CREATE TABLE `arenaranking` (
  `ranking` int(10) unsigned NOT NULL DEFAULT '0',
  `characterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ranking`),
  KEY `characterid` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for achievement
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
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for achievementinfo
-- ----------------------------
DROP TABLE IF EXISTS `achievementinfo`;
CREATE TABLE `achievementinfo` (
 `characterid` int(10) unsigned NOT NULL DEFAULT '0', 
 `achievementtype` int(10) unsigned DEFAULT 0,
 `completetimes` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`characterid`,`achievementtype`),
  KEY `character`(`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for escort
-- ----------------------------
DROP TABLE IF EXISTS `escort`;
CREATE TABLE `escort` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `todayescorttimes` int(10) unsigned DEFAULT 0,
  `todayattacktimes` int(10) unsigned DEFAULT 0,
  `carlev` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for characterstatus
-- ----------------------------
DROP TABLE IF EXISTS `characterstatus`;
CREATE TABLE `characterstatus` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `statusinfo` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for activitycommon
-- ----------------------------
DROP TABLE IF EXISTS `activitycommon`;
CREATE TABLE `activitycommon` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `answerrewardget` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for territoryguild
-- ----------------------------
DROP TABLE IF EXISTS `territoryguild`;
CREATE TABLE `territoryguild` (
  `sceneid` int(10) unsigned NOT NULL DEFAULT '0',
  `guildid` int(10) unsigned DEFAULT NULL,
  `occupytime` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`sceneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




-- ----------------------------
-- Table structure for maincityguild
-- ----------------------------
DROP TABLE IF EXISTS `maincityguild`;
CREATE TABLE `maincityguild` (
  `sceneid` int(10) unsigned NOT NULL DEFAULT '0',
  `guildid` int(10) unsigned DEFAULT NULL,
  `occupytime` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`sceneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for territoryreward
-- ----------------------------
DROP TABLE IF EXISTS `territoryreward`;
CREATE TABLE `territoryreward` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
   `territory` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for firstcharge
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
-- Table structure for worshiptimes
-- ----------------------------
DROP TABLE IF EXISTS `worshiptimes`;
CREATE TABLE `worshiptimes` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `times` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for worshipcharacter
-- ----------------------------
DROP TABLE IF EXISTS `worshipcharacter`;
CREATE TABLE `worshipcharacter` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `target` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ----------------------------
-- Table structure for prizebox
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
  `scorereward` int(10) unsigned NOT NULL DEFAULT '0',
  `vipreward` int(10) unsigned NOT NULL DEFAULT '0',
  `thing` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`), KEY `character` (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for metals
-- ----------------------------
DROP TABLE IF EXISTS `metals`;
CREATE TABLE `metals` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `grownvalue` int(10) unsigned NOT NULL DEFAULT '0',
  `growntimes` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for goddessfigure
-- ----------------------------
DROP TABLE IF EXISTS `goddessfigure`;
CREATE TABLE `goddessfigure` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `goddessid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for vip
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
-- Table structure for teambattletimes
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
-- Table structure for shrinebattle
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
-- Procedure structure for GS_SP_INSERT_ARENA_HISTORY
-- ----------------------------
DROP PROCEDURE IF EXISTS `GS_SP_INSERT_ARENA_HISTORY`;
DELIMITER ;;
CREATE  PROCEDURE `GS_SP_INSERT_ARENA_HISTORY`(para_characterid int unsigned, para_sourcecharacterid int unsigned, para_targetcharacterid int unsigned, para_winner int unsigned, para_old_rank  int unsigned, para_new_rank int unsigned, para_target_name char(255))
begin
	declare history_num int unsigned;
	select count(*) from arenahistory where characterid = para_characterid into history_num;
	if history_num >= 5 then
		delete from arenahistory where characterid=para_characterid order by id limit 1;
	end if;
	insert into `arenahistory` (characterid, sourcecharacterid, targetcharacterid, winnercharacterid, old_rank, new_rank, target_name) values (para_characterid, para_sourcecharacterid, para_targetcharacterid, para_winner, para_old_rank, para_new_rank, para_target_name);
end;;
DELIMITER ;


-- ----------------------------
-- Table structure for sword
-- ----------------------------
DROP TABLE IF EXISTS `sword`;
CREATE TABLE `sword` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `emoneytimes` int(10) unsigned NOT NULL DEFAULT '0',
  `moneytimes` int(10) unsigned NOT NULL DEFAULT '0',
  `emoneytimestotals` int(10) unsigned NOT NULL DEFAULT '0',
  `joinactivitystatus` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for mail
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
-- Table structure for newguild
-- ----------------------------
DROP TABLE IF EXISTS `newguild`;
CREATE TABLE `newguild` (
 `characterid` int(10) unsigned NOT NULL DEFAULT '0', 
 `completenewguildids`  binary(255) DEFAULT NULL,
 `newguildrecord` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for activity_freebarter
-- ----------------------------
DROP TABLE IF EXISTS `activity_freebarter`;
CREATE TABLE `activity_freebarter` (
 `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 `bopen` int(20) unsigned NOT NULL DEFAULT '0',
 `curactivitydayid` int(10) unsigned NOT NULL DEFAULT '0', 
 `begintime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for freebarter
-- ----------------------------
DROP TABLE IF EXISTS `freebarter`;
CREATE TABLE `freebarter` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `barterstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for activity_rechargegift
-- ----------------------------
DROP TABLE IF EXISTS `activity_rechargegift`;
CREATE TABLE `activity_rechargegift` (
 `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 `bopen` int(20) unsigned NOT NULL DEFAULT '0',
 `curactivitydayid` int(10) unsigned NOT NULL DEFAULT '0', 
 `begintime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for rechargegift
-- ----------------------------
DROP TABLE IF EXISTS `rechargegift`;
CREATE TABLE `rechargegift` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `rechargenum` int(20) unsigned NOT NULL DEFAULT '0',
 `rewardstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for activity_barter
-- ----------------------------
DROP TABLE IF EXISTS `activity_barter`;
CREATE TABLE `activity_barter` (
 `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 `bopen` int(20) unsigned NOT NULL DEFAULT '0',
 `curactivitydayid` int(10) unsigned NOT NULL DEFAULT '0', 
 `begintime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for barter
-- ----------------------------
DROP TABLE IF EXISTS `barter`;
CREATE TABLE `barter` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `barterstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for activity_consumegift
-- ----------------------------
DROP TABLE IF EXISTS `activity_consumegift`;
CREATE TABLE `activity_consumegift` (
 `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 `bopen` int(20) unsigned NOT NULL DEFAULT '0',
 `begintime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for consumegift
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
-- Table structure for activity_luckytoken
-- ----------------------------
DROP TABLE IF EXISTS `activity_luckytoken`;
CREATE TABLE `activity_luckytoken` (
 `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 `bopen` int(20) unsigned NOT NULL DEFAULT '0',
 `begintime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for luckytoken
-- ----------------------------
DROP TABLE IF EXISTS `luckytoken`;
CREATE TABLE `luckytoken` (
 `characterid` int(20) unsigned NOT NULL DEFAULT '0',
 `rechargenum` int(20) unsigned NOT NULL DEFAULT '0',
 `rewardstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 

-- ----------------------------
-- Table structure for activity_auction
-- ----------------------------
DROP TABLE IF EXISTS `activity_auction`;
CREATE TABLE `activity_auction` (
 `autoid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 `bopen` int(20) unsigned NOT NULL DEFAULT '0',
 `curactivitydayid` int(20) unsigned NOT NULL DEFAULT '0',
 `begintime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
 `auctionthingstatus` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for bank
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
-- Table structure for antiaddition
-- ----------------------------
DROP TABLE IF EXISTS `antiaddition`;
CREATE TABLE `antiaddition` (
  `characterid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
