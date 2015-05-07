<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Pager
 *
 * @author Administrator
 */
class Pager {

    /**
     * 获取分页列表
     * @param string $urlPrefix URL前缀
     * @param int $curPage 当前页
     * @param int $totalPage 总页数
     * @param int $range 范围
     * @param string $curPageClass 当前页的Class
     * @param string $attrStr 属性字符串
     * @return string
     */
    public static function getPageList($urlPrefix, $curPage, $totalPage, $range = 5, $curPageClass = '', $attrStr = '') {
        $start = max(2, $curPage - $range);
        $end = min($totalPage - 1, $curPage + $range);
        $delta = $range * 2 - ($end - $start);
        if ($delta > 0) {
            if ($start < $range) {
                $end = min($totalPage - 1, $end + $delta);
            } else {
                $start = max(2, $start - $delta);
            }
        }
        $str = '';
        $str .= self::__getPageTag($urlPrefix, 1, $curPage, $curPageClass, $attrStr);
        if ($start > 2) {
            $str .= '...';
        }
        for ($page = $start; $page <= $end; ++$page) {
            $str .= self::__getPageTag($urlPrefix, $page, $curPage, $curPageClass, $attrStr);
        }
        if ($end < $totalPage - 1) {
            $str .= '...';
        }
        if ($totalPage > 1) {
            $str .= self::__getPageTag($urlPrefix, $totalPage, $curPage, $curPageClass, $attrStr);
        }
        return $str;
    }

    /**
     * 获取页标签
     * @param string $urlPrefix URL前缀
     * @param int $page 页码
     * @param int $curPage 当前页
     * @param string $curPageClass 当前页的Class
     * @param string $attrStr 属性字符串
     * @return string
     */
    private static function __getPageTag($urlPrefix, $page, $curPage, $curPageClass, $attrStr) {
        if ($page == $curPage) {
            return '<a href="' . $urlPrefix . $page . '" class="' . $curPageClass . '"' . $attrStr . '>' . $page . '</a>';
        } else {
            return '<a href="' . $urlPrefix . $page . '"' . $attrStr . '>' . $page . '</a>';
        }
    }

    public static function getSelect($name, $id, $arr, $val, $multiple = false) {
        $multiple_str = $multiple == false ? '' :'multiple="true"';
        $html = '<select class="form-control" id="' . $id . '" name="' . $name . '" ' . $multiple_str . ' style="width:150px;display:inline;"><option value = "0">－请选择－</option>';
        if (!empty($arr)) {
            foreach ($arr as $k => $v) {
                $html .= '<option value = "' . $k . '" sid="' . $v['sid'] . '" ';
                if ($k == $val) {
                    $html .= ' selected ';
                }
                $html .= ' >' . $v['name'] . '</option>';
            }
        }
        $html .= '</select>';
        return $html;
    }

    //获取场景名称
    public static function getScene($sceneid){
        $xml = simplexml_load_file('./Public/Xml/scenes.xml');
        $str = array();
        for($i = 0;$i < count($xml->scene);$i++){
            $str[$i]['sceneid'] = $xml->scene[$i]->attributes()->id;
            $str[$i]['name'] = $xml->scene[$i]->attributes()->name;
        }
        for($i = 0;$i < count($xml->scene);$i++){
            if($str[$i]['sceneid'] == $sceneid){
                return $str[$i]['name'];
            }
        }
    }

}
