<template>
	<view class="remoney">
		<view class="remoney_top">
			<img :src="configData.image_url+configData.erweima" alt="">
			
			<button size="mini" class="remoney_btn" type="primary">二维码</button>
			
			<text class="remoney_cust">在线客户</text>
			<view class="">
				{{configData.add}}
			</view>
			<button size="mini" class="remoney_btn remoney_btn_copy" @click="handleCopy()" type="default">复制地址</button>
		</view>
		<view class="remoney_panel">
			<view class="">
				充值数量
			</view>
			<view>
				<input class="remoney_input" type="text" v-model="money">
			</view>
			<view class="">
				上传支付详情截图
			</view>
			<view class="remoney_upload">
				<uni-file-picker limit="1" title=""
				 @fail="fail" 
				 @select="handleSelect" @delete="handleDelete">
				</uni-file-picker>
			</view>
			<view class="">
				<button size="mini" class="remoney_btn" type="primary" @click="fileUpload()">上传</button>
			</view>
		</view>
		<view class="remoney_confirm">
			<button class="remoney_submit" type="primary" @click="payNow()">提交</button>
		</view>
	</view>
</template>

<script>
	import userService from '@/service/userService.js'
	import videoService from '@/service/videoService.js'
	import config from '@/common/config.js'
	export default {
		data() {
			return {
				configData: {},
				money: '',
				action: config.baseUrl + '/home/upload',
				files: [],
				imgRemoteUrl: '',
			}
		},
		onShow() {
			this.getUserCofig()
		},
		methods: {
			/**
			 * 获取配置
			 * **/
			getUserCofig() {
				userService.getUserConfig({name: 'add_usdt'}).then(res => {
					this.configData =  res.data
					// console.log("this.configData:",this.configData)
				}).catch(err => {
					console.log("err:",err)
				})
			},
			handleCopy() {
				uni.setClipboardData({
					data: this.configData.add,//要被复制的内容
					success:() => {//复制成功的回调函数
						uni.showToast({//提示
							title:'复制成功' 
						})
					}
				});
			},
			handleSelect(file) {
				console.log('filew:',file)
				file.tempFiles.forEach(el => {
					this.files.push(el.file)
				})
				
			},
			fail(file) {
				console.log("eilw:",file)
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
				let formData = new FormData()
				formData.append('image',this.files[0])
				let data = {
					image: this.files[0]
				}
				userService.fileUpload(data).then(res => {
						if(res.code == 1) {
							uni.showToast({
								title: res.message || '请求成功',
								icon: 'none'
							});
							this.imgRemoteUrl = res.data[0]
							return
						}
				}).catch(err => {
					console.log("err:",err)
				})
			},
			payNow() {
				if(parseFloat(this.money) < 1 ){
					uni.showToast({
						title: '请输入充值金额',
						icon: 'none'
					});
					return
				}
				if(this.imgRemoteUrl.length < 1 ){
					uni.showToast({
						title: '请上传充值截图凭证',
						icon: 'none'
					});
					return
				}
				let data = {
					goods_id: uni.getStorageSync('rechargeMoneyGoodsId'),
					pay_price: this.money,
					u_image: this.imgRemoteUrl,
				}
				videoService.upurchase(data).then(res => {
					if(res.code == 1) {
						uni.showToast({
							title: res.message || '请求成功',
							icon: 'none'
						});
						setTimeout(() => {
							uni.switchTab({
								url: "/pages/center/center"
							})
						},1500)
						
						return
					}
					uni.showToast({
						title: res.message || '请求失败',
						icon: 'none'
					});
					
				}).catch(err => {
					console.log('err:',err)
				})
			},
			
		}
	}
</script>

<style lang="scss">
page{
	height: 100%;
}
.remoney{
	height: 100%;
	
	.remoney_top{
		display: flex;
		flex-direction: column;
		background-color: #F7F6FB;
		padding: 20rpx 0;
		justify-content: center;
		align-items: center;
		
		img{
			width: 200rpx;
			height: 200rpx;
			border-radius: 20rpx;
		}
	}
	.remoney_btn{
		width: 200rpx;
		border-radius: 40rpx;
		margin-top: 20rpx;
	}
	.remoney_cust{
		color: blue;
		margin-top: 20rpx;
	}
	.remoney_btn_copy{
		border: 1px solid skyblue;
	}
	.remoney_panel{
		padding: 30rpx 40rpx;
	}
	.remoney_input{
		background-color: #F7F6FB;
		height: 60rpx;
		margin: 20rpx 0;
		padding: 0 30rpx;
	}
	.remoney_upload{
		margin-top: 20rpx;
	}
	.remoney_confirm{
		padding: 0 30rpx;
		text-align: center;
	}
	.remoney_submit{
		width: 100%;
	}
}
</style>
