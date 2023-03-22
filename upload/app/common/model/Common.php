<?php
namespace app\common\model;

use think\Model;
use think\facade\Request;
use think\facade\Db;
class Common extends Model{
    
    protected $autoWriteTimestamp = true;
    protected $updateTime = false;

    public function uploadMore($files,$id){
        $upload = new \services\UploadService();
        $upload->setUploadPath('comment');
        $filename = $upload->imageMore('imgList');
        
        // 获取表单上传文件
        //$files = request()->file('shopImgs');
        $data = [];
        foreach($filename as $file){
            $data[]  =  ['thumb'=>$file,'comment_id'=>$id];     
        }
        return $data;
    }

    public static function getMoney($role_id,$plate,$cash_total){
        switch ($role_id) {
            case '2':
                $money = 3000;
                break;
            case '3':
                $money = 6000;
                break;
            case '4':
                $money = 12000;
                    break;
            default:
                $money = 1000;
                break;
        }
        if($plate >= $role_id){
            $total_moeny = $money * 4;
        }else{
            $total_moeny = $money * 2;
        }
        return $total_moeny;
        
    }

    public static function findYj($money,$num){
        if($money >= 200000 && $num >= 20){
            $plate = 4;
        }else if($money >= 100000 && $num >= 10){
            $plate = 3;
        }else if($money >= 50000 && $num >= 5){
            $plate = 2;
        }else{
            $plate = 1;
        }
        return $plate;
    }

    public static function findRebate($palte){
        $webset = Webset::find(1);
        if($palte == 4){
            $rebate = $webset['agent_lcd_retail'];
        }else if($palte == 3){
            $rebate = $webset['agent_qjd_retail'];
        }else if($palte == 2){
            $rebate = $webset['agent_xxd_retail'];
        }else{
            $rebate = 1;
        }
        return $rebate;
    }

    public static function checkpl($role_id){
        if($role_id == 4){
            $moeny = 12000*0.5;
        }else if($role_id == 3){
            $moeny = 6000*0.5;
        }else if($role_id == 2){
            $moeny = 3000*0.5;
        }else{
            $moeny = 1000*0.5;
        }
        return $moeny;
    }

    /**
     * 批发条件判断
     */ 
    public static function pf_judge($user_id,$total_price,$pay_type,$postage_money=0){
        $info = Member::where('id',$user_id)->find();
        // $check_plate = Common::findYj($info['team_yj'],$info['plate_count']);
        // $total_money = Common::getMoney($info['old_role_id'],$check_plate,$info['cash_total']);
        // if($info['cash_total'] >= $total_money){
        //     $info->role_id = 0;
        //     $info->save();
        // }
        if($info['role_id'] <= 0)return show(400,'当前没有批发资格！','当前没有批发资格！');//|| $info['jishou_end_time'] < time()
        $money = self::checkpl($info['role_id']);
        $jsprice = OrderInfo::where('user_id',$user_id)->where('js_status','in','1,2')->sum('total_price');
        //批发售价不能大于 （门店*50%-寄售中和寄售出）的价格
        if($total_price-$postage_money > $money-$jsprice)return show(400,'当前不能批发该售价商品！','当前不能批发该售价商品！');
        $pf_switch = Webset::where('id',1)->value('pf_switch');
        // dump($pf_switch);die;
        $cash_total = CashOut::where('user_id',$user_id)->where('tip',1)->where('cash_sta',1)->where('status',1)->sum('y_money');
        $qiandou_now = $info['qiandou'] - $cash_total;
        if($pf_switch == 1){
            //关闭状态
            $firstbuy = Order::where('user_id',$user_id)->where('tip',4)->whereIn('status','2,4')->find();
            if(empty($firstbuy) && (int)$pay_type >= 4)return show(400,'首次批发只可使用现金支付！','首次批发只可使用现金支付！');
            if(!empty($firstbuy) && (int)$pay_type !== 4)return show(400,'只能使用余额支付！','只能使用余额支付！');
            $cash_balance = CashOut::where('user_id',$user_id)->where('tip',3)->where('status',1)->sum('y_money');
            $balance_now = $info['balance'] - $cash_balance;
            if($pay_type == 4 && $total_price > $balance_now){
                return show(400,'当前余额不足！','当前余额不足！');
            }
            if($pay_type == 5 && $total_price > $qiandou_now){
                return show(400,'当前余额不足！','当前余额不足！');
            }
        }else{
            if($pay_type == 5 && $total_price > $qiandou_now){
                return show(400,'当前黔豆不足！','当前黔豆不足！');
            }
        }
        
        return true;
    }

    /**
     * 订单退款处理
     */
    public function cancelOrder($order_id,$goods_id){
        try {
            Db::startTrans();
            $info = OrderInfo::where('order_id',$order_id)->where('goods_id',$goods_id)->find();
            $member = Member::find($info['user_id']);
            // $member->xf_money = $member['xf_money'] - $info['total_price'];
            // $member->save();
            $record = Record::where('order_id',$order_id)->select();
            $memberModel = new Member;
            if(count($record) > 0){
                if(!empty($member['user_id'])){
                    $money = $memberModel->getprofit($member['user_id'],$info['pt_profit'],1);
                    if($money > 0)
                        Member::reduce($member['user_id'],$money*7,$order_id,$info['id']);
                }
                if(!empty($member['ancestors'])){
                    $money = $memberModel->getprofit($member['ancestors'],$info['pt_profit'],2);
                    if($money > 0)
                        Member::reduce($member['ancestors'],$money*10,$order_id,$info['id']);
                }
                if(!empty($member['three_level'])){
                    $money = $memberModel->getprofit($member['three_level'],$info['pt_profit'],3);
                    if($money > 0)
                        Member::reduce($member['three_level'],$money*28,$order_id,$info['id']);
                }
            }
            Db::commit();
            return true;
        } catch (\Throwable $th) {
            Db::rollback();
            return show(400,'异常');
        }
    }

    /**
     * 门店达到要求（比如旗舰店，直推门店10个店，业绩达10万元）则自动续时
     */
    public static function userSetJishouTime(){
        $list = Member::where('role_id','>',0)->where('jishou_end_time','<=',strtotime('-1 day'))->select();
        $num = Webset::where('id',1)->value('time_num');
        if(count($list) > 0){
            Errmsg::create(['msg' => '执行续时任务:'.count($list).'个','time'=>date('Y-m-d H:i:m')]);
            foreach ($list as $key => $val) {
                if(($val['role_id'] == 4 && $val['plate_count'] >= 20 && $val['team_yj'] >= 200000)
                || ($val['role_id'] == 3 && $val['plate_count'] >= 10 && $val['team_yj'] >= 100000)
                || ($val['role_id'] == 2 && $val['plate_count'] >= 5 && $val['team_yj'] >= 50000)){
                    $res = Member::where('id',$val['id'])->update(['jishou_end_time'=>strtotime('+'.$num.' month')]);
                    if($res) Errmsg::create(['msg' => ''.$val['id'].'续时成功','time'=>date('Y-m-d')]);
                }
            }
        }
        // else{
        //     Errmsg::create(['msg' => '没有执行的用户任务','time'=>date('Y-m-d')]);
        // }
        return true;
    } 

    public static function ordersellt(){
        $date = strtotime('-15 days');
        $orderinfos = Order::where('status','in','3,8')->whereTime('create_time', '<=', $date)->select();
        if(count($orderinfos) > 0 ){//|| date('d') !== '15'
            $webset = Webset::find(1);
            foreach ($orderinfos as $k => $v) {
                Errmsg::create(['order_id' =>$v['id'],'msg' => 'xin有执行的任务','time'=>date('Y-m-d')]);
                $orderinfo = Order::where('id',$v['id'])->find();
                $orderinfo->status = 4;
                $res = $orderinfo->save();
                // if($v['tip'] == 3)
                //     Member::where('id', $orderinfo['user_id'])->inc('xf_money', $orderinfo['total_price'])->update();
                if($res){
                    $res_order = OrderInfo::where('order_id',$orderinfo['id'])->where('status','in','2,3')->update(['status'=>4]);
                    // $applly = AfterSaleApply::where('order_id',$orderinfo['id'])->find();
                    // if($applly){
                    //     $afres = AfterSaleApply::where('order_id',$orderinfo['id'])->update(['status' => 2]);
                    // }
                }
            }
        }
        // else{
        //     Errmsg::create(['msg' => '没有执行的订单任务','time'=>date('Y-m-d')]);
        // }
        return true;
    }
}