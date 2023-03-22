<template>
	<view class="sort">
		<view class="sort_search" @click="handleSearch()">
			<img src="/static/video/fangdajing.png" alt="">
		</view>
		<view class="sort_header">
			<!-- <text class="sort_tab">关注</text> -->
			<text class="sort_tab">热门</text>
		</view>
		<view class="sort_right">
			<view class="sort_head">
				<img class="sort_hea_img" src="/static/msg/msg2.png" alt="">
				<img class="sort_hea_plus" src="/static/video/plus.png" alt="">
			</view>
			
			<view class="sort_control" @click="handleLike()">
				<!-- <img src="/static/video/heart.png" alt="" > -->
				<img src="/static/video/like1.svg" alt="" v-if="!videoDetail.is_fabulous" >
				<img src="/static/video/like2.svg" alt="" v-if="videoDetail.is_fabulous" >
				<text>{{videoDetail.is_fabulous_count}}</text>
			</view>
			<view class="sort_control" @click="openComment()">
				<img src="/static/video/talk.png" alt="">
				<text>{{videoDetail.is_comment_count}}</text>
			</view>
			<!-- <view class="sort_control">
				<img src="/static/video/shear.png" alt="">
				<text>111</text>
			</view> -->
		</view>
		<!-- <view class="sort_content">
			<view class="sort_con_title">
				@爱奇艺自制111
			</view>
			<view class="sort_con_title">
				{{videoDetail.vod_name}}
			</view>
			<view class="sort_con_labels">
				<view class="sort_con_label" v-for="(item,index) in videoDetail.vod_tag_li" :key="index">
					#{{item}}
				</view>
			</view>
			<view class="sort_con_labels2" @click="toRecharge()">
				<img src="/static/video/play.png" alt="">
				<text>购买完整版</text>
			</view>
		</view> -->
		<!-- <video class="sort_video" src="/static/video/112.mp4"></video> -->
		<iframe class="sort_video" frameborder="no" src="https://m3u8.bxgtv.top?url=https://vip1.slbfsl.com/20221203/jN5bLHAX/index.m3u8" border="0"></iframe>
		<!-- https://m3u8.bxgtv.top/ -->
		
		<view class="modal" v-if="modalVisible">
			<view class="sort_com_container">
				<view class="sort_com_panel">
					<view class="sort_com_top">
						<view class="sort_com_title">
							评论
						</view>
						<view class="sort_com_cancel" @click="closeComment()">
							<img src="/static/img_index/close.png" alt="" srcset="">
						</view>
					</view>
					<view class="sort_com_box">
						<textarea class="sort_com_inbox" name="" v-model="comText" id="" cols="30" rows="3"></textarea>
						<button class="sort_com_send" type='primary' @click="handleComment()">发表</button>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import videoInfoService from '@/service/videoInfoService.js'
	import videoService from '@/service/videoService.js'
	export default {
		data() {
			return {
				//视频信息
				videoInfo: JSON.parse(uni.getStorageSync('sortVideoInfo')) || null,
				//视频详情
				videoDetail: {},
				//视频
				videoList: [],
				//评论框
				modalVisible: false,
				//评论
				comText: '',
			};
		},
		created() {
			if(this.videoInfo == null) {
				this.getSortVideoRandomList()
				return
			}
			this.getVideoInfo()
		},
		methods: {
			//获取短视频随机列表
			getSortVideoRandomList() {
				videoService.getSortVideoRandomList().then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.videoList = res.data
					if(this.videoList.length > 0) {
						console.log(this.videoList)
						this.videoList.forEach(el => {
							if(el.vod_tag.length > 0) {
								el.vod_tag_li =  el.vod_tag.split('#')
								el.vod_tag_li.shift()
							}
						})
						
					}
					this.videoDetail = this.videoList[0]
				}).catch(err => {
					console.log(err)
				})
			},
			/**
			 * 跳转到充值
			 * **/
			toRecharge() {
				uni.navigateTo({
					url: '/pages/recharge/recharge'
				})
			},
			/**
			 * 评论
			 * */
			handleComment() {
				let data = {
					content_id: this.videoDetail.vod_id,//视频id
					content_title: this.videoDetail.vod_title,//视频标题
					ucontent: this.comText,//评论内容
				}
				videoInfoService.publishComments(data).then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.modalVisible = false
				}).catch(err => {
					console.log("err:",err)
				})
			},
			/**
			 * 获取视频详情
			 * **/
			getVideoInfo() {
				let data = {
					id: this.videoInfo.id
				}
				videoService.getVideoInfo(data).then(res => {
					//新片榜
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					
					this.videoDetail = res.data
					if(this.videoDetail.vod_tag.length > 0) {
						this.videoDetail.vod_tag_li =  this.videoDetail.vod_tag.split('#')
						this.videoDetail.vod_tag_li.shift()
					}
				}).catch(err => {
					console.log(err)
				})
			},
			/**
			 * 搜索
			 * **/
			handleSearch() {
				uni.switchTab({
					url: '/pages/index/index'
				})
			},
			/**
			 * 关闭评论
			 * **/
			closeComment() {
				this.modalVisible = false
			},
			/**
			 * 打开评论
			 * **/
			openComment() {
				this.modalVisible = true
			},
			/**
			 * 点赞
			 * **/
			handleLike() {
				let data = {
					content_id: this.videoDetail.vod_id,
					content_title: this.videoDetail.vod_name
				}
				videoInfoService.videoLike(data).then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.getVideoInfo()
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
.sort{
	height: 100%;
	position: relative;
	overflow: hidden;
	
	.sort_video{
		height: 100%;
		width: 100%;
		top: 0;
		left: 0;
		position: absolute;
		z-index: 0;
	}
	.sort_header{
		display: flex;
		z-index: 9;
		justify-content: center;
		position: absolute;
		width: 100%;
		top: 25px;
	}
	.sort_search{
		position: absolute;
		right: 10rpx;
		width: 50rpx;
		height: 50rpx;
		z-index: 9;
		img{
			width: 100%;
			height: 100%;
		}
	}
	.sort_tab{
		width: 100rpx;
		text-align: center;
		font-size: 15px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #FFFFFF;
		opacity: 0.7;
	}
	.sort_right{
		width: 90rpx;
		height: 600rpx;
		z-index: 9;
		right: 0;
		position: absolute;
		top: 50%;
		transform: translateY(-300rpx);
		display: flex;
		flex-direction: column;
	}
	.sort_head{
		width: 90rpx;
		height: 90rpx;
		position: relative;
		
	}
	.sort_hea_img{
		width: 100%;
		height: 100%;
		border-radius: 45rpx;
	}
	.sort_hea_plus{
		position: absolute;
		bottom: 0;
		width: 15px;
		height: 15px;
		right: 50%;
		transform: translateX(8.5px);
		z-index: 99;
	}
	.sort_control{
		display: flex;
		flex-direction: column;
		align-items: center;
		margin-top: 50rpx;
		img{
			width: 60rpx;
			height: auto;
		}
		text{
			font-size: 13px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #999999;
		}
	}
	.sort_content{
		width: 100%;
		position: absolute;
		z-index: 9;
		bottom: 100rpx;
		padding: 0 0 0 20rpx;
		
	}
	.sort_con_title{
		font-size: 15px;
		font-family: PingFang SC;
		font-weight: bold;
		color: #FFFFFF;
		margin-bottom: 10rpx;
		
	}
	.sort_con_labels,.sort_con_labels2{
		display: flex;
	}
	.sort_con_label{
		width: 104rpx;
		height: 46rpx;
		background: #000000;
		opacity: 0.4;
		border-radius: 8rpx;
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #FFFFFF;
		display: flex;
		justify-content: center;
		align-items: center;
		margin-right: 20rpx;
		
	}
	.sort_con_labels2{
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: bold;
		color: #FFFFFF;
		align-items: center;
		margin-top: 10rpx;
		img{
			width: 20rpx;
			height: 20rpx;
			margin-right: 10rpx;
		}
	}
	.sort_com_container{
		height: 100%;
		border: 100%;
		position: relative;
	}
	.sort_com_panel{
		height: 300rpx;
		position: absolute;
		width: 100%;
		bottom: 0;
		background-color: white;
	}
	.sort_com_top{
		display: flex;
		height: 80rpx;
		align-items: center;
	}
	.sort_com_title{
		flex:1;
		font-size: 16px;
		font-family: PingFang SC;
		font-weight: bold;
		text-align: center;
	}
	.sort_com_cancel{
		width: 80rpx;
		height: 80rpx;
		img{
			width: 100%;
			height: 100%;
		}
	}
	.sort_com_box{
		height: calc(100% - 80rpx);
		position: relative;
	}
	.sort_com_inbox{
		height: 100%;
		width: 100%;
		border: 1px solid #ccc;
		padding: 4rpx 10rpx;
	}
	.sort_com_send{
		position: absolute;
		right: 0;
		bottom: 4rpx;
		z-index: 99;
		border-radius: 10rpx;
		padding: 0px 40rpx;
		font-size: 12px;
		border-radius: 100rpx;
	}
}
</style>
