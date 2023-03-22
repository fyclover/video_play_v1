<?php


namespace app\admin\controller\content;

use app\admin\controller\Base;


use app\common\model\Video as models;
use app\common\model\VideoDetail;
use app\common\model\VideoToVip;
use app\common\traites\PublicCrudTrait;
use app\validate\Status;
use think\Exception;
use think\exception\ValidateException;
use \app\validate\Video as validates;
use think\facade\Db;

class Video extends Base
{
    protected $model;
    use PublicCrudTrait;

    /**
     * 视频控制器
     */
    public function initialize()
    {
        $this->model = new models();
        parent::initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 列表
     */
    public function index()
    {
        //当前页
        $page = $this->request->post('page', 1);
        //每页显示数量
        $limit = $this->request->post('limit', 10);
        //查询搜索条件
        $post = array_filter($this->request->post());
        $map = [];
        $agent = session('admin_user.agent');
        if ($agent == 1){
            $map [] = ['a.admin_uid','=',session('admin_user.id')];
        }
        isset($post['title']) && $map [] = ['a.title', 'like', '%' . $post['title'] . '%'];
        isset($post['status']) && $map [] = ['a.status', '=',$post['status']];

        $list = $this->model->page_list($map, $limit, $page);
        return $this->success($list);
    }

    /**
     * 添加
     */
    public function add()
    {
        //过滤数据
        $postField = 'type,title,thumb_url,des,sort,status,video_url,description,video_price,labels,duration,platform';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        //验证数据
        try {
            validate(validates::class)->scene('add')->check($post);
        } catch (ValidateException $e) {
            // 验证失败 输出错误信息
            return $this->failed($e->getError());
        }

        $user = $this->model->where('title', $post['title'])->find();
        if ($user) return $this->failed('该标题以存在');

        $Detail = [];
        isset($post['thumb_url']) && $Detail['vod_pic'] = $post['thumb_url'] = image_update($post['thumb_url']);
        isset($post['video_url']) && $Detail['vod_play_url'] =$post['video_url'] = image_update($post['video_url']);
        !isset($post['thumb_url']) && $Detail['vod_pic'] = $post['thumb_url'] = '';
        if (isset($post['platform']) && !empty($post['platform'])){
             $post['platform'] = implode(',', $post['platform']);;
        }

        //插入到详情表
        $Detail['type_id'] = $post['type'];
        $Detail['group_id'] = 0;
        $Detail['vod_name'] = $post['title'];
        $Detail['vod_status'] = 1;
        $Detail['vod_content'] = 1;
        $Detail['admin_uid'] = session('admin_user.id');
        $Detail['status'] = session('admin_user.agent') == 1 ? 0 :1;

        $post['vod_play_from'] = $Detail['vod_play_from'] = 'mp4';
        $Detail['type_name'] = \app\common\model\VideoType::where('id',$post['type'])->value('title');

        //添加的时候顺便插入到 video_to_vip 表一条空数据
        $save = false;
        Db::startTrans();
        try {
            $this->model->save($post);
            $Detail['vod_id'] =$this->model->id;
            VideoDetail::insert($Detail);
            (new VideoToVip())->insert(['video_id' => $this->model->id]);
            $save = true;
            Db::commit();
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
        }

        if ($save) return $this->success([]);
        return $this->failed('新增失败');
    }

    /**
     * 修改
     * @return mixed
     */
    public function edit()
    {
        //过滤数据 可观看 duration 时长 ， platform 发布平台
        $postField = 'id,type,title,thumb_url,des,sort,status,video_url,description,video_price,labels,duration,platform';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        //验证数据
        try {
            validate(validates::class)->scene('edit')->check($post);
        } catch (ValidateException $e) {
            // 验证失败 输出错误信息
            return $this->failed($e->getError());
        }

        //查询是否重复的该菜单
        $find = $this->model->where('title', $post['title'])->where('id', '<>', $post['id'])->find();
        if ($find) return $this->failed('该标题以存在');

        if (isset($post['thumb_url']) && !empty($post['thumb_url'])) {
            $Detail['vod_pic'] =$post['thumb_url'] = image_update($post['thumb_url']);
        }
        if (isset($post['video_url']) && !empty($post['video_url'])) {
            $Detail['vod_play_url'] =$post['video_url'] = image_update($post['video_url']);
        }
        if (isset($post['labels']) && !empty($post['labels'])) {
            $Detail['vod_tag'] = $post['labels'];
        }
        //插入到详情表
        $Detail['type_id'] = $post['type'];
        $Detail['vod_name'] = $post['title'];
        $Detail['vod_content'] = 1;
        $Detail['type_name'] = \app\common\model\VideoType::where('id',$post['type'])->value('title');

        !isset($post['video_url']) && $Detail['vod_play_url'] =$post['video_url'] = '';
        !isset($post['thumb_url']) && $Detail['vod_pic'] =$post['thumb_url'] = '';
        if (isset($post['platform']) && !empty($post['platform'])){
            $post['platform'] = implode(',', $post['platform']);;
        }

        //执行修改数据

        $save = false;
        Db::startTrans();
        try {
            $this->model->update($post);
            VideoDetail::where('vod_id',$post['id'])->update($Detail);
            $save = true;
            Db::commit();
        }catch (Exception $e){
            Db::rollback();
            return $this->failed($e->getMessage());
        }

        if ($save) return $this->success([]);
        return $this->failed('修改失败');
    }

    /**
     * 状态切换 上下架
     */
    public function status()
    {
        //过滤数据
        $postField = 'id,show';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        try {
            validate(Status::class)->scene('show')->check($post);
        } catch (ValidateException $e) {
            // 验证失败 输出错误信息
            return $this->failed($e->getError());
        }

        $id = intval($post['id']);
        $status = intval($post['show']);

        $this->model->where('id',$id)->save(['status' => $status]);
        //还需要修改 作者的审核状态
        $find = $this->model->where('id',$post['id'])->find();
        if (!empty($find)){
            Db::name('update_video')->where('id',$find['upload_id'])->update(['status'=>$post['show']]);
        }

       $this->success([]);
    }
}