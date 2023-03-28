
import $http from '@/common/request.js'


const videoService = {
	getZoneList(params) {
		return $http.post('/goods/setBuyList', params)
	},
	/**观影历史*/
	getBrowseHistory(params) {
		return $http.post('/goods/browse', params)
	},
	//购买套餐
	purchase(params) {
		return $http.post('/goods/purchase', params)
	},
	//购买套餐
	upurchase(params) {
		return $http.post('/goods/upurchase', params)
	},

	//获取视频套餐信息
	getVideoLevel(params) {
		return $http.post('/goods/level', params)
	},
	//新片榜
	getHotVideoList(params) {
		return $http.post('/goods/hotList', params)
	},
	//获取视频分类列表 
	getVideotypeList(params) {
		return $http.post('/goods/video_type', params)
	},
	//获取全部视频
	getVideoAllList(params) {
		return $http.post('/goods/AllList', params)
	},
	//获取视频详情
	getVideoInfo(params) {
		return $http.post('/goods/video', params)
	},
	//获取短视频列表
	getSortVideoRandomList(params) {
		return $http.post('/video/random', params)
	},
	//获取长视频列表
	getMpVideoRandomList(params) {
		return $http.post('/video/mp_random', params)
	},
	validityPeriodInfo(params) {
		return $http.post('/validity/period', params)
	},
	//视频打赏
	setVideoReward(params) {
		return $http.post('/goods/reward', params)
	},
	//视频关注
	setVideoPour(params) {
		return $http.post('/goods/pour', params)
	},
	//视频评论列表
	getVideoCommentList(params) {
		return $http.post('/video/comment_list', params)
	},
	//我的视频
	getMyVidoList(params) {
		return $http.post('/goods/my_video', params)
	},
	//我的视频消息
	getMyVidoMsg(params) {
		return $http.post('/goods/my_msg', params)
	},
	//点赞我的消息
	getMyVidoFabulous(params) {
		return $http.post('/goods/my_fabulous', params)
	},
	//我的粉丝消息
	getMyVidoUserPour(params) {
		return $http.post('/goods/user_pour', params)
	},
	//评论未读
	getMyVidoCommentUnread(params) {
		return $http.post('/goods/comment_unread', params)
	},
	//点赞未读
	getMyVidoFabulousUnread(params) {
		return $http.post('/goods/fabulous_unread', params)
	},
	//粉丝未读
	getMyVidoUserPourUnread(params) {
		return $http.post('/goods/user_pour_unread', params)
	},
	// app页面推广返利
	app(params){
		return $http.post('/goodsInfo/rebate', params)
	},
	//推广记录
	tuiguangjilu(params){
		return $http.post('/goodsInfo/recordList', params)
	},
	// 收益
	income(params){
		return $http.post('/goodsInfo/income', params)
	},
	// 二维码
	erweima(params){
		return $http.post('/qrcode/index', params)
	},
	// 轮播图
	lunbo(params){
		return $http.post('/image/banner', params)
	},
	// 下载二维码
	download(params){
		return $http.post('/qrcode/download', params)
	},
	// //新片榜
	// getHotVideoList(params) {
	// 	return $http.post('/goods/hotList', params)
	// }
}

export default videoService