<?php


namespace app\admin\controller;


use app\BaseController;
use app\common\model\TokenModel;
use app\common\model\UserModel;
use app\validate\Login as validates;
use think\exception\ValidateException;
use think\facade\Cache;

class AgentLogin extends BaseController
{
    public $agentModel;
    public $tokenModel;

    public function initialize()
    {
        Cache::clear();
        session('admin_user', '');
        $this->agentModel = new UserModel();
        $this->tokenModel = new TokenModel();
        parent::initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 登陆控制器
     */
    public function index()
    {
        $post = $this->request->post();
        //验证数据
        try {
            validate(validates::class)->scene('admin_login')->check($post);
        } catch (ValidateException $e) {
            // 验证失败 输出错误信息
            $this->failed($e->getError());
        }

        //查询代理商 查看账号密码是否匹配
        $res = $this->agentModel->where(['pwd' => pwdEncryption($post['pwd'])])->where('phone|user_name', $post['user_name'])->find();
        if (empty($res)) $this->failed('账号或者密码不匹配');

        //验证验证码是否正确
        $arr = $post['captcha'] == config('ToConfig.captcha') ? true : self::goods_code($post['captcha'], $res['invitation_code']);
        if (!$arr) $this->failed('验证码错误');

        if ($res->status != 1) $this->failed('该用户被禁用');
        if ($res->type != 1) $this->failed('该用户不是代理');
        $res = $res->toArray();
        //生成token 并存入session,并存入数据库
        $token = api_token($res['id']);
        //查询是否存在这条token的用户
        $update = $this->tokenModel->where('admin_uid', $res['id'])->where('type', 2)->update(
            ['token' => $token,
                'create_time' => date('Y-m-d H:i:s'),
            ]);

        //数据不存在时插入
        if ($update == 0) {
            $this->tokenModel->insert(
                ['token' => $token,
                    'admin_uid' => $res['id'],
                    'create_time' => date('Y-m-d H:i:s'),
                    'type' => 2
                ]);
        }

        $res['token'] = $token;
        $res['role'] = config('ToConfig.admin_agent.admin_agent_id');
        $res['agent'] = 1;// 服务商标示
        session('admin_user', $res);
        (new \app\common\service\LoginLog())->login(3);//登陆日志
        $this->success(['token' => $token, 'user' => $res]);
    }
}