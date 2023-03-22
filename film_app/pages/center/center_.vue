<template>
	<view class="center">
		<view class="center_header">
			<view class="center_h_top">
				<view class="center_h_img" >
					<img src="/static/img_index/erweima.png" >
				</view>
				<view class="center_h_info" >
					<view class="">
						{{userInfo.nickname}}
					</view>
					<view class="">
						<text>ID:</text>
						<text>{{userInfo.phone}}</text>
					</view>
				</view>
				<view class="center_h_voucher">
					<view class="center_h_vou">
						账号凭证
					</view>
				</view>
				<view class="center_h_right">
					<!-- <view class="center_h_tr">
						<img src="/static/img_index/bell.png" >
					</view> -->
					<view class="center_h_tr" @click="toSetting()">
						<img src="/static/img_index/setting.png" >
					</view>
				</view>
			</view>
			<view class="center_h_bottom">
				<view class="center_equity">
					我的权益：免费视频剩余   2/3
				</view>
				<view class="center_member" @click="toRecharge()">
					开通会员
				</view>
			</view>
		</view>

		<view class="center_section">
			<view class="center_base">
				<view class="center_data">
					<view>
						<view class="center_d_num">1</view>
						<view class="center_d_type">观影券</view>
					</view>
					<view>
						<view class="center_d_num">342</view>
						<view class="center_d_type">粉丝</view>
					</view>
					<view>
						<view class="center_d_num">455</view>
						<view class="center_d_type">关注</view>
					</view>
					<view>
						<view class="center_d_num">0</view>
						<view class="center_d_type">推广</view>
					</view>
				</view>
				<view class="center_block">
					<view class="center_b_item">
						<view class="center_b_top">
							<img src="/static/img_index/diamonds.png" >
							<text class="center_b_title">会员中心</text>
						</view>
						<view class="center_b_cen">未开通会员</view>
						<view class="center_b_bot" >
							<view class="center_b_btn" @click="toRecharge()">
								去开通
							</view>
						</view>
					</view>
					<view class="center_b_item">
						<view class="center_b_top">
							<img src="/static/img_index/coin.png" >
							<text class="center_b_title">金币钱包</text>
						</view>
						<view class="center_b_cen">当前余额：{{userInfo.money_balance}}</view>
						<view class="center_b_bot" >
							<view class="center_b_btn" @click="toRecharge()">
								去充值
							</view>
						</view>
					</view>
					<view class="center_b_item">
						<view class="center_b_top">
							<img src="/static/img_index/redpacke.png" >
							<text class="center_b_title">推广赚钱</text>
						</view>
						<view class="center_b_cen">当前收益：0</view>
						<view class="center_b_bot">
							<!-- <view class="center_b_btn">
								去赚钱
							</view> -->
						</view>
					</view>
				</view>
			</view>

			<view class="center_record">
				<view class="center_r_top">
					<text class="center_r_title">观影历史</text>
					<!-- <text class="center_r_more">更多</text> -->
				</view>
				<view class="center_r_film">
					<view class="center_r_block" v-for="(item,index ) in browseList" :key="index" @click="toVideoPlay(item)">
						<view class="center_r_img">
							<img :src="item.thumb_url" >
						</view>
						<view class="center_r_name">
							{{item.title}}
						</view>
					</view>
					
					<!-- <view class="center_r_block">
						<view class="center_r_img">
							<img src="/static/img_index/erweima.png" >
						</view>
						<view class="center_r_name">
							妹子舞蹈跳得不错哦
						</view>
					</view> -->
				</view>
			</view>

			<view class="center_menu">
				<view class="center_r_top">
					<text class="center_r_title">常用功能</text>
					<text class="center_r_more"></text>
				</view>
				<view class="center_m_list">
					<view class="center_m_item">
						<view class="center_m_img">
							<img src="/static/img_index/gift.png" >
						</view>
						<view class="center_m_name">
							福利广场
						</view>
					</view>
					<view class="center_m_item">
						<view class="center_m_img">
							<img src="/static/img_index/fen.png" >
						</view>
						<view class="center_m_name">
							我的粉丝
						</view>
					</view>
					<view class="center_m_item">
						<view class="center_m_img">
							<img src="/static/img_index/buffer.png" >
						</view>
						<view class="center_m_name">
							缓存视频
						</view>
					</view>
					<view class="center_m_item">
						<view class="center_m_img">
							<img src="/static/img_index/group.png" >
						</view>
						<view class="center_m_name">
							官方社群
						</view>
					</view>
					<view class="center_m_item">
						<view class="center_m_img">
							<img src="/static/img_index/gift.png" >
						</view>
						<view class="center_m_name">
							我的收藏
						</view>
					</view>
					<view class="center_m_item">
						<view class="center_m_img">
							<img src="/static/img_index/msg.png" >
						</view>
						<view class="center_m_name">
							消息中心
						</view>
					</view>
					<view class="center_m_item">
						<view class="center_m_img">
							<img src="/static/img_index/customer.png" >
						</view>
						<view class="center_m_name">
							在线客服
						</view>
					</view>
					<view class="center_m_item">
						<view class="center_m_img">
							<img src="/static/img_index/buy.png" >
						</view>
						<view class="center_m_name">
							我购买的
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import userService from '@/service/userService.js'
	import videoService from '@/service/videoService.js'
	export default {
		data() {
			return {
				//用户信息
				userInfo: {},
				//浏览历史
				browseList: [],
			};
		},
		onShow() {
		},
		mounted() {
			this.getUserInfo()
			this.getBrowseHistory()
		},
		methods: {
			//跳转到视频播放
			toVideoPlay(videoInfo) {
				//长视频
				if(videoInfo.type == 20) {
					// uni.navigateTo({
					// 	url: '/pages/videoPlay/videoPlay',
					// })
					uni.setStorageSync('videoInfo',JSON.stringify(videoInfo))
					uni.switchTab({
						url:'/pages/videoPlay/videoPlay',
					})
					
					return
				}
				
				// if(videoInfo.type == 25) {
				// 	uni.navigateTo({
				// 		url: '/pages/sortVideo/sortVideo',
				// 	})
				// 	return
				// }
				if(videoInfo.vod_play_from == 'slm3u8') {
					uni.setStorageSync('sortVideoInfo',JSON.stringify(videoInfo))
					uni.switchTab({
						url:'/pages/sortVideo/sortVideo',
					})
					// uni.navigateTo({
					// 	url: '/pages/sortVideo/sortVideo',
					// })
					return
				}
				
			},
			/**
			 * 跳转到充值
			 * **/
			toRecharge() {
				uni.navigateTo({
					url: '/pages/recharge/recharge'
				})
			},
			toSetting() {
				uni.navigateTo({
					url: '/pages/setting/setting'
				})
			},
			getUserInfo() {
				userService.getUserInfo({token: uni.getStorageSync('token')}).then(res => {
					this.userInfo = res.data
				}).catch(err => {
					console.log('err:',err)
				})
			},
			getBrowseHistory() {
				videoService.getBrowseHistory({page:1,limit:10,token: uni.getStorageSync('token')}).then(res => {
					console.log("res:",res)
					this.browseList = res.data.data
				}).catch(err => {
					console.log(err)
				})
			}
			
		}
	}
</script>

<style lang="scss">
	page{
		height: 100%;
	}
	.center{
		height: 100%;

		.center_header{
			height: 200rpx;
			background-color: #3F6AF4;
			padding: 20rpx 20rpx;
		}
		.center_h_top{
			display: flex;
		}
		.center_h_img{
			width: 100rpx;
			height: 100rpx;
			border-radius: 50%;
			img{
				height: 100%;
				border-radius: 50%;
				width: auto;
			}
		}
		.center_h_info{
			margin-left:11rpx ;
			color: white;
		}
		.center_h_voucher{
			margin-left: 10rpx;
		}
		.center_h_vou{
			border: 1px solid white;
			width: 120rpx;
			height: 40rpx;
			text-align: center;
			border-radius: 20rpx;
			font-size: 12px;
			padding: 0 8rpx;
			color: white;
			margin-top: 52rpx;
		}
		.center_h_right{
			margin: 0 0 0 auto;
			width: 200rpx;
			display: flex;
			justify-content: flex-end;
		}
		.center_h_tr{
			img{
				height: 60rpx;
				width: auto;
			}
		}
		.center_h_bottom{
			margin: 0  auto;
			margin-top: 20rpx;
			width: 100%;
			height: 50rpx;
			background: #3B3E54;
			border-image: linear-gradient(0deg, #F5DABE, #FFFFFF, #D5A472) 10 10;
			opacity: 0.9;
			border-radius: 10rpx;
			display: flex;
			padding-left: 30rpx;
			align-items: center;
		}
		.center_equity{
			color: #F5DABE;
		}
		.center_member{
			width: 140rpx;
			height: 40rpx;
			background: #F5DABE;
			border-radius: 22rpx;
			font-size: 12px;
			text-align: center;
			margin: 0 6rpx 0 auto;
		}
		.center_section{
			height: calc(100% - 200rpx);
			padding: 20rpx 20rpx;
			background-color: #F5F5F5;
		}
		.center_base{
			height: 280rpx;
			background-color: white;
			border-radius: 20rpx;
		}
		.center_data{
			display: flex;
			justify-content: space-around;
			align-items: center;
		}
		.center_d_num{
			font-size: 15px;
			font-family: PingFang SC;
			font-weight: bold;
		}
		.center_d_type{
			color: #333333;
			font-size: 12px;
			font-family: PingFang SC;
			opacity: 0.43;
		}
		.center_block{
			display: flex;
			justify-content: space-around;
			margin-top: 20rpx;
			color: #F3D4B4;
		}
		.center_b_item{
			width: 200rpx;
			height: 144rpx;
			background: #3B3E54;
			border-radius: 18rpx;
			padding: 0 2rpx 0 6rpx;
		}
		.center_b_top{
			display: flex;
			align-items: center;
			img{
				width: 54rpx;
				height: auto;
			}
		}
		.center_b_cen{
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #F3D4B4;
		}
		.center_b_btn{
			width: 100rpx;
			height: 36rpx;
			justify-content: center;
			display: flex;
			align-items: center;
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #682604;
			background: #F5DABE;
			border-radius: 18rpx;
		}
		.center_record{
			height: 300rpx;
			background-color: white;
			border-radius: 20rpx;
			margin-top: 10rpx;
		}
		.center_r_top{
			padding: 10rpx 20rpx;
			display: flex;
			justify-content: space-between;
			border-bottom: 1px solid #F5F5F5;
		}
		.center_r_more{
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #999999;
		}
		.center_r_title{
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #333333;
		}
		.center_r_film{
			display: flex;
			justify-content: space-between;
			padding-top: 10rpx;
		}
		.center_r_block{

		}
		.center_r_img{
			width: 260rpx;
			height: 170rpx;
			img{
				width: 100%;
				height: 100%;
				border-radius: 8rpx;
			}
		}
		.center_r_block{
			text-align: center;
		}
		.center_r_name{
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #666666;
		}
		.center_menu{
			// height: 300rpx;
			padding: 0rpx 20rpx;
			background-color: white;
			border-radius: 20rpx;
			margin-top: 10rpx;
		}
		.center_m_list{
			display: flex;
			flex-wrap: wrap;
			justify-content: space-between;
			padding-top: 10rpx;
			// height: 200rpx;
		}
		.center_m_item{
			width: 130rpx;
			height: 140rpx;
			display: flex;
			flex-direction: column;
			align-items: center;
			margin: 10rpx;
		}
		.center_m_img{
			width: 110rpx;
			img{
				width: 100%;
				height: auto;
			}
		}
		.center_m_name{
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #131313;
			opacity: 0.77;
			margin-top: -32rpx;
		}
	}

</style>
