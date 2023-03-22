<template>
	<view class="msg">
		<view class="msg_top">
			<view class="msg_type" @click="setNav('fan')">
				<img src="/static/msg/fen2.png" alt="">
				<text :class="{'msg_active': currentNav=='fan'}">粉丝</text>
				<text class="msg_number" v-if="fanUnread>0">{{fanUnread}}</text>
			</view>
			<view class="msg_type" @click="setNav('like')">
				<img src="/static/msg/like.png" alt="">
				<text :class="{'msg_active': currentNav=='like'}">点赞</text>
				<text class="msg_number" v-if="fabulousUnread>0">{{fabulousUnread}}</text>
			</view>
			<view class="msg_type" @click="setNav('comment')">
				<img src="/static/msg/msg2.png" alt="">
				<text :class="{'msg_active': currentNav=='comment'}">评论回复</text>
				<text class="msg_number" v-if="commentUnread>0">{{commentUnread}}</text>
			</view>
		</view>
		<view class="msg_list" >
			<view class="msg_none" v-if="showNone">
				暂无消息
			</view>
			<template v-if="currentNav!='fan'">
				<view class="msg_row" v-for="(item,index) in msgList" :key="index">
					<view class="msg_img">
						<img :src="`/static/head/touxiang${item.randomNum}.jpg`" alt="" v-if="item.uhead.length<1">
						<img :src="item.uhead" alt="" v-if="item.uhead.length>0">
					</view>
					<view class="msg_text">
						<view class="msg_title">{{item.content_title}}</view>
						<view class="msg_content">
							{{item.ucontent}}
						</view>
					</view>
				</view>
			</template>
			<template v-if="currentNav=='fan'">
				<view class="msg_row" v-for="(item,index) in fanList" :key="index">
					<view class="msg_img">
						<img :src="`/static/head/touxiang${item.randomNum}.jpg`" alt="" v-if="item.uhead.length<1">
						<img :src="item.uhead" alt="" v-if="item.uhead.length>0">
					</view>
					<view class="msg_text">
						<view class="msg_content">{{item.create_time}}</view>
						<view class="msg_title">
							{{item.nickname}}
						</view>
					</view>
				</view>
			</template>
			<!-- <view class="msg_row">
				<view class="msg_img">
					<img src="/static/msg/tv.png" alt="">
				</view>
				<view class="msg_text">
					<view class="msg_title">系统消息</view>
					<view class="msg_content">
						尊敬的用户您好！001号客服为您服务~
					</view>
				</view>
			</view>
			<view class="msg_row">
				<view class="msg_img">
					<img src="/static/msg/light.png" alt="">
				</view>
				<view class="msg_text">
					<view class="msg_title">系统消息</view>
					<view class="msg_content">
						尊敬的用户您好！001号客服为您服务~
					</view>
				</view>
			</view>
			<view class="msg_row">
				<view class="msg_img">
					<img src="/static/msg/warning.png" alt="">
				</view>
				<view class="msg_text">
					<view class="msg_title">系统消息</view>
					<view class="msg_content">
						尊敬的用户您好！001号客服为您服务~
					</view>
				</view>
			</view> -->
		</view>
	</view>
</template>

<script>
	import videoService from '@/service/videoService.js'
	export default {
		data() {
			return {
				page: 1,
				msgList: [],
				currentNav: 'fan',
				commentUnread: 0,
				fabulousUnread: 0,
				fanUnread: 0,
				fanList: [],
				showNone:false,
			}
		},
		onShow() {
			this.getMyVidoCommentUnread()
			this.getMyVidoFabulousUnread()
			this.setNav('fan')
		},
		methods: {
			/**
			 * 粉丝未读
			 * **/
			getMyVidoUserPourUnread(){
				videoService.getMyVidoUserPourUnread({}).then(res => {
					this.fanUnread = res.data
				}).catch(err => {
					console.log(err)
				})
			},
			/**
			 * 评论未读
			 * **/
			getMyVidoCommentUnread(){
				videoService.getMyVidoCommentUnread({}).then(res => {
					this.commentUnread = res.data
				}).catch(err => {
					console.log(err)
				})
			},
			/**
			 * 点赞未读
			 * **/
			getMyVidoFabulousUnread(){
				videoService.getMyVidoCommentUnread({}).then(res => {
					this.fabulousUnread =  res.data
				}).catch(err => {
					console.log(err)
				})
			},
			setNav(type){
				this.page = 1
				this.currentNav = type
				this.msgList = []
				this.fanList = []
				this.showNone = false
				
				switch(type) {
					case 'fan':
						this.getMyVidoUserPour()
					break;
					case 'like':
						this.getMyVidoFabulous()
					break;
					case 'comment':
						this.getMyVidoMsg()
					break;
				}
			},
			
			/**
			 * 获取我的粉丝消息
			 * **/
			getMyVidoUserPour() {
				let data = {
					page: this.page,
					limit: 1000
				}
				videoService.getMyVidoUserPour(data).then(res => {
					this.fanList = res.data.data
					if(this.fanList.length < 1) {
						this.showNone = true
						return
					}
					this.fanList.forEach(el => {
						el.randomNum = Math.floor(Math.random()*10) % 9+1;
					})
				}).catch(err => {
					console.log(err)
				})
			},
			/**
			 * 获取评论视频消息
			 * **/
			getMyVidoMsg() {
				let data = {
					page: this.page,
					limit: 1000
				}
				
				videoService.getMyVidoMsg(data).then(res => {
					this.msgList = res.data.data
					if(this.msgList.length < 1) {
						this.showNone = true
						return
					}
					this.msgList.forEach(el => {
						el.randomNum = Math.floor(Math.random()*10) % 9+1
					})
				}).catch(err => {
					console.log(err)
				})
			},
			/**
			 * 点赞我的消息
			 * **/
			getMyVidoFabulous() {
				let data = {
					page: this.page,
					limit: 1000
				}
				videoService.getMyVidoFabulous(data).then(res => {
					this.msgList = res.data.data
					if(this.msgList.length < 1) {
						this.showNone = true
						return
					}
					this.msgList.forEach(el => {
						el.randomNum = Math.floor(Math.random()*10) % 9+1
					})
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
	.msg{
		height: 100%;
		.msg_top{
			height: 200rpx;
			width: 95vw;
			margin: 0 auto;
			border-bottom: 1px solid #FAFAFA;
			display: flex;
			justify-content: space-around;
			align-items: center;
		}
		.msg_active{
			color: red;
		}
		.msg_type{
			display: flex;
			flex-direction: column;
			width: 20vw;
			height: 160rpx;
			justify-content: center;
			align-items: center;
			font-size: 12px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #666666;
			position: relative;
			img{
				width: 100rpx;
				height: 100rpx;
				margin-bottom: 10rpx;
			}
		}
		.msg_list{
			margin:20rpx 0 0 0 ;
			padding: 20rpx 0 0 30rpx;
		}
		.msg_row{
			height: 160rpx;
			display: flex;
			align-items: center;
			margin-bottom: 20rpx;
		}
		.msg_img{
			width: 120rpx;
			height: 120rpx;
			margin-right: 8rpx;
			img{
				width: 100%;
				height: 100%;
			}
		}
		.msg_text{
			height: 100%;
			flex:1;
			padding-left: 22rpx;
			display: flex;
			flex-direction: column;
			justify-content: center;
			border-bottom:1px solid #E5E5E5 ;
		}
		.msg_title{
			font-size: 18px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #333333;
		}
		.msg_content{
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #B4B4B4;
		}
		.msg_none{
			display: flex;
			justify-content: center;
		}
		.msg_number{
			width: 40rpx;
			height: 40rpx;
			background-color: red;
			color: white;
			position: absolute;
			border-radius: 50%;
			top: 8rpx;
			right: 16rpx;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	}
</style>
