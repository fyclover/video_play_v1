<?php


namespace app\command;

use \app\admin\model\Upload;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\facade\Db;

class FfmpegM extends Command
{
    //视频转 m3u8
    protected function configure()
    {
        $this->setName('m3u8')->setDescription('Here is the m3u8');
    }

    protected function execute(Input $input, Output $output)
    {
        // $list = redis()->RPUSH('video_m3u8','2231.mp4');
        // $list = redis()->RPUSH('video_m3u8','WeChat_20221012140631.mp4');
        // $a = redis()->RPUSH('video_m3u8','qw1.mp4');
        // die;
        //拿取 redis 中需要转的视频名称
        //$list = redis()->LRANGE('video_m3u8',0, 10);
        //查询没有m3u8的数据
        $list = Upload::where('m3u8_name','=','')->where('is_change',1)->orderRaw('rand()')->limit(1)->select()->toArray();

        if (empty($list)){
            $output->writeln('执行成功没有数据');
            return ;
        }
        //判断是否存在了该视频 m3u8文件
        $dirM3u8 = app()->getRootPath().'public/m3u8/'.$list[0]['uid'].'/'.$list[0]['id'];

        if (is_dir($dirM3u8)){
            redis()->LREM('video_m3u8', $list[0]['id']);//删除当前已经计算过的值
            $output->writeln($list[0]['id'].'已存在m3u8文件');
            return ;
        };
        //不存在 创建文件夹

        $dir = mkdirs($dirM3u8);

        // if (!$dir){
        //     redis()->LREM('video_m3u8', $list[0]);//删除当前已经计算过的值
        //     $output->writeln($list[0].'创建文件失败');
        //     return ;
        // }
        //文件创建了。开始生成 ts文件了
        $dirM3u8x = app()->getRootPath().'public/'.$list[0]['video_path'];

        exec("ffmpeg -y -i {$dirM3u8x} -vcodec copy -acodec copy -vbsf h264_mp4toannexb {$dirM3u8}/input.ts",$a,$b);
        if($b == 1){
            return;
        }
        sleep(3);
        exec("ffmpeg -i {$dirM3u8}/input.ts -c copy -map 0 -f segment -segment_list $dirM3u8/input.m3u8 -segment_time 5 {$dirM3u8}/input-%03d.ts",$c,$d);
        if($d == 1){
            return;
        }
        sleep(3);
        //写入数据库 m3u8地址
        $adds = '/m3u8/'.$list[0]['uid'].'/'.$list[0]['id'].'/input.m3u8';
        Upload::where('id',$list[0]['id'])->update(['m3u8_name'=>$adds]);
        //写入视频详情
        $video = Db::name('video')->where('upload_id',$list[0]['id'])->find();
        Db::name('video')->where('upload_id',$list[0]['id'])->update(['vod_play_from'=>'$$$m3u8']);
        if (empty($video)){
            return $list[0]['id'].':ID 写入详情失败';
        }
        Db::name('video_detail')->where('vod_id',$video['id'])->update(['vod_play_url'=>$adds,'vod_play_from'=>'$$$m3u8']);
        $output->writeln('执行成功');
    }

}