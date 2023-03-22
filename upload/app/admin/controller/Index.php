<?php
namespace app\admin\controller;


use think\facade\View;
use think\facade\Session;
class Index extends Base
{
    public function index()
    {
        $account = Session::get('account');
        $admin_id = Session::get('admin_uid');

        return View::fetch('index',[
            'account'  => $account,
            'admin_id' => $admin_id,
            'dianjicishu'=>Session::get('dianjicishu')
        ]);
    }

    public function main($s_time = '',$end_time='')
    {

    }
}
