<?php
// +----------------------------------------------------------------------
// | 应用设置
// +----------------------------------------------------------------------

return [
    // 应用地址
    'app_host'         => env('app.host', ''),
    // 应用的命名空间
    'app_namespace'    => '',
    // 是否启用路由
    'with_route'       => true,
    // 是否启用事件
    'with_event'       => true,
    'app_express'      => true,
    // 默认应用
    'default_app'      => 'admin',
    // 默认时区
    'default_timezone' => 'Asia/Shanghai',

    // 应用映射（自动多应用模式有效）
    'app_map'          => [],
    // 域名绑定（自动多应用模式有效）
    'domain_bind'      => [],
    // 禁止URL访问的应用列表（自动多应用模式有效）
    'deny_app_list'    => [],

    // 异常页面的模板文件
    'exception_tmpl'   => app()->getThinkPath() . 'tpl/think_exception.tpl',

    // 错误显示信息,非调试模式有效
    'error_message'    => '页面错误！请稍后再试～',
    // 显示错误信息
    'show_error_msg'   => false,
    'code_cache_time' => 1800,//验证码过期时间3分钟
    'login_time_out'  => 28,
    'nocheck'		   => ['upload/cf','upload/index','Login/index','Index/index','Index/main','Login/loginout','Goods/gettype','Goods/getSpec','Goods/getItem','Goods/upimg'],//不需要验证权限的url
    'order_status'     => ['0'=>'待付款','1'=>'待发货', '2'=>'待收货', '3'=>'已完成','4'=>'已评价'],
];
