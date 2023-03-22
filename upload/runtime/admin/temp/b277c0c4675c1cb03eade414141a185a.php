<?php /*a:2:{s:63:"/www/wwwroot/upload.com/upload/app/admin/view/member/index.html";i:1678950416;s:67:"/www/wwwroot/upload.com/upload/app/admin/view/common/container.html";i:1677049147;}*/ ?>
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
</head>

<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">视频管理</a>
            <a>
              <cite>视频列表</cite>
            </a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">

                    <div id="uploader" class="wu-example">
                        <!--用来存放文件信息-->
                        <div id="thelist" class="uploader-list"></div>
                        <div class="btns">
                            <div id="picker">选择上传文件</div>
                        </div>
                    </div>

                    <br/>

                </div>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>

                        <th>标题</th>
                        <th>标签</th>
                        <th>价格</th>
                        <th>地址</th>
                        <th>封面图路径</th>
                        <th>免费时常</th>
                        <th>平台</th>
                        <th>编辑</th>
                        <th>上传时间</th>
                        </thead>
                        <tbody>
                        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                        <tr>
                            <td><?php echo htmlentities($v['video_title']); ?></td>
                            <td><?php echo htmlentities($v['labels']); ?></td>
                            <td><?php echo htmlentities($v['video_price']); ?></td>
                            <td><?php echo htmlentities($v['video_path']); ?></td>
                            <td>
                                <img class="head-img" src="<?php echo htmlentities($v['img_path']); ?>"/>
                                <br/>
                                
                            </td>
                            <td><?php echo htmlentities($v['duration']); ?></td>
                            <td><?php echo htmlentities($v['platform']); ?></td>
                        <td class="td-manage">
                            <?php if($v['status'] == 0): ?>
                            <a title="编辑" class="layui-btn layui-btn-xs" onclick="xadmin.open('详情','<?php echo url("edit"); ?>?id=<?php echo htmlentities($v['id']); ?>',700,400)" href="javascript:;">
                            <i class="icon iconfont"></i>编辑</a>
                            &nbsp;&nbsp;&nbsp;

                            <button type="button" onclick="member_del(this,'<?php echo htmlentities($v['id']); ?>')" class="layui-btn layui-btn-xs layui-btn-danger">更新到线上</button>
                            <?php endif; ?>
                        </td>
                            <td><?php echo htmlentities($v['create_time']); ?></td>
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
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script>
</script>


<script>
    var totalChunkNum = 0;
    var crrentChunkNum = 0;
    var uploadswf = 'webupload/Uploader.swf';
    var chunkSize = 2*1024*1024;
    var server_url='/index.php/admin/upload/index';
    var server_cf='/index.php/admin/upload/cf';
    var GUID = WebUploader.Base.guid();//一个GUID
    var chunkObj = {};  //用来记录文件的状态、上传中断的位置
    var seq=1;
    var msg='';

    function member_del(obj,id){
        var url = "<?php echo url('renew'); ?>";
        ajaxDelete(obj,id,url);
    }

    $(function () {
        var $ = jQuery;
        var $list = $('#thelist');
        WebUploader.Uploader.register({
            "before-send-file":"beforeSendFile",
            "before-send": "beforeSend"
        }, {
            "beforeSendFile": function (file) {
                //上传前校验文件是否已经上传过
                var deferred = WebUploader.Deferred();
                $.ajax({
                    type:"POST",
                    //上传前校验文件上传到第几片
                    url: server_cf,
                    data: {
                        seq: seq,
                        fileMd5: md5(file.name + file.size + file.ext),
                        fileName:file.name
                    },
                    dataType: "json",
                    success: function (data) {
                        chunkObj = data;
                        chunkObj.type = data.type;
                        chunkObj.chunk == data.chunk;
                        msg = data.msg;
                        // var percentNum = crrentChunkNum / totalChunkNum * 100
                        // $('#id').html(`<div> ${percentNum}%</div>`)
                        if(data.type==404){
                            deferred.reject();
                            $("#" + file.id).find(".state").text(data.msg);

                        }else if (data.type == 0) {
                            deferred.reject();
                            $("#" + file.id).find(".state").text("文件已上传");
                        } else if (data.type == 1) {
                            if (data.chunk) {
                                deferred.resolve();
                            }
                        } else {
                            deferred.resolve();
                        }
                    },
                    error: function () {
                        deferred.resolve();
                    }
                })
                return deferred.promise();
            },
            "beforeSend": function (block) {
                var deferred = WebUploader.Deferred();
                var curChunk = block.chunk;
                var totalChunk = block.chunks;
                totalChunkNum = totalChunk
                crrentChunkNum = curChunk
                console.log(chunkObj)
                if (chunkObj.type == "1") {
                    if (curChunk < chunkObj.chunk) {
                        deferred.reject();
                    } else {
                        deferred.resolve();
                    }
                } else {
                    deferred.resolve();
                }
                return deferred.promise();
            }
        });
        var uploader = WebUploader.create({
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: uploadswf,
            // 文件接收服务端。
            server: server_url,
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#picker',
            chunked: true,//开始分片上传
            chunkSize:1 * 1024 * 1024,//每一片的大小
            threads: 1,
            formData: {
            },
            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false
        });

        // 当有文件被添加进队列的时候
        uploader.on('fileQueued', function (file) {

            $list.append('<div id="' + file.id + '" class="item">' +
                '<div class="item-file"><div class="fileType-logo"></div>' +
                '<div class="fileMes"><h4 class="info">' + file.name + '</h4>' +
                '<p class="state">等待上传...</p>' +
                '</div></div></div>');

        });
        // 文件上传过程中创建进度条实时显示。
        uploader.on('uploadProgress', function (file, percentage) {
            var $li = $('#' + file.id),
                $percent = $li.find('.progress .progress-bar');
            // 避免重复创建
            if (!$percent.length) {
                $percent = $('<div class="progress progress-striped active">' +
                    '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                    '</div>' +
                    '</div>').appendTo($li).find('.progress-bar');
            }
            if (percentage * 100 >=90){
                percentage = 0.94;
            }
            $li.find('p.state').text('上传中...请勿刷新.已上传（'+((percentage * 100).toFixed(2))+'%）');
            $('#' + file.id).append(`<div> </div>`)

        });
        uploader.on("uploadBeforeSend", function (obj, data, headers) {
            var file = obj.cuted.file;
            data.test = 1;
            data.fileMd5 = md5(file.name + file.size + file.ext);

        })
        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on('uploadSuccess', function (file, response) {
            if(response.status==299){
                $('#' + file.id).find('p.state').text('文件已存在');
            }else{
                $('#' + file.id).find('p.state').text('已上传');
            }

        });
        // 文件上传失败，显示上传出错。
        uploader.on('uploadError', function (file) {
            $('#' + file.id).find('p.state').text(msg);
        });
        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on('uploadComplete', function (file) {
            $('#' + file.id).find('.progress').fadeOut();
        });
        //所有文件上传完毕
        uploader.on("uploadFinished", function () {
            //提交表单
        });
        //开始上传
        $("#ctlBtn").click(function () {
            uploader.upload();

        });
    });


</script>
</html>