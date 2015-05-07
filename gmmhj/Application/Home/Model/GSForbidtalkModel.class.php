<?php
namespace Home\Model;
use Think\Model;

/**
 * GM库 model
 */
class GSForbidtalkModel extends GSModel {

    protected $tableName = 'forbidtalk';
    protected $tablePrefix = '';

    public function __contstruct($sid) {
        parent::connection($sid);
    }

}
