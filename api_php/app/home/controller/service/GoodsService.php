<?php

namespace app\home\controller\service;

use app\common\model\OrderModel;
use app\common\model\PayRecharge;
use app\common\model\UserModel;
use app\common\model\VideoBuyUserVideo;
use app\common\model\VideoLog;
use app\common\model\VideoUserSetValidityPeriod;
use app\common\model\VideoDetail;
use app\common\model\VideoToVip;
use app\common\model\VideoType;
use app\common\model\VideoVipLevel;
use app\common\model\OrderVideo;
use app\common\model\Video;
use app\common\traites\GetTreeTrait;
use think\exception\ValidateException;
use think\facade\Db;
use think\facade\Log;
use \think\facade\Request;

class GoodsService
{
    // 基础数据准备
    use GetTreeTrait;

    public $model;

    public function video_model()
    {
        $this->model = new VideoType();
        return $this;
    }

    public function level_model()
    {
        $this->model = new VideoVipLevel();
        return $this;
    }

    //查询所有套餐
    public function video_level(int $type = 1)
    {
        $list = (new VideoVipLevel())->where(['status'=>1,'type'=>$type])->select();
        return $list;
    }

    //获取 已经购买的 单独视频列表
    public function alone_list()
    {
        //当前页
        $page = Request::post('page/d', 1);
        //每页显示数量
        $limit = Request::post('limit/d', 10);

        $type = Request::post('type/d', 0);
        //查询条件
        $map=[];
        if ($type > 0) $map['type'] = $type;

        $home_user = session('home_user');

        return (new VideoBuyUserVideo())->user_list($home_user['id'],$limit,$page,$map);
    }

    //查询 全部视频 列表
    public function video_all_list()
    {

        $page = Request::post('page/d', 1);			// 当前页
        $limit = Request::post('limit/d', 20);		// 每页显示数量
        $type = Request::post('type/d', 0);			// 视频分类
        $size = Request::post('is_size/d', 1);			// 是否大视频
        $labels = Request::post('labels', '');			// 是否搜索了标签
        $videoname = Request::post('video_name', '');			// 是否搜索了电影名称
        $video_id = Request::post('video_id/d', 0);			// 是否搜索了电影名称


        $map = array(); // 初始化查询条件
        if (!empty($labels)) $map[] = ['labels','like',"%$labels%"];
        if (!empty($videoname)) $map[] = ['title','like',"%$videoname%"];
        if (!empty($video_id)) $map[] = ['id','=',$video_id];

        $map[] = ['status','=',1];							// 查询条件
        if ($type > 0) $map[] = ['type','=',$type];
        //查询是大文件分类
        $whereIn = [];
        $VideoType = VideoType::where('is_size',$size)->select();
        if (!empty($VideoType)){
            $whereIn =array_column($VideoType->toArray(),'id');
        }

        $list = (new Video())
            ->where($map)
            ->whereIn('type',$whereIn)
            ->whereLike('vod_play_from','%m3u8%')
            ->order('update_time desc,id desc')
            ->paginate(['list_rows' => $limit, 'page' => $page]);

        // 为空
        if (empty($list)) return [];
        $list = $list->toArray();
        // 便利 补全参数
        $VideoDetail = new VideoDetail();
        foreach ($list['data'] as $key=>&$value){
            $find = $VideoDetail->where('vod_id',$value['id'])->find();
            $VideoDetail->where('vod_id',$value['id'])->update(['type_id'=>$value['type']]);
            if ($find){
                $value['thumb_url'] = $find->vod_pic;
                $vod_play_url =  videoIntercept($find->vod_play_url);

                if (!empty($vod_play_url)){
                    foreach ($vod_play_url as $k=>$v){

                        if (strpos($v,'m3u8')){
                            $value['video_url'] = $v;
                        }
                    }
                }
            }
        }
        return $list;
    }

    //查询 推荐视频 列表
    public function video_hot_list()
    {

        $page = Request::post('page/d', 1);			// 当前页
        $limit = Request::post('limit/d', 20);		// 每页显示数量
        $type = Request::post('type/d', 0);			// 视频分类
        $map = array();								// 初始化查询条件
        $map['status'] = 1;							// 查询条件
        $map['is_only_buy_alone'] = 1;							// 查询条件
        if ($type > 0) $map['type'] = $type;

        $list = (new Video())
            ->where($map)
            ->whereLike('vod_play_from','%m3u8%')
            ->order('update_time desc,id desc')
            ->paginate(['list_rows' => $limit, 'page' => $page]);
        // 为空
        if (empty($list)) return [];
        $list = $list->toArray();
        // 便利 补全参数
        $VideoDetail = new VideoDetail();
        foreach ($list['data'] as $key=>&$value){
            $find = $VideoDetail->where('vod_id',$value['id'])->find();

            if ($find){
                $value['thumb_url'] = $find->vod_pic;
                $vod_play_url =  videoIntercept($find->vod_play_url);

                if (!empty($vod_play_url)){
                    foreach ($vod_play_url as $k=>$v){

                        if (strpos($v,'m3u8')){
                            $value['video_url'] = $v;
                        }
                    }
                }
            }
        }
        return $list;
    }

    //查询 套餐视频 列表
    public function video_set_list()
    {

        $page = Request::post('page/d', 1);			// 当前页
        $limit = Request::post('limit/d', 20);		// 每页显示数量
        $type = Request::post('type/d', 0);			// 视频分类
        $map = array();								// 初始化查询条件
        $map['status'] = 1;							// 查询条件
        $map['is_only_buy_alone'] = 0;							// 查询条件
        if ($type > 0) $map['type'] = $type;

        $list = (new Video())
            ->where($map)
            ->whereLike('vod_play_from','%m3u8%')
            ->order('update_time desc,id desc')
            ->paginate(['list_rows' => $limit, 'page' => $page]);
        // 为空
        if (empty($list)) return [];
        $list = $list->toArray();
        // 便利 补全参数
        $VideoDetail = new VideoDetail();
        foreach ($list['data'] as $key=>&$value){
            $find = $VideoDetail->where('vod_id',$value['id'])->find();

            if ($find){
                $value['thumb_url'] = $find->vod_pic;
                $vod_play_url =  videoIntercept($find->vod_play_url);

                if (!empty($vod_play_url)){
                    foreach ($vod_play_url as $k=>$v){

                        if (strpos($v,'m3u8')){
                            $value['video_url'] = $v;
                        }
                    }
                }
            }
        }
        return $list;
    }

    //查询用户已经购买的视频套餐
    public function user_video_level()
    {
        $home_user = session('home_user');
        //查询用户购买的套餐
        $order_video = (new OrderVideo())->user_level($home_user['id']);
        if (empty($order_video)) return false;
        return $order_video->toArray();
    }

    //获取视频列表
    public function user_video_list($user_video_level = 0)
    {
        //当前页
        $page = Request::post('page/d', 1);
        //每页显示数量
        $limit = Request::post('limit/d', 20);
        //视频分类
        $type = Request::post('type/d', 0);
        //查询条件
        $map['status'] = 1;
        if ($type > 0) $map['type'] = $type;

        $list = (new VideoToVip())->alias('a')
            ->field('b.*')
            ->where($map)
            ->whereLike('b.vod_play_from','%m3u8%')
            ->join('video b', 'a.video_id=b.id','right');

        if (!empty($user_video_level) || $user_video_level!=0) {
            $list = $list->whereLike('types', '%' . $user_video_level['vip_level'] . '%')->whereOr('types',null);
        }

        $list = $list->order('b.update_time desc,b.id desc')
            ->paginate(['list_rows' => $limit, 'page' => $page]);

        if (empty($list)) return [];
        $list = $list->toArray();

        $VideoDetail = new VideoDetail();

        foreach ($list['data'] as $key=>&$value){

            $find = $VideoDetail->where('vod_id',$value['id'])->find();

            if ($find){
                $value['thumb_url'] = $find->vod_pic;
                $vod_play_url =  videoIntercept($find->vod_play_url);

                if (!empty($vod_play_url)){
                    foreach ($vod_play_url as $k=>$v){

                        if (strpos($v,'m3u8')){
                            $value['video_url'] = $v;
                        }
                    }

                }
            }
        }
        return $list;
    }

    //查询视频分类
    public function video_type_list()
    {
        //当前页
        $page = Request::post('page/d', 0);
        $limit = Request::post('limit/d', 100);
        $find = $this->model->field('id,pid,title,thumb_url')
            ->where('is_show', 1)
            ->order('sort desc,id desc')
            ->page($page,$limit)
            ->select();
        if (empty($find)) return false;
        $find = $find->toArray();
        array_unshift($find, ['id' => 0, 'pid' => 0, 'title' => '全部']);
        return $this->fillModelBackends($find);
    }
    /**
     * 充值  应该后台上分吧
     * @param int $rechargeId
     * @param int $price
     * @return array
     */
    public function recharge_price(int $rechargeId,int $price)
    {
        //事务操作。  充值成功   充值订单，支付成功写入充值列表，并写入用户金额,写入用户累计充值
        //充值订单，支付成功写入充值列表
        $data['sys_bank_id'] = '收款账号';
        $data['u_bank_name'] = '打款银行名';
        $data['u_bank_user_name'] = '打款用户名';
        $data['u_bank_card'] = '打款银行卡号';
        $data['success_time'] = date('Y-m-d H:i:s');


        $update =false;
        Db::startTrans();
        try {
            //写入充值订单  //写入用户累计充值
            (new PayRecharge())->where('id',$rechargeId)->save($data);
            //用户金额修改
            (new UserModel())->where('id',session('home_user.id'))
                ->save(['money_balance' => session('home_user.money_balance') + $price]);
            $update=true;
            // 提交事务
            Db::commit();
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
        }
        if ($update) return ['code' => 1, 'msg' => '支付成功','order_id'=>$rechargeId];

        $msg = '支付成功。写入充值订单信息失败，请联系管理员';
        Log::critical('订单ID：'.$rechargeId.':'.$msg);
        return ['code' => 1, 'msg' => $msg,'order_id'=>$rechargeId];
    }

    //充值订单写入
    public function recharge_user($user, $price)
    {
        event('RepeatPurchase',['repeat'=>true,'id'=>$user['id']]);
        $model = (new PayRecharge());
        $order = [
            'create_time' => date('Y-m-d H:i:s'),
            'money' => $price,
            'uid' => $user['id'],
            'u_ip' => $_SERVER['REMOTE_ADDR'],
            'market_uid' => $user['market_uid'],
            'order_no'=>orderCode('CZ'),
            'u_city' => '',
            'sys_bank_id' => '',
            'u_bank_name' => '',
            'u_bank_user_name' => '',
            'u_bank_card' => '',
        ];

        $save = $model->save($order);
        if ($save) return ['code'=>1,'购买成功','recharge_id'=>$model->id,'order_no' => $order['order_no']];
        return ['code'=>0,'msg'=>'订单生成失败'];
    }

    //购买套餐
    public function purchase_video_set()
    {
        // 启动监听时间 10秒内 只能购买一次
        event('RepeatPurchase',['repeat'=>true,'id'=>session('home_user.id')]);
        $id = Request::post('id/d', 0);
        if ($id <= 0) return ['code' => 0, 'msg' => '商品ID错误'];
        //查询当前商品价格。并生成订单号。发送支付 到订单平台
        $find = (new VideoVipLevel())->find($id);
        if (!$find) return ['code' => 0, 'msg' => '商品不存在'];
        $find = $find->toArray();
        $videoSetOrder = $find; // 保存套餐信息
        //生成订单号。
        $code = orderCode();
        //购买成功后直接写入订单

        //添加订单
        $save = $this->order_user($id, $find, $code);
        if (!$save->id) return ['code' => 0, 'msg' => '订单写入失败'];//订单写入失败
        //查看余额是否够
        $admin = session('home_user');

        //余额够直接扣除
        $money_balance = $admin['money_balance'] - $find['price_vip'];
        if ($money_balance >= 0) {
            $is_true = $this->user_price($admin, $find['price_vip'], $save->id);
            if (!$is_true) return ['code' => 0, 'msg' => '余额扣除失败'];//购买失败
        }
        //修改订单状态 默认套餐是直接支付成功的  status
        $status = $save->where('id', $save->id)->save(['pay_status' => 1,'status'=>1, 'pay_time' => date('Y-m-d H:i:s')]);

        if (!$status) {
            Log::emergency('订单号:'.$code . '：' . '购买成功，订单状态修改失败,联系管理员');
        }
        //增加到 视频订单表 | 针对特定套餐的 才添加 暂时废弃 这个部分代码 
        // $vip = $this->order_video_buy_set($save->id, $find);
        // if (!$vip) {
        //     Log::emergency('订单号:'.$code . '：' . '购买成功，视频订单表写入失败,联系管理员');
        // }

        // 增加套餐有效期时间 开始
        $video_validity_data = array();
        $map_validity_data = array();
        $uid = session('home_user.id');
        $map_validity_data['uid'] = $uid;
        $video_validity_data['uid'] = $uid;
        $addTimeSecond = $videoSetOrder['validity_time'];
//		var_dump($addTimeSecond);

        $userTimeValidity = (new VideoUserSetValidityPeriod())->where($map_validity_data)->find();
        if (!$userTimeValidity){
            // 没找到 插入
            $video_validity_data['end_time'] = date("Y-m-d H:i:s",time()+$addTimeSecond);
            (new VideoUserSetValidityPeriod())->insert($video_validity_data);
        }else{
            // 找到了 更新
            $userTimeValidity = $userTimeValidity->toArray();
            $startTime = strtotime($userTimeValidity['end_time']);
            $userTimeValiditySave = array();
            $userTimeValiditySave['end_time'] = date("Y-m-d H:i:s",$startTime+$addTimeSecond);
            (new VideoUserSetValidityPeriod())->where('id',$userTimeValidity['id'])->save($userTimeValiditySave);
        }


        // 增加套餐有效期时间 结束
        return ['code' => 1, 'msg' => '购买成功'];
    }

    //视频单独购买
    public function alone_video_purchase()
    {
        $id = Request::post('id/d',0);
        if ($id == 0) return ['code'=>0,'ID错误'];
        //查询当前商品价格。并生成订单号。发送支付 到订单平台
        $find = (new Video())->find($id);
        if (!$find) return ['code' => 0, 'msg' => '商品不存在'];
        if ($find->video_price <= 0 ) return ['code' => 0, 'msg' => '商品价格不存在'];
        //生成订单号
        $code = orderCode();
        //添加订单
        $save = $this->order_user($id, $find, $code,$find['admin_uid']);
        if (!$save->id) return ['code' => 0, 'msg' => '订单写入失败'];//订单写入失败
        //查看余额是否够
        $admin = session('home_user');

        //余额够直接扣除 | 只能 余额 支付
        $money_balance = $admin['money_balance'] - $find['video_price'];
        if ($money_balance >= 0) {
            $is_true = $this->user_price($admin, $find['video_price'], $save->id);
            if (!$is_true) return ['code' => 0, 'msg' => '余额扣除失败'];//购买失败
        }else{
            return ['code' => 0, 'msg' => '余额不够，请充值'];
        }
        //支付成功。修改订单状态.并写入到期时间到 video 订单表
        //修改订单状态
        $status = $save->where('id', $save->id)->save(['pay_status' => 1, 'pay_time' => date('Y-m-d H:i:s')]);
        if (!$status) {
            Log::emergency('订单号:'.$code . '：' . '购买成功，订单状态修改失败,联系管理员');
        }

        //增加到用户单独购买视频表
        $vip = (new VideoBuyUserVideo())->insert([
            'video_id'=>$id,
            'uid'=>$admin['id'],
            'start_time'=>date('Y-m-d H:i:s'),
            'end_time'=>date('Y-m-d H:i:s',strtotime("+1 day")),
        ]);
        if (!$vip) {
            Log::emergency('订单号:'.$code . '：' . '购买成功，视频订单表写入失败,联系管理员');
        }

        //分销奖励分配 $money_balance小于0 表示是走支付平台来的购买套餐金额 | 暂无 购买 分销 奖励
        // if ($money_balance < 0) {
        //     $BranchService = new BranchService();
        //     $money_log = $BranchService->branch($admin, ['price' => $find['video_price'], 'order_id' => $save->id]);
        //     if ($money_log['code'] == 0) return $money_log;
        // }



        return ['code' => 1, 'msg' => '购买成功'];

    }

    // 消费日志 填写
    public function user_price($admin, $price, $order)
    {
        $save = false;
        //写入消费日志
        Db::startTrans();
        try {
            (new UserModel())->where('id', $admin['id'])->save(['money_balance' => $admin['money_balance'] - $price]);
            //写操作日志
            (new \app\common\model\MoneyLog())->insert([
                'create_time' => date('Y-m-d H:i:s'),
                'type' => 3,
                'status' => 101,
                'money_before' => $admin['money_balance'],
                'money_end' => $admin['money_balance'] - $price,
                'money' => $price,
                'uid' => $admin['id'],
                'market_uid' => $admin['market_uid'],
                'source_id' => $order,
                'mark' => '购买会员'
            ]);
            $save = true;
            Db::commit();
        } catch (ValidateException $e) {
            Db::rollback();
            // 验证失败 输出错误信息
            return $e->getError();
        }
        return $save;
    }

    //写入订单 | 直接就是 套餐购买
    private function order_user($id, $find, $code,$buy_aid = 0)
    {
        //查询商品id是那个博主的

        //组装订单数据
        $order_user = [
            'uid' => session('home_user.id'),
            'market_uid' => session('home_user.market_uid'),
            'admin_uid' => 0,
            'create_time' => date('Y-m-d H:i:s'),
            'update_time' => date('Y-m-d H:i:s'),
            'status' => 0,
            'goods_id' => $id,
            //'pay_time' => date('Y-m-d H:i:s'),
            'pay_status' => 0,
            'pay_price' => isset($find['price_vip']) ? $find['price_vip']:$find['video_price'],
            'pay_no' => $code,
            'describe_order' => '购买商品' . $find['title'],
            'goods_info' => json($find),
            'pay_channel' => '前台购买',
            'ip' => $_SERVER['REMOTE_ADDR'],
            'buy_aid'=>$buy_aid
        ];
        $model = new OrderModel();
        $save = $model->save($order_user);
        if ($save) return $model;
        return false;
    }

    //订单成功 写入视频 订单购买表 | 暂时 废弃了 因为没有出现 单独的套餐
    private function order_video_buy_set($order_id, $find)
    {
        //写入vip订单信息
        $status = (new OrderVideo())->save([
            'uid' => session('home_user.id'),
            'market_uid' => session('home_user.market_uid'),
            'status' => 1,
            'order_id' => $order_id,
            'vip_level' => $find['id'],
            'vip_start_time' => date('Y-m-d H:i:s'),
            'vip_end_time' => date('Y-m-d H:i:s', time() + ($find['validity_time'] * 60)),//当前时间+可观看秒
        ]);
        if ($status) return true;
        return false;
    }

    // 检测视频 是否 可以观看
    // /**
    // 以下几种情况下是可以看片的
    // 1 单独购买某一影片(时间永久有效)
    // 2 全站(包天/包月/包年)购买(有效期累加)

    // 视频类型分为：
    // 1 套餐视频(套餐内视频也可以单独购买)
    // 2 非套餐视频(需要单独购买，支付单独购买价格，即使会员购买了套餐，也无法观看)
    //  */
    // 获取会员基础信息
    //视频详情 播放的时候 验证 该用户是否有权限 查看该视频
    public function get_and_check_user_video_details($videoId)
    {

        $home_user = session('home_user');
        // $video = (new Video())->find($videoId);	//查询视频  | 联合上播放地址
        $video = (new Video())
            ->alias('a')
            ->field('b.*,a.admin_uid,a.duration,a.heat,a.sort,a.video_price,a.video_money')
            ->where(array('a.id'=>$videoId))
            ->join('video_detail b', 'a.id=b.vod_id','left')
            ->find();
        if (empty($video)) return false;//没有该视频
        (new Video())->where('id',$videoId)->inc('heat',1)->update();


        //开始  查看当前用户是否具备查看该视频的资格
        $video->is_purchase=5;	//is_purchase 1可观看  2需要单独购买 5不可观看  | 默认设置为不可以观看

        // 只能单片 购买观看 不能加入套餐内播放产品
        if($video->is_only_buy_alone == 1){
            //查看用户是否对当前视频单独购买了
            $alone_video = (new VideoBuyUserVideo())->alone_purchase($home_user['id'],$video->id);
            if ($alone_video) $video->is_purchase = 1;
            $video->is_purchase = 2; // 表明该片 需要单独购买
        }

        // 可以套餐有效期内观看 也可以单片观看
        if($video->is_only_buy_alone == 0 || empty($video->is_only_buy_alone)){
            //查看用户是否对当前视频单独购买了
            $alone_video = (new VideoBuyUserVideo())->alone_purchase($home_user['id'],$video->id);

            if ($alone_video) $video->is_purchase = 1;

            //查询用户购买的套餐  查看用户 套餐是否有效
            $setInfo = (new VideoUserSetValidityPeriod())->where('uid',$home_user['id'])->find();
            if($setInfo && (strtotime($setInfo->end_time) > time()) ) $video->is_purchase = 1;
        }
        // 返回数据
        VideoLog::listens(['uid'=>$home_user['id'],'video_type'=>$video->type_id,'video_id'=>$video->vod_id]);

        //查询用户是否点赞了
        $is_fabulous = Db::name('video_fabulous')->where(['content_id'=>$videoId,'uid'=>$home_user['id']])->find();
        $video->is_fabulous = 0;
        $video->is_fabulous_count = 0;
        $video->is_comment_count = 0;
        if (!empty($is_fabulous)){
            $video->is_fabulous = 1;
        }
        //视频点赞统计
        $is_fabulous_count = Db::name('video_fabulous')->where(['content_id'=>$videoId])->count('id');
        if ($is_fabulous_count> 0 ){
            $video->is_fabulous_count = $is_fabulous_count;
        }
        //视频评论统计
        $is_comment_count = Db::name('video_comment')->where(['content_id'=>$videoId])->count('id');
        if ($is_comment_count> 0 ){
            $video->is_comment_count = $is_comment_count;
        }

        //视频博主信息
        $bozhuinfo = UserModel::where('id',$video['admin_uid'])->find();
        $video->bozhu_name ='';
        $video->bozhu_id = 0;
        $video->is_user_pour = 0;
        if (!empty($bozhuinfo)){
            $video->bozhu_name = $bozhuinfo['nickname'];
            $video->bozhu_id = $bozhuinfo['id'];
            //查询是否关注了
            if (Db::name('common_user_pour')->where(['uid'=>$home_user['id'],'bz_id'=>$video['admin_uid']])->count('gid') >0){
                $video->is_user_pour = 1;
            }
        }

        if ($home_user < 3){
            UserModel::where('id',$home_user['id'])->inc('viewing_times',1)->update();
            $video->is_purchase = 1;
        }

        return $video;
    }

    //用户浏览历史
    public function video_browse_list(){
        $page = Request::post('page/d', 1);			// 当前页
        $limit = Request::post('limit/d', 20);		// 每页显示数量

        $home_user = session('home_user');
        $map =[
            'uid'=>$home_user['id']
        ];
        $list =  VideoLog::browse($map);
        if (empty($list)){
            return [];
        }

        //查询浏览的视频
        $list = (new Video())
            ->whereIn('id',array_column($list->toArray(),'video_id'))
            ->whereLike('vod_play_from','%m3u8%')
            ->order('update_time desc,id desc')
            ->paginate(['list_rows' => $limit, 'page' => $page]);

        // 为空
        if (empty($list)) return [];
        $list = $list->toArray();
        // 便利 补全参数
        $VideoDetail = new VideoDetail();
        foreach ($list['data'] as $key=>&$value){
            $find = $VideoDetail->where('vod_id',$value['id'])->find();

            if ($find){
                $value['thumb_url'] = $find->vod_pic;
                $vod_play_url =  videoIntercept($find->vod_play_url);

                if (!empty($vod_play_url)){
                    foreach ($vod_play_url as $k=>$v){

                        if (strpos($v,'m3u8')){
                            $value['video_url'] = $v;
                        }
                    }
                }
            }
        }
        return $list;
    }

// 类结束了
}