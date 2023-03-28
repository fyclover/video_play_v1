<template>
	<view class="setpanel">
		<view class="set_header">
			<view class="set_name">收益</view>
			<view class="set_date">今日收益</view>
			<view class="set_state">人数</view>
		</view>
		<scroll-view scroll-y="true" @scrolltolower="">
			<view class="set_row " >
				<view class="set_name">{{all.popularize}}</view>
				<view class="set_date">{{all.popularizeDay}}</view>
				<view class="set_state">{{all.ren}}</view>
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
				setList: [],
				all:[]
			};
		},
		mounted() {
			
			let data={
				page:1,
				limit:20
			}
			videoService.income(data).then(res=>{	
				this.all=res.data
				console.log(res.data)
			})
		},
		methods: {
			handleScroll() {
				this.page += 1
				this.getUserSetList()
			},
			/**
			 * 获取用户套餐列表
			 * **/
			
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
		text-align: center;
		font-size: 12px;
		font-weight: bold;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.set_name{
		flex: 1;
	}
	.set_state{
		flex: 1;
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

