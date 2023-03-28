<template>
	<view class="content">
		<view class="box">
			<view class="title">收益总额</view>
			<view class="tixian">
				<view class="left dis">
					<image src="../../static/app/jinbi.png" mode=""></image>
					{{all.popularize}}
				</view>
				<view class="right dis">
					<view class="btn dis">提现</view>
				</view>
			</view>
			
			<!--  -->
			<view class="threeFont">
				<view class="item disc">
					<view class="tit dis">成功推广人数</view>
					<view class="de dis">
					
						<view>0.00</view>
					</view>
				</view>
				<view class="item disc">
					<view class="tit dis">推广收益</view>
					<view class="de dis">
						<image src="../../static/app/jinbi.png" mode=""></image>
						<view>0.00</view>
					</view>
				</view>
				<view class="item disc">
					<view class="tit dis">今日推广收益</view>
					<view class="de dis">
						<image src="../../static/app/jinbi.png" mode=""></image>
						<view>0.00</view>
					</view>
				</view>
			</view>
			<!--  -->
			
			<view class="threeImg">
				<view class="item disc" @tap="shouyi">
					<image src="../../static/app/shouyi.png" mode=""></image>
					<view class="de dis" >收益明细</view>
				</view>
				<view class="item disc" @tap="tuiguang">
					<image src="../../static/app/jilu.png" mode="" style="width: 86upx;height: 86upx;"></image>
					<view class="de dis" >推广记录</view>
				</view>
				<view class="item disc" @tap="qutuiguang">
					<image src="../../static/app/tuiguang.png" mode=""></image>
					<view class="de dis" style="padding-right: 20upx;">去推广</view>
				</view>
			</view>
			
			<!--  -->
			<view class=" biaoti" style="margin-top: 30upx;">
				<view class="line"></view>
				<view>推广返利</view>
				<view class="line"></view>
			</view>
			
			<view class="list">
				<view class="li">
					<view class="left da dis">累计充值</view>
					<view class="right da dis">返利百分比</view>
				</view>
				<view class="li" v-for="(item,index) in list" :key="index">
					<view class="left  dis">{{item.name}}</view>
					<view class="right  dis">{{item.value}}</view>
				</view>
				
			</view>
			
		</view>
	</view>
</template>

<script>
	import videoService from '@/service/videoService.js'
	export default {
		data() {
			return {
				list:[],
				all:{}
			}
		},
		mounted() {
			let res=JSON.parse(localStorage.getItem('userInfo')).token
			let data={}
			videoService.app(data).then(r=>{
				
				this.list=r.data
			})
			
			let datas={
				
			}
			videoService.income(datas).then(res=>{
				this.all=res.data
				console.log(res.data)
			})
		},
		methods: {
			shouyi(){
				uni.navigateTo({
					url:'/pages/income/income'
				})
			},
			tuiguang(){
				uni.navigateTo({
					url:'/pages/notes/notes'
				})
			},
			qutuiguang(){
				uni.navigateTo({
					url:'/pages/popularize/popularize'
				})
			},
		}
	}
</script>

<style lang="less" scoped src='./app.less'>

</style>
