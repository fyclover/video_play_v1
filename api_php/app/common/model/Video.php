<?php


namespace app\common\model;


use app\common\traites\TraitModel;
use think\Model;

class Video extends Model
{
    use TraitModel;
    public $name = 'video';

    public static function page_list($map,$limit, $page,$order = 'id desc,type asc')
    {
        return self::alias('a')
            ->where($map)
            ->join('video_type b', 'a.type = b.id', 'left')
            ->join('video_to_vip c', 'a.id = c.video_id', 'left')
            ->field('a.*,b.title name,c.types')
            ->order($order)
            ->paginate(['list_rows' => $limit, 'page' => $page], false)->each(function($item, $key){

                $VideoDetail =VideoDetail::where('vod_id',$item->id)->find();

                if($VideoDetail){
                    $item->video_url  = $VideoDetail->vod_play_url;
                    $item->thumb_url  = $VideoDetail->vod_pic;
                }
                if (!empty($item->types)) {
                    $types=array_filter(explode(',',$item->types));
                    $item->types=$types;
                    foreach ($types as &$value){
                        $value= intval($value);
                    }
                }
                if (!empty($item->platform)){
                    $item->platform = explode(',', $item->platform);
                    foreach ($item->platform as $key=>&$value){
                        $value = intval($value);
                    }
                }
                $item->status_text = '';
                if ($item->status == 0){
                    $item->status_text = '审核中';
                }
                return $item;
            });
    }
}