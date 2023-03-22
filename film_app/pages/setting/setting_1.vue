<template>
	<view class="setting">
		<view class="setting_section">
			<view class="setting_row">
				<text>基本信息</text>
				<view class="setting_id setting_ne" @click="toUserinfo()">
					<text ></text>
					<img class="setting_next" src="/static/video/next.svg" alt="">
				</view>
			</view>
			<view class="setting_row">
				<text>反馈建议</text>
				<view class="setting_id setting_ne">
					<text ></text>
					<img class="setting_next" src="/static/video/next.svg" alt="">
				</view>
			</view>
			<view class="setting_row">
				<text>扫码登录</text>
				<view class="setting_id setting_ne">
					<text ></text>
					<img class="setting_next" src="/static/video/next.svg" alt="">
				</view>
			</view>
			<view class="setting_row">
				<text>清除缓存</text>
				<view class="setting_id setting_ne">
					<text ></text>
					<img class="setting_next" src="/static/video/next.svg" alt="">
				</view>
			</view>
			<view class="setting_row">
				<text>版本号</text>
				<view class="setting_id setting_ne">
					<text ></text>
					<img class="setting_next" src="/static/video/next.svg" alt="">
				</view>
			</view>
			<view class="setting_row">
				<text>关于我们</text>
				<view class="setting_id setting_ne">
					<text ></text>
					<img class="setting_next" src="/static/video/next.svg" alt="">
				</view>
			</view>
		</view>
		<view class="setting_section2">
			<view class="setting_row">
				<text>邀请码</text>
				<view class="setting_id setting_ne">
					<text >JQCC7</text>
					<img class="setting_next" src="/static/video/next.svg" alt="">
				</view>
			</view>
			<view class="setting_row">
				<text>兑换码</text>
				<view class="setting_id setting_ne">
					<text >JQCC7</text>
					<img class="setting_next" src="/static/video/next.svg" alt="">
				</view>
			</view>
		</view>
		<button type="primary" class="setting_btn" @click="logout()">退出</button>
	</view>
</template>

<script>
	import loginService from '@/service/loginService.js'
	export default {
		data() {
			return {
				
			};
		},
		methods: {
			//跳转到用户信息
			toUserinfo() {
				uni.navigateTo({
					url: '/pages/info/info'
				})
			},
			//退出
			logout() {
				loginService.logout({}).then(res => {
					if(res.code == 1) {
						uni.navigateTo({
							url: '/pages/login/login'
						})
						return
					}
					uni.showToast({
						title: res.message || '请求失败',
						icon: 'none'
					});
				}).catch(err => {
					console.log("err:",err)
				})
			}
		}
	}
</script>

<style lang="scss">
	page{
		height: 100%;
	}
	.setting{
		height: 100%;
		background-color: #F3F3F3;
		padding-top: 30rpx;
	}
	.setting_section{
		background-color: #FFFFFF;
	}
	.setting_row{
		display: flex;
		width: 95%;
		border-bottom: 1px solid #EDEDED;
		padding: 40rpx 18rpx; 
		align-items: center;
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #333333;
		margin: 0 auto;
	}
	.setting_id{
		margin: 0 0 0 auto;
		color: #999999;
	}
	.setting_ne{
		display: flex;
		align-items: center;
	}
	.setting_next{
		width: 40rpx;
		height: auto;
	}
	.setting_section2{
		background-color: #FFFFFF;
		margin-top: 30rpx;
	}
	.setting_btn{
		width: 89%;
		margin-top: 50rpx;
	}
</style>
