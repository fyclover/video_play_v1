<?php /*a:1:{s:73:"D:\phpstudy\WWW\video\video_my\upload\app\admin\view\auth_user\index.html";i:1620709124;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-管理员列表</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="/static/css/font.css">
        <link rel="stylesheet" href="/static/css/xadmin.css">
        <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="/static/js/xadmin.js"></script>
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">管理员管理</a>
            <a>
              <cite>管理员列表</cite>
            </a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="account"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn" onclick="xadmin.open('添加用户','<?php echo url("add"); ?>',600,400)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                                <thead>
                                    <th>
                                        <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>ID</th>
                                    <th>登录名</th>
                                    <th>角色</th>
                                    <th>上次登陆时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </thead>
                                <tbody>
                                    <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                    <tr>
                                        <td>
                                        <input type="checkbox" name=""  lay-skin="primary">
                                        </td>
                                        <td><?php echo htmlentities($v['id']); ?></td>
                                        <td><?php echo htmlentities($v['account']); ?></td>
                                        <td><?php echo htmlentities($v['title']); ?></td>
                                        <td><?php echo htmlentities($v['last_login_time']); ?></td>
                                        <td class="td-status">
                                            <?php if($v['status'] == 1): ?>
                                            <span class="layui-btn layui-btn-normal layui-btn-xs">正常</span>
                                            <?php else: ?>
                                            <span class="layui-btn layui-btn-disabled layui-btn-xs">禁用</span>
                                            <?php endif; ?>
                                        </td>
                                        <td class="td-manage">
                                            <a title="编辑" class="layui-btn layui-btn-xs" onclick="xadmin.open('编辑','<?php echo url("AuthUser/edit"); ?>?id=<?php echo htmlentities($v['id']); ?>',600,500)" href="javascript:;">
                                                <i class="icon iconfont"></i>修改
                                            </a>
                                            <button type="button" onclick="member_del(this,'<?php echo htmlentities($v['id']); ?>')" class="layui-btn layui-btn-xs btn-danger"><i class="icon iconfont"></i>删除</button>
                                        </td>
                                    </tr>
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="layui-card-body ">
                            <div class="page">
                                <?php echo $list; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script type="text/javascript" src="/static/js/form.js"></script>
    <script>
        layui.use(['laydate','form'], function(){
            var laydate = layui.laydate;
            var form = layui.form;
            // 监听全选
            form.on('checkbox(checkall)', function(data){
                if(data.elem.checked){
                $('tbody input').prop('checked',true);
                }else{
                $('tbody input').prop('checked',false);
                }
                form.render('checkbox');
            });
        });

        /*用户-删除*/
        function member_del(obj,id){
            var url = "<?php echo url('delete'); ?>";
            ajaxDelete(obj,id,url);
        }
    </script>
</html>