<?php /*a:1:{s:65:"/www/wwwroot/upload.com/upload/app/admin/view/auth_user/edit.html";i:1679297990;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-新增管理员</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="/static/css/font.css">
        <link rel="stylesheet" href="/static/css/xadmin.css">
        <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="/static/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label for="username" class="layui-form-label">
                            <span class="x-red">*</span>登录名
                        </label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="account" value="<?php echo htmlentities($data['account']); ?>" required="" lay-verify="required"
                            autocomplete="off" class="layui-input">
                            <span><?php echo htmlentities($data['account']); ?></span>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>将会成为您唯一的登入名
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            手机
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="phone" name="phone" value="<?php echo htmlentities($data['phone']); ?>" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            用户视频ID
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="phone" name="video_1" value="<?php echo htmlentities($data['video_1']); ?>" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <?php if($data['group_id'] == 1): ?>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><span class="x-red">*</span>角色</label>
                        <div class="layui-input-inline">
                            <select name="group_id">
                                <?php if(is_array($group) || $group instanceof \think\Collection || $group instanceof \think\Paginator): $i = 0; $__LIST__ = $group;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                <option value="<?php echo htmlentities($v['id']); ?>" <?php if($v['id'] == $data['group_id']): ?>selected<?php endif; ?>><?php echo htmlentities($v['title']); ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </div>
                    </div>
                    <?php endif; ?>
                    <div class="layui-form-item">
                        <label for="L_pass" class="layui-form-label">
                            <span class="x-red">*</span>密码
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" id="L_pass" name="password" required="" lay-verify="pass"
                            autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            6到16个字符
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                            <span class="x-red">*</span>确认密码
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" id="L_repass" name="password" required="" lay-verify="repass"
                            autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <!--<div class="layui-form-item">-->
                    <!--    <label class="layui-form-label"><span class="x-red">*</span>状态</label>-->
                    <!--    <div class="layui-input-inline">-->
                    <!--        <input type="radio" name="status" value="1" title="正常" <?php if($data['status'] == 1): ?>checked<?php endif; ?>>-->
                    <!--        <input type="radio" name="status" value="2" title="禁用" <?php if($data['status'] == 2): ?>checked<?php endif; ?>>-->
                    <!--    </div>-->
                    <!--</div>-->
                    <input type="hidden" name="id" value="<?php echo htmlentities($data['id']); ?>" class="layui-input">
                    <div class="hr-line-dashed"></div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                        </label>
                        <button  class="layui-btn" lay-filter="add" lay-submit="">
                            <i class="icon iconfont"></i>确认提交
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="/static/js/form.js"></script>
        <script>layui.use(['form', 'layer'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    nikename: function(value) {
                        if (value.length < 5) {
                            return '昵称至少得5个字符啊';
                        }
                    },
                    repass: function(value) {
                        if ($('#L_pass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    }
                });
                var url = "<?php echo url('edit'); ?>";
                ajaxFormData(url,form);

            });
        </script>
    </body>

</html>
