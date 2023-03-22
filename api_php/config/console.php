<?php
// +----------------------------------------------------------------------
// | 控制台配置
// +----------------------------------------------------------------------
return [
    // 指令定义
    'commands' => [
        'admin:today_count' => \app\command\TodayCount::class,
        'admin:user_agent_path' => \app\command\UserAgentPath::class,
        'admin:bo_zhu_commission'=>\app\command\BoZhuCommission::class
    ],
];
