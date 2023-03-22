<?php

namespace app\common\service;

use app\common\model\MoneyLog;
use app\common\model\SysConfig;
use app\common\model\UserModel;
use think\Exception;
use think\facade\Db;

class BuyDivided
{
    /**
     * 购买分成比例
     */

    public $config = [];
    //获取配置
    public function getConfig(){
        //获取总分成配置
        $SysConfig = new SysConfig();
        $boZhuBuyDivided = $SysConfig->where('name','bozhu_buy_divided')->value('value'); //购买博主获得分成比例 除100
        $RechargeRebates = $SysConfig->where('name','recharge_rebates')->value('value');  //充值返佣 除100
        $config['bozhu_buy_divided'] = empty($boZhuBuyDivided) ? 0: $boZhuBuyDivided;
        $config['recharge_rebates'] =  empty($RechargeRebates) ? 0: $RechargeRebates;
        return $this->config;
    }



    /** 购买的时候分成给博主
     * @param $boZhuInfo @博主信息
     * @param $userInfo  @用户信息
     * @param $buyInfo  @购买信息
     * @return void
     */
    public function buy($boZhuID,$userInfo,$buyInfo) : bool
    {
        //1 获取博主余额 与分销比例
        $userModel = new UserModel();
        if ($boZhuID <=0){
            return false;
        }

        $boZhuInfo = $userModel->where('id',$boZhuID)->find();
        if (empty($boZhuInfo)){
            return false;
        }

        if ($boZhuInfo->agent_rate <=0){
            $boZhuInfo->agent_rate = $this->config['bozhu_buy_divided'];
        }
        //2 分配博主金额
        if (!isset($buyInfo['money']) || $buyInfo['money']<=0){
            return false;
        }

        $GetMoney = $buyInfo['money']*($boZhuInfo->agent_rate /100 );
        //3 写入资金来源记录
        $mark = '博主：'.$boZhuInfo->user_name.',ID:'.$boZhuID.',获得购买分成'.$GetMoney.'元,'.
            '来源用户: '.$userInfo['user_name'].',用户ID：'.$userInfo['id'].',订单ID：'.$buyInfo['id'];
        $MoneyLog = new MoneyLog();
        Db::startTrans();
        try {
            $userModel->inc('money_balance',$GetMoney)->update();//写入用户增加金额
            $MoneyLog->insert([
                'create_time'=>date('Y-m-d H:i:s'),
                'type'=>1,
                'status'=>301,
                'money_before'=>$buyInfo['money'],
                'money_end'=>$buyInfo['money'] + $GetMoney,
                'money'=>$GetMoney,
                'uid'=>$boZhuID,
                'source_id'=>$buyInfo['id'],//订单id
                'market_uid'=>0,
                'mark'=>$mark,
            ]);
            Db::commit();
        }catch (Exception $e){
            Db::rollback();
            return false;
        }
        return true;
    }
}