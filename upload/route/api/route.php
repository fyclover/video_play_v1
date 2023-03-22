<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
$header = [
    'Access-Control-Allow-Origin' => '*',
    'Access-Control-Allow-Methods' => 'OPTIONS,POST,GET,DELETE,PUT',
    'Access-Control-Allow-Credentials' => 'true',
    'Access-Control-Allow-Headers' => 'x-token,x-uid,x-token-check,x-requested-with,content-type,Host,token',
]; 
use think\facade\Route;
Route::get('cf', 'admin/Upload/cf');
Route::get('upload', 'admin/Upload/index');





