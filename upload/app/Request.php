<?php
namespace app;

// 应用请求对象类
class Request extends \think\Request
{
    //第二种：定义全局过滤信息
    protected $filter = 'htmlspecialchars';
}
