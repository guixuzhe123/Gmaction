<?php
namespace Home\Model;
use Think\Model;

class MyModel extends Model{
    protected $tablename = '';
    public $error;

    /*
     * 检查是否存在该表
     *
     * */
    public function testtable($table){
    }
}