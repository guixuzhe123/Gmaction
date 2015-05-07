-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2014-12-11 14:39:48
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
-- 表的结构 `gm_hour_reg`
--

CREATE TABLE IF NOT EXISTS `gm_hour_reg` (
  `sid` int(11) NOT NULL COMMENT '区服id',
  `date` date NOT NULL COMMENT '日期',
  `h1` int(11) NOT NULL,
  `h2` int(11) NOT NULL,
  `h3` int(11) NOT NULL,
  `h4` int(11) NOT NULL,
  `h5` int(11) NOT NULL,
  `h6` int(11) NOT NULL,
  `h7` int(11) NOT NULL,
  `h8` int(11) NOT NULL,
  `h9` int(11) NOT NULL,
  `h10` int(11) NOT NULL,
  `h11` int(11) NOT NULL,
  `h12` int(11) NOT NULL,
  `h13` int(11) NOT NULL,
  `h14` int(11) NOT NULL,
  `h15` int(11) NOT NULL,
  `h16` int(11) NOT NULL,
  `h17` int(11) NOT NULL,
  `h18` int(11) NOT NULL,
  `h19` int(11) NOT NULL,
  `h20` int(11) NOT NULL,
  `h21` int(11) NOT NULL,
  `h22` int(11) NOT NULL,
  `h23` int(11) NOT NULL,
  `h0` int(11) NOT NULL,
  `role_h0` int(11) NOT NULL,
  `role_h1` int(11) NOT NULL,
  `role_h2` int(11) NOT NULL,
  `role_h3` int(11) NOT NULL,
  `role_h4` int(11) NOT NULL,
  `role_h5` int(11) NOT NULL,
  `role_h6` int(11) NOT NULL,
  `role_h7` int(11) NOT NULL,
  `role_h8` int(11) NOT NULL,
  `role_h9` int(11) NOT NULL,
  `role_h10` int(11) NOT NULL,
  `role_h11` int(11) NOT NULL,
  `role_h12` int(11) NOT NULL,
  `role_h13` int(11) NOT NULL,
  `role_h14` int(11) NOT NULL,
  `role_h15` int(11) NOT NULL,
  `role_h16` int(11) NOT NULL,
  `role_h17` int(11) NOT NULL,
  `role_h18` int(11) NOT NULL,
  `role_h19` int(11) NOT NULL,
  `role_h20` int(11) NOT NULL,
  `role_h21` int(11) NOT NULL,
  `role_h22` int(11) NOT NULL,
  `role_h23` int(11) NOT NULL,
  `task_h0` int(11) NOT NULL,
  `task_h1` int(11) NOT NULL,
  `task_h2` int(11) NOT NULL,
  `task_h3` int(11) NOT NULL,
  `task_h4` int(11) NOT NULL,
  `task_h5` int(11) NOT NULL,
  `task_h6` int(11) NOT NULL,
  `task_h7` int(11) NOT NULL,
  `task_h8` int(11) NOT NULL,
  `task_h9` int(11) NOT NULL,
  `task_h10` int(11) NOT NULL,
  `task_h11` int(11) NOT NULL,
  `task_h12` int(11) NOT NULL,
  `task_h13` int(11) NOT NULL,
  `task_h14` int(11) NOT NULL,
  `task_h15` int(11) NOT NULL,
  `task_h16` int(11) NOT NULL,
  `task_h17` int(11) NOT NULL,
  `task_h18` int(11) NOT NULL,
  `task_h19` int(11) NOT NULL,
  `task_h20` int(11) NOT NULL,
  `task_h21` int(11) NOT NULL,
  `task_h22` int(11) NOT NULL,
  `task_h23` int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


--
-- 表的结构 `gm_online`： 在线数据
--

CREATE TABLE IF NOT EXISTS `gm_online` (
  `sid` int(11) NOT NULL COMMENT '区服id',
  `date` date NOT NULL COMMENT '日期',
  `h0` int(11) NOT NULL,
  `h1` int(11) NOT NULL,
  `h2` int(11) NOT NULL,
  `h3` int(11) NOT NULL,
  `h4` int(11) NOT NULL,
  `h5` int(11) NOT NULL,
  `h6` int(11) NOT NULL,
  `h7` int(11) NOT NULL,
  `h8` int(11) NOT NULL,
  `h9` int(11) NOT NULL,
  `h10` int(11) NOT NULL,
  `h11` int(11) NOT NULL,
  `h12` int(11) NOT NULL,
  `h13` int(11) NOT NULL,
  `h14` int(11) NOT NULL,
  `h15` int(11) NOT NULL,
  `h16` int(11) NOT NULL,
  `h17` int(11) NOT NULL,
  `h18` int(11) NOT NULL,
  `h19` int(11) NOT NULL,
  `h20` int(11) NOT NULL,
  `h21` int(11) NOT NULL,
  `h22` int(11) NOT NULL,
  `h23` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `avg` int(11) NOT NULL
  );


--
-- 表的结构 `gm_keep`： 留存
--
CREATE TABLE IF NOT EXISTS `gm_keep` (
  `sid` int(11) NOT NULL COMMENT '区服id',
  `date` date NOT NULL COMMENT '日期',
  `new` int(11) NOT NULL COMMENT '当日新增',
  `day2` int(11) NOT NULL COMMENT '二日留存',
  `day3` int(11) NOT NULL COMMENT '三日留存',
  `day4` int(11) NOT NULL COMMENT '四日留存',
  `day5` int(11) NOT NULL COMMENT '五日留存',
  `day7` int(11) NOT NULL COMMENT '七日留存',
  `day14` int(11) NOT NULL COMMENT '十四日留存',
  `day21` int(11) NOT NULL COMMENT '二十一日留存',
  `day30` int(11) NOT NULL COMMENT '三十日留存'
);

