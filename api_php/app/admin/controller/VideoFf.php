<?php
namespace app\admin\controller;

use app\BaseController;
define('FFMPEG_CMD', 'ffmpeg -i "%s" 2>&1');
class VideoFf extends BaseController
{
    public function initialize()
    {

        parent::initialize(); // TODO: Change the autogenerated stub
    }

    // 定义ffmpeg路径及命令常量
    public function index()
    {
        $video = 'http://xapi.yhvip666.net/storage/topic/20210408/cf1e8ceb4cc0635dd557931922516153.mp4'; //需要截屏的视频文件
        $img_name = '1540299975791-2018-10-23.jpg'; //截屏后的图片文件名
        $file_url = 'static/' . $img_name; //截屏后输出的文件地址
        // 输出视频信息
        $video_info =$this->getVideoInfo($video);
        //截取视频封面
        convertToFlv($video, $file_url, $video_info[0]['resolution']);
    }

    /**
     * 使用ffmpeg获取视频信息
     * @param String $file 视频文件
     * @return Array
     */
    public function getVideoInfo($file)
    {
        ob_start();
        passthru(sprintf(FFMPEG_CMD, $file));
        $video_info = ob_get_contents();
        ob_end_clean();

        // 使用输出缓冲，获取ffmpeg所有输出内容
        $ret = array();

        // Duration: 00:33:42.64, start: 0.000000, bitrate: 152 kb/s
        if (preg_match("/Duration: (.*?), start: (.*?), bitrate: (\d*) kb\/s/", $video_info, $matches)) {
            $ret['duration'] = $matches[1]; // 视频长度
            $duration = explode(':', $matches[1]);
            $ret['seconds'] = $duration[0] * 3600 + $duration[1] * 60 + $duration[2]; // 转为秒数
            $ret['start'] = $matches[2]; // 开始时间
            $ret['bitrate'] = $matches[3]; // bitrate 码率 单位kb
        }

        // Stream #0:1: Video: rv20 (RV20 / 0x30325652), yuv420p, 352x288, 117 kb/s, 15 fps, 15 tbr, 1k tbn, 1k tbc
        if (preg_match("/Video: (.*?), (.*?), (.*?)[,\s]/", $video_info, $matches)) {
            $ret['vcodec'] = $matches[1];  // 编码格式
            $ret['vformat'] = $matches[2]; // 视频格式
            $ret['resolution'] = $matches[3]; // 分辨率
            list($width, $height) = explode('x', $matches[3]);
            $ret['width'] = $width;
            $ret['height'] = $height;
        }

        // Stream #0:0: Audio: cook (cook / 0x6B6F6F63), 22050 Hz, stereo, fltp, 32 kb/s
        if (preg_match("/Audio: (.*), (\d*) Hz/", $video_info, $matches)) {
            $ret['acodec'] = $matches[1];  // 音频编码
            $ret['asamplerate'] = $matches[2]; // 音频采样频率
        }

        if (isset($ret['seconds']) && isset($ret['start'])) {
            $ret['play_time'] = $ret['seconds'] + $ret['start']; // 实际播放时间
        }

        $ret['size'] = filesize($file); // 视频文件大小
        $video_info = iconv('gbk', 'utf8', $video_info);
        return array($ret, $video_info);
    }


    //截取视频的封面
    public function convertToFlv($input, $output, $size)
    {
        // $command = "ffmpeg -v 0 -y -i $input -vframes 1 -ss 5 -vcodec mjpeg -f rawvideo -s 286x160 -aspect 16:9 $output ";
        $command = "ffmpeg -i $input -y -f image2 -t 0.001 -s $size $output";
        shell_exec($command);
    }


}