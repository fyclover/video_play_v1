<?php /*a:2:{s:62:"/www/wwwroot/upload.com/upload/app/admin/view/member/edit.html";i:1679363177;s:67:"/www/wwwroot/upload.com/upload/app/admin/view/common/container.html";i:1677049147;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">

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
    <link rel="stylesheet" href="/static/css/uploadimg.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <style>
        .photo-upload{
            height: 35px;
            width: 35px;
        }
        .photo-upload .iconfont{
            font-size: 1.8rem;
        }
        .photo-item {
            width: 180px;
            height: 150px;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form" id="form">
            <input type="hidden" name="id" value="<?php echo htmlentities($data['id']); ?>" >
            <input type="hidden" id="img_path" name="img_path" value="<?php echo htmlentities($data['img_path']); ?>" >
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red"></span>视频名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="video_title" value="<?php echo htmlentities($data['video_title']); ?>" maxlength="50" autocomplete="off" class="layui-input">
                </div>

            </div>
            <label for="username" class="layui-form-label">
                            <span class="x-red">
                                
                            </span>视频分类：
                        </label>
            <div class="layui-input-inline">
                            <select name="video_type" lay-filter="vide_type">
                                <?php if(is_array($type) || $type instanceof \think\Collection || $type instanceof \think\Paginator): $i = 0; $__LIST__ = $type;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                <option value="<?php echo htmlentities($v['id']); ?>"><?php echo htmlentities($v['title']); ?><?php echo htmlentities(isChange($v['is_size'])); ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
             </div>
             
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red"></span>标签
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="labels" value="<?php echo htmlentities($data['labels']); ?>" maxlength="50" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>输入样式：#国风#美女#跳舞
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    免费时长
                </label>
                <div class="layui-input-inline">
                    <input type="number" name="duration" value="<?php echo htmlentities($data['duration']); ?>" maxlength="4" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    价格
                </label>
                <div class="layui-input-inline">
                    <input type="number" name="video_price" value="<?php echo htmlentities($data['video_price']); ?>" maxlength="4" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    介绍
                </label>
                <div class="layui-input-inline">
                 <textarea type="text" name="description"   autocomplete="off" class="layui-input"><?php echo htmlentities($data['description']); ?></textarea></div>
            </div>

<!--            <div class="layui-form-item">-->
<!--                <label for="username" class="layui-form-label">-->
<!--                    <span class="x-red">*</span>平台-->
<!--                </label>-->
<!--                <div class="layui-input-inline">-->
<!--                    <input type="number" name="platform" value="0" maxlength="4" autocomplete="off" class="layui-input">-->
<!--                </div>-->
<!--            </div>-->
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>图片封面
                </label>
                <div class="layui-input-inline">
                    <div class="photo-list-wrapper border-1px--bottom">
                        <ul id="productPhotoList" class="photo-list">
<!--                            <li class="photo-item"> <img class="photo-pic" src="" alt=""></li>>-->

                        </ul>
                        <div class="photo-upload">
                            <i class="icon iconfont">&#xe6b9;</i>
                            <input type="file" onchange="handleAddImg()" />
                        </div>
                    </div>
                </div>
            </div>
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
<script src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/xcity.js"></script>
<script>
    layui.use(['form', 'layer'],
        function() {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;
            //监听提交
            form.on('submit(add)',
                function(data) {
                    var form = document.getElementById('form')
                    var formData = new FormData(form);
                    imgList.forEach(item => {
                        formData.append("imgList", item.file,item.name);
                    });
                    //发异步，把数据提交给php
                    $.ajax({
                        url:"<?php echo url('edit'); ?>",
                        method:'post',
                        data:formData,
                        dataType:'JSON',
                        processData: false,
                        contentType: false,
                        success:function(res){
                            if(res.code == 200){
                                layer.alert(res.msg, {icon: 6},function () {
                                    xadmin.close();
                                    // 可以对父窗口进行刷新
                                    xadmin.father_reload();
                                });
                            }else{
                                layer.msg(res.msg);
                            }
                        },
                        error:function (data) {
                        }
                    }) ;
                    return false;
                });

        });
</script>
<script>
    layui.use(['form','code'], function(){
        form = layui.form;

        layui.code();

        $('#start').xcity();
    });
</script>
<script>
    var imgList = [];
    function handleAddImg(element, type) {
        var file = event.target.files[0];
        var img = new Compression({
            file: file,
            width: 750,
            height: 750,
            formData: false
        });

        var formData = new FormData();
        formData.append('file',file)
        formData.append('width',750)
        formData.append('height',750)
        formData.append('formData',false)
            $.ajax({
                type:"POST",
                //上传前校验文件上传到第几片
                url: "<?php echo url('upload'); ?>", //上传文件的请求路径必须是绝对路劲
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                dataType: "json",
                success:function(res){
                    console.log(res.data[0])
                    var html =
                        '<li class="photo-item">' +
                        '<img class="photo-pic" src="' +
                        res.data[0] +
                        '" alt="">';
                    $('#img_path').val(res.data[1])
                    $("#productPhotoList").html(html);
                },
                error:function (data) {
                    $('.jiance').html('检测失败')
                }
            }) ;

    }
</script>
</body>

</html>
