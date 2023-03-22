<?php


namespace app\common\model;


use app\common\traites\TraitModel;
use think\Model;

class VideoLog extends Model
{
    use TraitModel;

    public $name = 'vodeo_browse_log';

    //用户插入浏览历史数据
    public static function listens($map){
        $find = @VideoLog::where($map)->find();
        if (empty($find)){
            $map['create_time'] = date('Y-m-d H:i:s');
            VideoLog::insert($map);
        }else{
            VideoLog::where($map)->update(['create_time'=>date('Y-m-d H:i:s')]);
        }
    }

    //用户浏览历史
    public static function browse($map){
        return VideoLog::where($map)->select();
    }
}