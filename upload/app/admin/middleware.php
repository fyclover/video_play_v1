<?php
// 中间件定义文件
return [
   \think\middleware\SessionInit::class,
   \app\middleware\Check::class,
];
