<template>
	<view class="info">
		<view class="info_panel">
			<view class="info_row" @click="headVisible=true">
				<text>头像</text>
				<img  class="info_head" :src="userInfo.head_img" >
				<!-- <img class="info_head" src="/static/msg/msg2.png" alt=""> -->
			</view>
			
			<view class="info_row" @click="phoneVisible=true" >
				<text>手机号码</text>
				<text class="info_id">{{userInfo.phone}}</text>
				<img class="info_next" src="/static/video/next.svg"  alt="">
			</view>
			<view class="info_row">
				<text>昵称</text>
				<view class="info_id info_ne">
					<text >{{userInfo.nickname}}</text>
					<img class="info_next" src="/static/video/next.svg" @click="nicknameedit()"  alt="">
				</view>
			</view>
			<view class="info_row">
				<text>修改密码</text>
				<text class="info_id"></text>
				<img class="info_next" src="/static/video/next.svg" @click="nicknameedit()" alt="">
			</view>
			<!-- <view class="info_row">
				<text>姓别</text>
				<view class="info_id info_ne">
					<text >男</text>
					<img class="info_next" src="/static/video/next.svg" alt="">
				</view>
			</view> -->
		</view>
		<view class="modal" v-if="visible">
			<view class="info_m_con">
				<view class="info_m_panel">
					<view class="info_m_body">
						<view class="info_m_select info_m_select_ac">
							<img src="/static/video/boy.png" alt="">
							<text>我是男生</text>
						</view>
						<view class="info_m_select">
							<img src="/static/video/girl.png" alt="">
							<text>我是女生</text>
						</view>
					</view>
					<view class="info_m_bottom">
						<text class="info_m_cancel" @click="handleCancel()">取消</text>
						<text class="info_m_confirm">确定</text>
					</view>
				</view>
			</view>
		</view>
		
		<view class="modal" v-if="headVisible">
			<view class="info_m_con">
				<view class="info_m_panel">
					<view class="info_m_body">
							<uni-file-picker :height="60" limit="1" title=""
							 @fail="fail" 
							 @select="handleSelect" @delete="handleDelete">
							</uni-file-picker>
						
					</view>
					<view class="info_m_bottom">
						<text class="info_m_cancel" @click="headVisible=false">取消</text>
						<text class="info_m_confirm" @click="fileUpload()">确定</text>
					</view>
				</view>
			</view>
		</view>
		
		<view class="modal" v-if="phoneVisible">
			<view class="info_m_con">
				<view class="info_m_panel">
					<view class="info_m_body">
						<view class="">
							<input v-model="phone" style="border: 1px solid #ccc;height: 60rpx;width: 70vw;" type="text" placeholder="请输入手机号">
						</view>
					</view>
					<view class="info_m_bottom">
						<text class="info_m_cancel" @click="phoneVisible=false">取消</text>
						<text class="info_m_confirm" @click="updatePhone()">确定</text>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import userService from '@/service/userService.js'
	import loginService from '@/service/loginService.js'
	export default {
		data() {
			return {
				visible: false,
				headVisible:false,
				phoneVisible: false,
				userInfo: {},
				files: [],
				phone: '',
				imgRemoteUrl: ''
			};
		},
		mounted() {
			this.getUserInfo()
		},
		methods:{
			updatePhone() {
				loginService.updatePhone({phone: this.phone}).then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return 
					}
					this.phoneVisible = false
					uni.showToast({
						title: res.message || '修改成功',
						icon: 'none'
					});
					this.getUserInfo()
					// uni.setStorageSync('token',res.data.token)
				}).catch(err => {
					console.log("err:",err)
				})
			},
			getUserInfo() {
				
				userService.getUserInfo({}).then(res => {
					this.userInfo = res.data
					localStorage.setItem('nickname',this.userInfo.nickname)
					// localStorage.setItem('phone',this.userInfo.nickname)
				}).catch(err => {
					console.log('err:',err)
				})
			},
			nicknameedit(){
				uni.navigateTo({
					url: '/pages/about/nickname'
				})
			},
			handleCancel() {
				this.visible = false
			},
			handleSelect(file) {
				file.tempFiles.forEach(el => {
					this.files.push(el.file)
				})
			},
			fail(file) {
				console.log("file:",file)
			},
			handleDelete(file){
				let i = -1
				this.files.forEach((el,index) => {
					if(file.uuid == el.uuid) {
						i = index
					}
				})
				this.files.splice(i,1)
				this.imgRemoteUrl = ''
			},
			fileUpload() {
				let imgs = []
				if(this.files.length < 1) {
					return
				}
				this.files.forEach(el => {
					imgs.push(el)
				})
				// let formData = new FormData()
				// formData.append('image',this.files[0])
				let data = {
					image: this.files[0]
				}
				userService.fileUpload(data).then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					if(res.code == 1) {
						uni.showToast({
							title: res.message || '请求成功',
							icon: 'none'
						});
						this.imgRemoteUrl = res.data[0]
						let form = {
							image: this.imgRemoteUrl
						}
						userService.editUserInfo(form).then(res => {
							if(res.code == 1) {
								uni.showToast({
									title: res.message || '请求成功',
									icon: 'none'
								});
								this.getUserInfo()
								this.headVisible = false
								return
							}
							uni.showToast({
								title: res.message || '请求失败',
								icon: 'none'
							});
						}).catch(err => {
							
						})
						return
					}
				}).catch(err => {
					console.log("err:",err)
				})
			},
		}
	}
</script>

<style lang="scss">
	page{
		height: 100%;
	}
	::v-deep .uni-file-picker__container{
		justify-content: center !important;
	}
	.info{
		height: 100%;
		background-color: #F3F3F3;
		padding-top: 30rpx;
	}
	.info_panel{
		height: 100%;
		background-color: #FFFFFF;
	}
	.info_row{
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
	.info_head{
		margin: 0 0 0 auto;
		width: 80rpx;
		height: 80rpx;
		border-radius: 50%;
	}
	.info_id{
		margin: 0 0 0 auto;
		color: #999999;
	}
	.info_ne{
		display: flex;
		align-items: center;
	}
	.info_next{
		width: 40rpx;
		height: auto;
	}
	.info_m_con{
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.info_m_panel{
		width: 90vw;
		height: 360rpx;
		background: #FFFFFF;
		border-radius: 10rpx;
	}
	.info_m_body{
		height: calc(100% - 80rpx);
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.info_m_bottom{
		height: 80rpx;
		display: flex;
		justify-content: center;
		border-top: 1px solid #EFEFEF;
		text{
			display: flex;
			align-items: center;
			justify-content: center;
			width: 50%;
		}
	}
	.info_m_cancel{
		color: #999999;
	}
	.info_m_confirm{
		border-left: 1px solid #EFEFEF;
	}
	.info_m_select{
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #666666;
		height: 100rpx;
		padding: 0 40rpx;
		border-radius: 50rpx;
		border: 1px solid #ABABAB;
		margin: 0 10rpx;
		img{
			width: 50rpx;
			height: auto;
		}
	}
	.info_m_select_ac{
		background: #F6F4FF;
	}
	
</style>
