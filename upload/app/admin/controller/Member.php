<?php

namespace app\admin\controller;

use app\common\model\UpdateVideo;
use think\facade\Db;
use think\facade\Request;


use think\facade\View;

class Member extends Base
{
    /**
     * 显示资源列表
     * @return \think\Response
     */
    public function index()
    {

        $map =[['status','=',0]];
        if (session('group_id') !=1 ){
            $map[] =['uid','=',session('admin_uid')];
        }

        $list = UpdateVideo::where($map)->order('id desc')->paginate();
        
        return View::fetch('index', [
            'list' => $list,
        ]);
    }

    public function edit()
    {
        $data = Request::param();
        if(Request::isAjax()) {
            $model = new UpdateVideo();
            $data = array_filter($data);
            
            //查询是否需要转
            $is_size=Db::name('video_type')->where('id',$data['video_type'])->value('is_size');
            $data['is_change'] = $is_size;
            if ($model->update($data)) return show(200, '操作成功');
            return show(-1, '操作失败');
        }
        $list = UpdateVideo::where('id',$data['id'])->find();
        $type=Db::name('video_type')->where('status',1)->select();
        return View::fetch('edit', [
            'data' => $list,
            'type'=>$type
        ]);
    }


    public function upload(){
        //获取当前域名
        // 获取表单上传文件 例如上传了001.jpg
        $file =  $this->request->file('file');
        $this->uid = session('admin_uid');
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

        show(1,'ok',[$_SERVER['HTTP_ORIGIN'].$path.'/'.$savename,$path.'/'.$savename]);
    }

    public function renew(){
        $data = Request::param();
        if ($data['id'] <=0){
            show(0,'非法操作');
        }

        //查询 是否合法了
        $model = new UpdateVideo();
        $find = $model->where('id',$data['id'])->find();
        if (empty($find)){
            show(0,'非法操作');
        }
        if ($find['status'] != 0 ){
            show(0,'不可更新');
        }
        if (empty($find['video_title'])){
            show(0,'请编辑标题');
        }

        if (empty($find['labels'])){
            show(0,'请编辑标签');
        }
        if (empty($find['img_path'])){
            show(0,'请编辑封面图');
        }

        if (empty($find['video_path'])){
            show(0,'请编辑图片地址');
        }
        
        if (empty($find['video_type'])){
            show(0,'请选择分类');
        }

        $strType = '$$$mp4';
         if (!empty($find['is_change']) && $find['is_change']==1){
             $strType .='$$$m3u8';
         }

        
        $type= $find['video_type'];
        $true = false;
        Db::startTrans();
        try {
        //提交到线上
        //1 查询视频表
        
        if(strlen($find['labels']) > 0){
            if (strpos($find['labels'],'#')!=0) {
            $find['labels'] = '#'.$find['labels'];
            }
        }
        
        
         $save = [
           'type'=>$type,
           'title'=>$find['video_title'],
           'status'=>0,
           'video_price'=> $find['video_price']>=0 ? $find['video_price']:0,
           'description'=>$find['description'],
           'create_time'=>date('Y-m-d H:i:s'),
           'update_time'=>date('Y-m-d H:i:s'),
           'admin_uid'=>$this->userinfo['video_1'],
           'vod_play_from'=>$strType,
           'is_only_buy_alone'=>$find['video_title']>=0 ? 1:0,
           'labels'=>$find['labels'],
           'duration'=>$find['duration'],
           'platform'=>$find['platform'],
           'upload_id'=>$find['id'],
         ];

        $id = Db::name('video')->insertGetId($save);

        //写入视频详情
        $saved = [
            'vod_id'=>$id,
            'type_id'=>$save['type'],
            'group_id'=>0,
            'vod_name'=>$save['title'],
            'vod_en'=>'',
            'vod_status'=>0,
            'vod_tag'=>$save['labels'],
            'vod_pic'=>$find['img_path'],
            'vod_pic_thumb'=>'',
            'vod_remarks'=>'',
            'vod_pubdate'=>'',
            'vod_total'=>0,
            'vod_area'=>'',
            'vod_lang'=>'',
            'vod_year'=>date('Ymd'),
            'vod_version'=>'',
            'vod_state'=>'',
            'vod_time'=>date('Y-m-d H:i:s'),
            'vod_content'=>'',
            'vod_play_from'=>$strType,
            'vod_play_url'=>$find['video_path'],
            'type_name'=>'',
            'vod_blurb'=>$find['description'],
        ];
        //提交申请
           Db::name('video_detail')->insertGetId($saved);
            $model->where('id',$data['id'])->update(['status'=>1]);
            $true = true;
            Db::commit();
        }catch (\Exception $exception){
            Db::rollback();
            show(0,$exception->getMessage());

        }
        show(1,'ok');
    }
}
