<template>
	<view class="vdieo">
		<view class="vdieo_play" >
			<iframe class="video_iframe" frameborder="no" :src="'https://m3u8.bxgtv.top?url=https://m3u8.bxgtv.top?url=https://vip1.slbfsl.com/20221203/cdMSnf2x/index.m3u8'" border="0"></iframe>
			<!-- <video controls ref="video" :src="videoDetail.video_url"></video> -->
			<!-- <video src="/static/video/112.mp4"></video> -->
			<!-- <video src="https://vip1.slbfsl.com/20220901/可爱学生 XB0001 醉後誤闖班花水簾洞/index.m3u8"></video> -->
			
		</view>
		
		<view class="vdieo_play" style="border: 1px solid red;">
			<div id="dplayer" style="height: 450px; width: 800rpx;border: 1px solid green;"></div>
		</view>
	</view>
</template>

<script>
	import Hls from 'hls.js'
	import Dplayer from 'dplayer'
	export default {
		data() {
			return {
				dp: {}
			};
		},
		mounted() {
			this.dp = new Dplayer({
				//播放器的一些参数
				container: document.getElementById('dplayer'),
				autoplay: false, //是否自动播放
				theme: '#FADFA3', //主题色
				loop: true,//视频是否循环播放
				lang: 'zh-cn',
				screenshot: false,//是否开启截图
				hotkey: true,//是否开启热键
				preload: 'auto',//视频是否预加载
				volume: 0.7,//默认音量
				mutex: true,//阻止多个播放器同时播放，当前播放器播放时暂停其他播放器
				video: {
					// url: 'https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8', //视频地址
					url: 'https://m3u8.bxgtv.top?url=https://vip1.slbfsl.com/20221203/cdMSnf2x/index.m3u8', //视频地址
					type: 'customHls',
					customType: {
						customHls: function(video, player) {
							const hls = new Hls()  //实例化Hls  用于解析m3u8
							hls.loadSource(video.src)
							hls.attachMedia(video)
						}
					},
				},
			});
		},
	}
</script>

<style lang="scss">
	page{
		height: 100%;
	}
.vdieo{
	height: 100%;
	overflow: auto;
	.video_iframe{
		width: 100%;
		height: 100%;
	}
	.vdieo_play{
		height: 400rpx;
		overflow: hidden;
		display: flex;
		justify-content: center;
		align-items: center;
		position: relative;
	}
	.vdieo_play{
		height: 400rpx;
		overflow: hidden;
		display: flex;
		justify-content: center;
		align-items: center;
		position: relative;
	}
}
</style>
