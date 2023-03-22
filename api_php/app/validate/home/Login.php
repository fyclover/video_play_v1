<?php
declare (strict_types = 1);

namespace app\validate\home;

use think\Validate;

class Login extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名' =>  ['规则1','规则2'...]
     *
     * @var array
     */
    protected $rule = [
        'user_name'=>  'require|max:200',
        'pwd'=>'require|max:200',
        'phone'=>'require|max:200',
        'used'=>'require|max:200',
    ];

    /**
     * 定义错误信息
     * 格式：'字段名.规则名' =>  '错误信息'
     *
     * @var array
     */
    protected $message  =   [
        'user_name.require' => '账号必填',
        'user_name.max' => '账号最多200字',
        'pwd.require' => '密码必填',
        'pwd.max' => '密码最多200字',
        'phone.require' => '手机号必填',
        'phone.max' => '手机号最多200字',
        'used.require' => '旧密码必填',
        'used.max' => '旧密码最多200字',

    ];

    /**
     * 验证场景
     * @var \string[][]
     */
    protected $scene  = [
        'login'=>['phone','pwd'],//登陆
        'register'=>['phone','pwd'],//注册
        'forget'=>['phone','pwd'],//忘记密码
        'edit_pwd'=>['pwd'],//修改密码
    ];

}
