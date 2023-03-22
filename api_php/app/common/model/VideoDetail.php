<?php


namespace app\common\model;


use app\common\traites\TraitModel;
use think\Model;

class VideoDetail extends Model
{
    use TraitModel;
    public $name = 'video_detail';
    public function getVodPicAttr($value)
    {

        if (empty($value)){
            return '';
        }
        $value = str_replace("在线播放$","",$value);
        if(strpos($value,'http') !== false){
            return  $value;
        }else{
            return config('ToConfig.app_update.image_url') . $value;
        }

        if (empty($value)){
            return '';
        }
        //return str_ireplace('===', env('CURL.VIDEO_PIC'), $value);

    }

    public function getVodPlayUrlAttr($value)
    {
        if (empty($value)){
            return '';
        }
        $value = str_replace("在线播放$","",$value);
        if(strpos($value,'http') !== false){
            return  $value;
        }else{
            return config('ToConfig.app_update.image_url') . $value;
        }
    }


}