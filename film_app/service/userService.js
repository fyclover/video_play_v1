import $http from '@/common/request.js'

const userService = {
	//获取用户信息
	getUserInfo(params) {
		return $http.post('/user/index', params)
	},
	//获取配置
	getUserConfig(params) {
		return $http.post('/user/config', params)
	},
	//修改信息
	userInfoEdit(params) {
		return $http.post('/login/change_pwd', params)
	},
	//用户购买的
	getUserBuyList(params) {
		return $http.post('/goods/aloneList', params)
	},
	//用户套餐列表
	getUserSetList(params) {
		return $http.post('/user/buyList', params)
	},
	//用户充值列表
	getUserRechargeList(params) {
		return $http.post('/user/chargeList', params)
	},
	//用户上传文件
	fileUpload(params) {
		return $http.upload('/upload', params)
	},
	//个性用户信息
	editUserInfo(params) {
		return $http.post('/user/edit', params)
	},
	
}

export default userService