<template>
	<view class="setpanel">
		<view class="set_header">
			<view class="set_name">套餐名</view>
			<view class="set_date">购买日期</view>
			<view class="set_state">状态</view>
		</view>
		<scroll-view scroll-y="true" @scrolltolower="">
			<view class="set_row" v-for="(item,index) in setList" :key="index">
				<view class="set_name">{{item.describe_order}}</view>
				<view class="set_date">{{item.pay_time}}</view>
				<view class="set_state">{{item.pay_status}}</view>
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
			this.getUserSetList()
		},
		methods: {
			handleScroll() {
				this.page += 1
				this.getUserSetList()
			},
			/**
			 * 获取用户套餐列表
			 * **/
			getUserSetList() {
				let data = {
					page: this.page,
					limit: 100
				}
				userService.getUserSetList(data).then(res => {
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
.setpanel{
	height: 100%;
	padding: 0 20rpx;
	
	.set_header{
		height:60rpx ;
		display: flex;
	}
	.set_name,.set_state,.set_date{
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: 16px;
		font-weight: bold;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.set_name{
		width: 130rpx;
	}
	.set_state{
		width: 150rpx;
	}
	.set_date{
		flex: 1;
	}
	.set_row{
		margin-bottom: 20rpx;
		display: flex;
		justify-content: center;
		align-items: center;
	}
}
</style>
