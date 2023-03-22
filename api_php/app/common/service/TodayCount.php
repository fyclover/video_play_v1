<?php


namespace app\common\service;

use app\common\model\PayCash;
use app\common\model\PayRecharge;
use app\common\model\TodayCountModel;
use app\common\model\UserModel;
use think\exception\ValidateException;

/**
 *   每日提现，充值，注册统计
 * Class TodayCount
 * @package app\common\service
 */
class TodayCount
{
    public $count = [];

    //充值
    public function recharge()
    {
        $model = new PayRecharge();
        $this->count['recharge'] = $model->whereTime('create_time', 'today')->sum('money');
        return $this;
    }

    //提现
    public function withdrawal()
    {
        $model = new PayCash();
        $this->count['withdrawal'] = $model->whereTime('create_time', 'today')->sum('money');
        return $this;
    }

    //注册
    public function register()
    {
        $model = new UserModel();
        $this->count['register'] = $model->whereTime('create_time', 'today')->count();
        return $this;
    }

    public function update()
    {
        $model = new TodayCountModel();
        //查询是否有今日的数据
        $find = $model->whereTime('date_time', 'today')->find();
        //存在时修改当前数据
        if ($find) {
            $find['today_register'] = $this->count['register'];
            $find['today_withdrawal'] = $this->count['withdrawal'];
            $find['today_recharge'] = $this->count['recharge'];
            try {
                $find->save();
            } catch (ValidateException $e) {
                $e->getMessage();
            }
            return $this;
        }

        //不存在是插入数据
        try {
            $model->save([
                'today_register' => $this->count['register'],
                'today_withdrawal' => $this->count['withdrawal'],
                'today_recharge' => $this->count['recharge'],
                'date_time' => date('Y-m-d H:i:s'),
                'dates' => date('Y-m-d'),
            ]);
        } catch (ValidateException $e) {
            $e->getMessage();
        }

        return $this;
    }
}