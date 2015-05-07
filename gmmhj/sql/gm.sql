-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2014-12-11 13:15:40
-- 服务器版本： 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gm`
--

-- --------------------------------------------------------

--
-- 表的结构 `gm_admin`
--

CREATE TABLE IF NOT EXISTS `gm_admin` (
`id` int(4) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `logintime` int(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `gm_admin`
--

INSERT INTO `gm_admin` (`id`, `username`, `password`, `logintime`) VALUES
(1, 'admin', 'f00d04b763dfad1f8a30ad2e42e5d9d4', 0);

-- --------------------------------------------------------

--
-- 表的结构 `gm_plat`
--

CREATE TABLE IF NOT EXISTS `gm_plat` (
    `id` int(5) NOT NULL,
    `platid` int(10) NOT NULL COMMENT '运营平台ID',
    `platname` varchar(255) NOT NULL COMMENT '运营平台名称'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `gm_plat`
--

INSERT INTO `gm_plat` (`id`, `platid`, `platname`) VALUES
(1, 1, '3595想玩就玩'),
(2, 2, '1723yx');

-- --------------------------------------------------------

--
-- 表的结构 `gm_serverinfo`
--

CREATE TABLE IF NOT EXISTS `gm_serverinfo` (
`id` int(5) NOT NULL,
  `gameip` varchar(255) NOT NULL COMMENT '物理IP',
  `name` varchar(255) NOT NULL COMMENT '服务器中文标识',
  `create_time` int(15) NOT NULL COMMENT '开服时间',
  `platid` int(10) NOT NULL COMMENT '运营平台ID'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='区服信息' AUTO_INCREMENT=3 ;

alter table gm_serverinfo ADD `oa_connection` varchar(512) NOT NULL COMMENT 'oa库连接';
alter table gm_serverinfo ADD `gs_connection` varchar(512) NOT NULL COMMENT 'gameserver库连接';

--
-- 转存表中的数据 `gm_serverinfo`
--

INSERT INTO `gm_serverinfo` (`id`, `gameip`, `name`, `create_time`, `platid`) VALUES
(1, '1', '奥拉基尔', 1417684931, 1),
(2, '2', '奥特兰克', 1417684931, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gm_admin`
--
ALTER TABLE `gm_admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_plat`
--
ALTER TABLE `gm_plat`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_serverinfo`
--
ALTER TABLE `gm_serverinfo`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gm_admin`
--
ALTER TABLE `gm_admin`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `gm_plat`
--
ALTER TABLE `gm_plat`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `gm_serverinfo`
--
ALTER TABLE `gm_serverinfo`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



--
-- 表的结构 `gm_msg`
--

CREATE TABLE IF NOT EXISTS `gm_msg` (
    `id` int(5) NOT NULL,
    `role` varchar(64) NOT NULL COMMENT '操作人',
    `type` varchar(64) NOT NULL COMMENT '消息类型',
    `content` text COMMENT '运营平台ID',
    `createtime` int(10) NOT NULL COMMENT '创建时间',
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 表的结构 `gm_apply`
--

CREATE TABLE IF NOT EXISTS `gm_apply` (
    `id` int(5) NOT NULL AUTO_INCREMENT,
	`plat` int(10) NOT NULL,
    `sid` int(10) NOT NULL,
	`characters` varchar(512) NOT NULL COMMENT '申请角色id列表',
	`apply_time` datetime NOT NULL,
    `apply_reason` varchar(512) NOT NULL COMMENT '申请原因',
	`status` int(10) NOT NULL,
	`review_time` datetime NULL,
	`review_reason` varchar(512) NULL COMMENT '审核原因',
	`apply_gold` int(10) NOT NULL COMMENT '申请元宝',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
