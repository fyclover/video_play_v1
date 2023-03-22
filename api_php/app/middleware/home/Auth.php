<?php
declare (strict_types=1);

namespace app\middleware\home;


use app\common\model\HomeTokenModel;
use app\common\model\UserModel;
use app\common\traites\ApiResponseTrait;
use think\facade\Db;
class Auth
{
    use ApiResponseTrait;
    public function handle($request, \Closure $next)
    {
        //   Db::name('video')->where('id','>',1)->update(['labels'=>'#玄幻#可爱#成熟#武侠#穿越']);
        //校验token
        $token = $request->header('x-csrf-token','ecb05b65e08b49132a60994ff4694a27bieniyxlngji');
        if(empty($token)){
            $token = $request->post('token');
        }
        if (empty($token)) return $this->failed('token不存在',255);
        //查询token
        $res = (new HomeTokenModel())->where('token', $token)->find();
        if (empty($res)) return $this->failed('无效token',255);

        //校验是否过期的token
        $expiration_time = time() - strtotime($res['create_time']);
        if ($expiration_time >= env('token.home_token_time', 10)) return $this->failed('token过期');

        //校验成功处理逻辑
        //查询用户数据并存入session
        $res = (new UserModel())->find($res['user_id']);
        if (empty($res)) return $this->failed('无效token',255);

        //session 登陆写入日志
        //if(empty(session())) (new \app\common\service\LoginLog())->login();
        $res=$res->toArray();
        $res['token'] = $token;
        session('home_user',$res);
        // 添加中间件执行代码
        return $next($request);

    }

}
