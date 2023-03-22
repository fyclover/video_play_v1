<?php


namespace app\command;

use app\common\model\OrderModel;
use app\common\model\UserModel;
use app\common\service\BuyDivided;
use think\console\Command;
use think\console\Input;
use think\console\Output;

/**
 * 10分钟执行一次
 **/
class BoZhuCommission extends Command
{
    protected function configure()
    {
        $this->setName('BoZhuCommission')->setDescription('Here is the BoZhuCommission');
    }

    protected function execute(Input $input, Output $output)
    {
        //1  查询没有返给博主的订单
        $OrderArray = OrderModel::where('status', 1)->where('buy_aid', '>', 0)->select()->toArray();
        if (empty($OrderArray)) {
            $output->writeln('没有数据。执行成功');
            return;
        }
        //2 查询博主信息
        $BuyDividedModel = new BuyDivided();
        $BuyDividedModel->getConfig();
        foreach ($OrderArray as $key => $value) {
            //$bozhuinfo =  AdminModel::where('id',$value['buy_aid'])->find();
            //3 查询购买用户信息

            $userinfo = UserModel::where('id', $value['uid'])->find();
            $BuyDividedModel->buy($value['buy_aid'], $userinfo, $value);
            sleep(1);
        }


        $output->writeln('执行成功');
    }
}