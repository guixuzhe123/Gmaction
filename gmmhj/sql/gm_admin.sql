-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-01-04 09:00:38
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
  `logintime` int(20) NOT NULL,
  `ruthrank` int(3) NOT NULL COMMENT '授权等级，暂定为3个等级',
  `blockid` varchar(255) NOT NULL DEFAULT '999' COMMENT '可操作模块对应的id'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `gm_admin`
--

INSERT INTO `gm_admin` (`id`, `username`, `password`, `logintime`, `ruthrank`, `blockid`) VALUES
(1, 'admin', 'f00d04b763dfad1f8a30ad2e42e5d9d4', 0, 1, '0'),
(5, 'hai1222', 'f00d04b763dfad1f8a30ad2e42e5d9d4', 0, 0, '20010,20020,20030,20040,30020,200,300');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gm_admin`
--
ALTER TABLE `gm_admin`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gm_admin`
--
ALTER TABLE `gm_admin`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
