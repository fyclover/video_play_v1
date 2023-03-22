<template>
	<view class="relistpanel">
		<view class="relist_header">
			<view class="relist_name">金额</view>
			<view class="relist_date">购买日期</view>
			<view class="relist_state">状态</view>
		</view>
		<scroll-view scroll-y="true" @scrolltolower="">
			<view class="relist_row" v-for="(item,index) in setList" :key="index">
				<view class="relist_name">{{item.money}}元</view>
				<view class="relist_date">{{item.create_time}}</view>
				<view class="relist_state">{{item.status_text}}</view>
			</view>
		</scroll-view>
		
	</view>
</template>

<script>
	import videoService from '@/service/videoService.js'
	import videoInfoService from '@/service/videoInfoService.js'
	import userService from '@/service/userService.js'
	export default {
		data() {
			return {
				page:1,
				setList: []
			};
		},
		mounted() {
			this.getUserRechargeList()
		},
		methods: {
			handleScroll() {
				this.page += 1
				this.getUserRechargeList()
			},
			/**
			 * 获取用户套餐列表
			 * **/
			getUserRechargeList() {
				let data = {
					page: this.page,
					limit: 100
				}
				userService.getUserRechargeList(data).then(res => {
					if(res.data.data.length > 0) {
						res.data.data.forEach(el => {
							this.setList.push(el)
						})
					}
				}).catch(err => {
					console.log(err)
				})
			}
		},
	}
</script>

<style lang="scss">
page{
	height:100%;
}
.relistpanel{
	height: 100%;
	padding: 0 20rpx;
	
	.relist_header{
		height:60rpx ;
		display: flex;
	}
	.relist_name,.relist_state,.relist_date{
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: 16px;
		font-weight: bold;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.relist_name{
		width: 130rpx;
	}
	.relist_state{
		width: 150rpx;
	}
	.relist_date{
		flex: 1;
	}
	.relist_row{
		margin-bottom: 20rpx;
		display: flex;
		justify-content: center;
		align-items: center;
	}
}
</style>
