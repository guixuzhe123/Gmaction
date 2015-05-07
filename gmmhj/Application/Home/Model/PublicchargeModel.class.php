<?php

namespace Home\Model;

use Think\Model;

/**
 * Public库chargeemoney表
 */
class PublicchargeModel extends Model {

    protected $tablePrefix = '';
    protected $tableName = 'chargeemoney';

    public function __construct() {
        parent::__construct('', '', 'mysql://selecter:111111@192.168.68.1:3306/mhj_publiclog_p1#utf8');
        //parent::__construct();
    }

}
