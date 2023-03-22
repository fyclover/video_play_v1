<?php


namespace app\command;

use app\business\Curl;
use app\model\VideoModel;
use app\model\VideoTypeModel;
use think\console\Command;
use think\console\Input;
use think\console\Output;

class VideoList extends Command
{
    protected function configure()
    {
        $this->setName('video_list')->setDescription('Here is the video_list');
    }

    protected function execute(Input $input, Output $output)
    {
        $Vmodel = new VideoTypeModel();
        $TypeList = $Vmodel->select()->toArray();

        // 获取分页 默认获取 18个分页的数据
        $limit = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]; 

        $VideoList = [];
        $model = new VideoModel();
        foreach ($TypeList as $key=>$value){
			// 分类获取
            $str = 'ac=list&t='.$value['id'];
            foreach ($limit as $pg){
				// 分页获取
                $string =$str. '&pg='.$pg;
                $json = Curl::post(env('CURL.CAI_JI_URL').$string);
				dump('采集：'.$string);
				dump('采集到'.count($json['list']).'条信息');
				// 如果有数据
                if (!empty($json['list'])){
                    foreach ($json['list'] as  $k=>$j){
                        $VideoList['id'] = $j['vod_id'];
                        $VideoList['title'] = $j['vod_name'];
                        $VideoList['type'] = intval($j['type_id']);
                        $VideoList['description'] = $j['vod_en'];
                        $VideoList['create_time'] = $j['vod_time'];
                        $VideoList['update_time'] = $j['vod_time'];
						$VideoList['vod_play_from'] = $j['vod_play_from'];
                        if (!$model->where('id',$VideoList['id'])->find()){
                            $model->strict(false)->insert($VideoList);
                        }
                    }
                }
            }
        }
        return '成功';

        $output->writeln('执行成功');
    }
}