<?php
namespace Home\Model;
use Think\Model;

/**
 * GM库 model
 */
class GSTaskModel extends GSModel {

    protected $tableName = 'plotquest';
    public function __contstruct($sid) {
        parent::connection($sid);
    }

}
