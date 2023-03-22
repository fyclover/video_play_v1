<?php

namespace app\admin\controller;

use app\BaseController;
use think\facade\Request;
use think\Validate;
use app\admin\model\AuthRule as AuthRuleModel;
use app\admin\model\AuthModule;
use think\facade\View;
class AuthRule extends Base   
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $list = AuthRuleModel::order('id desc')->paginate(10);
        $page = $list->render();
        $module = AuthModule::select();
        $num = $list->total();//获取总数
        return View::fetch('index', [
            'list'  => $list,
            'page'  => $page,
            'count' => $num,
            'module'  => $module,
        ]);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save()
    {
        if (Request::isAjax()) {
            $data = Request::param();
            $validate = $this->validate($data,
            [
                'name|规则' => 'require|unique:AuthRule',
            ]);
            if (!$validate) {
                return show(0,$validate);
            }
            $model = new AuthRuleModel();
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
        $data = Request::param();
        if(Request::isAjax()) {
            $validate = $this->validate($data,
            [
                'name|规则' => 'require|unique:AuthRule',
            ]);
            if ($validate !== true) {
                return show(400,$validate);
            }
            $model = new AuthRuleModel();
            if ($model->updateDb()) return show(200, '操作成功');
            return show(-1, '操作失败');
        }
        $id = $data['id'];
        $data = AuthRuleModel::get($id);
        $module = AuthModule::all();
        return View::fetch('edit', [
            'module'  => $module,
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
        $model = new AuthRuleModel();
        if (Request::isAjax()) {
            if (true !== $model->deleteDb()) {
                return show(-1, '操作失败');
            }
            return show(200, '操作成功');
        }
        return show(-1, '非法操作');
        
    }
}
