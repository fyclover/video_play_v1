<?php


namespace app\command;

use app\business\Curl;
use app\controller\Index;
use app\model\VideoDetailModel;
use app\model\VideoModel;
use think\console\Command;
use think\console\Input;
use think\console\Output;

class VideoDetail extends Command
{
    protected function configure()
    {
        $this->setName('video_detail')->setDescription('Here is the video_detail');
    }

    protected function execute(Input $input, Output $output)
    {
        //查询视频
        $model = new VideoModel(); // 获取所有视频列表
        $VideoDetailModel = new VideoDetailModel(); // 获取视频详情列表
		
		// 断点 继续下载的功能 开始
        $find =$VideoDetailModel->order('id desc')->find();
        $findId = 0;
        if (!empty($find)){
            $findId = $find->vod_id;
        }
        $video = $model->where('id','>',$findId)->order('id asc')->select()->toArray();
		// 断点 继续下载的功能 结束

		// 批量下载 开始
        foreach ($video as $k=>$v){
			dump('开始采集：'.$k.'条数据');
            if ($k%10 == 1){
                sleep(3);
            }
            $json = Curl::post(env('CURL.CAI_JI_URL').'ac=detail&ids='.$v['id']);
            if (empty($json['list'])){
                continue;
            }
            $VideoDetailModel->strict(false)->insert($json['list'][0]);
            continue;
        }

        $output->writeln('执行成功');
    }
}