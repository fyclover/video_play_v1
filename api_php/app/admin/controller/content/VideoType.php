<?php


namespace app\admin\controller\content;

use app\admin\controller\Base;


use app\common\model\VideoType as models;
use app\common\traites\GetTreeTrait;
use app\common\traites\PublicCrudTrait;
use think\exception\ValidateException;
use \app\validate\VideoType as validates;

class VideoType extends Base
{
    protected $model;
    use PublicCrudTrait;
    use GetTreeTrait;
    /**
     * 视频分类控制器
     */
    public function initialize()
    {
        $this->model = new models();
        parent::initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 视频分类
     */
    public function index()
    {
        //当前页
        $page = $this->request->post('page', 1);
        //每页显示数量
        $limit = $this->request->post('limit', 10);
        //查询搜索条件
        $list = $this->model->where(['pid' => 0])->paginate(['list_rows' => $limit, 'page' => $page]);
        if (!empty($list))  {
            $list=$list->toArray();
            $list['data'] = $this->fillModelBackends($list['data']);
        }
        return $this->success($list);
    }

    public function type_list()
    {
        $list = $this->model->select();
        return $this->success($list);
    }



    /**
     * 添加
     */
    public function add()
    {
        //过滤数据
        $postField = 'title,thumb_url,pid';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        //验证数据
        try {
            validate(validates::class)->scene('add')->check($post);
        } catch (ValidateException $e) {
            // 验证失败 输出错误信息
            return $this->failed($e->getError());
        }

        $user = $this->model->where('title', $post['title'])->find();
        if ($user) return $this->failed('该分类以存在');

        if (isset($post['thumb_url'])){
            $post['thumb_url']= image_update($post['thumb_url']);
        }
        !isset($post['thumb_url']) && $post['thumb_url'] = '';

        $save = $this->model->save($post);
        if ($save) return $this->success([]);
        return $this->failed('新增失败');
    }

    /**
     * 修改
     * @return mixed
     */
    public function edit()
    {
        //过滤数据
        $postField = 'id,title,thumb_url,pid';
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
        if ($find) return $this->failed('该分类以存在');

        if (isset($post['thumb_url'])){
            $post['thumb_url']= image_update($post['thumb_url']);
        }

        !isset($post['thumb_url']) && $post['thumb_url'] = '';

        //执行修改数据
        $save = $this->model->update($post);
        if ($save) return $this->success([]);
        return $this->failed('修改失败');
    }
    
    public function platform(){
        $data = [
            ['id'=>1,'name'=>'91大神'],
            ['id'=>2,'name'=>'麻豆'],
            ['id'=>3,'name'=>'番茄'],
            ];
        
        return $this->success($data);
    }
}