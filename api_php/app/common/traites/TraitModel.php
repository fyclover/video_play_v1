<?php


namespace app\common\traites;


use app\common\model\VideoLog;
use think\facade\Db;

trait TraitModel
{
    /**
     * 直接删除
     * @param $id /主键
     * @return bool
     */
    public function del($id)
    {
        $find = $this->find($id);
        if (empty($find)) return false;
        return $find->delete();
    }
    /**
     * 添加数据
     * @param $data /数据数组
     * @param bool $type /true 单条添加,false多条添加
     */
    public function add(array $data,bool $type=true)
    {
        //单条添加
        if ($type){
            return $this->insert($data);
        }
        //多条添加
        return $this->insertAll($data);
    }

    //软删除
    public function deletes($id)
    {
        return '';
    }

    public function setStatus($post)
    {
        $id = intval($post['id']);
        $status = intval($post['status']);
        //$status = $post['status'] == 1 ? 0 : 1;

        if ($id < 1) return false;
        $find = $this->find($id);
        return $find->save(['status' => $status]);
    }

    public function getThumbUrlAttr($value)
    {

        if (empty($value)) return '';
        if (is_array($value)) return '';
        $value = explode(',', $value);
        if (count($value) > 1) {
            foreach ($value as $key => $v) {
                $value[$key] = config('ToConfig.app_update.image_url') . $v;
            }
            return $value;
        }

        if(strpos($value[0],'http') !== false){
            return  $value[0];
        }else{
            return config('ToConfig.app_update.image_url') . $value[0];
        }

    }
    
    public function getVodPicAttr($value)
    {

        if (empty($value)) return '';
        if (is_array($value)) return '';
        $value = explode(',', $value);
        
        if (count($value) > 1) {
            foreach ($value as $key => $v) {
                $value[$key] = config('ToConfig.app_update.image_url') . $v;;
            }
            return $value;
        }

        if(strpos($value[0],'http') !== false){
            return  $value[0];
        }else{
            return config('ToConfig.app_update.image_url') . $value[0];
        }

    }
    
    public function getVodPlayUrlAttr($value)
    {
        if (empty($value)) return '';
        if (is_array($value)) return '';
        $value = explode(',', $value);
       
        if (count($value) > 1) {
            foreach ($value as $key => $v) {
               $value[$key] = config('ToConfig.app_update.image_url') . $v;
            }
            
            return $value;
        }
        
       
        if(strpos($value[0],'http') !== false){
          $value[0] = str_replace("在线播放$","",$value[0]);
            return  $value[0];
        }else{
            return config('ToConfig.app_update.image_url') . $value[0];
        }
    }

    public function getVideoUrlAttr($value)
    {
        if (empty($value)){
            return '';
        }
        $value = str_replace("在线播放$","",$value);
        if(strpos($value,'http') !== false){
            return  $value;
        }else{
            // if(isset($value[0]) && !empty($value[0])){
            //     dump($value);die;
            //     return config('ToConfig.app_update.image_url') . $value[0];
            // }
            return config('ToConfig.app_update.image_url') . $value;
        }
    }

    //代理商查看代理商推广的用户充值等 不排除自己
    public static function whereMap()
    {
        $map = [];
        //代理商 推广列表
        if (session('admin_user.agent')) $map = ['agent_id_1|agent_id_2|agent_id_3|b.id' => session('admin_user.id')];
        return $map;
    }
    //代理商查看用户代理。排除自己
    public static function whereMapUser()
    {
        $map = [];
        //代理商 推广列表
        if (session('admin_user.agent')) $map = ['agent_id_1|agent_id_2|agent_id_3' => session('admin_user.id')];
        return $map;
    }


    public static function videoInfoAdditional($item){
       $home_user_id =  session('home_user.id');

        $item->is_fabulous = 0;
        $item->is_fabulous_count = 0;
        $item->is_comment_count = 0;

        if ($home_user_id >0){
        VideoLog::listens(['uid'=>$home_user_id,'video_type'=>$item->type_id,'video_id'=>$item->vod_id]);
        //查询用户是否点赞了
        $is_fabulous = Db::name('video_fabulous')->where(['content_id'=>$item->vod_id,'uid'=>$home_user_id])->find();

        if (!empty($is_fabulous)){
            $item->is_fabulous = 1;
        }
        }
        //视频点赞统计
        $is_fabulous_count = Db::name('video_fabulous')->where(['content_id'=>$item->vod_id])->count('id');
        if ($is_fabulous_count> 0 ){
            $item->is_fabulous_count = $is_fabulous_count;
        }
        //视频评论统计
        $is_comment_count = Db::name('video_comment')->where(['content_id'=>$item->vod_id])->count('id');
        if ($is_comment_count> 0 ){
            $item->is_comment_count = $is_comment_count;
        }
        return $item;
    }
}