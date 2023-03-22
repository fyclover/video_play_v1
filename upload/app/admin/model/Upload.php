<?php
namespace app\admin\model;

use think\Model;

class Upload extends Model
{
    protected $autoWriteTimestamp = 'int';
     public $name='update_video';


     public static function inserts($data){
        self::insert($data);
     }
}