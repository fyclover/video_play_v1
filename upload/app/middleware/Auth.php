<?php

namespace app\middleware;

use app\common\model\Member;
use think\Controller;
class Auth
{
    public function handle($request, \Closure $next)
    {
        $user_token = $request->header('token');
        // return show(400,'系统升级中~');
        if (!empty($user_token)) {
            //根据token获得用户数据
            $info = Member::where('token',$user_token)->find();
            if (empty($info)) {
                return show(401,'身份过期1');
            }
            //判断是否过期
            else if(time() > $info['auth_time']) {
                return show(401,'身份过期2');
            }
           // $this->userinfo = $info;
        }else{
            return show(400,'缺少Token');
        }
        return $next($request);
    }
}
