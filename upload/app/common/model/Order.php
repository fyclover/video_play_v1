<?php
namespace app\common\model;

use think\Model;
use think\facade\Request;
use think\facade\Db;
use app\common\model\SpecGoodsPrices;
use think\model\concern\SoftDelete;
class Order extends Model{

    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $autoWriteTimestamp = true;
    protected $updateTime = false;

    public function addr()
    {
        return $this->belongsTo(OrderAddress::class, 'address_id');
    }
    public function user()
    {
        return $this->hasOne('Member','id','user_id')->field('id,nickname,head_img');
    }

    public function order()
    {
        return $this->hasMany('OrderInfo','order_id')->with(['goods','comment']);
    }

    public function ordersh()
    {
        return $this->hasMany('OrderInfo','order_id')->with(['goods','refund','change']);
    }
    public function record()
    {
        return $this->hasMany('Record','order_id')->where('tip',1);
    }

    public function goods()
    {
        return $this->hasOne(Goods::class,'id','goods_id')->field('id,goods_name,thumb,sell_price,js_price,number');
    }

    public static function countPrice($userids){
        $model = new self;
        $model = $model->where('tip','in','1,3,4');
        $model = $model->where('user_id','in',$userids);
        $model = $model->where('status','>=',2);
        return $model->sum('total_price');
    }

    public static function getAll($user_id){
        $where = Request::param();
        $page = !empty($where['page']) ? $where['page'] :1;
        $pagesize = !empty($where['page_size']) ? $where['page_size'] :15;
        $model = new self;
        $status = !empty($where['status']) ? $where['status'] :5;
        if($status == 5){
            $model = $model->whereIn('status','1,2,3,4,5,6,7,8,10');
        }else{
            $model = $model->where('status',$status);
        }
        $model = $model->where('user_id',$user_id);
//        $model = $model->where('is_jishou',2);
        return $model->with(['addr'])->order('id desc')->page($page,$pagesize)->select();
    }
    /**
     * 新增
     */
    public function insertDb($userid,$pay_order_num)
    {
        $data = Request::param();
        Db::startTrans();
        try {
            $address_id = OrderAddress::insertDb($data['address_id']);
            if(!$address_id){
                return show(400,'网络错误稍后重试！');
            }
            $carinfo = ShoppingCar::whereIn('id',$data['car_id'])->field('GROUP_CONCAT(id) AS carid,tip as bid')
            ->group('tip')->select();
            if(count($carinfo)<=0)return show(400,'数据不存在！');
            // return show(0,'ok',$carinfo);
            foreach ($carinfo as $key => $v) {
                $data['address_id'] = $address_id;
                $strs = "QWERTYUIOPASDFGHJKLZXCVBNM";
                $name = substr(str_shuffle($strs),mt_rand(0,strlen($strs)-11),3);
                $data['order_num'] = $name.substr(mt_rand(1000000, 999999999), 0, 9);
                $data['pay_order_num'] = $pay_order_num;
                $total = $this::getTotalPrice($v['carid']);
                $data['original_price'] = $total['total_price'];
                if($v['bid'] == 3){
                    $offset = PlatePrice::getFind($data['original_price']);
                    $data['plate_id'] = $offset;
//                    $data['is_jishou'] = 2;
                    // $data['total_price'] = $total['total_price'];
                }
                // else{
                //     $data['total_price'] = $total['pf_price'];
                // }
//                if($v['bid'] == 4){
//                    $data['is_jishou'] = 1;
//                }
                $data['tip'] = $v['bid'];
                $data['user_id'] = $userid;
                $data['type'] = 2;
                $res = $this::create($data);
                if($res){
                    $caridlist = ShoppingCar::with('goods')->whereIn('id',$v['carid'])->select();
                    if(!empty($caridlist)){
                        $order_id = $res->id;
                        foreach ($caridlist as $key => $val) {
                            $map['order_id']    = $order_id;
                            $map['goods_id']    = $val['goods_id'];
                            $map['number']      = $val['number'];
                            $map['sku_id']      = $val['sku_id'];
                            if($val['sku_id']){
                                $specifo  = SpecGoodsPrices::where('goods_id',$val['goods_id'])->where('key_id',$val['sku_id'])->find();
                                if($val['tip'] == 4){
                                    $map['total_price'] = $specifo['pf_price']*$val['number'];
                                }else{
                                    $map['total_price'] = $specifo['price']*$val['number'];
                                }
                                $map['original_price'] = $specifo['price']*$val['number'];
                                $map['sku_val'] = $specifo['value'];
                            }else{
                                if($val['tip'] == 4){
                                    $map['total_price'] = $val->goods['pf_price']*$val['number'];
                                }else{
                                    $map['total_price'] = $val->goods['sell_price']*$val['number'];
                                }
                                $map['original_price'] = $val->goods['sell_price']*$val['number'];
                                
                            }
                            if($val['tip'] == 3){
                                $map['js_status'] = 0;
                            }
                            $map['tip'] = $v['bid'];
                            // $map['pt_profit'] =  $map['total_price'] - $val->goods['js_price']*$val['number'];
                            // $map['sub_type']      = $val->goods['subtype_id'];
                            // if(!empty($data['postage_money']))
                            //     $map['total_price'] = $map['total_price']-$data['postage_money'];
                            $map['user_id']   = $userid;
                            $result = OrderInfo::create($map);
                        }
                    }
                }
            }
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    public static function getTotalPrice($car_id){
        $goodsinfo = ShoppingCar::with('goods')->whereIn('id',$car_id)->select();
        $profit_price = 0;
        $pf_total_price = 0;
        foreach ($goodsinfo as $key => $val) {
            if($val['sku_id']){
                $specifo  = SpecGoodsPrices::where('goods_id',$val['goods_id'])->where('key_id',$val['sku_id'])->find();
                $price = $specifo['price'];
                $pf_price = $specifo['pf_price'];
            }else{
                $price = $val->goods['sell_price'];
                $pf_price = $val->goods['pf_price'];
            }
            $profit = $price *$val['number'];
            $pf_profit = $pf_price *$val['number'];
            $profit_price += $profit;
            $pf_total_price += $pf_profit;
        }
        return ['total_price'=> $profit_price,'pf_price'=>$pf_total_price];
    }

    /**
     * 新增
     */
    public function insertSingleDb($userid,$pay_order_num,$plate_id='')
    {
        $data = Request::param();
        Db::startTrans();
        try {
            $address_id = OrderAddress::insertDb($data['address_id']);
            if(!$address_id){
                return show(400,'网络错误稍后重试！');
            }
            $data['address_id'] = $address_id;
            $strs = "QWERTYUIOPASDFGHJKLZXCVBNM";
            $name = substr(str_shuffle($strs),mt_rand(0,strlen($strs)-11),3);
            $data['order_num'] = $name.substr(mt_rand(1000000, 999999999), 0, 9);
            $data['user_id'] = $userid;
            $data['pay_order_num'] = $pay_order_num;
            $data['original_price'] = $this->getTotal($data['goods_id'],$data['sku_id'],$data['number']);
            if(in_array($data['tip'], ["3", "4"])){
                $data['plate_id'] = $plate_id;
            }
//            if($data['tip'] !== 4){
//                $data['is_jishou'] = 2;
//            }
//            if($data['tip'] == 4){
//                $data['is_jishou'] = 1;
//            }
//            if($data['tip'] == 2){
//                $data['qianbao'] = $data['qianbao']*$data['number'];
//            }
            $res = $this::create($data);
            if($res){
                $map['order_id']    = $res->id;
                $map['goods_id']    = $data['goods_id'];
                $map['number']      = $data['number'];
                $map['total_price'] = $data['total_price'] - $data['postage_money'];
                $map['sku_id']      = $data['sku_id'];
                if(!empty($data['sku_id'])){
                    $specifo  = SpecGoodsPrices::where('goods_id',$data['goods_id'])->where('key_id',$data['sku_id'])->find();
                    $map['sku_val'] = $specifo['value'];
                }
                $map['user_id']     = $userid;
                $map['original_price'] = $data['original_price'];
                $map['pf_price'] = $data['original_price'];
                if(in_array($data['tip'], ["3", "4"])){
                    $map['tip']   = $data['tip'];
                }
                $result = OrderInfo::create($map);
            }
            Db::commit();
            return $res->id;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    public function getTotal($goods_id,$sku_id,$number){
        $ginfo = Goods::where('id',$goods_id)->field('id,sell_price,js_price')->find(); 
        $specprice = SpecGoodsPrices::where('goods_id',$goods_id)->where('key_id',$sku_id)->find();
        if(!empty($sku_id)){
            $price = $specprice['price'];//普通售价
        }else{
            $price = $ginfo['sell_price'];
        }
        // $pt_profit = ($price - $ginfo['js_price']) * $number;
        return $price * $number;
    }

    /**确认收货 */
    public function notify_pay($order_id){
        $orderinfo = $this::where('id',$order_id)->find();
        if(empty($orderinfo)){
            return show(400,'订单不存在');
        }
        if($orderinfo['status'] !== 3){
            return show(400,'订单状态不符');
        }
        Db::startTrans();
        try{
            $orderinfo->status = 4;
            $res = $orderinfo->save();
            // $memberModel = new Member;
            // $myselfinfo = $memberModel::where('id',$orderinfo['user_id'])->find();
            // $myselfinfo->xf_money = $myselfinfo['xf_money']+$orderinfo['total_price'];
            // $myselfinfo->save();
            // if($orderinfo['tip'] == 3)
            //     Member::where('id', $orderinfo['user_id'])->inc('xf_money', $orderinfo['total_price'])->update();
            if($res){
                $res_order = OrderInfo::where('order_id',$orderinfo['id'])->where('status','in','2,3')->update(['status'=>4]);
                // $applly = AfterSaleApply::where('order_id',$orderinfo['id'])->find();
                // if($applly){
                //     $afres = AfterSaleApply::where('order_id',$orderinfo['id'])->update(['status' => 2]);
                // }
                Db::commit();
                return true;
            }else{
                Db::rollback();
                return false;
            }
        }catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    /**
     * 余额支付
     */
    public static function balancePay($order_num,$pay_type,$tip){
        Db::startTrans();
        try {
            $info = self::where('pay_order_num',$order_num)->find();
            $res = self::update(['id'=>$info['id'],'status'=>2]);
            if($res){
//                if($info['is_jishou'] == 1){
//                    OrderInfo::where('order_id',$info['id'])->update(['js_status'=>1]);
//                }
                if($pay_type == 4){
                    Record::reduce($info['user_id'],$info['total_price'],$info['id'],'','购买商品',$tip,'balance');
                }else{
                    if($tip == 2){
                        Record::reduce($info['user_id'],$info['qianbao'],$info['id'],'','黔宝兑换商品',$tip,'qianbao');
                        if($info['postage_money'])
                            Record::reduce($info['user_id'],$info['postage_money'],$info['id'],'','运费支付',1,'qiandou');
                    }else{
                        Record::reduce($info['user_id'],$info['total_price'],$info['id'],'','黔豆购买商品',1,'qiandou');
                    }
                    
                }
                OrderInfo::notify_pay($info['id'],1);
            }
            Db::commit();
            return true;
        } catch (\Throwable $th) {
            Db::rollback();
            return show(400,'兑换失败稍后再试!');
        }
    }

    public static function check($yj_money,$qiandou,$user_id){
        $data = Request::param();
        if(empty($data['qianbao']) || empty($data['number']))
            return show(400,'参数错误！'); 
        if((int)$data['qianbao']*$data['number'] > (int)$yj_money){
            return show(400,'黔宝不足！');
        }
        if($data['pay_type'] == 5){
            return show(400,'暂不支持黔豆支付！');
            // $total = CashOut::where('user_id',$user_id)->where('tip',1)->where('cash_sta',1)->where('status',1)->sum('y_money');
            // $qiandou_now = $qiandou - $total;
            // if((int)$data['postage_money'] > (int)$qiandou_now){
            //     return show(400,'黔豆不足！');
            // }
        }
        $info = Goods::where('id',$data['goods_id'])->where('is_exchange',1)->find();
        if(!$info)return show(400,'该商品不支持黔宝兑换！');
        if($info['exchange_score'] !== (int)$data['qianbao'])return show(400,'黔宝数值错误！');
        return true;
    }

    public static function checkiD($yj_money,$order_id,$qianbao,$pay_type,$qiandou,$postage_money){
        $oinfo = OrderInfo::where('order_id',$order_id)->find();
        if((int)$qianbao > (int)$yj_money){
            return show(400,'黔宝不足！','黔宝不足！');
        }  
        if($pay_type == 5){
            return show(400,'暂不支持黔豆支付！');
            // if((int)$postage_money > (int)$qiandou){
            //     return show(400,'黔豆不足！');
            // }
        }
        $info = Goods::where('id',$oinfo['goods_id'])->where('is_exchange',1)->find();
        if(!$info)return show(400,'该商品不支持黔宝兑换！','该商品不支持黔宝兑换！');
        if($info['exchange_score'] !== (int)$qianbao/$oinfo['number'])return show(400,'黔宝数值错误！请重新下单！','黔宝数值错误！请重新下单！');
        return true;
    }

    public static function checkStore($role_id,$userid,$balance){//,$jishou_end_time
        $data = Request::param();
        $info = Goods::where('id',$data['goods_id'])->find();
        if(!$info['plate_id'])return show(400,'该商品不属于门店！','该商品不属于门店！');
        // if(empty($data['is_jishou']))return show(400,'寄售状态不能为空！','寄售状态不能为空！');
        if($data['tip'] == 3){
            if(!in_array($data['pay_type'],['1','2','3']))return show(400,'该支付方式不允许！','该支付方式不允许！');
            $money = $info['sell_price'] * $data['number'];
            // if (!in_array($money, ["1000", "3000", "6000", "12000"]))
            // {
            //     return show(400,'该结算金额不符任何门店，请重新选择下单！','该结算金额不符任何门店，请重新选择下单！');
            // }
            $offset = PlatePrice::getFind($money);
            if(empty($offset)){
                return show(400,'该结算金额不符任何门店，请重新选择下单！','该结算金额不符任何门店，请重新选择下单！');
            }
            // $offset = array_search($money,["1000", "3000", "6000", "12000"]);
            if($role_id > 0 && $offset <= $role_id){ //&& $jishou_end_time > time()
                return show(400,'不能再次购买同门店商品！','不能再次购买同门店商品！');
            }
            if($role_id > 0 && $role_id !== $offset)return show(400,'只能购买同门店商品！','只能购买同门店商品！');
            return $offset;
        }
        else{
            Common::pf_judge($userid,$data['total_price'],$data['pay_type'],$data['postage_money']);
            return true;
        }
        
    }

    public static function checkCar($role_id,$user_id){//,$jishou_end_time
        $data = Request::param();
        $carinfo = ShoppingCar::whereIn('id',$data['car_id'])->find();
        $check = ShoppingCar::where('id','in',$data['car_id'])->where('tip',3)->find();
        $checkpf = ShoppingCar::where('id','in',$data['car_id'])->where('tip',4)->find();
        if($check && $checkpf)return show(400,'只能选择同类型商品下单！');
        if($carinfo['tip'] == 3){
            $total = self::getTotalPrice($data['car_id']);
            // if (!in_array($total['total_price'], ["1000", "3000", "6000", "12000"]))
            // {
            //     return show(400,'该结算金额不符任何门店，请重新选择下单！');
            // }
            $offset = PlatePrice::getFind($total['total_price']);
            if(empty($offset)){
                return show(400,'该结算金额不符任何门店，请重新选择下单！');
            }
            if($role_id > 0 && $offset <= $role_id){//&& $jishou_end_time > time()
                return show(400,'不能再次购买同门店商品！','不能再次购买同门店商品！');
            }
            if($role_id > 0 && $role_id !== $offset+1)return show(400,'只能购买同门店商品！','只能购买同门店商品！');
        }
        // else{
        //     Common::pf_judge($user_id,$data['total_price'],$data['pay_type']);
        // }
        return true;
    }

    /**
     * 删除
     * @return bool
     * @author TFC
     */
    public function deleteDb()
    {
        $data = Request::param();
        Db::startTrans();
        try {
            $result = $this::destroy($data['id']);
            if($result){
                $res = OrderInfo::where('order_id',$data['id'])->update(['delete_time'=>time()]);
            }
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }
    
}