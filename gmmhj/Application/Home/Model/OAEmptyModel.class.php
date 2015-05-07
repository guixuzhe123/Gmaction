<?php
namespace Home\Model;
use Think\Model;

//oa空数据库
class OAEmptyModel extends OAModel{
	protected $tableName = '';
	protected $tablePrefix = '';

	public function __contstruct($sid){
		parent::connection($sid);
	}
}