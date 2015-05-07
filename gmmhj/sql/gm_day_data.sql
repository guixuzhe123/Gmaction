-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2014-12-11 14:39:43
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
-- 表的结构 `gm_day_data`
--

CREATE TABLE IF NOT EXISTS `gm_day_data` (
  `sid` int(11) NOT NULL COMMENT '区服id',
  `date` date NOT NULL COMMENT '日期',
  `accout_num` int(11) NOT NULL COMMENT '账户数量',
  `role_num` int(11) NOT NULL COMMENT '角色数',
  `task_num` int(11) NOT NULL COMMENT '完成第一个任务角色数',
  `act_num` int(11) NOT NULL COMMENT '活跃人数',
  `charge_role_num` int(11) NOT NULL COMMENT '充值角色数',
  `charge_total` int(11) NOT NULL COMMENT '充值总钱数',
  `charge_num` int(11) NOT NULL COMMENT '充值次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日数据';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
