<?php
declare (strict_types = 1);

namespace app\listener;

use think\facade\Request;

class RepeatPurchase
{
    /**
     * @param $event
     * 事件监听处理 监听重复购买操作
     * @return mixed
     */
    public function handle($event)
    {
        if (empty($event['repeat'])) return '';
        //添加缓存
        $second = 10;
        if (isset($event['second'])){
            $second = $event['second'];
        }
        if (cache(Request::action().'_user_'.$event['id'])){
            //abort(404,'10秒内只能进行一次购买');
            return show([],config('ToConfig.http_code.error'),$second.'秒内只能进行一次购买');
            die;
         }

        cache(Request::action().'_user_'.$event['id'],time(),$second);
    }
}
