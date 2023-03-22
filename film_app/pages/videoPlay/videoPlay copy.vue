<template>
	<view class="vdieo">
		<view class="vdieo_play">
			<video controls ref="video" :src="videoDetail.video_url"></video>
			<!-- <video src="/static/video/112.mp4"></video> -->
			
			<view class="vdieo_notice">
				非VIP可试看60秒,<text style="color: red;">充值VIP</text>无限看
			</view>
		</view>
		<view class="vdieo_discount" @click="toRecharge()">
			VIP充值享受更多优惠
		</view>
		<view class="video_brife">
			<view class="video_name">
				{{videoDetail.vod_name}}
			</view>
			<view class="video_num">
				<!-- 8.7W次观看 -->
			</view>
			<view class="video_labels">
				<text class="video_label" v-for="(item,index) in videoDetail.vod_tag_li" :key="index">
					#{{item}}
				</text> 
			</view>
		</view>
		<view class="video_issue">
			<img src="/static/msg/msg2.png" class="video_i_header" alt="">
			<view class="video_publisher">
			</view>
			<view class="video_follow">
				关注
			</view>
		</view>
		<view class="video_use">
			<!-- <view class="video_control">
				<img src="/static/video/gift.png" alt="">
				<text>111</text>
			</view> -->
			<!-- <view class="video_control">
				<img src="/static/video/dowload.png" alt="">
				<text>缓存</text>
			</view> -->
			<view class="video_control">
				<img src="/static/video/msg.png" alt="">
				<text>{{videoDetail.is_comment_count}}</text>
			</view>
			<view class="video_control">
				<img src="/static/video/like.png" alt="">
				<text>{{videoDetail.is_fabulous_count}}</text>
			</view>
			<!-- <view class="video_control">
				<img src="/static/video/transfer.png" alt="">
				<text>转发</text>
			</view> -->
			<view class="video_control">
				<img src="/static/video/share.png" alt="">
				<text>赚钱</text>
			</view>
		</view>
		<view class="video_poster">
			<img :src="videoDetail.thumb_url" alt="">
		</view>
		<view class="video_recommend">
			<view class="video_reco_title">
				为你推荐
			</view>
			<view class="">
				<view class="video_reco_row" v-for="(item,index) in allVideoList" :key="index">
					<view class="video_reco_poster">
						<img :src="item.thumb_url" alt="" srcset="">
						<text class="video_reco_vip">VIP</text>
					</view>
					<text class="video_reco_text">{{item.title}}</text>
				</view> 
				<!-- <view class="video_reco_row">
					<view class="video_reco_poster">
						<img src="/static/img_index/erweima.png" alt="" srcset="">
						<text class="video_reco_vip">VIP</text>
					</view>
					<text class="video_reco_text">李宏毅东北话原声 演绎江湖纷争字段</text>
				</view> -->
			</view>
		</view>
	</view>
</template>

<script>
    // let Hls = require('hls.js');
	import videoInfoService from '@/service/videoInfoService.js'
	import videoService from '@/service/videoService.js'
	export default {
		data() {
			return {
				// hls: null,
				//视频信息
				videoInfo: null,
				//视频详情
				videoDetail: {},
				//全部视频列表
				allVideoList: [],
				videoList: []
			};
		},
		onLaunch() {
			// this.getStream(this.videoInfo.video_url)
		},
		created() {
			this.videoInfo = uni.getStorageSync('videoInfo') ? JSON.parse(uni.getStorageSync('videoInfo')) : null
			if(this.videoInfo == null) {
				this.getMpVideoRandomList()
			}else{
				this.getVideoInfo()
			}
			
			this.getVideoAllList()
		},
		methods: {
			//获取短视频随机列表
			getMpVideoRandomList() {
				videoService.getMpVideoRandomList().then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.videoList = res.data.data
					if(this.videoList.length > 0) {
						this.videoList.forEach(el => {
							el.vod_tag_li = []
							console.log("el:",el.vod_tag)
							if(el.vod_tag) {
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
			//获取全部视频列表
			getVideoAllList() {
				// token: uni.getStorageSync('token')
				let data = {
					page: 1,
					limit:2,
					type: 'text',
					is_size: 1, //0:短视频 1：长视频，
					labels: '',
					video_name: '',
					video_id: ''
				}
				videoService.getVideoAllList(data).then(res => {
					this.allVideoList = res.data.data
					if(this.allVideoList.length > 0) {
						this.allVideoList.forEach(el => {
							el.labelList = []
							if(el.labels.length > 0) {
								el.labelList= el.labels.split('#')
								el.labelList.shift()
							}
							
						})
					}
					// console.log('res:',res)
				}).catch(err => {
					console.log(err)
				})
			},
			// getStream(source) {
			// 	if (Hls.isSupported()) {
			// 		this.hls = new Hls();
			// 		this.hls.loadSource(source);
			// 		this.hls.attachMedia(this.$refs.video);

			// 		this.hls.on(Hls.Events.MANIFEST_PARSED, () => {
			// 			console.log("加载成功");
			// 			this.$refs.video.play();
			// 		});
			// 		this.hls.on(Hls.Events.ERROR, (event, data) => {
			// 			// console.log(event, data);
			// 			// 监听出错事件
			// 			console.log("加载失败");
			// 		});
			// 	} else if (this.$refs.video.canPlayType('application/vnd.apple.mpegurl')) {
			// 		this.$refs.video.src = 'https://video-dev.github.io/streams/x36xhzz/x36xhzz.m3u8';
			// 		this.$refs.video.addEventListener('loadedmetadata',function() {
			// 			this.$refs.video.play();
			// 		});
			// 	}
			// },
			// 停止流
			// videoPause() {
			// 	if (this.hls) {
			// 		this.$refs.video.pause();
			// 		this.hls.destroy();
			// 		this.hls = null;
			// 	}
			// }
		}
	}
</script>

<style lang="scss">
	page{
		height: 100%;
	}
	.vdieo{
		height: 100%;
		
		.vdieo_play{
			height: 400rpx;
			overflow: hidden;
			display: flex;
			justify-content: center;
			align-items: center;
			position: relative;
		}
		.vdieo_notice{
			position: absolute;
			width: 600rpx;
			height: 40rpx;
			bottom: 20rpx;
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #FFFFFF;
			text-align: center;
			background: #000000;
			opacity: 0.4;
			border-radius: 30rpx;
		}
		.vdieo_discount{
			width: 95vw;
			height: 70rpx;
			background: url('/static/video/vip.png') no-repeat 100% 100%;
			background-size: 100% 100%;
			margin: 20rpx auto 0 auto;
			font-size: 16px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #6A2D09;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.video_name{
			font-size: 22px;
			font-family: PingFang SC;
			font-weight: bold;
			color: #333333;
		}
		.video_brife{
			padding: 16rpx 25rpx;
		}
		.video_num{
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #999999;
		}
		.video_labels{
			display: flex;   
			padding: 10rpx 0;
		}
		.video_label{
			width: 104rpx;
			height: 46rpx;
			background: #E1E1E1;
			border-radius: 4px;
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #999999;
			margin-right: 10rpx;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.video_issue{
			display: flex;
			padding: 16rpx 25rpx;
		}
		.video_i_header{
			width: 60rpx;
			height: 60rpx;
			border-radius: 30rpx;
			border: 1px solid #999999;
			margin-right: 20rpx;
		}
		.video_publisher{
			font-size: 16px;
			font-family: PingFang SC;
			font-weight: bold;
			color: #333333;
		}
		.video_follow{
			width: 100rpx;
			height: 50rpx;
			background: #FCE5B3;
			border-radius: 24rpx;
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #6A2D09;
			display: flex;
			justify-content: center;
			align-items: center;
			margin: 0 0 0 auto;
		}
		.video_use{
			display: flex;
			justify-content: space-between;
			padding: 16rpx 25rpx;
		}
		.video_control{
			display: flex;
			flex-direction: column;
			align-items: center;
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
		.video_poster{
			height: 200rpx;
			img{
				height: 100%;
				width: 100%;
			}
		}
		.video_recommend{
			padding: 16rpx 25rpx;
		}
		.video_reco_title{
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #333333;
		}
		.video_reco_row{
			display: flex;
			margin-bottom: 20rpx;
		}
		.video_reco_poster{
			position: relative;
			width: 250rpx;
			height: 130rpx;
			margin-right: 30rpx;
			img{
				height: 100%;
				width: 100%;
			}
		}
		.video_reco_text{
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #333333;
			line-height: 17px;
		}
		.video_reco_vip{
			width: 60rpx;
			height: 28rpx;
			background: #F5DABE;
			border-radius: 0px 0px 0px 4px;
			right: 0;
			position: absolute;
			top:0;
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #682604;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	}
	
</style>
