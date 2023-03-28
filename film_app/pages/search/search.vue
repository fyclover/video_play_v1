<template>
	<view class="search">
		<view class="search_head">
			<view class="search_box">
				<img class="search_search_i" src="/static/img_index/search.svg" >
				<input class="search_search" v-model="keywords" placeholder-style="color: #C0C0C0;font-size:14px"
				 type="text" placeholder="请输入影视剧名称">
			</view>
			<view class="search_cus" @click="handleSearch()">
				确定
			</view>
			<view class="search_cus" @click="handleCancel()">
				取消
			</view>
		</view>
		<view class="search_panel">
			<view class="search_hot">
				热搜主题
			</view>
			<view class="search_key">
				<view class="search_k" @click="toHome('type',item)"  :class="{'search_k_top':i < 3}" v-for="(item, i) in hotTopicList" :key="i">
					<text>{{item.title}}</text>
					<img src="/static/img_index/fire.png" alt="" v-if="i < 3">
				</view>
			</view>
			<view class="search_hot">
				热搜标签
			</view>
			<view class="search_key">
				<view class="search_label" @click="toHome('label',i)"  v-for="(i) in hotTopicLabels" :key="i">
					<text>{{i}}</text>
				</view>
			</view>
			<view class="search_hot">
				热搜剧主
			</view>
			<view class="search_key">
				<view class="search_rich"
				 @click="transfer(item)"
				 :class="{'search_k_top':index < 3}" v-for="(item, index) in hotDramatList" :key="index">
					<!-- <text class="search_serial">{{index}}</text> -->
					<!-- <img class="search_poster" src="/static/img_index/erweima.png" alt=""> -->
					<text class="search_ri_text">{{item}}</text>
					<img class="search_ri_mark" src="/static/img_index/fire.png" alt="" v-if="index < 3">
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import videoInfoService from '@/service/videoInfoService.js'
	export default {
		data() {
			return {
				//热搜主题
				hotTopicList:[],
				//热搜标签
				hotTopicLabels: [],
				//热搜剧主
				hotDramatList: [],
				//搜索关键词
				keywords: uni.getStorageSync('searchKeywords') || ''
			}
		},
		created() {
			this.getHotTopicList()
			this.getHotTopicLabel()
			this.getHotDramatist()
		},
		methods: {
			handleCancel() {
				uni.navigateBack({
					delta:1,//返回层数，2则上上页
				})
			},
			toHome(type,obj) {
				if(type == 'type') {
					uni.setStorageSync('searchType',JSON.stringify(obj))
				}
				if(type == 'label') {
					uni.setStorageSync('searchLabels',obj)
				}
				
				uni.setStorageSync('indexTheme','zone')
				uni.switchTab({
					url: '/pages/index/index'
				})
				
			},
			handleSearch() {
				this.getHotTopicList()
				this.getHotTopicLabel()
				this.getHotDramatist()
				uni.setStorageSync('searchKeywords',this.keywords)
				uni.setStorageSync('indexTheme','zone')
				uni.switchTab({
					url: '/pages/index/index'
				})
			},
			//热搜主题
			getHotTopicList() {
				videoInfoService.getHotTopicList({}).then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.hotTopicList = res.data
					console.log(res.data,'热搜标签')
				}).catch(err => {
					console.log(err)
				})
			},
			//热搜标签
			getHotTopicLabel() {
				videoInfoService.getHotTopicLabel({}).then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.hotTopicLabels = res.data
					console.log(res.data,'热搜标签')
				}).catch(err => {
					console.log(err)
				})
			},
			transfer(videoInfo) {
				uni.switchTab({
					url:'/pages/sortVideo/sortVideo',
				})
				//长视频
				if(videoInfo.type == 20) {
					// uni.navigateTo({
					// 	url: '/pages/videoPlay/videoPlay',
					// })
					uni.switchTab({
						url:'/pages/videoPlay/videoPlay',
					})
					uni.setStorageSync('videoInfo',JSON.stringify(videoInfo))
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
			//获取热搜剧主
			getHotDramatist() {
				videoInfoService.getHotDramatist({}).then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.hotDramatList = res.data
					console.log(res.data,'获取热搜剧主')
					if(this.hotDramatList.length > 0) {
						
					}
					
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
	.search{
		height: 100%;
		
		.search_head{
			height: 80rpx;
			display: flex;
			padding: 0 30rpx;
			justify-content: space-between;
			align-items: center;
			background-color: #3F6AF4;
		}
		.search_cus{
			width: 80rpx;
			height: 80rpx;
			display: flex;
			justify-content: center;
			align-items: center;
			color: white;
		}
		.search_search{
			width: 65vw;
			background-color: white;
			border-radius: 6rpx;
			padding-left:80rpx;
			height: 62rpx;
		}
		.search_box{
			position: relative;
		}
		.search_search_i{
			position: absolute;
			width: 56rpx;
			z-index: 99;
			left: 8rpx;
			top: 2rpx;
		}
		.search_panel{
			height: calc(100% - 80rpx);
			padding: 20rpx 30rpx 0 30rpx;
		}
		.search_hot{
			height: 50rpx;
			font-size: 18px;
			font-family: PingFang SC;
			font-weight: bold;
			color: #333333;
			display: flex;
			align-items: center;
			padding: 20rpx 0;
		}
		.search_key{
			display: flex;
			flex-wrap: wrap;
			justify-content: flex-start;
			margin-top: 20rpx;
		}
		.search_k{
			display: flex;
			justify-content: flex-start;
			align-items: center;
			width: 45vw;
			margin-bottom: 40rpx;
			
			img{
				width: 50rpx;
				height: auto;
			}
		}
		
		.search_k_top{
			color: #F61273;
		}
		.search_label{
			background: #E1E1E1;
			border-radius: 8rpx;
			padding: 8rpx 18rpx;
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #999999;
			margin-right: 10rpx;
			margin-bottom: 16rpx;
		}
		.search_rich{
			display: flex;
			justify-content: flex-start;
			align-items: center;
			width: 45vw;
			margin-bottom: 30rpx;
		}
		.search_ri_mark{
			width: 50rpx;
			height: auto;
		}
		.search_poster{
			width: 90rpx;
			height: 90rpx;
			border-radius: 50%;
			border: 1px solid #333333;
			margin: 0 20rpx;
		}
		.search_serial{
			font-size: 16px;
			font-family: PingFang SC;
			font-weight: bold;
			color: #F61273;
		}
		.search_ri_text{
			max-width: 320rpx;
			overflow: hidden;
			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 2;
			-webkit-box-orient: vertical;
			color: seagreen;
		}
	}
</style>
