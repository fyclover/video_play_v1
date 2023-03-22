<?php

namespace app\admin\controller;

use think\facade\Request;
use app\admin\model\AuthUser as AuthUserModel;
use app\admin\model\AuthGroup;
use think\facade\View;
class AuthUser extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $postData = Request::param();
        $where = [];
        if(!empty($postData['account'])){
            $where = [['account', 'like', '%'.$postData['account'].'%']];
        }
        $list = AuthUserModel::with('group')->where($where)->order('id desc')->paginate(15,false,['query' => request()->param()]);
        $num = $list->total();//获取总数
        return View::fetch('index', [
            'list' => $list,
            'num'  => $num
        ]);
    }

    public function add(){
        $data = Request::param();
        if(Request::isAjax()){
            $model = new AuthUserModel();
            if ($model->insertDb()) return show(200, '操作成功');
            return show(-1, '操作失败');
        }
        $group = AuthGroup::select();
        return View::fetch('add', [
            'group'  => $group
        ]);
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit()
    {
        $data = Request::param();
        if(Request::isAjax()) {
            $model = new AuthUserModel();
            if ($model->updateDb()) return show(200, '操作成功');
            return show(-1, '操作失败');
        }
        $list = AuthUserModel::find($data['id']);
        $group = AuthGroup::select();
        return View::fetch('edit', [
            'group'  => $group,
            'data' => $list
        ]);
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete()
    {
        $model = new AuthUserModel();
        if (Request::isAjax()) {
            if (true !== $model->deleteDb()) {
                return show(-1, '操作失败');
            }
            return show(200, '操作成功');
        }
        return show(-1, '操作失败');
    }
}
