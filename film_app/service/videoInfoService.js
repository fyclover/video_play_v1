
import $http from '@/common/request.js'


const videoInfoService = {
	//获取热搜主题
	getHotTopicList(params) {
		return $http.post('/goodsInfo/hotTopic', params)
	},
	//获取热搜标签
	getHotTopicLabel(params) {
		return $http.post('/goodsInfo/HotLabel', params)
	},
	//获取热搜剧主
	getHotDramatist(params) {
		return $http.post('/goodsInfo/HotDramatist', params)
	},
	//点赞
	videoLike(params) {
		return $http.post('/goodsInfo/give', params)
	},
	//发表评论
	publishComments(params) {
		return $http.post('/goodsInfo/comment', params)
	},
	//排行榜
	getRankVideos(params) {
		return $http.post('/goodsInfo/heat', params)
	},
	//我的收藏
	getMygive(params) {
		return $http.post('/goodsInfo/mygive', params)
	},
	
	
}

export default videoInfoService