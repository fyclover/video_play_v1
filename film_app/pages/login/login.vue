<template>
	<view class="loginPage">
		<view class="goRegister" @click="goRegister()">免费快捷注册</view>
		<view class="login-form">
			<view class="title-form">账号登录</view>
			<view class="body-form">
				<view class="body-form-item">
					<text class="label-form" v-if="form.phone">账号:</text>
					<input type="text" placeholder="邮箱/手机号/账号" maxlength="11" data-key="mobile"
						:style="form.phone ? 'margin-top: 20rpx;' : ''" v-model="form.phone" />
				</view>
				<view class="body-form-item">
					<text class="label-form" v-if="form.pwd">密码:</text>
					<input :password='!isPassword' v-model="form.pwd" maxlength="26" placeholder="请输入您的密码"
						:style="form.pwd ? 'margin-top: 20rpx;' : ''">
					<view class="more">
						<text class="iconfont icon-close1" v-if="form.pwd" @click="form.pwd=undefined"></text>
						<text v-else></text>
						<text class="iconfont" :class="isPassword?'icon-eye-on':'icon-eye-off'"
							@click="isPassword = !isPassword"></text>
						<!-- <text>|</text>
						<text @click="forgetPassword()">忘记密码</text> -->
					</view>
				</view>
				<view class="btn-info">
					<view class="loginBtn" :style="isLogin?'opacity:0.8':'opacity:0.4'" @click="isLogin?login():''">
						<text>登录</text>
					</view>
					<!--
					<view class="weixinLoginBtn" style="opacity:0.8" @click="weixinLogin()">
						<text>微信登录</text>
					</view>
					 -->
				</view>
			</view>
		</view>
		
		<view class="modal" v-if="modalVisible">
			<view class="index_m_panel">
				<view class="index_m_head">
					注册
				</view>
				<view class="index_m_body">
					<view class="body-form-item">
						<input type="text" v-model="registerData.phone" placeholder="手机号">
					</view>
					<view class="body-form-item">
						<input  :password='true' v-model="registerData.pwd" placeholder="密码">
					</view>
					<view class="body-form-item">
						<input  :password='true' v-model="registerData.confirmPwd" placeholder="确认密码">
					</view>
					<view class="body-form-item">
						<input  type="text" v-model="registerData.codes" placeholder="邀请码">
					</view>
					
				</view>
				<view class="index_m_btn" @click="register()()">
					确定
				</view>
			</view>
			<view class="index_m_bottom" @click="closeModal()">
				<img src="/static/img_index/close.png" alt="">
			</view>
		</view>
	</view>
</template>

<script>
	import loginService from '@/service/loginService.js'
	export default {
		data() {
			return {
				modalVisible:false,
				// 是否显示密码
				isPassword: false,
				// 是否可点击登录
				// isLogin: false,
				isLogin: true,
				// 提交的表单数据
				form: {
					phone: undefined,
					pwd: undefined
				},
				code: '',
				registerData: {
					phone: '',
					pwd: '',
					confirmPwd: '',
					codes: ''
				},
			};
		},
		onShow() {
			
			let pages = getCurrentPages();
			let page = pages[pages.length - 1].$page.fullPath;  //完整路由地址
			this.registerData.codes = page.split('invitation_code=')[1]  //携带的type参数
			// this.out();
			if(this.registerData.codes) {
				this.goRegister()
			}
			uni.clearStorageSync()
		},
		onLoad: function(option) { //option为object类型，会序列化上个页面传递的参数||
			
		},
		methods: {
			/**
			 * 打开注册
			 * **/
			goRegister() {
				this.modalVisible = true
			},
			/**
			 * 注册
			 * **/
			register() {
				//this.form
				if(this.registerData.pwd!=this.registerData.confirmPwd) {
					uni.showToast({
						title: '两次密码不一致',
						icon: 'none'
					});
					return
				}
				
				loginService.register(this.registerData).then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					uni.showToast({
						title: '注册成功',
						icon: 'none'
					});
					this.closeModal()
				}).catch(err => {
					console.log("err:",err)
				})
			},
			login() {
				let data = {
					pwd : '123456',
					phone : '15800000001'
				}
				//this.form
				loginService.login(this.form).then(res => {
					uni.setStorageSync('token',res.data.token)
					uni.setStorageSync('isLogged',1)
					uni.setStorageSync('userInfo',JSON.stringify(res.data))
					if(res.code == 1) {
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
			},
			/**
			 * 关闭弹窗
			 * **/
			closeModal() {
				this.modalVisible = false;
			},
			//忘记密码
			forgetPassword() {
				loginService.forgetPassword(this.form).then(res => {
					console.log("res:",res)
					if(res.code == 1) {
						
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
		}
		.goRegister {
			position: absolute;
			top: 50rpx;
			right: 30rpx;
			font-size: 28rpx;
			color: #000000;
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
		
		.index_m_head{
			text-align: center;
			font-size: 18px;
			font-family: PingFang SC;
			font-weight: bold;
			color: #333333;
			line-height: 18px;
		}
		.index_m_panel{
			width: 95%;
			height: 780rpx;
			background: #FFFFFF;
			border-radius: 10rpx;
			margin: 30% auto 0 auto;
			padding-top: 30rpx;
		}
		.index_m_body{
			height: 610rpx;
			margin-top: 20rpx;
			font-size: 14px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #666666;
			text-align: center;
			padding: 0 20rpx;
		}
		.index_m_btn{
			width: 304rpx;
			height: 70rpx;
			background: #3F6AF4;
			border-radius: 36rpx;
			font-size: 18px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #FFFFFF;
			display: flex;
			justify-content: center;
			align-items: center;
			margin: 0 auto;
		}
		.index_m_bottom{
			display: flex;
			justify-content: center;
			align-items: center;
			margin-top: 20rpx;
			img{
				width: 180rpx;
				height: auto;
			}
		}
		
	}
</style>
