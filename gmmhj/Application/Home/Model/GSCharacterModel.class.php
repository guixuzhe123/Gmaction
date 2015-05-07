<?php
namespace Home\Model;
use Think\Model;

/**
 * GM库 model
 */
class GSCharacterModel extends GSModel {

    protected $tableName = 'character';
    protected $tablePrefix = '';

    public function __contstruct($sid) {
        parent::connection($sid);
    }

}
