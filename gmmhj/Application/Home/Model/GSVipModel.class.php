<?php
namespace Home\Model;
use Think\Model;

//vip表

class GSVipModel extends GSModel{
	
	protected $tableName = 'vip';
	protected $tablePrefix = '';

	public function __contstruct($sid){
		parent::connection($sid);
	}
}
