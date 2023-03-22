<?php
// +----------------------------------------------------------------------
// | 控制台配置
// +----------------------------------------------------------------------
return [
    // 指令定义
    'commands' => [
        'video_detail'=>\app\command\VideoDetail::class,
        'video_list'=>\app\command\VideoList::class,
    ],
];
