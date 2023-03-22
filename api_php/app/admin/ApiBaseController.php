<?php


namespace app\admin;


use app\BaseController;
use app\common\model\UserModel;
use app\middleware\Before;

class ApiBaseController extends BaseController
{
    protected $middleware = [Before::class,];//验证token和访问控制器权利
    public function initialize()
    {
        $user_info = (new UserModel())->order('id asc')->find()->toArray();

        session('admin_user',$user_info);
        parent::initialize(); // TODO: Change the autogenerated stub
    }
}