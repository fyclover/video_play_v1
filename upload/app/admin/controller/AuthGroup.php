<?php

namespace app\admin\controller;

use think\facade\Request;
use app\admin\model\AuthGroup as AuthGroupModel;
use app\admin\model\AuthModule;
use app\admin\model\AuthRule;
use think\facade\View;
class AuthGroup extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $rulemodel = new AuthRule();
        $list = AuthGroupModel::order('id desc')->paginate(10);
        foreach ($list as $key => &$val) {
            $val['rule'] = $rulemodel->where('id','in',$val['rules'])->select();
        }
        $num = $list->total();//获取总数
        return View::fetch('index', [
            'list'  => $list
        ]);
    }

    public function add(){
        if (Request::isAjax()) {
            $data = Request::param();
            $rule = [
                'title|角色名称'  => 'require',
            ];
            $validate = $this->validate($data,$rule);
            if($validate !== true){
                return show(400,$validate);
            }
            $model = new AuthGroupModel();
            if ($model->insertDb()) return show(200, '操作成功');
            return show(-1, '操作失败');
        }
        $list = AuthModule::order('sort asc')->select();
        foreach ($list as $key => &$value) {
            $value['rule'] = AuthRule::where('condition',$value['id'])->order('id desc')->select();
        }
        return View::fetch('add', [
            'list'  => $list
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
        if(Request::isAjax()) {
            $model = new AuthGroupModel();
            if ($model->updateDb()) return show(200, '操作成功');
            return show(-1, '操作失败');
        }
        $id = input('get.id');
        $data = AuthGroupModel::where('id',$id)->find();
        $arr = explode(",", $data['rules']);
        $list = AuthModule::order('sort asc')->select();
        foreach ($list as $key => &$value) {
            $value['rule'] = AuthRule::where('condition',$value['id'])->order('id desc')->select();
        }
        return View::fetch('edit', [
            'list'  => $list,
            'data'  => $data,
            'arr'   => $arr
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
        $model = new AuthGroupModel();
        if (Request::isAjax()) {
            if (true !== $model->deleteDb()) {
                return show(-1, '操作失败');
            }
            return show(200, '操作成功');
        }
        return show(-1, '非法操作');
    }
}
