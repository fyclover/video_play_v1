<template>
	<view class="vdieo">
		<!--  弹出框-->

		<view @tap="buyOpen"></view>
		<u-popup :show="zhuangtai==5?true:false" @close="buyClose" @open="buyOpen" mode='center'>
			<view class="vipBuy dis">
				<view class="vipBox">
					<view class="shang disc">
						<view class="dis">观看完整版需要50金币</view>
						<view class="dis">会员最低只需25金币</view>
					</view>
					<view class="xia">
						<view class="btn dis" style="background-color: #fff;border: 1upx solid red;" @tap="lijigoumai">
							立即购买</view>
						<view class="btn dis" style="background-color:  #007aff;color: #fff;" @tap="goumaihuiyuan">购买会员
						</view>
					</view>
				</view>
			</view>
		</u-popup>
		<!--  -->
		<view>
			<u-popup :show="dashangShow" @close="close" @open="open" mode='bottom'>
				<view class="contentBox disc">
					<view class="title dis">打赏</view>
					<view class="listBox">
						<view class="listItem dis" v-for="(item,index) in jinbiList" :key="index"
							@tap='dashangItem(item)'>
							<image src="../../static/video/jinbi.png" mode=""></image>
							<view>{{item}}</view>
						</view>
					</view>
					<input type="text" style="width: 90%;background-color: #efefef;height: 60upx;
					margin-top: 20upx;border-radius: 10upx;" placeholder="请输入留言">
					<view class="dashangBtn dis" @click="setVideoReward()">确认支付</view>
				</view>
			</u-popup>

		</view>
		<!-- 测试 -->
		<view id="dplayer" style="height: 500upx;width: 100%;">

		</view>

		<!--  -->

		<!-- <video src="" style="height: 250px;width: 100%;" v-show="!videoShow"></video> -->
		<view style="width: 80%;margin: 0 auto;text-align: center;font-size: 28upx;">
			非VIP可试看60秒,<text style="color: red;">充值VIP</text>无限看
		</view>

		<view class="vdieo_play" v-if='false'>
			<iframe class="video_iframe" frameborder="no" :src="'https://m3u8.bxgtv.top?url='+videoDetail.vod_play_url"
				border="0"></iframe>
			<!-- <video controls ref="video" :src="videoDetail.video_url"></video> -->
			<!-- <video src="/static/video/112.mp4"></video> -->

			<view class="vdieo_notice">
				非VIP可试看60秒,<text style="color: red;">充值VIP</text>无限看
			</view>
		</view>
		<view class="vdieo_play" v-show="false">
			<video src="" style="width: 100%;height: 520upx;"></video>
			<!-- <video controls ref="video" :src="videoDetail.video_url"></video> -->
			<!-- <video src="/static/video/112.mp4"></video> -->

			<view class="vdieo_notice">
				非VIP可试看60秒,<text style="color: red;">充值VIP</text>
			</view>
		</view>
		<!-- <view class="" style="padding: 10rpx 0 0 10rpx;">
			<button type="primary" size="mini" @click="quanping">全屏</button>
		</view> -->
		<view class="vdieo_discount" @click="toRecharge()">
			VIP充值享受更多优惠
		</view>
		<view class="video_brife">
			<view class="video_name">
				{{videoDetail.vod_name}}
			</view>
			<view class="video_num">
				{{videoDetail.heat}}次观看
			</view>
			<view class="video_labels">
				<text class="video_label" v-for="(item,index) in videoDetail.vod_tag_li" :key="index">
					#{{item}}
				</text>
			</view>
		</view>
		<view class="video_issue">
			<view class="video_bozhu" @click="openMsgs()">
				<img src="/static/msg/msg2.png" class="video_i_header" alt="">
				<text>{{videoDetail.bozhu_name}}</text>
			</view>

			<view class="video_publisher">
			</view>
			<view class="video_follow" @click="setVideoPour()">
				{{videoDetail.is_user_pour?'取消关注':'关注'}}
			</view>
		</view>
		<view class="video_use">
			<view class="video_control" @click="openReward()">
				<img src="/static/video/gift.png" alt="">
				<text>打赏</text>
			</view>
			<!-- <view class="video_control">
				<img src="/static/video/dowload.png" alt="">
				<text>缓存</text>
			</view> -->
			<view class="video_control" @click="publish()">
				<img src="/static/video/msg.png" alt="">
				<text>{{videoDetail.is_comment_count}}</text>
			</view>
			<view class="video_control">
				<view class="" @click="handleLike()">
					<img src="/static/video/like.png" v-if="!videoDetail.is_fabulous" alt="">
					<img src="/static/video/like2.svg" v-if="videoDetail.is_fabulous" alt="">
				</view>

				<text>{{videoDetail.is_fabulous_count}}</text>
			</view>
			<view class="video_control" @click="handleCopy()">
				<img src="/static/video/transfer.png" alt="">
				<text>转发</text>
			</view>
			<view class="video_control" @click="handleMoneyCopy()">
				<img src="/static/video/share.png" alt="">
				<text>赚钱</text>
			</view>
		</view>
		<swiper autoplay="true" :interval="3000" :duration="1000" style="width: 100%;height: 400upx;">
			<swiper-item style="width: 100%;height: 400upx;" v-for="(item,index) in lunbo">
				<view class="swiper-item" style="width: 100%;height: 400upx;">
					<image :src="imgUrls+item.img_path" mode="" style="width: 100%;height: 400upx;"></image>
				</view>
			</swiper-item>

		</swiper>
		<view class="video_recommend">
			<view class="video_reco_title">
				为你推荐
			</view>
			<view class="">
				<view class="video_reco_row" v-for="(item,index) in allVideoList" @click="setCurrentVideo(item)"
					:key="index">
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

		<view class="modal " v-if="msgVisible">
			<view class="vid_modal">
				<view class="vid_panel">
					<view class="vid_m_head">
						<view class="vid_m_title">
							评论
						</view>
						<view class="vid_m_cancel" @click="closeComment()">
							<img src="/static/img_index/close.png" alt="" srcset="">
						</view>
					</view>
					<view class="vid_m_body">
						<view class="vid_m_row" v-for="(item,index) in commentList" :key="index">
							{{item.ucontent}}
						</view>
					</view>
				</view>
			</view>
		</view>


		<view class="modal " v-if="publishVisible">
			<view class="vid_modal">
				<view class="vid_panel">
					<view class="vid_m_head">
						<view class="vid_m_title">
							发表评论
						</view>
						<view class="vid_m_cancel" @click="closePublish()">
							<img src="/static/img_index/close.png" alt="" srcset="">
						</view>
					</view>
					<view class="vid_pub_body">
						<view class="">
							<textarea class="vid_pub_txt" v-model="comText" name="" id="" cols="30"
								rows="10"></textarea>
						</view>
						<view class="vid_pub_send">
							<button type="primary" size="mini" @click="handleComment()">发送</button>
						</view>

					</view>

				</view>
			</view>
		</view>


		<view class="modal " v-if="rewardVisible">
			<view class="vid_modal">
				<view class="vid_panel vid_reward_panel">
					<view class="vid_m_head">
						<view class="vid_m_title">
							打赏
						</view>
						<view class="vid_m_cancel" @click="closeReward()">
							<img src="/static/img_index/close.png" alt="" srcset="">
						</view>
					</view>
					<view class="vid_m_body">
						<view class="vid_m_row">
							<input class="vid_m_reward" v-model="rewardMoney" type="text" placeholder="请输入赏金">
							<button type="primary" size="mini" @click="setVideoReward()">赏</button>
						</view>
					</view>
				</view>
			</view>
		</view>

		<!-- <view class="modal" v-show="fullScreen">
			<view class="">
				<view class="my_back" @click="fullScreen=false">
					<img src="/static/img_index/back.svg" alt="">
				</view>
			</view>
			<view class="vid_p_body">
				<iframe class="video_iframe" frameborder="no"
					:src="'https://m3u8.bxgtv.top?url='+videoDetail.vod_play_url" border="0"></iframe>
			</view>
		</view> -->
	</view>
</template>

<script>
	// let Hls = require('hls.js');
	import videoInfoService from '@/service/videoInfoService.js'
	import videoService from '@/service/videoService.js'
	import userService from '@/service/userService.js'
	import Hls from 'hls.js'
	import Dplayer from 'dplayer'
	
	export default {
		data() {
			return {
				buyShow: '',
				dashangShow: false, //打赏弹出框
				videoShow: true,
				nowTime: 0,
				xx: true,
				dp: {},
				// hls: null,
				//视频信息
				videoInfo: null,
				//视频详情
				videoDetail: {},
				//全部视频列表
				allVideoList: [],
				videoList: [],
				msgVisible: false,
				publishVisible: false,
				rewardVisible: false,
				comText: '',
				rewardMoney: 0,
				commentList: [],
				banner_tuijian: '',
				fullScreen: false,
				jinbiList: [
					20, 50, 100, 200, 520, 1314
				],
				lunbo: [],
				imgUrls: '',
				shengyu: '',
				VIPSate: false,
				zhuangtai: ''
			};
		},
		onLaunch() {
			// this.getStream(this.videoInfo.video_url)

		},
		onLoad() {

			// 
			this.getValidityPeriodInfo()
			let data = {
				"image_type": '2'
			}
			videoService.lunbo(data).then(res => {
				console.log(res.data.data)
				this.imgUrls = res.data.url
				this.lunbo = res.data.data
			})

			userService.getUserInfo({
				token: uni.getStorageSync('token')
			}).then(res => {
				this.userInfo = res.data
				this.shengyu = res.data.viewing_times
				// this.shengyu = 3
				console.log(res.data.viewing_times, '剩余次数')
			}).catch(err => {
				console.log('err:', err)
			})
		},
		mounted() {

        let data = {
        	id: this.videoInfo.vod_id ? this.videoInfo.vod_id : this.videoInfo.id
        }
        videoService.getVideoInfo(data).then(res => {
        	//新片榜
        	if (res.code != 1) {
        		uni.showToast({
        			title: res.message || '请求失败',
        			icon: 'none'
        		});
        		return
        	}
        	this.videoDetail = res.data
        	this.dp = new Dplayer({
        		//播放器的一些参数
        		container: document.getElementById('dplayer'),
        		autoplay: false, //是否自动播放
        		theme: '#FADFA3', //主题色
        		loop: false, //视频是否循环播放
        		lang: 'zh-cn',
        		screenshot: false, //是否开启截图
        		hotkey: true, //是否开启热键
        		preload: 'auto', //视频是否预加载
        		volume: 0.7, //默认音量
        		mutex: true, //阻止多个播放器同时播放，当前播放器播放时暂停其他播放器
        		// logo:res.data.vod_pic,
        		video: {
        			url: res.data.vod_play_url, //视频地址
        			type: 'customHls',
        			customType: {
        				customHls: function(video, player) {
        					const hls = new Hls() //实例化Hls  用于解析m3u8
        					hls.loadSource(video.src)
        					hls.attachMedia(video)
        				}
        			},
        		},
        	});
        
        
        
        	if(this.shengyu > 0){
        		 return
        	}
        
        	if (this.videoDetail.duration == 60 && this.shengyu == 0) {
        		this.buyShow = true
        		this.dp.on('playing', () => {
        			console.log('开始播放')
        			// console.log(this.dp.video.currentTime)
        			if (this.dp.video.currentTime > 60 && this.shengyu == 0) {
        				this.pause()
        			}
        		})
        
        		this.dp.on('timeupdate', () => {
        			if (this.dp.video.currentTime > 60) {
        				if (this.videoDetail.is_purchase == 5 && this.shengyu == 0) {
        					uni.showToast({
        						title: '请充值会员',
        						icon: 'error',
        						duration: 3000
        					})
        
        					setTimeout(() => {
        						uni.navigateTo({
        							url: '/pages/recharge/recharge'
        						})
        					}, 4000)
        				}
        			}
        		})
        
        	}
        
        	if (this.videoDetail.vod_tag.length > 0) {
        		this.videoDetail.vod_tag_li = this.videoDetail.vod_tag.split('#')
        		this.videoDetail.vod_tag_li.shift()
        	}
        
        
        }).catch(err => {
        	console.log(err)
        })
        

		},
		onShow() {

			this.banner_tuijian = uni.getStorageSync('array_banner_dianbo')
			this.videoInfo = uni.getStorageSync('videoInfo') ? JSON.parse(uni.getStorageSync('videoInfo')) : null

			if (this.videoInfo == null) {
				this.getMpVideoRandomList()
			} else {
				this.getVideoInfo()

			}
			this.getVideoAllList()
			// 
			let data = {
				id: this.videoInfo.vod_id ? this.videoInfo.vod_id : this.videoInfo.id
			}
			videoService.getVideoInfo(data).then(res => {
				//新片榜
				if (res.code != 1) {
					uni.showToast({
						title: res.message || '请求失败',
						icon: 'none'
					});
					return
				}
				this.videoDetail = res.data
				this.dp = new Dplayer({
					//播放器的一些参数
					container: document.getElementById('dplayer'),
					autoplay: false, //是否自动播放
					theme: '#FADFA3', //主题色
					loop: false, //视频是否循环播放
					lang: 'zh-cn',
					screenshot: false, //是否开启截图
					hotkey: true, //是否开启热键
					preload: 'auto', //视频是否预加载
					volume: 0.7, //默认音量
					mutex: true, //阻止多个播放器同时播放，当前播放器播放时暂停其他播放器
					// logo:res.data.vod_pic,
					video: {
						url: res.data.vod_play_url, //视频地址
						type: 'customHls',
						customType: {
							customHls: function(video, player) {
								const hls = new Hls() //实例化Hls  用于解析m3u8
								hls.loadSource(video.src)
								hls.attachMedia(video)
							}
						},
					},
				});
			
			
			
				if(this.shengyu > 0){
					 return
				}
			
				if (this.videoDetail.duration == 60 && this.shengyu == 0) {
					this.buyShow = true
					this.dp.on('playing', () => {
						console.log('开始播放')
						// console.log(this.dp.video.currentTime)
						if (this.dp.video.currentTime > 60 && this.shengyu == 0) {
							this.pause()
						}
					})
			
					this.dp.on('timeupdate', () => {
						if (this.dp.video.currentTime > 60) {
							if (this.videoDetail.is_purchase == 5 && this.shengyu == 0) {
								uni.showToast({
									title: '请充值会员',
									icon: 'error',
									duration: 3000
								})
			
								setTimeout(() => {
									uni.navigateTo({
										url: '/pages/recharge/recharge'
									})
								}, 4000)
							}
						}
					})
			
				}
			
				if (this.videoDetail.vod_tag.length > 0) {
					this.videoDetail.vod_tag_li = this.videoDetail.vod_tag.split('#')
					this.videoDetail.vod_tag_li.shift()
				}
			
			
			}).catch(err => {
				console.log(err)
			})

		},
		onHide() {
			// this.dp.destroy()
		},
		methods: {
			getValidityPeriodInfo() {
				videoService.validityPeriodInfo().then(res => {
					this.end_time = res.data.end_time
					if (!this.end_time) {
						this.VIPSate = false
						return
					}
					// 获取当前时间
					let currentTime = new Date();
					// 自定义时间
					let customTime = this.end_time
					// 替换字符，变成标准格式  
					customTime = customTime.replace("-", "/");
					customTime = new Date(Date.parse(customTime));
					if (currentTime < customTime) {
						this.VIPSate = true
					} else if (currentTime > customTime) {
						this.VIPSate = false
					}
				}).catch(err => {
					console.log(err)
				})
			},
			pause() {
				this.dp.pause()
			},
			lijigoumai() {
				uni.navigateTo({
					url: '/pages/recharge/recharge'
				})
			},
			goumaihuiyuan() {
				uni.navigateTo({
					url: '/pages/recharge/recharge'
				})
			},
			quanping() {
				//全屏

			},
			dashangItem(item) {
				this.rewardMoney = item
				console.log(this.rewardMoney)
			},
			open() {
				// console.log('open');
			},
			close() {
				this.dashangShow = false
				// console.log('close');
			},
			buyClose() {
				this.zhuangtai = 1
			},
			buyOpen() {
				this.zhuangtai = 5
			},
			handleMoneyCopy() {
				let routes = getCurrentPages(); // 获取当前打开过的页面路由数组
				let curRoute = location.href // 获取当前页面路由，也就是最后一个打开的页面路由
				let userInfo = uni.getStorageSync('userInfo') ? JSON.parse(uni.getStorageSync('userInfo')) : false
				// console.log()

				if (!userInfo) {
					uni.showToast({ //提示
						title: '请先登录'
					})
					return
				}
				let url = curRoute.replace('/videoPlay/videoPlay', '/login/login')
				uni.setClipboardData({
					data: `${url}?invitation_code=${userInfo.invitation_code}`, //要被复制的内容
					success: () => { //复制成功的回调函数
						uni.showToast({ //提示
							title: '复制成功'
						})
					}
				});
			},
			handleCopy() {

				let routes = getCurrentPages(); // 获取当前打开过的页面路由数组
				let curRoute = location.href // 获取当前页面路由，也就是最后一个打开的页面路由
				uni.setClipboardData({
					data: curRoute, //要被复制的内容
					success: () => { //复制成功的回调函数
						uni.showToast({ //提示
							title: ' 复制成功'
						})
					}
				});
			},
			/**
			 * 关注
			 * **/
			setVideoPour() {
				let data = {
					bz_id: this.videoDetail.bozhu_id,
					bz_name: this.videoDetail.bozhu_name
				}
				videoService.setVideoPour(data).then(res => {
					if (res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					uni.showToast({
						title: res.message || '关注成功',
						icon: 'none'
					});
					this.videoDetail.is_user_pour = !this.videoDetail.is_user_pour
				}).catch(err => {
					console.log(err)
				})
			},
			openReward() {
				this.rewardMoney = 0
				// this.rewardVisible = true
				this.dashangShow = true
			},
			/**
			 * 打赏
			 * **/
			setVideoReward() {
				let data = {
					money: this.rewardMoney,
					video_id: this.videoDetail.vod_id
				}
				videoService.setVideoReward(data).then(res => {
					if (res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					uni.showToast({
						title: res.message || '打赏成功',
						icon: 'none'
					});
					this.rewardVisible = false
				}).catch(err => {
					console.log(err)
				})
			},
			/**
			 * 获取视频评论列表
			 * **/
			getVideoCommentList() {
				let data = {
					video_id: this.videoDetail.vod_id,
					page: 1,
					limit: 1000
				}
				videoService.getVideoCommentList(data).then(res => {
					if (res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.commentList = res.data.data
					console.log("commentList:", this.commentList)
				}).catch(err => {
					console.log("err:", err)
				})
			},
			/**
			 * 评论
			 * */
			handleComment() {
				let data = {
					content_id: this.videoDetail.vod_id, //视频id
					content_title: this.videoDetail.vod_title, //视频标题
					ucontent: this.comText, //评论内容
				}
				videoInfoService.publishComments(data).then(res => {
					if (res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.publishVisible = false
					this.videoDetail.is_comment_count += 1
					this.comText = ''
				}).catch(err => {
					console.log("err:", err)
				})
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
					if (res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.videoDetail.is_fabulous = !this.videoDetail.is_fabulous
					this.getVideoInfo()
				}).catch(err => {
					console.log(err)
				})
			},
			publish() {
				this.publishVisible = true
			},
			closeComment() {
				this.msgVisible = false
			},
			closePublish() {
				this.publishVisible = false
			},
			closeReward() {
				this.rewardVisible = false
			},
			openMsgs() {
				this.msgVisible = true
				this.getVideoCommentList()
			},
			setCurrentVideo(video) {
				// console.log(video)
				this.videoInfo = video
				// this.getVideoInfo()
				if (this.videoInfo.vod_play_from.indexOf("m3u8") != -1) {
					// uni.setStorageSync('sortVideoInfo',JSON.stringify(videoInfo))
					console.log(video)
					uni.setStorageSync('videoInfo', JSON.stringify(this.videoInfo))
					setTimeout(() => {
						this.$router.go(0)
					}, 100)
					return
				}
			},
			//获取短视频随机列表
			getMpVideoRandomList() {
				videoService.getMpVideoRandomList().then(res => {
					if (res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					this.videoList = res.data.data
					if (this.videoList.length > 0) {
						this.videoList.forEach(el => {
							el.vod_tag_li = []
							if (el.vod_tag) {
								el.vod_tag_li = el.vod_tag.split('#')
								el.vod_tag_li.shift()
							}
						})
					}

					this.videoInfo = this.videoList[0]
					this.getVideoInfo()
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
					id: this.videoInfo.vod_id ? this.videoInfo.vod_id : this.videoInfo.id
				}
				videoService.getVideoInfo(data).then(res => {
					//新片榜
					if (res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}

					this.videoDetail = res.data
					localStorage.setItem('info', JSON.stringify(res.data))
					if (this.videoDetail.vod_tag.length > 0) {
						this.videoDetail.vod_tag_li = this.videoDetail.vod_tag.split('#')
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
					limit: 5,
					type: 'text',
					is_size: 1, //0:短视频 1：长视频，
					labels: '',
					video_name: '',
					video_id: ''
				}
				videoService.getVideoAllList(data).then(res => {
					this.allVideoList = res.data.data
					if (this.allVideoList.length > 0) {
						this.allVideoList.forEach(el => {
							el.labelList = []
							if (el.labels && el.labels.length > 0) {
								el.labelList = el.labels.split('#')
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
	.vipBuy {
		width: 500upx;
		height: 300upx;
		border-radius: 20upx;

		.vipBox {
			width: 500upx;
			height: 300upx;
			border-radius: 20upx;

			.shang {
				background-color: #007aff;
				color: #fff;
				width: 100%;
				height: 65%;
				font-size: 28upx;

			}

			.xia {
				width: 100%;
				height: 35%;
				display: flex;
				align-items: center;
				justify-content: space-around;
				background-color: #fff;

				.btn {
					width: 170upx;
					height: 70upx;
					border-radius: 30upx;
					font-size: 28upx
				}
			}
		}


	}

	page {
		height: 100%;
	}

	.disc {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	}

	.dis {
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.contentBox {
		width: 100%;
		height: 600upx;

		.title {
			font-size: 32upx;
		}

		.listBox {
			width: 90%;
			height: 200upx;
			display: flex;
			align-items: center;
			justify-content: space-around;
			flex-wrap: wrap;
			margin: 0 auto;

			.listItem {
				width: 180upx;
				height: 70upx;
				background-color: #007aff;
				color: #fff;
				border-radius: 20upx;

				image {
					width: 40upx;
					height: 40upx;
					margin-right: 10upx;
				}
			}

		}

		.dashangBtn {
			width: 90%;
			border-radius: 40upx;
			color: #fff;
			height: 80upx;
			background-color: #007aff;
			margin-top: 20upx;
		}
	}

	.vdieo {
		height: 100%;
		overflow: auto;
		position: relative;

		.video_iframe {
			width: 100%;
			height: 100%;
		}

		.vdieo_play {
			height: 400rpx;
			overflow: hidden;
			display: flex;
			justify-content: center;
			align-items: center;
			position: relative;
		}

		.vdieo_notice {
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

		.vdieo_discount {
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

		.video_name {
			font-size: 22px;
			font-family: PingFang SC;
			font-weight: bold;
			color: #333333;
		}

		.video_brife {
			padding: 16rpx 25rpx;
		}

		.video_num {
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #999999;
		}

		.video_labels {
			display: flex;
			padding: 10rpx 0;
		}

		.vid_p_body {
			height: calc(100% - 60rpx);
			display: flex;
			align-content: center;
			justify-content: center;
		}

		.my_back {
			width: 50rpx;
			height: 50rpx;

			img {
				width: 100%;
				height: auto;
			}
		}

		.video_label {
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

		.video_issue {
			display: flex;
			padding: 16rpx 25rpx;
		}

		.video_i_header {
			width: 60rpx;
			height: 60rpx;
			border-radius: 30rpx;
			border: 1px solid #999999;
			margin-right: 20rpx;
		}

		.video_publisher {
			font-size: 16px;
			font-family: PingFang SC;
			font-weight: bold;
			color: #333333;
		}

		.video_follow {
			// width: 100rpx;
			height: 50rpx;
			padding: 0 10rpx;
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

		.video_bozhu {
			display: flex;
			align-items: center;
		}

		.video_use {
			display: flex;
			justify-content: space-between;
			padding: 16rpx 25rpx;
		}

		.video_control {
			display: flex;
			flex-direction: column;
			align-items: center;

			img {
				width: 60rpx;
				height: auto;
			}

			text {
				font-size: 13px;
				font-family: PingFang SC;
				font-weight: 500;
				color: #999999;
			}
		}

		.video_poster {
			height: 200rpx;

			img {
				height: 100%;
				width: 100%;
			}
		}

		.video_recommend {
			padding: 16rpx 25rpx;
		}

		.video_reco_title {
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #333333;
		}

		.video_reco_row {
			display: flex;
			margin-bottom: 20rpx;
		}

		.video_reco_poster {
			position: relative;
			width: 250rpx;
			height: 130rpx;
			margin-right: 30rpx;

			img {
				height: 100%;
				width: 100%;
			}
		}

		.video_reco_text {
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #333333;
			line-height: 17px;
			flex: 1;
		}

		.video_reco_vip {
			width: 60rpx;
			height: 28rpx;
			background: #F5DABE;
			border-radius: 0px 0px 0px 4px;
			right: 0;
			position: absolute;
			top: 0;
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #682604;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.vid_modal {
			height: 100%;
			position: relative;
		}

		.vid_panel {
			position: absolute;
			bottom: 0;
			// max-height: 60%;
			width: 100%;
			border-top-left-radius: 10rpx;
			border-top-right-radius: 10rpx;
			background-color: white;
		}

		.vid_m_row {
			display: flex;
			justify-content: center;
			align-items: center;
			border-bottom: 1px solid #999999;
			padding: 8rpx 20rpx;
		}

		.vid_m_reward {
			border-bottom: 1px solid #999999;
			height: 80rpx;
			padding-left: 10rpx;

		}

		.vid_m_head {
			height: 70rpx;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.vid_m_body {
			// display: flex;
			// justify-content: center;
			// align-items: center;
			max-height: calc(50vh - 70rpx);
			padding: 0 40rpx;
			overflow-y: auto;
		}

		.vid_m_title {
			flex: 1;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.vid_m_cancel {
			width: 80rpx;
			height: 80rpx;
			margin: 0 0 0 auto;

			img {
				width: 100%;
				height: 100%;
			}
		}

		.vid_pub_body {
			max-height: calc(50vh - 70rpx);
			padding: 0 40rpx;
			overflow-y: auto;
		}

		.vid_pub_send {
			display: flex;
			justify-content: right;
			align-items: center;
			padding: 10rpx 0 10rpx 0;

		}

		.vid_pub_txt {
			border: 1px solid #E1E1E1;
			width: 100%;
		}

		.vid_reward_panel {
			bottom: 55%;
		}
	}
</style>
