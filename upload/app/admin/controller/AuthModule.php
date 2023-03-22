<?php

namespace app\admin\controller;

use think\Controller;
use think\facade\Request;
use app\admin\model\AuthModule as AuthModuleModel;
use think\facade\View;
class AuthModule extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        $list = AuthModuleModel::order('id desc')->paginate(15);
        $page = $list->render();
        $num = $list->total();//获取总数
        return View::fetch('index', [
            'list'  => $list
        ]);
    }

    public function add()
    {
        if (Request::isAjax()) {
            $model = new AuthModuleModel();
            if ($model->insertDb()) return show(200, '操作成功');
            return show(-1, '操作失败');
        }else{
            return show(-1, '非法操作！');
        }
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit()
    {
        if(Request::isAjax()) {
            $model = new AuthModuleModel();
            if ($model->updateDb()) return show(200, '操作成功');
            return show(-1, '操作失败');
        }
        $postdata = Request::param();
        $data = AuthModuleModel::find($postdata['id']);
        return View::fetch('edit', [
            'data'  => $data
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
        $model = new AuthModuleModel();
        if (Request::isAjax()) {
            if (true !== $model->deleteDb()) {
                return show(-1, '操作失败');
            }
            return show(200, '操作成功');
        }
        return show(-1, '非法操作');
    }
}
