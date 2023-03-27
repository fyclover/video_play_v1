<?php

use app\common\model\TokenModel;

/**
 * 前台用户密码加密
 * @param $pwd
 */
function pwdEncryption($pwd)
{
    if (empty($pwd))
        return false;
    return base64_encode($pwd);
}

//默认密码
function admin_Initial_pwd()
{
    return base64_encode('aa123456');
}
//用户默认密码
function home_Initial_pwd()
{
    return base64_encode('aa123456');
}

//用户提现默认密码
function home_tx_pwd()
{
    return 'aa123456';
}

function api_token($id)
{
    return md5($id . 'api' . date('Y-m-d H:i:s', time()) . 'token') . randomkey(mt_rand(10, 30));
}

function home_api_token($id)
{
    return md5($id . 'home' . date('Y-m-d H:i:s', time()) . 'token') . randomkey(mt_rand(10, 30));
}

function url_code()
{
    return $_SERVER['REQUEST_SCHEME'] . '://';
}

function tg_url()
{
    return $_SERVER['REQUEST_SCHEME'] . '://' . randomkey(5) .'.'. config('ToConfig.app_tg.tg_url') . '?codes=';
//  return  $_SERVER['REQUEST_SCHEME'] . '://'.'www'. config('ToConfig.app_tg.tg_url') . '?codes=';
}
/**
 * 生成邀请码 代理掩码
 * @return string
 */
function generateCode($start=32,$end=50)
{
    return (new \app\common\google\GoogleAuth())->model()->generate_code();
    //return randomkey(rand($start, $start));
}

/**
 * 生成用户 google验证码二维码地址
 * @param $secret
 * @return mixed
 */
function captchaUrl($secret)
{
    return (new \app\common\google\GoogleAuth())->model()->google_qrcode($secret);
}

//图片上传处理
function image_update($string)
{
    if(!is_array($string)){
        if(strpos($string,'storage') !== false){
        return explode('/storage', $string)[1];
        }
        return $string;
    }


    $column = array_column($string, 'url');
   
    $image_url = config('ToConfig.app_update.image_url');
   
    if(strpos($column[0],'http') !== false){
        return  str_replace($image_url,"",$column[0]);
    }


    foreach ($column as $key => &$value) {
        $value = explode('/storage', $value)[1];
    }
    return implode(',', $column);
}

//购买商品生成订单号
function orderCode($string = 'video')
{
    if (empty($string))
        return false;
    //生成订单 字符串 + 随机数 + 时间 +
    return $string . mt_rand(1000, 9999) . date('YmdHis');
}

//订单错误时生成日志，可查看
function buildHtml($value, $type = 'o')
{
    $cachename = 'order_log/' . $type . date("Y-m-d") . ".html";
    $value = is_array($value) ? json_encode($value, JSON_UNESCAPED_UNICODE) . PHP_EOL : $value;
    file_put_contents($cachename, date("Y-m-d H:i:s") . '--' . $value . PHP_EOL, FILE_APPEND);
}

//地址掩码 20—40位
function randomkey($length)
{
    $pattern = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLOMNOPQRSTUVWXYZ';
    $key = '';
    for ($i = 0; $i < $length; $i++) {
        $key .= $pattern{mt_rand(0, 35)}; //生成php随机数
    }
    return $key;
}

//生成用户账号 10 - 30
function userkey($length)
{
    $pattern = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLOMNOPQRSTUVWXYZ';
    $key = '';
    for ($i = 0; $i < $length; $i++) {
        $key .= $pattern{mt_rand(0, 35)}; //生成php随机数
    }
    return 'user' . $key . date('Ymd');
}

//加密 rsa
function rsa_encrypt($data)
{
    openssl_public_encrypt($data, $encrypted, config('ToConfig.public_key'));
    return base64_encode($encrypted);
}

//解密 rsa
function rsa_decrypt($encrypted)
{
    $encrypted = base64_decode($encrypted);
    openssl_private_decrypt($encrypted, $decrypted, config('ToConfig.private_key'));
    return $decrypted;
}

/**
 * 忽略订单计算方法
 * @param $count /订单数量
 * @return bool
 */
function orderIgnore($count)
{
    //大于 设定的订单数。，并且取莫  每5单抽取一单
    if ($count > config('ToConfig.order_ignore') && rand(1,5) == 3) {
        return true;
    }
    return false;
}

/**
 * 获取配置文件
 * @param null $name
 * @return \think\Collection
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\DbException
 * @throws \think\db\exception\ModelNotFoundException
 */
function get_config($name=null)
{
    if ($name == null){
        return \app\common\model\SysConfig::select();
    }
    $find = \app\common\model\SysConfig::where('name',$name)->find();
    $is_json = isJsonString($find->value);
    if($is_json){
        $is_json['image_url'] = config('ToConfig.app_update.image_url');
        return $is_json;
    }
    return $find;
}

function getConfigOne($name=null)
{
    if ($name == null){
        return false;
    }
    return \app\common\model\SysConfig::where('name',$name)->find();
}


function isJsonString($stringData)
{
    if (empty($stringData)) return false;
    try
    {
        //校验json格式
        $json = json_decode($stringData, true);
        JSON_ERROR_NONE === json_last_error();
        return  $json;
    }
    catch (\Exception $e)
    {
        return false;
    }
}


/**
 * @param array $data
 * @param int $code
 * @param string $message
 * @param int $httpStatus
 * @return \think\response\Json return会出现重复请求的问题
 */

function show($data = [],int $code = 1,string $message = '成功！',int $httpStatus = 0){
    $result=[
        'code'=>$code,
        'message'=>$message,
        'data'=>$data,
    ];
    header('Access-Control-Allow-Origin:*');
    if ($httpStatus != 0){
        return json($result,$httpStatus);
    }
    echo json_encode($result);
    exit();
}

/*
 * 富文本存储，需要把域名替换下
 */
function saveEditor($content){

    return str_replace(config('ToConfig.app_update.image_url'),'',$content);
}

/*
 * 富文本返回，需要把域名加上
 */
function returnEditor($content){
    return str_replace('/topic/',config('ToConfig.app_update.image_url').'/topic/',$content);
}

function videoIntercept($str){
    $domain = strstr($str, '$$$');
    $url=[];
    #第一种格式
    //不存在的时候说明只有一种格式
    if ($domain === false){
        $array = explode('$',$str);
        if (empty($array)){
            return [];
        }
        foreach ($array as $key=>$value){
            $ss = strstr($value, 'http');
            if (!$ss){
                continue;
            }
            $as = explode('#',$value);
            if (!$as){
                continue;
            }
            $url[] = $as[0];
        }
        return $url;
    }

    #第二种格式
    $array2 = explode('$$$',$str);
    if (empty($array2)){
        return [];
    }

    $array1 = explode('$',$str);
    if (empty($array1)){
        return [];
    }

    $url = [];
    foreach ($array1 as $key=>$value){
        $sv = strstr($value, 'http');
        if (!$sv){
            continue;
        }
        $as = explode('#',$value);
        if (!$as){
            continue;
        }
        $url[] = $as[0];
    }

    return $url;
}


/**
 * Name [[验签]]
 * User:
 */
function verifySignApplet($input,$key)
{
    $param = $input;
    ksort($param);
    $paramStr = '';
    foreach ($param as $paramKey => $paramVal)
    {
        if(is_array($paramVal)) continue;
        if($paramVal === null || $paramVal === '')continue;
        $paramStr.=$paramKey.'='.$paramVal.'&';
    }
    $paramStr.='key='.$key;
    $newSign = md5($paramStr);
    return $newSign;
}

/*
 * post请求
 * */
function curl_post($url,$body,$way='POST')
{
    $headers = array();
    $headers[] = "Content-Type:application/json";
    $postBody    = json_encode($body);
    $curl = curl_init();
    $ssl = preg_match('/^https:\/\//i', $url) ? TRUE : FALSE;
    if ($ssl) {
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE); // https请求 不验证证书和hosts
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE); // 不从证书中检查SSL加密算法是否存在
    }
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);//设置请求头
    if(!empty($postBody)){
        curl_setopt($curl, CURLOPT_POSTFIELDS, $postBody);//设置请求体
    }
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $way);//使用一个自定义的请求信息来代替"GET"或"HEAD"作为HTTP请求。(这个加不加没啥影响)
    $data = curl_exec($curl);
    curl_close($curl);
    return $data;
}