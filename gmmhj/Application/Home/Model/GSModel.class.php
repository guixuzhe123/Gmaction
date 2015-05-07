<?php

namespace Home\Model;

use Think\Model;

/**
 * GM库 model
 */
class GSModel extends Model {

    protected $tablePrefix = '';
    public function __construct($sid) {
        $serverinfo = D('Serverinfo');
        $re = $serverinfo->where(array('autoid' => $sid))->find();
        parent::__construct('', '', $re['gs_connection']);
        //parent::__construct();
    }

}
