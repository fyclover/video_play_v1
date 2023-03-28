<?php

use think\facade\Route;

Route::rule('wx/user$', 'home/wx.WxLogin/user');//微信用户信息
Route::rule('wx/token$', 'home/wx.WxLogin/wx_token');//微信token验签
Route::rule('wx/app$', 'home/wx.WxLogin/wx_appid'); //微信appid
Route::rule('wx/access_token$', 'home/wx.WxLogin/access_token');//微信登陆

Route::rule('login/index$', 'home/login.Login/index');//登陆
Route::rule('login/register$', 'home/login.Login/register');//注册
Route::rule('login/register_test$', 'home/login.Login/register_test');//首次登录直接送账号

Route::rule('login/out$', 'home/login.Login/sign_out');//退出
Route::rule('login/forget$', 'home/login.UpdatePwd/forget');//忘记密码
Route::rule('login/change_pwd$', 'home/login.UpdatePwd/change_pwd');//修改密码
Route::rule('login/update_phone$', 'home/login.UpdatePwd/update_phone');//修改密码

Route::rule('qrcode/index$', 'home/qrcode.code/qrcode');//二维码生成
Route::rule('qrcode/download$', 'home/qrcode.code/download');

Route::rule('goods/recharge$', 'home/goods.goods/recharge');//充值购买  | 暂时废弃


Route::rule('goods/purchase$', 'home/goods.goods/purchase_set_video');		//套餐购买
Route::rule('goods/upurchase$', 'home/goods.goods/u_money');		//充值U币
Route::rule('goods/purchaseSet$', 'home/goods.goods/purchase_set_video');		//套餐购买
Route::rule('goods/gold$', 'home/goods.goods/gold_coin');		//金币套餐
Route::rule('goods/purchaseAlone$', 'home/goods.goods/purchase_alone_video');	//视频当前购买


Route::rule('goods/level$', 'home/goods.goods/level');//套餐信息
Route::rule('goods/video$', 'home/goods.goods/video');//查询指定视频播放地址
Route::rule('validity/period$', 'home/goods.goods/validity_period_info');//购买的套餐信息
//Route::rule('goods/video_type$', 'home/goods.goods/video_type_list');//查询视频分类
//Route::rule('goods/AllList$', 'home/goods.goods/video_all_list');			// 所有的视频列表
//Route::rule('user/config$', 'home/user.user/get_config');//配置文件


Route::rule('goods/video_type$', 'home/login.NoVerification/video_type_list');//查询视频分类
Route::rule('goods/AllList$', 'home/login.NoVerification/video_all_list');			// 所有的视频列表
Route::rule('user/config$', 'home/login.NoVerification/get_config');//配置文件
Route::rule('image/banner$', 'home/login.NoVerification/banner');//图片
Route::rule('video/random$', 'home/login.NoVerification/video_random_list');//视频随机
Route::rule('video/mp_random$', 'home/login.NoVerification/video_mp_random_list');//长视频视频随机
Route::rule('video/comment_list$', 'home/login.NoVerification/video_comment_list');//视频评论


Route::rule('goods/browse$', 'home/goods.goods/video_browse_list');			// 浏览历史
Route::rule('goods/playList$', 'home/goods.goods/video_play_list');			// 播放页 视频 列表 (所有的视频 )
Route::rule('goods/hotList$', 'home/goods.goods/video_hot_list');			// 热门推荐视频列表 (纯单片 )
Route::rule('goods/setBuyList$', 'home/goods.goods/video_set_buy_list');	// 套餐视频列表 (不含 纯单片)
Route::rule('goods/aloneList$', 'home/goods.goods/video_alone_list');		// 单片购买后的视频列表 (纯单片 | 已购买)
Route::rule('goods/reward$', 'home/goods.goods/reward');//打赏视频
Route::rule('goods/pour$', 'home/goods.goods/pour');//博主关注

Route::rule('goodsInfo/hotTopic$', 'home/goods.goodsInfo/hot_search_topic');//热搜主题
Route::rule('goodsInfo/HotLabel$', 'home/goods.goodsInfo/hot_search_label');//热搜标签
Route::rule('goodsInfo/HotDramatist$', 'home/goods.goodsInfo/hot_search_dramatist');//热搜剧主
Route::rule('goodsInfo/give$', 'home/goods.goodsInfo/give_the_thumbs_up');//点赞
Route::rule('goodsInfo/mygive$', 'home/goods.goodsInfo/my_give_the_thumbs_up');//我的收藏
Route::rule('goodsInfo/comment$', 'home/goods.goodsInfo/video_comment');//评论
Route::rule('goodsInfo/reply$', 'home/goods.goodsInfo/video_reply');//评论回复
Route::rule('goodsInfo/heat$', 'home/goods.goodsInfo/video_new_list');//热播视频



Route::rule('goods/my_video$', 'home/goods.GoodsInfo/my_upload');//我上传的视频
Route::rule('goods/my_fabulous$', 'home/goods.GoodsInfo/fabulous_msg');//我点赞
Route::rule('goods/my_msg$', 'home/goods.GoodsInfo/comment_msg');//我视频评论
Route::rule('goods/fabulous_unread$', 'home/goods.GoodsInfo/fabulous_unread');//点赞未读消息
Route::rule('goods/comment_unread$', 'home/goods.GoodsInfo/comment_unread');//评论未读消息
Route::rule('goods/system_msg$', 'home/goods.GoodsInfo/system_msg');//系统消息
Route::rule('goods/user_pour$', 'home/goods.GoodsInfo/user_pour');//关注我的
Route::rule('goods/user_pour_unread$', 'home/goods.GoodsInfo/user_pour_unread');//未读粉丝


Route::rule('pay/pay$', 'home/pay.pay/pay');//用户充值
Route::rule('pay/pay_back$', 'home/pay.pay/pay_back');//充值回调

Route::rule('user/index$', 'home/user.user/index');//用户个人信息
Route::rule('user/edit$', 'home/user.user/user_edit');//用户信息修改

Route::rule('user/chargeList$', 'home/user.user/get_charge_list');//获取用户充值列表
Route::rule('user/buyList$', 'home/user.user/get_buyset_list');//获取用户购买列表
Route::rule('user/withdrawalList$', 'home/user.user/get_withdrawal_list');//获取用户提现

Route::rule('goodsInfo/income$', 'home/goods.goodsInfo/income_list');//推广人数
Route::rule('goodsInfo/rebate$', 'home/goods.goodsInfo/rebate_list');//推广返利
Route::rule('goodsInfo/revenueList$', 'home/goods.goodsInfo/revenue_details_list');//推广收益列表
Route::rule('goodsInfo/recordList$', 'home/goods.goodsInfo/promotion_record_list');//推广记录


Route::rule('/upload$', 'home/uploadData/image');//上传头像
Route::miss(function() {
    return show([],404,'无效路由地址');
});