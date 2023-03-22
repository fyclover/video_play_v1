<?php
namespace app\admin\controller;

use app\BaseController;
use think\facade\View;
use think\facade\Session;
use think\facade\Request;
use app\admin\model\AuthUser;
class Base extends BaseController
{
    //用户信息
    public $userinfo = [];

    protected function initialize(){
        
        $admin_id = Session::get('admin_uid');
        $userinfo = AuthUser::where('id',$admin_id)->find();
        $this->userinfo = $userinfo;
        Session::set('dianjicishu', env('config.countdianji')-$userinfo['numbers']);
    }
}
