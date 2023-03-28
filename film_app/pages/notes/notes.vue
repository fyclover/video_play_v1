<template>
	<view class="setpanel">
		
		
		
		<view class="set_header">
			<view class="set_name">昵称</view>
			<view class="set_date">购买日期</view>
			<view class="set_state">用户名</view>
		</view>
		<scroll-view scroll-y="true" @scrolltolower="">
			<view class="set_row " v-for="(item,index) in all" :key="index">
				<view class="set_name">{{item.nickname}}</view>
				<view class="set_date">{{item.create_time}}</view>
				<view class="set_state">{{item.user_name}}</view>
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
			videoService.tuiguangjilu(data).then(res=>{	
				this.all=res.data.data
				console.log(res.data.data)
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
		
		font-size: 12px;
		font-weight: bold;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.set_name{
		width: 20%;
	}
	.set_state{
		width: 45%;
	}
	.set_date{
		width: 45%;
	}
	.set_row{
		margin-bottom: 20rpx;
		display: flex;
		justify-content: center;
		align-items: center;
	}
}
</style>

