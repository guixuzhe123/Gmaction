<?php
namespace Home\Model;
use Think\Model;

//gs空数据库
class GSEmptyModel extends GSModel{
	protected $tableName = '';
	protected $tablePrefix = '';

	public function __contstruct($sid){
		parent::connection($sid);
	}
}