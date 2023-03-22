<template>
	<view class="loginPage">
		<view class="login-form">
			<view class="title-form">信息修改</view>
			<view class="body-form">
				<view class="body-form-item">
					<text class="label-form">昵称:</text>
					<input type="text" placeholder="昵称" maxlength="11" :value="form.nickname" v-model="form.nickname">
				</view>
				<view class="body-form-item">
					<text class="label-form">密码:</text>
					<input  maxlength="26" placeholder="请输入您的密码" :value="form.pwd" v-model="form.pwd">
					<view class="more">
						<text class="iconfont icon-close1" ></text>
						<text ></text>
						<text ></text>
					</view>
				</view>
				<view class="btn-info">
					<view class="loginBtn">
						<text class="loginBtn" style="opacity:0.4" @click="edits()">修改</text>
					</view>
				
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import userService from '@/service/userService.js'
	export default {
		data() {
			return {
				form: {
					nickname: '',
					pwd: '',
					token:'',
				},
			};
		},
		mounted() {
			this.form.nickname = localStorage.getItem('nickname');
		},
		
		methods: {
			edits(){
				console.log(this.form)
				//修改昵称密码
				this.form.token = uni.getStorageSync('token')
				userService.userInfoEdit(this.form).then(res => {
					
					if(res.code == 1) {
						uni.showToast({
							title:'修改成功',
							duration:500,
							icon:arguments
						})
						
						uni.switchTab({
							url: '/pages/index/index'
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
			
		},

	}
</script>

<style lang="scss" scoped>
	.loginPage {
		width: 100%;
		min-height: 100%;
		background: url(/static/login/loginbg.png) no-repeat;
		background-size: cover;
		position: absolute;

		.goRegister {
			position: absolute;
			top: 50rpx;
			right: 30rpx;
			font-size: 28rpx;
			color: #FFFFFF;
			opacity: 0.8;
		}

		.login-form {
			position: absolute;
			top: 16%;
			left: 6%;
			width: 650rpx;
			height: 600rpx;

			.title-form {
				font-size: 42rpx;
				font-family: PingFang SC;
				font-weight: 500;
				color: black;
			}

			.body-form {
				margin-top: 40rpx;

				.body-form-item {
					width: 100%;
					height: 100rpx;
					// color: #FFFFFF;
					font-size: 32rpx;
					margin-bottom: 44rpx;
					display: flex;
					align-items: center;
					justify-content: space-between;
					height: 100rpx;
					border-bottom: 2rpx solid #C4C4C4;
					position: relative;

					.label-form {
						position: absolute;
						top: -8rpx;
						left: 2rpx;
						font-size: 26rpx;
					}

					.more {
						position: absolute;
						display: flex;
						align-items: center;
						justify-content: space-between;
						right: 10rpx;
						width: 240rpx;
						height: 40rpx;
						font-size: 30rpx;
						// color: #FFFFFF;
					}
				}

				/* 按钮 */
				.btn-info {
					height: 100rpx;
					margin-top: 80rpx;

					.loginBtn,
					.weixinLoginBtn {
						display: flex;
						align-items: center;
						justify-content: center;
						margin: 0 auto;
						border-radius: 500rpx;
						color: #FFFFFF;
						font-size: 40rpx;
						opacity: 0.4;
						width: 100%;
						height: 100rpx;
						width: 90%;
					}

					.loginBtn {
						background: black;
					}

					.weixinLoginBtn {
						background: #4FEB77;
						margin-top: 22rpx;
					}
				}
			}
		}
	}
</style>
