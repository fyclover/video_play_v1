<template>
	<view class="my">
		<view class="my_header">
			<view class="my_back" @click="goBack()">
				<img src="/static/img_index/back.svg" alt="">
			</view>
			<view class="my_h_center">
				<text class="my_h_tab " >{{title}}</text>
			</view>
		</view>
		<scroll-view scroll-y="true" @scrolltolower="scrollEventLower" class="my_content" >
			<view class="my_list">
				<view class="my_li_item" v-for="(item,index) in videoList" :key="item.id" @click="toVideoPlay(item)">
					<view class="my_poster" >
						<img :src="item.thumb_url" alt="">
						<!-- <text class="my_vip">VIP</text> -->
						<img class="my_play_img" src="/static/video/play.svg" alt="">
					</view>
					<view class="my_name">
						{{item.title}}
					</view>
				</view>
				<view class="" style="text-align: center;width: 100%;" v-if="videoList.length < 1">
					暂无数据
				</view>
			</view>
		</scroll-view>
	</view>
</template>

<script>
	import videoService from '@/service/videoService.js'
	import videoInfoService from '@/service/videoInfoService.js'
	import userService from '@/service/userService.js'
	export default {
		data() {
			return {
				page:1,
				type:uni.getStorageSync('myVideoType'),
				title: '',
				videoList: []
			};
		},
		mounted() {
			if(this.type == 'give') {
				this.title = '我的收藏'
			}else if(this.type == 'buy') {
				this.title = '已购列表'
			}
			this.getList()
		},
		methods:{
			getList(){
				if(this.type == 'give') {
					this.getMygive()
				}else if(this.type == 'buy') {
					this.getUserBuyList()
				}
			},
			goBack() {
				uni.navigateBack({
					delta:1,//返回层数，2则上上页
				})
			},
			/**
			 * 获取用户购买
			 * **/
			getUserBuyList() {
				let data = {
					page: this.page,
					limit: 20
				}
				userService.getUserBuyList(data).then(res => {
					// this.videoList = res.data.data
					if(res.data.data.length > 0) {
						res.data.data.forEach(el => {
							this.videoList.push(el)
						})
					}
				}).catch(err => {
					console.log(err)
				})
			},
			/**
			 * 获取我的收藏
			 * */
			getMygive() {
				let data = {
					page: this.page,
					limit: 20
				}
				videoInfoService.getMygive(data).then(res => {
					if(res.data.data.length > 0) {
						res.data.data.forEach(el => {
							this.videoList.push(el)
						})
					}
				}).catch(err => {
					console.log(err)
				})
			},
			
			//跳转到视频播放
			toVideoPlay(videoInfo) {
				console.log('videoInfo:',videoInfo)
				//长视频
				if(videoInfo.vod_play_from == 'mp4') {
					// uni.navigateTo({
					// 	url: '/pages/videoPlay/videoPlay',
					// })
					uni.switchTab({
						url:'/pages/sortVideo/sortVideo',
					})
					uni.setStorageSync('videoInfo',JSON.stringify(videoInfo))
					return
				}
				
				
				if(videoInfo.vod_play_from == 'slm3u8') {
					uni.setStorageSync('sortVideoInfo',JSON.stringify(videoInfo))
					uni.switchTab({
						url:'/pages/videoPlay/videoPlay',
					})
					return
				}
				
			},
			
			// 滚定监听
			scrollEventLower(e) {
				this.getList()
			},
		}
	}
</script>

<style lang="scss">
page{
	height: 100%;
}
.my{
	height: 100%;
	
	.my_header{
		height: 100rpx;
		padding: 0 20rpx;
		display: flex;
		background-color: #668AFF;
		align-items: center;
		color: #FFFFFF;
	}
	.my_back{
		width: 50rpx;
		height: 50rpx;
		img{
			width: 100%;
			height: auto;
		}
	}
	.my_h_center{
		flex:1;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.my_h_tab{
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 400;
		padding: 0 30rpx;
	}
	.my_h_active{
		background: #F5DABE;
		border-radius: 11px;
		color: #682604;
	}
	.my_h_right{
		margin: 0 0 0 auto;
		width: 100rpx;
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 400;
	}
	.my_content{
		height: calc(100% - 100rpx);
		overflow-y: auto;
		background-color: #FAFAFA;
	}
	.my_list{
		display: flex;
		flex-wrap: wrap;
		padding: 20rpx 30rpx;
		justify-content: space-between;
	}
	.my_li_item{
		width: calc(100% / 2 - 20rpx);
		height: 180rpx;
		margin-bottom: 80rpx;
	}
	.my_poster{
		position: relative;
		height: 200rpx;
		
		img:nth-child(1){
			width: 100%;
			height: 100%;
		};
	}
	.my_play_img{ 
		width: 80rpx;
		height: auto;
		position: absolute;
		left: 0;
		bottom: 0;
	}
	.my_name{
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #333333;
		text-align: center;
		overflow: hidden;
		text-overflow: ellipsis;
		height: 40rpx;
		border-right: none !important;
	}
}
</style>
