<?php


namespace app\admin\controller\auth;

use app\admin\controller\Base;

use app\common\model\ActionModel;
use app\common\model\MenuModel;
use app\common\traites\PublicCrudTrait;
use think\facade\Db;

class BranchAuth extends Base
{
    protected $actionModel;
    protected $menuModel;
    use PublicCrudTrait;

    /**
     * 权限
     */
    public function initialize()
    {
        $this->actionModel = new ActionModel();
        $this->menuModel = new MenuModel();
        parent::initialize(); // TODO: Change the autogenerated stub
    }

    public function action_list()
    {
        //所有的控制器ID
        $list = $this->actionModel->order('id desc')->field('id,title')->select();
        return $this->success($list);
    }

    public function menu_list()
    {
        $list = $this->menuModel->where(['status' => 1])->field('id,pid,title')->order('id desc')->select();
        return $this->success($list);
    }

    public function action_edit()
    {
        //接收权限ID
        $post = $this->request->post();

        if (!isset($post['id']) || $post['id'] < 1) return $this->failed('ID参数错误');
        if (!isset($post['action'])) return $this->failed('action参数错误');

        $action = implode(',', $post['action']);

        //新增到
        $db = Db::name('common_admin_role_power');
        //查询是否存在的权限
        $res = $db->where(['role_id' => $post['id']])->find();
        //存在就修改
        if ($res) {
            $status = $db->where(['role_id' => $post['id']])->update(['auth_ids' => $action]);
        } else {
            $status = $db->insert(['auth_ids' => $action, 'role_id' => $post['id']]);
        }

        if ($status) return $this->success([]);
        return $this->failed();
        //接收权限
    }

    public function menu_edit()
    {
        //接收权限ID
        $post = $this->request->post();
        if (!isset($post['id']) || $post['id'] < 1) return $this->failed('ID参数错误');
        if (!isset($post['menus'])) return $this->failed('action参数错误');
        $action = implode(',', $post['menus']);

        //新增到
        $db = Db::name('common_admin_role_menu');
        //查询是否存在的权限
        $res = $db->where(['role_id' => $post['id']])->find();
        //存在就修改
        if ($res) {
            $status = $db->where(['role_id' => $post['id']])->update(['auth_ids' => $action]);
        } else {
            $status = $db->insert(['auth_ids' => $action, 'role_id' => $post['id']]);
        }

        if ($status) return $this->success([]);
        return $this->failed();
    }


}