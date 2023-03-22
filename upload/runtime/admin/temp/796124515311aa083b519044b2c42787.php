<?php /*a:1:{s:74:"D:\phpstudy\WWW\video\video_my\upload\app\admin\view\auth_group\index.html";i:1620709124;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-角色管理</title>
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
              <cite>角色列表</cite>
            </a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <button class="layui-btn" onclick="xadmin.open('添加角色','<?php echo url("add"); ?>')"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                  <th>ID</th>
                                  <th>角色名</th>
                                  <th>拥有权限规则</th>
                                  <th>描述</th>
                                  <th width="150">操作</th>
                              </thead>
                              <tbody>
                                <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                  <tr>
                                    <td><?php echo htmlentities($v['id']); ?></td>
                                    <td><?php echo htmlentities($v['title']); ?></td>
                                    <td style="width: 500px;"><?php if(is_array($v['rule']) || $v['rule'] instanceof \think\Collection || $v['rule'] instanceof \think\Paginator): $i = 0; $__LIST__ = $v['rule'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><?php echo htmlentities($vo['title']); ?>,<?php endforeach; endif; else: echo "" ;endif; ?></td>
                                    <td><?php echo htmlentities($v['desc']); ?></td>
                                    <td width="150" class="td-manage">
                                        <a title="编辑" class="layui-btn layui-btn-xs" onclick="xadmin.open('编辑','<?php echo url("edit"); ?>?id=<?php echo htmlentities($v['id']); ?>')" href="javascript:;">
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
            
            //执行一个laydate实例
            laydate.render({
            elem: '#start' //指定元素
            });

            //执行一个laydate实例
            laydate.render({
            elem: '#end' //指定元素
            });
        });

        /*用户-删除*/
        function member_del(obj,id){
            var url = "<?php echo url('delete'); ?>";
            ajaxDelete(obj,id,url);
        }
    </script>
</html>