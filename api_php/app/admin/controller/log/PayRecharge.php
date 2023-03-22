<?php


namespace app\admin\controller\log;


use app\admin\controller\Base;

use app\common\model\PayRecharge as models;
use app\common\traites\PublicCrudTrait;

class PayRecharge extends Base
{
    protected $model;
    use PublicCrudTrait;
    /**
     * 充值控制器
     */
    public function initialize()
    {
        $this->model = new models();
        parent::initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 菜单栏目树
     */
    public function index()
    {
        //当前页
        $page = $this->request->post('page', 1);
        //每页显示数量
        $limit = $this->request->post('limit', 10);
        //查询搜索条件
        $post = array_filter($this->request->post());
        $map=[];
        isset($post['user_name']) && $map [] = ['b.user_name', 'like', '%' . $post['user_name'] . '%'];
        isset($post['id']) && $map [] = ['a.id', '=', $post['id']];
        $list = $this->model->page_list($map,$limit, $page);
        //$list = $this->model->order('id desc')->paginate(['list_rows'=>$limit,'page'=>$page]);
        return $this->success($list);
    }


}