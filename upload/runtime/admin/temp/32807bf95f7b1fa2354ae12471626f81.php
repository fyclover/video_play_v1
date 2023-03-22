<?php /*a:2:{s:69:"D:\phpstudy\WWW\video\video_my\upload\app\admin\view\login\index.html";i:1675060323;s:74:"D:\phpstudy\WWW\video\video_my\upload\app\admin\view\common\container.html";i:1677049147;}*/ ?>
<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
<title>后台管理-大文件上传</title>

<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="/static/css/font.css">
<link rel="stylesheet" href="/static/css/xadmin.css">
<script src="/static/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/js/xadmin.js"></script>

<link rel="stylesheet" type="text/css" href="/static/duandian/webupload/webuploader.css">
<script type="text/javascript" src="/static/duandian/jquery.js"></script>
<script type="text/javascript" src="/static/duandian/jquery.md5.js"></script>
<!--引入JS-->
<script type="text/javascript" src="/static/duandian/webupload/webuploader.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <link rel="stylesheet" href="/static/css/login.css">
    <link rel="stylesheet" href="https://ysdwnkj.com/static/css/test.css">
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
</head>
<style>
    .layui-bg-green {
        background-color: #009688!important;
    }
</style>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">域名分发-管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
            <input name="account" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <div id="slider"></div>
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        layui.config({
			base: '/static/lib/layui/'
		}).extend({
			sliderVerify:'sliderVerify/sliderVerify'
		}).use(['sliderVerify', 'jquery', 'form'], function() {
			var sliderVerify = layui.sliderVerify,
				form = layui.form;
			var slider = sliderVerify.render({
				elem: '#slider',
				// onOk: function()
			});
			//监听提交
			form.on('submit(login)', function(data) {
                //console.log('111111');return false;
				if(!slider.isOk()){
					layer.msg("请先通过滑块验证");
                    return false;
				}
				$.ajax({
                    url:"<?php echo url('login/loginHandle'); ?>",       
                    method:'post',       
                    data:data.field,        
                    dataType:'JSON',         
                    success:function(res){
                        if(res.code == 200){
                            location.href="<?php echo url('Index/index'); ?>"
                        }else{
                            layer.msg(res.msg);
                        }
                    },              
                    error:function (data) {
                            
                    }           
                }) ;
                return false;
			});
			
		})
    </script>
</body>
</html>