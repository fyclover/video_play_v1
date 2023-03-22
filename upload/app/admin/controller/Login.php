<?php
namespace app\admin\controller;

use app\BaseController;
use think\facade\View;
use think\facade\Request;
use think\facade\Session;
use app\admin\model\AuthUser;
class Login extends BaseController
{
    public function index()
    {
        return View::fetch('index');
    }

    public function loginHandle(){
        $data = Request::param();
        if(!Request::isAjax()) {
            return show(400,'请求错误');
        }
        $account  = trim($data['account']);
        $pwd      = md5($data['password']);
        if(empty($account) || empty($pwd)){
            return json(['code'=>'400','msg'=>'用户名或密码不能为空']);
        }

        $model = new AuthUser;
        $adminInfo = $model->getAdminByUsernamePassword($account, $pwd);
        if (false === $adminInfo) {
            return show(400, '用户名或密码错误');
        }
        if($adminInfo['status'] == 2){
            return show(400, '账户已被禁用请联系管理员！');
        }
        $res = $model::update(['last_login_time'=>time(),'id'=>$adminInfo['id']]);

        Session::set('admin_user', $adminInfo);
        Session::set('account', $adminInfo['account']);
        //dump($adminInfo);die;
        //Session::set('dianjicishu', $adminInfo['numbers']);
        Session::set('group_id', $adminInfo['group_id']);
        Session::set('admin_uid', $adminInfo['id']);
        //页面跳转1

        //return redirect('index/index');
        return json(['code'=>200,'msg'=>'登录成功,即将跳转~']);
    }

    public function loginout(){
        //清除session
        $res = Session::clear();
        //跳转登录页
        return redirect('index/login');
    }


    private $uid = 0;



    public function upload(){
        // 获取表单上传文件 例如上传了001.jpg
        $file =  $this->request->file('file');

        $this->uid = $this->request->param('agent_uid',0);
        if ($this->uid <=0){
            show(0,'uid错误');
        }

        // 上传到本地服务器
        $savename = '';
        try {
            $savename = \think\facade\Filesystem::disk('image')->putFile($this->uid, $file);
        } catch (\think\exception\ValidateException $e) {
            echo $e->getMessage();
        }
        $path = '/upload_image';
        show(1,'ok',[env('URL.URL').$path.'/'.$savename]);
    }
}
