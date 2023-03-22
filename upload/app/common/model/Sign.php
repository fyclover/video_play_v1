<?php
namespace app\common\model;

use think\Model;
use think\facade\Request;
use think\facade\Db;

class Sign extends Model{
    
    protected $autoWriteTimestamp = true;
    protected $updateTime = false;

    public static function getAll($user_id){
        $where = Request::param();
        $model = new self;
        $model = $model->where('user_id',$user_id);
        $model = $model->where('status',1);
        return $model->order('id desc')->select();
    }
    /**
     * 新增
     */
    public function insertDb($user_id)
    {
        $data = Request::param();
        Db::startTrans();
        try {
            $check = $this->where('user_id',$user_id)->whereDay('create_time')->find();
            if($check) return show(400,'今日已签到！');
            $info = $this::where('user_id',$user_id)->whereDay('create_time', 'yesterday')->find();
            if($info && $info['sign_num']<7){
                $data['sign_num'] = $info['sign_num']+1;
            }else{
                $data['sign_num'] = 1;
                $this->check($user_id);
            }
            $data['user_id'] = $user_id;
            $data['day'] = date('Y-m-d');
            $res = $this::create($data);
            if($res){
                $money = SignSet::where('day_num',$data['sign_num'])->value('qianbao_num');
                Record::addRecord($user_id,$money,'','签到黔宝','qianbao',2);
            }
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    public function check($user_id){
        $info = $this::where('user_id',$user_id)->whereDay('create_time', 'yesterday')->find();
        $info1 = $this::where('user_id',$user_id)->whereDay('create_time')->find();
        if(!$info && !$info1){
            $this->where('user_id',$user_id)->update(['status'=>2]);
        }
        return true;
    }
}