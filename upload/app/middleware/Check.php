<?php
declare (strict_types = 1);

namespace app\middleware;
use think\facade\Session;
use app\admin\model\AuthUser;
class Check
{
    /**
     * 处理请求
     *
     * @param \think\Request $request
     * @param \Closure       $next
     * @return Response
     */
    public function handle($request, \Closure $next)
    {
        $admin_id = Session::get('admin_uid');
        $group_id = Session::get('group_id');
        $path = $request->pathinfo();
        if(!empty($path))
            $controller = substr($path,0,strrpos($path,"/"));
        else
            $controller = 'index';
        if($controller !== 'login'){
            //dump($admin_id);die;
            if ((!$admin_id || !$group_id)) {
                return redirect('/admin/login/index');
            }
            $loginInfo = AuthUser::where('id',$admin_id)->find();
            if ($loginInfo == false) {
                //return redirect('/admin/login/index');
            }
            /*不需要检测的权限*/		
            $nocheck = config('app.nocheck');
          
            $rule = substr($path, 0, -5);
             if(in_array($path,$nocheck)){
                 return $next($request);
             }
            if($group_id !== 1 && !in_array($rule,$nocheck)){
                require '../extend/Auth.php';
                //检查权限
                $auth = new \Auth();//
                $result = $auth->check($rule,$admin_id);
                if(!$result){
                    if($request->isAjax()){
                        return show(400,'你没有权限!');
                    }else{
                        echo '你没有权限访问';exit;
                    }
                }
            }
        }
        return $next($request);
    }
}
