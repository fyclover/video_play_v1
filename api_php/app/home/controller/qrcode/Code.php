<?php


namespace app\home\controller\qrcode;

use app\home\ApiBaseController;
use my\QRcode;

class Code extends ApiBaseController
{
    public function  qrcode()
    {
        $code = $this->request->param('code');
        //$qrcode=url_code().randomkey(5).'.'.config('ToConfig.app_tg.tg_url');
        $qrcode=config('ToConfig.app_tg.tg_url');
        if (empty($code)){
            return show([],config('ToConfig.http_code.error'),'code码没有');
        }
        if (!empty($code))$qrcode.='?codes='.$code;

        $name = $this->generate($qrcode);

        $img = config('ToConfig.app_update.app_qrcode').'static/'.$name;
        return show(['qrcode' => $img,'url'=>$qrcode,'name'=>$name]);
    }

    public function generate($url = 'http', $logo = 0)
    {
        if (empty($url))
            return false;
        $value = $url; //二维码内容地址 地址一定要加http啥的
        $errorCorrectionLevel = 'H';  //容错级别
        $matrixPointSize = 6;      //生成图片大小
        //生成二维码图片
        $name = 'qb' . time() . '.png';
        $filename = 'static/' .$name ; //生成的二维码图片

        QRcode::png($value, $filename, $errorCorrectionLevel, $matrixPointSize, 2);
        //$logo = 'static/info_msg.png'; //准备好的logo图片 注意地址
        $QR = $filename;      //已经生成的原始二维码图

        if ($logo == 0){
            return $name;
        }

        if (file_exists($logo)) {
            $QR = imagecreatefromstring(file_get_contents($QR));      //目标图象连接资源。
            $logo = imagecreatefromstring(file_get_contents($logo));  //源图象连接资源。
            $QR_width = imagesx($QR);        //二维码图片宽度
            $QR_height = imagesy($QR);       //二维码图片高度
            $logo_width = imagesx($logo);    //logo图片宽度
            $logo_height = imagesy($logo);   //logo图片高度
            $logo_qr_width = $QR_width / 4;   //组合之后logo的宽度(占二维码的1/5)
            $scale = $logo_width / $logo_qr_width;  //logo的宽度缩放比(本身宽度/组合后的宽度)
            $logo_qr_height = $logo_height / $scale; //组合之后logo的高度
            $from_width = ($QR_width - $logo_qr_width) / 2;  //组合之后logo左上角所在坐标点
            //重新组合图片并调整大小
            /*
             * imagecopyresampled() 将一幅图像(源图象)中的一块正方形区域拷贝到另一个图像中
             */
            imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width, $logo_qr_height, $logo_width, $logo_height);
        }
        //输出图片
        //最新图片。拼接头像 和二维码的最新图片
        $i = time();
        $img_path = "$i.png";
        imagepng($QR, $img_path); //不改
        imagedestroy($QR);
        imagedestroy($logo);
        //图片

        return $img_path;
    }

    function download()
    {
        $file_name = $this->request->post('name','');
        if (empty($file_name)){
            return show([],config('ToConfig.http_code.error'),'文件名称不存在');
        }
        //用以解决中文不能显示出来的问题
        //$file_name=iconv("utf-8","gb2312",$file_name);
        $file_path = app()->getRootPath().'public/static/' . $file_name;
        $file_path = str_replace("'", "", $file_path);
        //首先要判断给定的文件存在与否
        if (!file_exists($file_path)) {
            return show([],config('ToConfig.http_code.error'),'文件不存在');
        }
        $fp = fopen($file_path, "r");
        $file_size = filesize($file_path);
        //下载文件需要用到的头
        Header("Content-type: application/octet-stream");
        Header("Accept-Ranges: bytes");
        Header("Accept-Length:" . $file_size);
        Header("Content-Disposition: attachment; filename=" . $file_name);
        $buffer = 1024;
        $file_count = 0;

        //一下两行防止（格式未知 数据已被损坏）
        ob_clean();
        flush();
        //向浏览器返回数据
        while (!feof($fp) && $file_count < $file_size) {
            $file_con = fread($fp, $buffer);
            $file_count += $buffer;
            echo $file_con;
        }
        fclose($fp);
    }
}