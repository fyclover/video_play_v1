<template>
	<view class="recharge">
		<view class="recharge_header">
			<view class="recharge_back" @click="goBack()">
				<img src="/static/img_index/back.svg" alt="">
			</view>
			<view class="recharge_h_center">
				<text class="recharge_h_tab " :class="{'recharge_h_active': type=='VIP'}" @click="setRechargeType('VIP')">会员</text>
				<text class="recharge_h_tab"  :class="{'recharge_h_active': type=='wallet'}" @click="setRechargeType('wallet')">钱包</text>
			</view>
			<!-- <view class="recharge_h_right">
				交易明细
			</view> -->
		</view>
		<view class="recharge_section">
			<view class="recharge_top">
				<view class="recharge_user">
					<view class="recharge_head">
						<img src="/static/msg/msg2.png" alt="">
					</view>
					<view class="recharge_info">
						<text class="recharge_nickname">{{userInfoData.nickname}}</text>
						<text class="recharge_id">账号：{{userInfoData.phone}}</text>
					</view>
				</view>
				<view class="recharge_switchs" v-if="type=='VIP'">
					<view class="recharge_switch recharge_switch1 " 
					:class="{'recharge_switch_active': rechargeTab=='vipCard1'}"
					@click="setRechargeTab('vipCard1')">
						<img src="/static/video/diamonds.png" alt="">
						<text>会员卡</text>
					</view>
					<view class="recharge_switch recharge_switch2 "
					 :class="{'recharge_switch_active': rechargeTab=='vipCard2'}"
					 @click="setRechargeTab('vipCard2')">
						<img src="/static/video/diamonds.png" alt="">
						<text>特权卡</text>
					</view>
				</view>
				<view class="recharge_switchs" v-if="type=='wallet'" >
					<view class="recharge_switch recharge_switch1 "
					  :class="{'recharge_switch_active': rechargeTab=='coinWallet1'}"
					  @click="setRechargeTab('coinWallet1')">
						<img src="/static/video/coin.png" alt="">
						<text>金币钱包</text>
					</view>
					<!-- <view class="recharge_switch recharge_switch2 "
					:class="{'recharge_switch_active': rechargeTab=='coinWallet2'}"
					 @click="setRechargeTab('coinWallet2')">
						<img src="/static/video/coin.png" alt="">
						<text>果币钱包</text>
					</view> -->
				</view>
			</view>
			<view class="recharge_body">
				<view class="" v-if="type=='VIP'">
					<view class="recharge_news"  >
						<view class="recharge_n_label">
							最新
						</view>
						<text>资讯</text>
						<text class="recharge_n_msg">新年限时抢购最低价会员卡~  会员视频无限看</text>
					</view>
					<view class="recharge_cards" >
						<view class="recharge_card " :class="{'recharge_card_active': cardActive==item.id}"
						 v-for="(item,index) in setList" :key="index" @click="setCardType(item)">
							<view class="recharge_card_title">{{item.title}}</view>
							<view class="recharge_card_money">
								<text class="recharge_card_mark">¥</text>
								<text>{{item.price_vip}}</text>
							</view>
							<view class="recharge_card_price">原价¥{{item.price_single}}</view>
							<view class="recharge_card_vip">VIP视频无线看</view>
						</view>
						
					</view>
					<view class="recharge_title" >
						会员特权
					</view>
					<view class="recharge_fun" >
						<view class="recharge_item">
							<img src="/static/video/v.png" alt="">
							<text>VIP视频免费看</text>
						</view>
						<view class="recharge_item">
							<img src="/static/video/no.png" alt="">
							<text>无限评论</text>
						</view>
						<view class="recharge_item">
							<img src="/static/video/cus.png" alt="">
							<text>专属客服</text>
						</view>
						<view class="recharge_item">
							<img src="/static/video/pe.png" alt="">
							<text>修改呢称头像</text>
						</view>
					</view>
				</view>
				
				<view class="" v-if="type=='wallet'">
					<view class="recharge_profit">
						<view class="recharge_p_row">
							<text>金币余额</text>
							<text class="recharge_p_right">10金币=1元</text>
						</view>
						<view class="recharge_p_body">
							<img src="/static/video/coin.png" alt="">
							<text class="">
								{{userInfoData.money_balance}}
							</text>
						</view>
						<view class="recharge_p_row">
							<!-- <text>收益金币0.00金币</text> -->
							<!-- <text class="recharge_p_right">提现</text> -->
						</view>
					</view>
					<view class="recharge_title" >
						购买金币
					</view>
					<view class="recharge_re_money">
						<view class="recharge_re_card " :class="{'recharge_re_card_act': cardActive==item.id}"
						 v-for="(item,index) in setList" :key="index" @click="setCardType(item)">
							<view class="recharge_re_top">
								<img src="/static/video/coin2.png" alt="">
								<text>{{item.price_single}}</text>
							</view>
							<view class="recharge_re_value">
								<text class="recharge_re_mark">¥</text>
								<text>{{item.price_vip.split('.')[0]}}</text>
							</view>
							<view class="recharge_re_bottom">
								<text>额外赠送100金币</text>
							</view>
						</view>
					</view>
				</view>
				<view class="recharge_title">
					支付小贴士：
				</view>
				<view class="recharge_text">
					
					<view class="">
						1、跳转后请及时付款，超时支付无法到账，要重新发起
					</view>
					<view class="">
						2、如多次支付失败，请尝试其他支付方式或稍后再试
					</view>
					<view class="">
						3、支付成功后一般10分钟内到账，超过30分钟未到账请
						带详细支付截图联系客服 
					</view>
					<view class="">
						3、支付成功后一般10分钟内到账，超过30分钟未到账请
						带详细支付截图联系客服
					</view>
					<view class="">
						4、部分安卓手机支付时误报病毒，请选择忽略即可.
					</view>
					<view class="">
						5、更多问题请点击查看 「常见问题」
					</view>
				</view>
				<view class="recharge_btn">
					<button type="primary" @click="payNow()">立即支付</button>
				</view>
			</view>
			
			
			
		</view>
		<view class="recharge_customer">
			<img src="/static/video/customer_w.svg" alt="">
			<text >客服</text>
		</view>
	</view>
</template>

<script>
	import videoService from '@/service/videoService.js'
	import userService from '@/service/userService.js'
	const rechargeTypeStr = {
		wallet: 'wallet',
		VIP :'VIP'
	}
	const rechargeTabStr = {
		vipCard1: 'vipCard1',
		vipCard2 :'vipCard2',
		coinWallet1: 'coinWallet1',
		coinWallet2: 'coinWallet2'
	}
	export default {
		data() {
			return {
				type: rechargeTypeStr.VIP,
				rechargeTab: rechargeTabStr.vipCard1,
				//套餐列表
				setList: [],
				//当前套餐
				cardActive: '',
				//用户信息数据
				userInfoData: {}
			};
		},
		created() {
			this.setRechargeType(rechargeTypeStr.VIP)
			this.getUserInfo()
		},
		methods:{
			goBack() {
				// uni.navigateBack({
				// 		delta:1,//返回层数，2则上上页
				// })
				uni.switchTab({
					url:'/pages/center/center'
				})
			},
			//设置套餐
			setCardType(item){
				this.cardActive = item.id
			},
			
			getUserInfo() {
				userService.getUserInfo({}).then(res => {
					console.log('res:',res)
					this.userInfoData = res.data
				}).catch(err => {
					console.log("err:",err)
				})
			},
			/**
			 * 获取套餐信息
			 * **/
			getVideoLevel() {
				let data = {
					//1 会员套餐，2特权套餐 3 金币钱包
					type:  0
				}
				if(this.rechargeTab == rechargeTabStr.vipCard1) {
					data.type = 1
				}
				if( this.rechargeTab == rechargeTabStr.vipCard2) {
					data.type = 2
				}
				if( this.rechargeTab == rechargeTabStr.coinWallet1) {
					data.type = 3
				}
				
				videoService.getVideoLevel(data).then(res => {
					console.log("res:",res)
					this.setList = res.data
					this.cardActive = this.setList[0].id
				}).catch(err => {
					console.log(err)
				})
			},
			// 设置充值tab
			setRechargeTab(tabType){
				this.rechargeTab = tabType
				this.getVideoLevel()
			},
			setRechargeType(type) {
				this.type = type
				if(type == rechargeTypeStr.VIP) {
					this.setRechargeTab(rechargeTabStr.vipCard1)
				}else{
					this.setRechargeTab(rechargeTabStr.coinWallet1)
				}
			},
			
			//立即支付
			payNow() {
				uni.setStorageSync('rechargeMoneyGoodsId',this.cardActive)
				uni.navigateTo({
					url: '/pages/rechargeMoney/rechargeMoney'
				})
				
				// videoService.purchase({id: this.cardActive}).then(res => {
				// 	if(res.code == 1) {
				// 		uni.showToast({
				// 			title: res.message || '请求成功',
				// 			icon: 'none'
				// 		});
				// 		this.getUserInfo()
				// 		return
				// 	}
				// 	uni.showToast({
				// 		title: res.message || '请求失败',
				// 		icon: 'none'
				// 	});
					
				// }).catch(err => {
				// 	console.log('err:',err)
				// })
			}
		}
	}
</script>

<style lang="scss">
page{
	height: 100%;
}
.recharge{
	height: 100%;
	.recharge_header{
		height: 100rpx;
		padding: 0 20rpx;
		display: flex;
		background-color: #668AFF;
		align-items: center;
		color: #FFFFFF;
	}
	.recharge_back{
		width: 50rpx;
		height: 50rpx;
		img{
			width: 100%;
			height: auto;
		}
	}
	.recharge_h_center{
		flex:1;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.recharge_h_tab{
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 400;
		padding: 0 30rpx;
	}
	.recharge_h_active{
		background: #F5DABE;
		border-radius: 11px;
		color: #682604;
	}
	.recharge_h_right{
		margin: 0 0 0 auto;
		width: 100rpx;
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 400;
	}
	
	.recharge_section{
		height: calc(100% - 100rpx);
		overflow-y: auto;
	}
	.recharge_top{
		height: 300rpx;
		background-color: #668AFF;
		padding: 0 20rpx;
		position: relative;
	}
	.recharge_body{
		height: calc(100% - 300rpx);
		overflow: auto;
	}
	.recharge_user{
		display: flex;
		// margin-top: 40rpx;
		padding-top: 40rpx;
	}
	.recharge_info{
		display: flex;
		flex-direction: column;
	}
	.recharge_nickname{
		font-size: 16px;
		font-family: PingFang SC;
		font-weight: bold;
		color: #FFFFFF;
	}
	.recharge_id{
		font-size: 13px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #FFFFFF;
		opacity: 0.8;
	}
	.recharge_head{
		width: 80rpx;
		height: 80rpx;
		margin-right: 20rpx;
		img{
			width: 100%;
			height: 100%;
			border-radius: 40rpx;
			border: 1px solid #cccccc;
		}
	}
	.recharge_switchs{
		display: flex;
		position: absolute;
		display: flex;
		justify-content: center;
		bottom:0;
		right: 20rpx;
		left: 20rpx;
		font-size: 16px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #444444;
		align-items: end;
	}
	.recharge_switch{
		display: flex;
		justify-content: center;
		align-items: center;
		height: 80rpx;
		width: 350rpx;
		background: #F6F6F6;
		
		border: 1px solid #E9E9E9;
		img{
			width: 50rpx;
			height: auto;
		}
	}
	.recharge_switch2{
		border-radius: 0rpx 12rpx 0rpx 0rpx;
		border-left: none;
	}
	.recharge_switch1{
		border-radius: 12rpx 0rpx 0rpx 0rpx;
		border-right: none;
	}
	.recharge_switch_active{
		border-radius: 12rpx 12rpx 0rpx 0rpx;
		height: 100rpx;
		background: #FFFFFF;
	}
	.recharge_news{
		display: flex;
		align-items: center;
		height: 60rpx;
		padding: 0 20rpx;
		font-size: 13px;
	}
	.recharge_n_label{
		margin-right: 10rpx;
		padding: 2rpx 12rpx;
		background: #E1AF7C;
		border-radius: 15rpx;
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #FFFFFF;
	}
	.recharge_n_msg{
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #494949;
		margin-left: 10rpx;
	}
	.recharge_cards{
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.recharge_card{
		width: 210rpx;
		height: 240rpx;
		background: #FEFFFE;
		border: 1px solid #E4E4E4;
		opacity: 0.5;
		border-radius: 12rpx;
		margin: 0 20rpx;
		text-align: center;
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		align-items: center;
	}
	.recharge_card_title{
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #333333;
	}
	.recharge_card_money{
		font-size: 29px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #1A91FF;
	}
	.recharge_card_mark{
		font-size: 14px;
	}
	.recharge_card_price{
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #A5A3A3;
	}
	.recharge_card_vip{
		background: #E8F4FE;
		border-radius: 9px;
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #41A9FF;
		padding: 4rpx 8rpx;
	}
	.recharge_card_active{
		background: linear-gradient(131.7561deg, #6BC3FF 0%, #0081FF 100%);
		border-radius: 6px;
	}
	.recharge_title{
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #333333;
		line-height: 18px;
		padding: 30rpx 20rpx;
	}
	.recharge_fun{
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 0 18rpx;
	}
	.recharge_item{
		width: 240rpx;
		text-align: center;
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #908a8a;
		display: flex;
		flex-direction: column;
		align-items: center;
		img{
			width: 100rpx;
			height: auto;
			margin-bottom: 36rpx;
		}
	}
	.recharge_text{
		padding: 6rpx 20rpx;
		font-size: 13px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #333333;
		line-height: 20px;
	}
	.recharge_btn{
		margin-top: 40rpx;
		padding: 6rpx 20rpx;
	}
	.recharge_customer{
		position: fixed;
		width: 100rpx;
		height: 100rpx;
		top: 1300rpx;
		right: 20rpx;
		border-radius: 50%;
		background: linear-gradient(0deg, #0C89FF 0%, #62BDFF 100%);
		box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.29);
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: space-between;
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #FFFFFF;
		img{
			width: 56rpx;
			height: auto;
		}
	}
	.recharge_profit{
		width: 90vw;
		margin: 0 auto;
		margin-top: 20rpx;
		background: #FFFFFF;
		box-shadow: 0px 0px 22rpx 0px rgba(0,0,0,0.19);
		border-radius: 10rpx;
		padding: 20rpx;
	}
	.recharge_p_row{
		display: flex;
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #666666;
		line-height: 18px;
	}
	.recharge_p_right{
		margin: 0 0 0 auto;
		color:#F33436;
	}
	.recharge_p_body{
		display: flex;
		height: 160rpx;
		align-items: end;
		padding-bottom: 40rpx;
		img{
			width: 50rpx;
			height: 50rpx;
		}
		text{
			font-size: 40px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #F33436;
			display: flex;
			align-items: end;
			margin-bottom: -16rpx;
		}
	}
	.recharge_re_money{
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
		padding: 0 46rpx;
	}
	.recharge_re_card{
		width: calc((100% - 80rpx) / 3 );
		background: #FEFFFE;
		border: 1px solid #E4E4E4;
		border-radius: 12rpx;
		text-align: center;
		padding-top: 20rpx;
		margin-bottom: 20rpx;
	}
	.recharge_re_card_act{
		background: linear-gradient(131deg, #6BC3FF 0%, #0081FF 100%);
	}
	.recharge_re_top{
		height: 40rpx;
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #A5A3A3;
		img{
			width: 20rpx;
			height: auto;
		}
	}
	.recharge_re_value{
		font-size: 29px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #1A91FF;
		height: 80rpx;
	}
	.recharge_re_mark{
		font-size: 13px;
		margin-right: 4rpx;
	}
	.recharge_re_bottom{
		height: 40rpx;
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #FFFFFF;
		background: #2498FF;
		border-radius: 0px 0px 6px 6px;
	}
}
</style>
