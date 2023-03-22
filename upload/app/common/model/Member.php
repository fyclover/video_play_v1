<?php
namespace app\common\model;

use PhpOffice\PhpSpreadsheet\Reader\Xls\MD5;
use think\Model;
use think\facade\Request;
use think\facade\Db;
class Member extends Model{
    
    protected $autoWriteTimestamp = true;
    protected $updateTime = false;


    public function find1($id)
    {
        return $this->where('id',$id)->find();
    }
    public function user()
    {
        return $this->hasMany('Member','user_id')->field('user_id');
    }

    public function searchUserIdAttr($query, $value, $data)
    {
        $query->where('user_id', $value); 
    }

    public static function getFind($openid='',$id=''){
        $model = new self;
        if(!empty($openid)) $model = $model->where('openid',$openid);
        if(!empty($id)) $model = $model->where('id',$id);
        return $model->find();
    }

    public static function getAll(){
        $where = Request::param();
        $model = new self;
        
        if(!empty($where['name'])) $model = $model->where('nickname','like','%'.$where['name'].'%');
        if(!empty($where['start'])){
            $begin = date(''.$where['start'].' 0:0:0');
            $end   = date(''.$where['end'].' 23:59:59');
            $model = $model->whereBetweenTime('create_time', $begin, $end);
        } 
        if(!empty($where['role_id'])){
            if($where['role_id'] == 5){
                $model = $model->where('role_id','>',0);
            }else{
                $model = $model->where('role_id',$where['role_id']);
            }
        }
        if(!empty($where['group_id'])){
            $model = $model->where('group_id',$where['group_id']);
        }
        if(!empty($where['user_id'])){
            $model = $model->where('id',$where['user_id']);
        }
        if(!empty($where['tag'])){
            $map[] = ['','EXP',Db::raw("FIND_IN_SET('".$where['tag']."',tags)")];
            $model = $model->where($map);
        }
        if(!empty($where['phone'])) $model = $model->where('phone',$where['phone']);
        return $model->order('id desc')->paginate(['list_rows'=>15,'query' => request()->param()]);
    }

    public function loginhandle(){
        $data = Request::param();
        $data['pass'] = MD5($data['pass']);
        Db::startTrans();
        try {
            $info = $this->where('phone',$data['phone'])->find();
            $data['token']  = $this->setLoginToken($data['phone']);
            $data['auth_time'] = strtotime('+' . config('app.login_time_out') . ' day');
            $data['last_login_time'] = time();
            if(!$info){
                if(!empty($data['user_id'])){
                    if(is_numeric($data['user_id'])){
                        $check = $this->where('id',$data['user_id'])->find();
                        if($check){
                            $data['user_id'] = $check['id'];
                            $data['two_level'] = $check['user_id'];
                            $ancestors = $this->where('id',$data['user_id'])->field('user_id,ancestors,level')->find();
                            if(!empty($ancestors['user_id'])){
                                $ancestors_list = $ancestors['ancestors'];
                                if(!empty($ancestors_list)){
                                    $ancestors_list = $ancestors_list.','.$ancestors['user_id'];
                                }else{
                                    $ancestors_list = $ancestors['user_id'];
                                }
                                $data['ancestors'] = $ancestors_list;
                            }
                            $data['level'] = $ancestors['level'] + 1;
                            $data['rec_code'] = $check['id_code'];
                        }
                        $this->incUser($check['id'],$check['user_id'],$check['ancestors']);
                    }else{
                        $data['user_id'] = 0;
                    }
                }
                // $head_img = Webset::where('id',1)->value('default_img');
                // $data['head_img'] = $head_img;
                $data['nickname'] = $this::createName();
                $data['id_code']  = substr(mt_rand(1000000, 999999999), 0, 6);//推荐码
                $check = $this->where('id_code',$data['id_code'])->find();
                if($check){
                    $data['id_code']  = substr(mt_rand(1000000, 999999999), 0, 6);//推荐码
                }
                $result = $this::create($data);
            }else{
                if(!empty($data['openid'])){
                    $data['openid'] = $data['openid'];
                }
                $data['id'] = $info['id'];
                $data['user_id'] = $info['user_id'];
                $result = $this->update($data);
            }
            Db::commit();
            return $result;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    public static function upPhone(){
        $data = Request::param();
        Db::startTrans();
        try {
            $info = self::where('phone',$data['new_phone'])->find();
            if($info){
                return show(400,'该手机号已注册过！');
            }
            $id = self::where('phone',$data['phone'])->value('id');
            $data['phone'] = $data['new_phone'];
            $data['id'] = $id;
            $result = self::update($data);
            Db::commit();
            return $result;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    // public function wx_login($user){
    //     Db::startTrans();
    //     try {
    //         $info = $this->where('unionid',$user->getOriginal()['unionid'])->find();
    //         $data['token']  = $this->setLoginToken($user->getOriginal()['unionid']);
    //         $data['auth_time'] = strtotime('+' . config('app.login_time_out') . ' day');
    //         $data['last_login_time'] = time();
    //         if(!$info){
    //             $data['openid'] = $user->getId();
    //             $data['unionid'] = $user->getOriginal()['unionid'];
    //             $data['head_img'] = $user->getAvatar();
    //             $data['nickname'] = $user->getNickname();
    //             $data['id_code']  = substr(mt_rand(1000000, 999999999), 0, 6);//推荐码
    //             $result = $this::create($data);
    //         }else{
    //             $data['id'] = $info['id'];
    //             $result = $this->update($data);
    //         }
    //         Db::commit();
    //         return $result;
    //     } catch (\Exception $e) {
    //         Db::rollback();
    //         return false;
    //     }
    // }

    public static function createName(){
        $nicheng_tou = array('快乐的','积极的','冷酷的','漂亮的','自然的','昏睡的','狂野的','等待的','搞怪的','幽默的',
        '高兴的','超帅的','完美的','精明的','无聊的','有魅力的','饱满的','炙热的','暴躁的','碧蓝的',
        '俊逸的','英勇的','健忘的','故意的','无心的','土豪的','朴实的','兴奋的','幸福的','淡定的',
        '不安的','阔达的','沉默的','斯文的','香蕉','苹果','鲤鱼','鳗鱼','任性的','细心的',
        '粗心的','大意的','善良的','凶狠的','害怕的','重要的','危机的','欢喜的','欣慰的','满意的',
        '跳跃的','诚心的','魔幻的','虚幻的','淡然的','受伤的','雪白的','高高的','糟糕的','顺利的',
        '闪闪的','羞涩的','缓慢的','迅速的','优秀的','聪明的','含糊的','俏皮的','淡淡的','坚强的',
        '平淡的','欣喜的','能干的','灵巧的','友好的','机智的','机灵的','正直的','谨慎的','俭朴的',
        '务实的','拼搏的','个性的','粗犷的','活力的','火星上的','爱听歌的','还单身的');
        $nicheng_wei=array('可乐','绿茶','魔镜','星星','啤酒','玫瑰','大叔','小伙','太阳','树叶',
        '星月','机器猫','枕头','大船','刺猬','天空','春天','蛋挞','香水','泥猴桃',
        '吐司','溪流','黄豆','樱桃','小鸽子','爆米花','花卷','日记本','小熊猫','小懒猪',
        '小懒虫','曲奇','向日葵','水蜜桃','薯片','口红','超短裙','乌冬面','冰淇淋','棒棒糖',
        '长颈鹿','豆芽','铃铛','小馒头','小笼包','小甜瓜','冬瓜','香菇','小兔子','含羞草',
        '短靴','睫毛膏','小蘑菇','跳跳糖','小白菜','草莓','柠檬','月饼','百合','纸鹤',
        '小天鹅','云朵','芒果','面包','海燕','小猫咪','龙猫','唇膏','鞋垫','黑猫',);
        $tou_num=rand(0,87);
        $wei_num=rand(0,69);

        $nicheng=$nicheng_tou[$tou_num].$nicheng_wei[$wei_num];

        return $nicheng;
    }

    /**
     * 设置登陆唯一token
     * @param $phone 手机号码
     */
    public function setLoginToken($openid){
        $str = md5(uniqid(md5(microtime(true)),true));
        $str = sha1($str.$openid);
        return $str;
    }

    /**
     * 编辑
     */
    public function updateDb($userid)
    {
        $data = Request::param();
        Db::startTrans();
        try {
            $data['id'] = $userid;
            $file = Request::file('file');
            if (!empty($file)) { 
                $upload = new \services\UploadService();
                $upload->setUploadPath('member');
                $filename = $upload->image('file');
                $thumb = $upload->thumb($filename);
                $data['head_img'] = $thumb;
                $upload->delImage($filename);
                $info = $this->where('id',$data['id'])->find();
                if(file_exists('../public/' . $info['head_img']) && !empty($info['head_img'])){
                    unlink('../public/' . $info['head_img']);
                }
            }
            if(!empty($data['rec_code'])){
                $check = $this->where('id_code',$data['rec_code'])->where('id','<>',$data['id'])->find();
                if(!$check || $check['id'] > $data['id']){
                    return show(400,'推荐码填写错误');
                }
                $myselfinfo = $this->where('id',$data['id'])->value('rec_code');
                if(!$myselfinfo){
                    $data['user_id'] = $check['id'];
                    $data['two_level'] = $check['user_id'];
                    $ancestors = $this->where('id',$data['user_id'])->field('user_id,ancestors,level')->find();
                    if(!empty($ancestors['user_id'])){
                        $ancestors_list = $ancestors['ancestors'];
                        if(!empty($ancestors_list)){
                            $ancestors_list = $ancestors_list.','.$ancestors['user_id'];
                        }else{
                            $ancestors_list = $ancestors['user_id'];
                        }
                        $data['ancestors'] = $ancestors_list;
                    }
                    $data['level'] = $ancestors['level'] + 1;
                }
                $this->incUser($check['id'],$check['user_id'],$check['ancestors']);
                $data['update_time'] = time();
            }
            $res = $this->update($data);
            if(!empty($data['rec_code']) && !$myselfinfo){
                $this->xiajiUser($userid);
            }
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    public function xiajiUser($userid){
        $info = $this::where('id',$userid)->find();
        $map['two_level'] = $info['user_id'];
        $map['level'] = $info['level']+1;
        // $subuser = $this::whereIn('user_id',''.$userid.'')->update(['two_level'=>$info['user_id'],'level'=>$info['level']+1]);
        if(!empty($info['two_level'])){
            // dump($data['ancestors'].','.$check['id']);die;
            if(!empty($info['ancestors'])){
                $map['ancestors'] = $info['ancestors'].','.$info['user_id'];
            }else{
                $map['ancestors'] = $info['two_level'];
            }
            // $subuser = $this::whereIn('ancestors',''.$userid.'')->update(['ancestors'=>$data['ancestors'].','.$check['id']]);
        }
        $subuser = $this::whereIn('user_id',''.$userid.'')->select();
        if(count($subuser) > 0){
            $this::whereIn('user_id',''.$userid.'')->update($map);
        }
        $twouser = $this::whereIn('two_level',''.$userid.'')->select();
        if(count($twouser) > 0){
            if(!empty($map['ancestors'])){
                $ancestors = $map['ancestors'].','.$twouser[0]['two_level'];
            }else{
                $ancestors = $twouser[0]['two_level'];
            }
            $this::whereIn('two_level',''.$userid.'')->update(['ancestors'=>$ancestors,'level'=>$map['level']+1]);
        }
       
        $alluser = $this::whereFindInSet('ancestors',$userid)->where('two_level','<>',$userid)->select();
        if(count($alluser) > 0){
            foreach ($alluser as $key => $val) {
                if(!empty($map['ancestors'])){
                    $ancestorsa = $map['ancestors'].','.$val['ancestors'];
                }else{
                    $ancestorsa = $val['ancestors'];
                }
                $level = count(explode(",",$ancestorsa));
                $this::where('id',$val['id'])->update(['ancestors'=>$ancestorsa,'level'=>$level+1]);
            }
            
        }
    }

    public function incUser($id,$user_id,$ancestors){
        if(!empty($id)){
            $alladdnum = $this::where('id',$id)->inc('all_user_num')->update();
        }
        if(!empty($user_id)){
            $alladdnum = $this::where('id',$user_id)->inc('all_user_num')->update();
        }
        if(!empty($ancestors)){
            $alladdnum = $this::where('id','in',$ancestors)->inc('all_user_num')->update();
        }
    }

    public function editDb()
    {
        $data = Request::param();
        Db::startTrans();
        try {
            if(!empty($data['new_rec_code'])){
                $check = $this->where('id_code',$data['new_rec_code'])->where('id','<>',$data['id'])->find();

                if(!$check || $check['id'] > $data['id']){
                    return show(400,'推荐码填写错误');
                }
                $myselfinfo = $this->where('id',$data['id'])->value('rec_code');
                if($myselfinfo){
                    return show(400,'已有推荐码！');
                }
                $data['user_id'] = $check['id'];
                $data['two_level'] = $check['user_id'];
                $ancestors = $this->where('id',$data['user_id'])->field('user_id,ancestors,level')->find();
                if(!empty($ancestors['user_id'])){
                    $ancestors_list = $ancestors['ancestors'];
                    if(!empty($ancestors_list)){
                        $ancestors_list = $ancestors_list.','.$ancestors['user_id'];
                    }else{
                        $ancestors_list = $ancestors['user_id'];
                    }
                    $data['ancestors'] = $ancestors_list;
                }
                $data['rec_code'] = $data['new_rec_code'];
                $data['level'] = $ancestors['level'] + 1;
                $this->incUser($check['id'],$check['user_id'],$check['ancestors']);
                $data['edit_time'] = time();
            }
            // if(!empty($data['group_id'])){
                $group_id = self::where('id',$data['id'])->value('group_id');
                if($group_id !== (int)$data['group_id']){
                    $data['set_role_time'] = time();
                }
            // }
            // if(!empty($data['role_id'])){
            //     $data['jishou_end_time'] = strtotime('+6 month');
            // }
            $res = $this->update($data);
            if(!empty($data['new_rec_code']) && !$myselfinfo){
                $this->xiajiUser($data['id']);
            }
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    public static function setRoleDb()
    {
        $data = Request::param();
        Db::startTrans();
        try {
            $res = self::update($data);
            if($data['role_id'] > 0){
                $userids = Webset::where('id',1)->value('jsxz_user_ids');
                if($data['is_tip'] == 1){
                    Webset::update(['id'=>1,'jsxz_user_ids'=>$userids.','.$data['id']]);
                }else{
                    $arr = explode(",",$userids);
                    $key = array_search($data['id'], $arr);
                    if ($key !== false)
                        array_splice($arr, $key, 1);
                    Webset::update(['id'=>1,'jsxz_user_ids'=>implode(",",$arr)]);
                }
            }
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    public static function notify($user_id,$order_id){
        $data = Request::param();
        Db::startTrans();
        try {
            $userinfo = self::where('id',$user_id)->update(['group_id'=>1]);
            $info = self::where('id',$user_id)->field('id,user_id,ancestors')->find();
            if(!empty($info['user_id'])){
                //推广大使||服务中心
                $user_check = self::where('id',$info['user_id'])->whereIn('group_id','1,2')->find();
                if($user_check){
                    if($user_check['group_id'] == 2){
                        $money = 100;
                    }else{
                        $money = 50;
                    }
                    self::addRecord($info['user_id'],$order_id,$money);
                }
            }
            if(!empty($info['ancestors'])){
                //服务中心
                $fw_check = self::whereIn('id',$info['ancestors'])->where('group_id',2)->order('id desc')->value('id');
                if($fw_check && $user_check['group_id'] !== 2){
                    self::addRecord($fw_check,$order_id,50);
                }
            }
            Db::commit();
            return true;
        } catch (\Throwable $th) {
            Db::rollback();
            return false;
        }
        
    }

    public static function addRecord($user_id,$order_id,$money){
        // $money = Webset::where('id',1)->value('extend_price');
        $res = Member::where('id',$user_id)->inc('qiandou',$money)->update();
        if($res){
            if($money > 0)
                $one_record = Record::create([
                    'order_id'=>$order_id,'tip'=>1,'user_id'=>$user_id,'money'=>$money,'title'=>'推广大使']);
        }
        return true;
    }

}