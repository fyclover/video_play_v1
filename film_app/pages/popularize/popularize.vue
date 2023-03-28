<template>
	<view class="content">
		<view style="width: 100%;height: 200upx;"></view>
		
		<view class="erweima">
			<view class="top disc">
				<view class="tuiguang dis">您的推广码</view>
				<view class="ma dis">{{userInfo.invitation_code}}</view>
			</view>
			<view class="bottom disc">
				<image :src="info.qrcode" mode=""></image>
				<a :href="info.url" style='text-align: center;'>{{info.url}}</a>
			</view>
			<view class="touxiang dis">
				<image src="../../static/head/touxiang2.jpg" mode=""></image>
			</view>
		</view>
		
		<view class="twoBox">
			<a class="item dis"  style='text-decoration: aliceblue;'  :href="'https://api.bxgtv.top/home/qrcode/download?name='+info.name">
				<image src="../../static/popularize/xiazai.png" mode=""></image>
				保存图片分享
				</a>
			<view class="item dis" @tap="copyMessage(info.url)">
				<image src="../../static/popularize/lainjie.png" mode=""></image>
				复制链接分享
				</view>
		</view>
		
		<view class="title dis">邀请步骤</view>
		
		<view class="da">
			<view class="right">
				<view class="item">
					<view class="ops dis">1</view>
					<view class="tit">第一步</view>
					<view class="de">保存图片或复制链接</view>
				</view>
				<view class="item">
					<view class="ops dis">2</view>
					<view class="tit">第二步</view>
					<view class="de">将图片或各种链接通过各种渠道发送出去</view>
					<view class="imgs">
						<image src="../../static/popularize/weixin.png" mode=""></image>
						<image src="../../static/popularize/zhifubao.png" mode=""></image>
						<image src="../../static/popularize/weibo.png" mode=""></image>
						<image src="../../static/popularize/momo.png" mode=""></image>
					</view>
					<view class="de">等平时常用的社交软件</view>
					<view class="imgs">
						<image src="../../static/popularize/lol.png" mode=""></image>
						<image src="../../static/popularize/pubg.png" mode=""></image>
						
					</view>
					<view class="de">等各类游戏公共平道</view>
				</view>
				<view class="item">
					<view class="ops dis">3</view>
					<view class="tit">第三步</view>
					<view class="de">被邀请用户下载进入App内生效</view>
					
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import videoService from '@/service/videoService.js'
	export default {
		data() {
			return {
				userInfo:[],
				info:{},
				src:''
			};
		},
		onLoad() {
			
		    this.userInfo = uni.getStorageSync('userInfo') ? JSON.parse(uni.getStorageSync('userInfo')) : null
			console.log( this.userInfo)
			let data={
				'code':this.userInfo.invitation_code	
			}
			videoService.erweima(data).then(res=>{
				console.log(res,'邀请数据')
				this.info=res.data
			})
		},
		methods:{
			       xiazai(url) {
					   console.log(url)
							// var oA = document.createElement("a");
							// oA.download = url; // 设置下载的文件名，默认是'下载'
							// oA.href = '';
							// document.body.appendChild(oA);
							// oA.click();
							// oA.remove(); // 下载之后把创建的元素删除
							let data={
								"name":url
							}
							videoService.download(data).then(res=>{
								console.log(res)
							})
						},
			 //复制
			    copyMessage(value) {
			      uni.setClipboardData({
			        data: value,
			        success: function (res) {
			          uni.getClipboardData({
			            success: function (res) {
			              uni.showToast({
			                title: "复制成功",
			              });
			            },
			          });
			        },
			      });
			    },

		},
	}
</script>

<style lang="less" scoped  src='./popularize.less'>

</style>
