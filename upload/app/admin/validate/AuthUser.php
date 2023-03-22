<?php

namespace app\admin\validate;

use think\Validate;

class AuthUser extends Validate
{
    // 当前的验证规则
    protected $rule = [
        'account|账号'  => 'require|unique:AuthUser|min:6|max:20',
        'password|密码' => 'require',
        'group_id|角色' => 'require',
        'user_id|绑定用户'  => 'require|unique:AuthUser',
    ];

    // 验证场景
    protected $scene = [
        'add' => ['account','password','group_id'],
        'edit' => ['account'],
        'check' => ['user_id']
    ];
}