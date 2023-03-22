<?php

namespace app\admin\controller;

use app\BaseController;

class ImgUpload extends BaseController
{
    private $uid = 0;

    public function initialize()
    {
       
    }

    public function upload(){
        // 获取表单上传文件 例如上传了001.jpg
        $file =  $this->request->file('file');

        $this->uid = $this->request->param('agent_uid',0);
        if ($this->uid <=0){
            show(0,'uid错误');
        }

        // 上传到本地服务器
        $savename = '';
        try {
            $savename = \think\facade\Filesystem::disk('image')->putFile($this->uid, $file);
        } catch (\think\exception\ValidateException $e) {
            echo $e->getMessage();
        }
        $path = '/upload_image';
        show(1,'ok',[env('URL.URL').$path.'/'.$savename]);
    }
}

