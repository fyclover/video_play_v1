<?php
use think\facade\Session;
// 应用公共文件

// 应用公共文件
function redis()
{
    return think\facade\Cache::store('redis');
}
function randomString($length = 10,$base64 = true){
    $str = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz1234567890';
    $randstr = str_shuffle($str);//打乱字符串
    $rands= substr($randstr,0,$length);//substr(string,start,length);返回字符串的一部分
    return $base64 ? base64_encode($rands):$rands;
}
function show($code,$msg = "",$data = []){
    $result = array(
        'code' => $code,
        'msg'  => $msg,
        'data' => $data
    );
    //输出json
    echo json_encode($result,JSON_UNESCAPED_UNICODE);
    exit;
}

function authCheck($rule,$uid,$type = 1, $mode = 'url', $relation = 'or'){
    //$auth = new think\Auth(); 
    //require '../extend/Auth.php';
    //生成二维码图片
    $auth = new \Auth();//
    $group_id = Session::get('group_id');
	//获取当前uid所在的角色组id
	if($group_id == 1){
		return true;
    }
	return @$auth->check($rule,$uid,$type,$mode,$relation)?true:false;
}

    function countdown($create_time){
        /*活动倒计时*/
        $today = time();   //当前时间戳 6月7号
        //$second = strtotime($create_time)+604800 - $today; //结束时间戳减去当前时间戳
        $second = $today - strtotime($create_time);
        // echo $second;
        $day = floor($second/3600/24);    //倒计时还有多少天
        $hr = floor($second/3600%24);     //倒计时还有多少小时（%取余数）
        $min = floor($second/60%60);      //倒计时还有多少分钟
        $sec = floor($second%60);         //倒计时还有多少秒          
        $str = $day."天：".$hr.":".$min.":".$sec;  //组合成字符串
        return $str;
    }

function check_url($url)
{
    $httpcode = 0;
    $ch = curl_init();
    $timeout = 3; // 设置超时的时间[单位：秒]
    curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
    curl_setopt($ch, CURLOPT_HEADER, 1);
    curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_exec($ch);
    # 获取状态码赋值
    $httpcode = curl_getinfo($ch,CURLINFO_HTTP_CODE);
    curl_close($ch);
    if($httpcode == 200){
        return true;
    }else{
        return false;
    }
}
function mkdirs($dir, $mode = 0777)
{
    if (is_dir($dir) || @mkdir($dir, $mode)) return TRUE;
    if (!mkdirs(dirname($dir), $mode)) return FALSE;
    return @mkdir($dir, $mode);
}

function isChange($is_size=0){
    if($is_size == 0){
        return '(短视频)';
    }
     if($is_size == 1){
        return '(点播,大视频。转m3u8)';
    }
    return '';
}

