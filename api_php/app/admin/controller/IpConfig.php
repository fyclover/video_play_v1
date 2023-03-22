<?php


namespace app\admin\controller;


use app\common\model\IpConfig as models;
use app\common\traites\PublicCrudTrait;
use think\exception\ValidateException;
use \app\validate\SysIpConfig as validates;

class IpConfig extends Base
{
    protected $model;
    use PublicCrudTrait;

    /**
     *配置控制器
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
        $limit = $this->request->post('limit', 500);
        //查询搜索条件

        //->page($page, $limit)
        $list = $this->model->order('id desc')->paginate(['list_rows' => $limit, 'page' => $page]);
        return $this->success($list);
    }

    /**
     * 添加
     */
    public function add()
    {
        //过滤数据
        $postField = 'ip,status';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        //验证数据
        try {
            validate(validates::class)->scene('add')->check($post);
        } catch (ValidateException $e) {
            // 验证失败 输出错误信息
            return $this->failed($e->getError());
        }

        $user = $this->model->where('ip',$post['ip'])->find();
        if ($user) return $this->failed('该配置以存在');

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
        $postField = 'id,ip,status';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        //验证数据
        try {
            validate(validates::class)->scene('edit')->check($post);
        } catch (ValidateException $e) {
            // 验证失败 输出错误信息
            return $this->failed($e->getError());
        }

        //查询是否重复的
        $find = $this->model->where('ip', $post['ip'])->where('id', '<>', $post['id'])->find();
        if ($find) return $this->failed('该IP已存在');

        //执行修改数据
        $save = $this->model->update($post);
        if ($save) return $this->success([]);
        return $this->failed('修改失败');
    }
}