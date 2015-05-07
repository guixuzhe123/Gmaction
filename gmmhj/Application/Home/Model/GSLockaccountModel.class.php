<?php
namespace Home\Model;
use Think\Model;

/**
 * GM库 model
 */
class GSLockaccountModel extends GSModel {

    protected $tableName = 'lockaccount';
    protected $tablePrefix = '';

    public function __contstruct($sid) {
        parent::connection($sid);
    }

}
