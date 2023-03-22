<?php /*a:1:{s:73:"D:\phpstudy\WWW\video\video_my\upload\app\admin\view\auth_group\edit.html";i:1620709124;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-编辑</title>
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
            <form action="" method="post" class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label for="name" class="layui-form-label">
                        <span class="x-red">*</span>角色名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="title" value="<?php echo htmlentities($data['title']); ?>" required="" lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">
                        拥有权限
                    </label>
                    <table  class="layui-table layui-input-block">
                        <tbody>
                            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="like1[write]" lay-skin="primary" lay-filter="father" title="<?php echo htmlentities($v['title']); ?>">
                                    </td>
                                    <td>
                                        <div class="layui-input-block">
                                            <?php if(is_array($v['rule']) || $v['rule'] instanceof \think\Collection || $v['rule'] instanceof \think\Paginator): $i = 0; $__LIST__ = $v['rule'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                                                <input name="rules[]" lay-skin="primary" type="checkbox" title="<?php echo htmlentities($vo['title']); ?>" value="<?php echo htmlentities($vo['id']); ?>" <?php if(in_array($vo['id'],$arr)): ?>checked<?php endif; ?>> 
                                            <?php endforeach; endif; else: echo "" ;endif; ?>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label for="desc" class="layui-form-label">
                        描述
                    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea"></textarea>
                    </div>
                </div>
                <input type="hidden" name="id" value="<?php echo htmlentities($data['id']); ?>"/>
                <div class="hr-line-dashed"></div>
                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="" lay-filter="add">
                        <i class="icon iconfont"></i>确认提交
                    </button>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="/static/js/form.js"></script>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
            var form = layui.form
            ,layer = layui.layer;

            //监听提交
            var url = "<?php echo url('edit'); ?>";
            ajaxFormData(url,form);
            form.on('checkbox(father)', function(data){

                if(data.elem.checked){
                    $(data.elem).parent().siblings('td').find('input').prop("checked", true);
                    form.render(); 
                }else{
                $(data.elem).parent().siblings('td').find('input').prop("checked", false);
                    form.render();  
                }
            });
        });
    </script>
  </body>

</html>