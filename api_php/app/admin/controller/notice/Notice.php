<?php


namespace app\admin\controller\notice;


use app\admin\controller\Base;
use app\common\model\Notice as models;
use app\common\traites\PublicCrudTrait;
use think\exception\ValidateException;
use \app\validate\Notice as validates;

class Notice extends Base
{
    protected $model;
    use PublicCrudTrait;

    /**
     * 公告控制器
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
        $post= array_filter($this->request->post());

        $map=[];
        isset($post['content']) && $map [] = ['content', 'like', '%' . $post['content'] . '%'];
        $list = $this->model->page_list($map, $limit, $page);
        //$list = $this->model->order('id desc')->paginate(['list_rows' => $limit, 'page' => $page]);
        return $this->success($list);
    }

    /**
     * 添加
     */
    public function add()
    {
        //过滤数据
        $postField = 'content,status,position';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        //验证数据
        try {
            validate(validates::class)->scene('add')->check($post);
        } catch (ValidateException $e) {
            // 验证失败 输出错误信息
            return $this->failed($e->getError());
        }

        $user = $this->model->where('content', $post['content'])->find();
        if ($user) return $this->failed('该公告以存在');
        $post['status'] = isset($post['status']) ? $post['status'] : 1;//默认正常状态
        $save = $this->model->save($post);
        if ($save) return $this->success([]);
        return $this->failed('新增失败');
    }

    /**
     * 公告位置
     * @return mixed
     */
    public function position()
    {
        $positions = $this->model->positions;
        return $this->success([$positions]);
    }

    /**
     * 修改
     * @return mixed
     */
    public function edit()
    {
        //过滤数据
        $postField = 'id,content,status,position';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        //验证数据
        try {
            validate(validates::class)->scene('edit')->check($post);
        } catch (ValidateException $e) {
            // 验证失败 输出错误信息
            return $this->failed($e->getError());
        }

        //查询是否重复的该菜单
        $find = $this->model->where('content', $post['content'])->where('id', '<>', $post['id'])->find();
        if ($find) return $this->failed('该公告以存在');

        //执行修改数据
        $save = $this->model->update($post);
        if ($save) return $this->success([]);
        return $this->failed('修改失败');
    }


}