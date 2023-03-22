<template>
	<view class="videoPlayPage">
		<VideoPlay :src="videoUrl" :conf="conf"></VideoPlay>
	</view>
</template>

<script>
	import VideoPlay from '../../components/video-play/new-video-player.vue'
	import listMixin from '@/common/mixins/list-mixin.js';
	// import VideoPlay from '../../components/video-play/video-play.vue'
	// import VideoPlay from '../../components/video-play/vue-video.vue'
	export default {
		onLoad: function(option) {
			this.id = option.id
		},
		components: {
			VideoPlay
		},
		data() {
			return {
				videoUrl: '',
				id: '',
				conf:{},
				is_purchase:1,
				titleName:'请购买后查看',
				urlName:'',
			};
		},
		mounted() {
			this.videos();
		},
		methods: {
			videos() {
				this.$request('/goods/video', {id:this.id}, 'POST').then(res => {
					if (res.code == 1) {
					
						//判断当前视频是否可一直观看，不行跳到购买页面
						this.videoUrl = res.data.video_url
						this.is_purchase = res.data.is_purchase
						let	 urlName='/pages/Recharge/Recharge'
						if(res.data.is_purchase != 1 ){
							if(res.data.is_purchase == 2){
								this.titleName ='该视频需要单独购买';
								urlName ='/pages/Recharge/alone?id='+this.id;
								this.urlName=urlName
							}


							// uni.showToast({
							// 	icon: "none",
							// 	title:this.titleName,
							// 	duration:10000,
							// })

							// setTimeout(function(){
							// 	uni.reLaunch({
							// 		url: urlName
							// 	})
							// },30000);
						}
						res.data.urlName=urlName;
						//this.conf.is_purchase=res.data.is_purchase;
						this.conf=res.data;
						//this.conf.urlName=urlName;
					}else{
						uni.showToast({
							icon: "none",
							title:'请购买后查看',
						})
					}
				})
			},
		},
	}
</script>

<style lang="scss" scoped>
	.videoPlayPage {
		width: 100%;
		min-height: 100%;
		position: absolute;
		background-color: #000;
	}
</style>
