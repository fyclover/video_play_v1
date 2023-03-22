<?php
namespace app\controller;

use app\BaseController;
use app\business\Curl;
use app\model\VideoTypeModel;

class Index extends BaseController
{
    /**
     *  获取视频分类
     * @return string
     */
    public function cai_ji_video_type(){
        $str = 'ac=list';
        $json = Curl::post(env('CURL.CAI_JI_URL').$str);
        if ($json['code'] != 1){
            return '成功';
        }
        if (empty($json['class'])){
            return '成功';
        }
        $VideoType=[];
        //把数据保存到数据库
        $model = new VideoTypeModel();
        try {
            foreach ($json['class'] as $key=>$value) {
                $VideoType['id'] = $value['type_id'];
                $VideoType['pid'] = $value['type_pid'];
                $VideoType['title'] = $value['type_name'];
                $model->insert($VideoType);
            }
        } catch (\Exception $e) {
            return '失败';
        }

        return '成功';
    }

}
