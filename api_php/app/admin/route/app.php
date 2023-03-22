<?php

use think\facade\Route;

//Route::group(function () {});
Route::rule('login/index$', 'admin/Login/index');//登陆
Route::rule('login/captcha$', 'admin/Login/captcha');//验证码
Route::rule('login/captcha_check$', 'admin/Login/captcha_check');//验证码
Route::rule('login/agent$', 'admin/agentLogin/index');//服务商登陆

Route::rule('upload/image$', 'admin/UploadData/image');//上传图片
Route::rule('upload/video$', 'admin/UploadData/video');//都可以上传
Route::rule('upload/index$', 'admin/VideoFf/index');//都可以上传

Route::rule('/$', 'admin/Index/index');//后台首页
Route::rule('admin/list$', 'admin/Index/index');//后台用户列表
Route::rule('admin/add$', 'admin/Index/add');//后台用户添加

Route::rule('admin/edit$', 'admin/Index/edit');//后台用户修改
Route::rule('admin/detail$', 'admin/Index/detail');//后台用户信息查看
Route::rule('admin/del$', 'admin/Index/del');//后台用户删除

Route::rule('menu/list$', 'admin/auth.Menu/index');//后台菜单列表
Route::rule('menu/add$', 'admin/auth.Menu/add');//后台菜单添加
Route::rule('menu/edit$', 'admin/auth.Menu/edit');//后台菜单修改
Route::rule('menu/detail$', 'admin/auth.Menu/detail');//后台菜单修改
Route::rule('menu/del$', 'admin/auth.Menu/del');//后台菜单删除
Route::rule('menu/column$', 'admin/auth.Menu/lists');//后台表单列表
Route::rule('menu/status$', 'admin/auth.Menu/status');//后台表单列表

Route::rule('action/list$', 'admin/auth.Action/index');//后台控制列表
Route::rule('action/add$', 'admin/auth.Action/add');//后台控制列表
Route::rule('action/edit$', 'admin/auth.Action/edit');//后台控制列表
Route::rule('action/del$', 'admin/auth.Action/del');//后台控制列表
Route::rule('action/status$', 'admin/auth.Action/status');//后台控制列表

Route::rule('role/list$', 'admin/auth.Role/index');//角色列表
Route::rule('role/add$', 'admin/auth.Role/add');//角色列表add
Route::rule('role/edit$', 'admin/auth.Role/edit');//角色列表edit
Route::rule('role/del$', 'admin/auth.Role/del');//角色列表del
Route::rule('role/status$', 'admin/auth.Role/status');//角色列表

Route::rule('auth/action$', 'admin/auth.BranchAuth/action_list');//控制器列表
Route::rule('auth/action_edit$', 'admin/auth.BranchAuth/action_edit');//控制器列表
Route::rule('auth/menu$', 'admin/auth.BranchAuth/menu_list');//菜单列表
Route::rule('auth/menu_edit$', 'admin/auth.BranchAuth/menu_edit');//菜单列表

Route::rule('role_menu/list$', 'admin/auth.RoleMenu/index');//角色菜单列表分组
Route::rule('role_menu/add$', 'admin/auth.RoleMenu/add');//角色菜单列表添加
Route::rule('role_menu/edit$', 'admin/auth.RoleMenu/edit');//角色菜单列表

Route::rule('power/list$', 'admin/auth.RolePower/index');//角色 api接口列表
Route::rule('power/add$', 'admin/auth.RolePower/add');//角色 api接口列表
Route::rule('power/edit$', 'admin/auth.RolePower/edit');//角色 api接口列表

//Route::rule('agent/list$', 'admin/Agent/index');//代理列表
//Route::rule('agent/add$', 'admin/Agent/add');//代理添加
//Route::rule('agent/edit$', 'admin/Agent/edit');//代理修改
//Route::rule('agent/status$', 'admin/Agent/status');//代理状态修改

Route::rule('article_type/list$', 'admin/content.ArticleType/index');//文章分类
Route::rule('article_type/add$', 'admin/content.ArticleType/add');//文章分类
Route::rule('article_type/edit$', 'admin/content.ArticleType/edit');//文章分类
Route::rule('article_type/detail$', 'admin/content.ArticleType/detail');//文章分类
Route::rule('article_type/del$', 'admin/content.ArticleType/del');//文章分类


Route::rule('article/list$', 'admin/content.Article/index');//文章内容
Route::rule('article/add$', 'admin/content.Article/add');//文章内容
Route::rule('article/edit$', 'admin/content.Article/edit');//文章内容
Route::rule('article/detail$', 'admin/content.Article/detail');//文章内容
Route::rule('article/del$', 'admin/content.Article/del');//文章内容

Route::rule('video_type/list$', 'admin/content.VideoType/index');//视频分类
Route::rule('video_type/type$', 'admin/content.VideoType/type_list');//视频分类
Route::rule('video_type/add$', 'admin/content.VideoType/add');//视频分类
Route::rule('video_type/edit$', 'admin/content.VideoType/edit');//视频分类
Route::rule('video_type/detail$', 'admin/content.VideoType/detail');//视频分类
Route::rule('video_type/del$', 'admin/content.VideoType/del');//视频分类
Route::rule('video_type/status$', 'admin/content.VideoType/status');//视频分类
Route::rule('video_type/show$', 'admin/content.VideoType/is_show');//视频前台是否显示
Route::rule('video_type/size$', 'admin/content.VideoType/is_size');//是否是大视频
Route::rule('video/platform$', 'admin/content.VideoType/platform');//视频平台
Route::rule('video_vip/name$', 'admin/content.VideoVip/type_name_list');//视频套餐名称列表
Route::rule('video_vip/list$', 'admin/content.VideoVip/index');//视频套餐列表
Route::rule('video_vip/add$', 'admin/content.VideoVip/add');//视频套餐新增
Route::rule('video_vip/edit$', 'admin/content.VideoVip/edit');//视频套餐修改
Route::rule('video_vip/status$', 'admin/content.VideoVip/status');//视频状态修改
Route::rule('video_vip/del$', 'admin/content.VideoVip/del');//视频套餐删除
Route::rule('video_vip/fast$', 'admin/content.VideoVip/fast_set_meal');//视频套餐一键上架
Route::rule('video_vip/end$', 'admin/content.VideoVip/end_set_meal');//视频套餐一键下架

Route::rule('video_vip/auth$', 'admin/content.VideoVip/video_auth');//视频分配套餐

Route::rule('video/list$', 'admin/content.Video/index');//视频列表
Route::rule('video/add$', 'admin/content.Video/add');//视频新增
Route::rule('video/edit$', 'admin/content.Video/edit');//视频修改
Route::rule('video/detail$', 'admin/content.Video/detail');//视频详情
Route::rule('video/del$', 'admin/content.Video/del');//视频删除
Route::rule('video/status$', 'admin/content.Video/status');//视频


Route::rule('login/log$', 'admin/log.LoginLog/index');//登陆日志
Route::rule('money/log$', 'admin/log.MoneyLog/index');//资金流动日志
Route::rule('admin/log$', 'admin/log.AdminLog/index');//后台操作日志

Route::rule('pay/list$', 'admin/log.PayCash/index');//提现列表日志
Route::rule('pay/status$', 'admin/log.PayCash/status');//提现成功状态修改

Route::rule('recharge/list$', 'admin/log.PayRecharge/index');//充值列表日志
Route::rule('recharge/status$', 'admin/log.PayRecharge/status');//确认充值

Route::rule('order/list$', 'admin/order.order/index');//订单列表
Route::rule('order/edit$', 'admin/order.order/edit');//订单状态


Route::rule('notice/list$', 'admin/notice.Notice/index');//公告列表
Route::rule('notice/add$', 'admin/notice.Notice/add');//公告添加
Route::rule('notice/edit$', 'admin/notice.Notice/edit');//公告修改
Route::rule('notice/del$', 'admin/notice.Notice/del');//公告删除
Route::rule('notice/detail$', 'admin/notice.Notice/detail');//公告详情
Route::rule('notice/position$', 'admin/notice.Notice/position');//公告位置
Route::rule('notice/status$', 'admin/notice.Notice/status');//公告上下架

Route::rule('notify/list$', 'admin/notice.Notify/index');//通知列表
Route::rule('notify/add$', 'admin/notice.Notify/add');//通知添加
Route::rule('notify/edit$', 'admin/notice.Notify/edit');//通知修改
Route::rule('notify/del$', 'admin/notice.Notify/del');//通知删除
Route::rule('notify/detail$', 'admin/notice.Notify/detail');//通知详情
Route::rule('notify/status$', 'admin/notice.Notify/status');//通知上下架
Route::rule('notify/notify$', 'admin/notice.Notify/notifys');//通知类型



Route::rule('bank/list$', 'admin/PayBank/index');//银行卡列表
Route::rule('bank/del$', 'admin/PayBank/del');//银行卡删除
Route::rule('bank/default$', 'admin/PayBank/default');//银行卡修改默认卡

Route::rule('pay_bank/list$', 'admin/PayBank/index');//支付银行卡列表
Route::rule('pay_bank/del$', 'admin/PayBank/del');//支付银行卡删除
Route::rule('pay_bank/default$', 'admin/PayBank/default');//支付银行卡修改默认卡

Route::rule('config/list$', 'admin/SysConfig/index');//后台配置文件列表
Route::rule('config/add$', 'admin/SysConfig/add');//后台添加
Route::rule('config/edit$', 'admin/SysConfig/edit');//后台修改
Route::rule('config/detail$', 'admin/SysConfig/detail');//配置详情
Route::rule('config/del$', 'admin/SysConfig/del');//配置删除

Route::rule('ipconfig/list$', 'admin/IpConfig/index');//后台IP白名单
Route::rule('ipconfig/add$', 'admin/IpConfig/add');//IP白名单添加
Route::rule('ipconfig/edit$', 'admin/IpConfig/edit');//IP白名单修改
Route::rule('ipconfig/detail$', 'admin/IpConfig/detail');//IP白名单详情
Route::rule('ipconfig/del$', 'admin/IpConfig/del');//IP白名单删除
Route::rule('ipconfig/status$', 'admin/IpConfig/status');//IP白名单状态修改


Route::rule('user/is_status$', 'admin/User/is_status');//用户是否虚拟账号设置
Route::rule('user/list$', 'admin/User/index');//用户列表
Route::rule('user/agent$', 'admin/User/agent');//代理商信息
Route::rule('money/edit$', 'admin/User/money_edit');//用户余额修改

//Route::rule('frozen/edit$', 'admin/User/frozen_edit');//用户冻结额度修改


Route::rule('user/edit$', 'admin/User/edit');//用户修改
Route::rule('user/add$', 'admin/User/add');//
Route::rule('user/del$', 'admin/User/del');//
Route::rule('user/detail$', 'admin/User/detail');//用户详情
Route::rule('user/status$', 'admin/User/status');//用户状态修改
Route::rule('userreal/list$', 'admin/RealName/index');//用户身份证列表

Route::rule('market_level/list$', 'admin/MarketLevel/index');//市场部等级
Route::rule('market_level/add$', 'admin/MarketLevel/add');//市场部等级
Route::rule('market_level/edit$', 'admin/MarketLevel/edit');//市场部等级
Route::rule('market_level/del$', 'admin/MarketLevel/del');//市场部等级
Route::rule('market_level/detail$', 'admin/MarketLevel/detail');//市场部等级

Route::rule('market_relation/list$', 'admin/MarketRelation/index');//市场部关系
Route::rule('market_relation/add$', 'admin/MarketRelation/add');//市场部关系
Route::rule('market_relation/edit$', 'admin/MarketRelation/edit');//市场部关系
Route::rule('market_relation/del$', 'admin/MarketRelation/del');//市场部关系
Route::rule('market_relation/detail$', 'admin/MarketRelation/detail');//市场部关系


//注册统计
Route::rule('register/all$', 'admin/count.Register/index');//今日注册量与总注册列表
Route::rule('register/today$', 'admin/count.Register/today_register');//今日注册量
Route::rule('register/total$', 'admin/count.Register/total_register');//总注册

//充值统计
Route::rule('recharge/all$', 'admin/count.Recharge/index');//今日充值与总充值列表
Route::rule('recharge/today$', 'admin/count.Recharge/today_recharge');//今日充值
Route::rule('recharge/total$', 'admin/count.Recharge/total_recharge');//总充值

//提现统计
Route::rule('withdrawal/all$', 'admin/count.Withdrawal/index');//今日提现与总提现列表
Route::rule('withdrawal/today$', 'admin/count.Withdrawal/today_withdrawal');//今日提现
Route::rule('withdrawal/total$', 'admin/count.Withdrawal/total_withdrawal');//总提现

//订单统计
Route::rule('order/all$', 'admin/count.Order/index');//今日订单与总订单列表全部
Route::rule('order/today$', 'admin/count.Order/today_order');//今日订单全部
Route::rule('order/total$', 'admin/count.Order/total_order');//总订单全部
Route::rule('order/today_pay$', 'admin/count.Order/today_pay_order');//今日订单 已经支付的
Route::rule('order/total_pay$', 'admin/count.Order/total_pay_order');//总订单　已经支付的
Route::rule('order/today_money$', 'admin/count.Order/today_pay');//今日订单金额 已支付
Route::rule('order/total_money$', 'admin/count.Order/total_pay');//总订单金额  已支付


//google验证码生成器使用
Route::rule('google/qrcode$', 'admin/base/captcha_url');//二维码地址
Route::rule('google/secret$', 'admin/base/generate_code');//google secret

//台桌
Route::rule('desktop/index$', 'admin/desktop.desktop/index');
Route::rule('desktop/add$', 'admin/desktop.desktop/add');
Route::rule('desktop/edit$', 'admin/desktop.desktop/edit');
Route::rule('desktop/status$', 'admin/desktop.desktop/status');

