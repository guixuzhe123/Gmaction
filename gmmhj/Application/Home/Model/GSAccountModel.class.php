<?php
namespace Home\Model;
use Think\Model;

/**
 * GM库 model
 */
class GSAccountModel extends GSModel {

    protected $tableName = 'account';
    protected $tablePrefix = '';

    public function __contstruct($sid) {
        parent::connection($sid);
    }

}
