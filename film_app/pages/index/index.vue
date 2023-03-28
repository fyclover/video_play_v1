<template>
	<view class="index">
		<view class="index_head">
			<view class="index_box">
				
				<img class="index_search_i" src="/static/img_index/search.svg" @click="toSearch()">
				<input class="index_search" v-model="keyWords" placeholder-style="color: #C0C0C0;font-size:12px"
				 type="text" placeholder="请输入影视剧名称">
				 <view style="margin-left: 10upx;color: #fff;" @click="sousuo">搜索</view>
			</view>
			<view class="index_cus"  @click="getConfigKefu()">
				<img src="/static/img_index/customer.svg" >
			</view>
		</view>
		<view class="index_section">
			<view class="index_tap">
				<view class="index_ta_item" :class="{'index_ta_active':theme=='recommend'}" @click="setTheme('recommend')">
					推荐
				</view>
				<view class="index_ta_item" :class="{'index_ta_active':theme=='rank'}" @click="setTheme('rank')">
					排行
				</view>
				<view class="index_ta_item " :class="{'index_ta_active':theme=='zone'}" @click="setTheme('zone')">
					全部
				</view>
				<view class="index_ta_item " :class="{'index_ta_active':theme=='category'}" @click="setTheme('category')">
					分类
				</view>
			</view>
			<scroll-view scroll-y="true" @scrolltolower="scrollEventLower" class="index_content"  id="index_content" v-if="theme=='recommend'" >
				<!-- <view class="index_banner">
					<img  :src="banner_tuijian" >
				</view> -->
				<!-- 轮播图 -->
				<swiper indicator-dots="true" autoplay="true" :interval="3000" :duration="1000" style="width: 100%;height: 400upx;">
					<swiper-item style="width: 100%;height: 400upx;" v-for="(item,index) in lunbo">
						<view class="swiper-item" style="width: 100%;height: 400upx;">
							<image :src="imgUrls +item.img_path" mode=""style="width: 100%;height: 400upx;"></image>
						</view>
					</swiper-item>
					
				</swiper>
				
				<view class="index_apps">
					<view class="index_ap_item" @click="toCategory(item) "
					 v-for="item in categoryList" :key="item.id">
						<view class="index_ap_mark">
							<img :src="item.thumb_url" alt="">
						</view>
						<text style="font-size: 12px;">{{item.title}}</text>
					</view>
				</view>
				<view class="index_list_head">
					<text class="index_li_title1"></text>
					<text class="index_li_more"> </text>
				</view>
				<view class="tuijian">
					推荐视屏
				</view>
				<view class="index_rec_block" @tap="toVideoPlay(item)" v-for="(item,index) in allVideoList" :key="index">
					<view class="index_rec_poster">
						<img :src="item.thumb_url" alt="">
					</view>
					
					<view class="index_rec_content">
						<view class="index_rec_title">
							<text class="index_rec_name">{{item.title}}</text>
							<!-- <text class="index_rec_progress">完整版 14:20</text> -->
						</view>
						<view class="index_rec_brief">
							{{item.description}}
						</view>
						<view class="index_rec_label">
							<text class="index_label" v-for="(label,i) in item.labelList" :key="i">{{label}}</text>
						</view>
					</view>
				</view>
				
			</scroll-view>
			<view class="index_content index_rank" v-if="theme=='rank'">
				<view class="index_ran_tab">
					<text class="index_ran_type" :class="{'index_ran_active': rankType==1}" @click="setRankType(1)">新片榜</text>
					<text  class="index_ran_type" :class="{'index_ran_active': rankType==2}" @click="setRankType(2)">博主榜</text>
				</view>
				<view class="" v-if="rankType==1">
					<view class="index_ran_block">
						<view class="index_list_head index_ran_head">
							<view class="index_li_title index_ran_title">
								<text>最新上传</text>
								<img class="index_ran_icon" src="/static/img_index/fire.png" alt="">
							</view>
							<text class="index_ran_more" @click="setTheme('zone')">查看更多 ></text>
						</view>
						<view class="index_ran_list">
							<view class="index_li_item" @click="toVideoPlay(item)"
							 v-for="(item,index) in rankFilmList" :key="index">
								<view class="index_poster">
									<img :src="item.thumb_url" alt="">
									<text class="index_vip">VIP</text>
								</view>
								<view class="index_name">
									{{item.title}}
								</view>
							</view>
						</view>
					</view>
					
					<view class="index_ran_block">
						<view class="index_list_head index_ran_head">
							<view class="index_li_title index_ran_title">
								<text>热度榜</text>
								<img class="index_ran_icon" src="/static/img_index/fire.png" alt="">
							</view>
							<text class="index_ran_more" @click="setTheme('zone')">查看更多 ></text>
						</view>
						<view class="index_ran_list">
							<view class="index_li_item" @click="toVideoPlay(item)"
							 v-for="(item,index) in hotFilmList" :key="index" >
								<view class="index_poster">
									<img :src="item.thumb_url" alt="">
									<text class="index_vip">VIP</text>
								</view>
								<view class="index_name">
									{{item.title}}
								</view>
							</view>
						</view>
					</view>
				</view>
				
				<view class="" v-if="rankType==2">
					<view class="index_blog_types">
						<view class="index_blog_type" :class="{'index_blog_active':bloggerType=='popularity'}" @click="setBloggerType('popularity')">
							<img src="/static/img_index/crown.png" alt="">
							<text>人气博主榜</text>
						</view>
						<view class="index_blog_type " :class="{'index_blog_active':bloggerType=='newStar'}" @click="setBloggerType('newStar')">
							<img src="/static/img_index/newP.png" alt="">
							<text>新星人气榜</text>
						</view>
					</view>
					<view class="index_ran_block">
						<view class="index_list_head index_ran_head" @click="setTheme('zone')">
							<view class="index_li_title index_ran_title">
								<text></text>
								<!-- <img class="index_ran_icon" src="/static/img_index/fire.png" alt=""> -->
							</view>
							<text class="index_ran_more">查看更多 ></text>
						</view>
						<view class="index_ran_list">
							<view class="index_li_item" v-for="(item, index) in rankFilmList" 
							@click="toVideoPlay(item)" :key="index">
								<view class="index_poster">
									<img :src="item.thumb_url" alt="">
									<text class="index_vip">VIP</text>
								</view>
								<view class="index_name">
									{{item.title}}
								</view>
							</view>
						</view>
					</view>
					
					<!-- <view class="index_ran_block">
						<view class="index_list_head index_ran_head">
							<view class="index_li_title index_ran_title">
								<text>少年歌行剧住</text>
								<img class="index_ran_icon" src="/static/img_index/fire.png" alt="">
							</view>
							<text class="index_ran_more">查看更多 ></text>
						</view>
						<view class="index_ran_list">
							<view class="index_li_item" v-for="item in 4" :key="item">
								<view class="index_poster">
									<img src="/static/img_index/erweima.png" alt="">
									<text class="index_vip">VIP</text>
								</view>
								<view class="index_name">
									李宏毅东北话原声 演绎
								</view>
							</view>
						</view>
					</view> -->
				</view>
			</view>
			<scroll-view scroll-y="true" @scrolltolower="scrollEventLower" class="index_content" v-if="theme=='zone'">
				<!-- 全部 -->
				<swiper indicator-dots="true" autoplay="true" :interval="3000" :duration="1000" style="width: 100%;height: 400upx;">
					<swiper-item style="width: 100%;height: 400upx;" v-for="(item,index) in lunbo">
						<view class="swiper-item" style="width: 100%;height: 400upx;">
							<image :src="imgUrls +item.img_path" mode=""style="width: 100%;height: 400upx;"></image>
						</view>
					</swiper-item>
					
				</swiper>
				<view class="index_list_head">
					<text class="index_li_title"></text>
					<!-- <text class="index_li_more">查看更多 ></text> -->
				</view>
				<view class="index_list">
					<view class="index_li_item" v-for="(item) in allVideoList" :key="item.id" @click="toVideoPlay(item)">
						<view class="index_poster" >
							<img :src="item.thumb_url" alt="">
							<text class="index_vip">VIP</text>
							<img class="index_play_img" src="/static/video/play.svg" alt="">
						</view>
						<view class="index_name">
							{{item.title}}
						</view>
					</view>
				</view>
			</scroll-view>
			<!-- 这里 -->
			<view class="index_content" v-if="theme=='category'">
				<!-- 分类 -->
				<swiper indicator-dots="true" autoplay="true" :interval="3000" :duration="1000" style="width: 100%;height: 400upx;">
					<swiper-item style="width: 100%;height: 400upx;" v-for="(item,index) in lunbo">
						<view class="swiper-item" style="width: 100%;height: 400upx;">
							<image :src="imgUrls +item.img_path" mode=""style="width: 100%;height: 400upx;"></image>
						</view>
					</swiper-item>
					
				</swiper>
				<view class="index_list_head" @click="setTheme('zone')">
					<text class="index_li_title"></text>
					<text class="index_li_more">查看更多 ></text>
				</view>
				<view class="index_cate_body">
					<view class="index_cate_name " >
						<view class="index_cate_title" :class="{'index_cate_title_act':categoryActive == item.id}" 
						@click="handleCategory(item)"
						 v-for="(item,index) in categoryList" :key="index">
							{{item.title}}
						</view>
					</view>
					<scroll-view scroll-y="true" @scrolltolower="scrollEventLower" class="index_cate_panel" >
						<view class="index_list">
							<view class="index_li_item" v-for="(item) in categoryVideoList" :key="item.id" @click="toVideoPlay(item)">
								<view class="index_poster" >
									<img :src="item.thumb_url" alt="">
									<text class="index_vip">VIP</text>
									<img class="index_play_img" src="/static/video/play.svg" alt="">
								</view>
								<view class="index_name index_cate_name2">
									{{item.title}}
								</view>
							</view>
							<view class="" v-if="categoryVideoList.length < 1">
								暂无数据
							</view>
							<!-- <view class="index_li_item" v-for="(item) in 5" :key="item" @click="toVideoPlay(item)">
								<view class="index_poster" >
									<img src="1" alt="">
									<text class="index_vip">VIP</text>
									<img class="index_play_img" src="/static/video/play.svg" alt="">
								</view>
								<view class="index_name">
								</view>
							</view> -->
						</view>
					</scroll-view>
				</view>
				<!-- <view class="index_list">
					<view class="index_li_item" v-for="(item) in allVideoList" :key="item.id" @click="toVideoPlay(item)">
						<view class="index_poster" >
							<img :src="item.thumb_url" alt="">
							<text class="index_vip">VIP</text>
							<img class="index_play_img" src="/static/video/play.svg" alt="">
						</view>
						<view class="index_name">
							{{item.title}}
						</view>
					</view>
				</view> -->
			</view>
		</view>
		
		
		<view class="modal disc" v-if="modalVisible" style="" >
			<!-- <view class="index_m_panel" v-html="configData.value" >
				
			</view> -->
			<view style="width: 95%;height: 900upx; margin: 0 auto;">
				<image :src="qian+tupianurl" mode="" style="width: 100%;height:100%"></image>
			</view>
			
			<view class="index_m_bottom" @click="closeModal()" style="z-index: 999;margin-top: 40upx;">
				<img src="/static/img_index/close.png" alt="">
			</view>
		</view>
	</view>
</template>

<script>
	import userService from '@/service/userService.js'
	import videoService from '@/service/videoService.js'
	import videoInfoService from '@/service/videoInfoService.js'
	import loginService from '@/service/loginService.js'
	export default {
		data() {
			return {
				swiperList:[
					{
						res:[
							'https://cdn.uviewui.com/uview/swiper/swiper2.png'
						]
					}
				],
				//主题
				theme: uni.getStorageSync('indexTheme'),
				//排行类型 1:新片榜 2:博主榜
				rankType: 1,
				bloggerType: 'popularity',
				modalVisible:true,
				//专区视频列表
				zoneVideoList:[],
				//排行榜视频列表
				rankFilmList: [],
				//热度榜
				hotFilmList:[],
				//博主榜视频
				bloggerFilmList: [],
				//分类列表
				categoryList: [],
				//全部视频列表
				allVideoList:[],
				//分类视频列表
				categoryVideoList: [],
				//长短视频 0短视频 1长视频
				videoType: 1,
				//搜索词
				keyWords:  '',
				//配置数据
				configData: {},
				//arrayBanner:{},
				banner_tuijian:'',
				banner_quanbu:'',
				banner_fenlei:'',
				categoryActive: '-11',
				scrollTop: -99,
				page:1,
				categoeryLimit: 10,
				lunbo:[],
				imgUrls:'',
				tupianurl:'',
				qian:''
			}
		},
		onLoad(options) {
			
			if(options.codes){
				let data={
					"codes":options.codes
				}
				this.registerTest(data)
					
				
			}else{
				console.log('不邀请')
			}
			
			
			let data={
				"image_type":'1'
			}
			videoService.lunbo(data).then(res=>{
				console.log(res.data.url)
				this.imgUrls=res.data.url
				this.lunbo=res.data.data
			})
			
			let datas={
				"image_type":'4'
			}
			videoService.lunbo(datas).then(res=>{
				this.tupianurl=res.data.data[0].img_path
				console.log(this.tupianurl[0])
				this.qian=res.data.url
			})
		},
		onShow() {
			
			this.keyWords = uni.getStorageSync('searchKeywords') || ''
			let isLogged = uni.getStorageSync('isLogged')
			let res=''
			
			if(isLogged != 1) {
				
				this.registerTest()
			}
			this.getUserConfig()
			// this.getVideoAllList()
			let theme = uni.getStorageSync('indexTheme') || 'recommend'
			this.setTheme(theme)
		},
		
		methods: {
			/**
			 * 测试账号
			 * **/
			 tiao(){
				 console.log('tiao')
			 },
			registerTest() {
				loginService.registerTest({}).then(res => {
					uni.setStorageSync('token',res.data.token)
					uni.setStorageSync('isLogged',1)
				}).catch(err => {
					console.log("err:",err)
				})
			},
			// 滚定监听
			scrollEventLower(e) {
				this.page += 1
				if(this.theme=='recommend') {
					this.getVideoAllList()
					return
				}
				if(this.theme=='zone') {
					this.getVideoAllList()
					return
				}
				if(this.theme=='category') {
					this.getCategoryVideoList()
				}
			},
			/**
			 * 获取配置
			 * **/
			getUserConfig() {
				userService.getUserConfig({name: 'prompt_content'}).then(res => {
					this.configData = res.data
					
					localStorage.setItem('guanyuwomen',res.data.value);
				}).catch(err => {
					console.log('err:',err)
				})
				//获取图片配置
				userService.getUserConfig({name: 'array_banner'}).then(res => {
					this.banner_tuijian = res.data.image_url + res.data.tuijie;
					this.banner_quanbu = res.data.image_url + res.data.quanbu;
					this.banner_fenlei = res.data.image_url + res.data.fenlei;
					localStorage.setItem('image_url',res.data.image_url);
					uni.setStorageSync('array_banner_tuijie',this.banner_tuijian);
					uni.setStorageSync('array_banner_dianbo',res.data.image_url + res.data.dianbo);
				}).catch(err => {
					console.log('err:',err)
				})
			},
			/**
			 * 分类
			 * **/
			handleCategory(category) {
				this.page=1
				this.categoryActive = category.id
				this.categoryVideoList = []
				this.getCategoryVideoList()
			},
			/**
			 * 推荐视频
			 * **/
			getVideotypeList() {
				videoService.getVideotypeList({limit: this.categoeryLimit,is_size: 1}).then(res => {
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return 
					}
					this.categoryList = res.data
					this.categoryList.shift()
					this.categoryActive = this.categoryList[0].id
					this.getCategoryVideoList()
				}).catch(err => {
					console.log(err)
				})
			},
			//获取热榜 
			getHotVideoList(type) {
				let data = {
					page: 1,
					limit: 20,
					type: type
				}
				videoService.getHotVideoList(data).then(res => {
					//新片榜
					if(res.code != 1) {
						uni.showToast({
							title: res.message || '请求失败',
							icon: 'none'
						});
						return
					}
					if(type == 1) {
						this.rankFilmList = res.data
					}
					if(type == 2) {
						this.bloggerFilmList = res.data
					}
				}).catch(err => {
					console.log(err)
				})
			},
			toSearch() {
				uni.setStorageSync('searchKeywords',this.keyWords)
				uni.navigateTo({
					url:'/pages/search/search'
				})
			},
			sousuo(){
				let data={
					page: 1,
					limit: 20,
					video_name:this.keyWords,
				}
				console.log(data)
				videoService.getVideoAllList(data).then((res)=>{
					
					if(res.code==1){
						console.log(res.data.data)
						this.allVideoList=res.data.data
					}
				})
			},
			/**
			 * 获取排行榜视频
			 * **/
			getRankVideos(){
				let data = {
					//1最新上传   2 热度榜  3人气博主榜   4新星人气榜
					new_type: 0
				}
				if(this.rankType == 1) {
					data.new_type = 1
					videoInfoService.getRankVideos({new_type: 2}).then(res => {
						
						this.hotFilmList = res.data.data
					}).catch(err => {
						console.log("err:",err)
					})
				}
				if(this.rankType == 2 && this.bloggerType == 'popularity') {
					data.new_type = 3
				}
				if(this.rankType == 2 && this.bloggerType == 'newStar') {
					data.new_type = 4
				}
				videoInfoService.getRankVideos(data).then(res => {
					
					this.rankFilmList = res.data.data
				}).catch(err => {
					console.log("err:",err)
				})
			},
			//获取全部视频列表
			getVideoAllList() {
				// token: uni.getStorageSync('token')
				let typeObj = uni.getStorageSync('searchType') ? JSON.parse( uni.getStorageSync('searchType')) : {id: 'text'} 
				let data = {
					page: this.page,
					limit:20,
					type: typeObj.id,
					is_size: this.videoType, //0:短视频 1：长视频，
					labels: '',
					video_name: uni.getStorageSync('searchKeywords') || '',
					video_id: ''
				}
				videoService.getVideoAllList(data).then(res => {
					// this.allVideoList = res.data.data
					if(res.data.data.length> 0) {
						res.data.data.forEach(el => {
							this.allVideoList.push(el)
						})
					}
					uni.removeStorageSync('searchType')
					uni.removeStorageSync('searchKeywords')
					if(this.allVideoList.length > 0) {
						this.allVideoList.forEach(el => {
							el.labelList = []
							if(el.labels.length > 0) {
								el.labelList= el.labels.split('#')
								el.labelList.shift()
							}
							
						})
					}
					// console.log('res:',res)
				}).catch(err => {
					console.log(err)
				})
			},
			//获取分类视频列表
			getCategoryVideoList() {
				
				// token: uni.getStorageSync('token')
				let data = {
					page: this.page,
					limit:10,
					type: this.categoryActive,
					is_size: 1, //0:短视频 1：长视频，
					// labels: '',
					// video_name: '',
					// video_id: ''
				}
				
				videoService.getVideoAllList(data).then(res => {
					// this.categoryVideoList = res.data.data
					if(res.data.data.length > 0) {
						res.data.data.forEach(el => {
							this.categoryVideoList.push(el)
						})
					}
					if(this.categoryVideoList.length > 0) {
						this.categoryVideoList.forEach(el => {
							el.labelList = []
							if(el.labels.length > 0) {
								el.labelList= el.labels.split('#')
								el.labelList.shift()
							}
						})
					}
					// console.log('res:',res)
				}).catch(err => {
					console.log(err)
				})
			},
			// getZoneList() {
			// 	// token: uni.getStorageSync('token')
			// 	videoService.getZoneList({page: 1,limit:20,type: 'text',token: uni.getStorageSync('token')}).then(res => {
			// 		this.zoneVideoList = res.data.data
			// 		// console.log('res:',res)
			// 	}).catch(err => {
			// 		console.log(err)
			// 	})
			// },
			
			//跳转到视频播放
			toVideoPlay(videoInfo) {
				console.log(videoInfo,'index')
				//长视频
				// if(videoInfo.type == 20) {
				// 	// uni.navigateTo({
				// 	// 	url: '/pages/videoPlay/videoPlay',
				// 	// })
				// 	uni.switchTab({
				// 		url:'/pages/sortVideo/sortVideo',
				// 	})
				// 	uni.setStorageSync('videoInfo',JSON.stringify(videoInfo))
				// 	return
				// }
				
				// if(videoInfo.type == 25) {
				// 	uni.navigateTo({videoInfo.vod_play_from == 'slm3u8'
				// 		url: '/pages/sortVideo/sortVideo',
				// 	})
				// 	return
				// }
				
				if(videoInfo.vod_play_from.indexOf("m3u8") != -1) {
					// uni.setStorageSync('sortVideoInfo',JSON.stringify(videoInfo))
					 uni.setStorageSync('videoInfo',JSON.stringify(videoInfo))
					uni.switchTab({
						url:'/pages/videoPlay/videoPlay',
					})
					// uni.navigateTo({
					// 	url: '/pages/sortVideo/sortVideo',
					// })
					return
				}
				
			},
			/**
			 * 设置主题
			 * */
			setTheme(type) {
				this.page = 1
				this.theme = type
				uni.setStorageSync('indexTheme',type)
				if(type == 'recommend') {
					this.categoeryLimit = 10
					this.getVideotypeList()
					this.videoType = 1
					this.getVideoAllList()
					return
				}
				if(type == 'rank') {
					// this.getVideotypeList()
					// this.videoType = 1
					this.rankType = 1
					this.getRankVideos()
					return
				}
				if(type == 'zone') {
					// this.getVideotypeList()
					this.videoType = 1
					this.getVideoAllList()
					return
				}
				if(type == 'category') {
					this.categoeryLimit = 100
					this.getVideotypeList()
					// this.videoType = 0
					// this.getVideoAllList()
					
					return
				}
				
			},
			toCategory(item) {
				this.theme = 'category'
				this.categoryActive = item.id
			},
			/**
			* 获取配置
			* **/
			getConfigKefu() {
				userService.getUserConfig({name: 'ke_fu'}).then(res => {
					this.ke_fu = res.data.value
					//跳转到客服地址
					window.location.href = this.ke_fu
					
				}).catch(err => {
					console.log('err:',err)
				})
			},
			/**
			 * 设置排行类型
			 * **/
			setRankType(type) {
				this.rankType = type
				this.getRankVideos()
			},
			setBloggerType(type){
				this.bloggerType = type
				this.getRankVideos()
			},
			/**
			 * 关闭弹窗
			 * **/
			closeModal() {
				this.modalVisible = false;
			}
		}
	}
</script>

<style lang="scss">
	page{
		height: 100%;
	}
	::v-deep .index_m_panel{
		img{
			width: 100%;
			height: 100%;
		}
	}
	.index{
		height: 100%;
		position: relative;
	}
	.index_head{
		height: 80rpx;
		display: flex;
		padding: 0 30rpx;
		justify-content: space-between;
		align-items: center;
		background-color: #3F6AF4;
	}
	.index_cus{
		width: 60rpx;
		height: 60rpx;
		img{
			width: 100%;
			height: auto;
		}
	}
	.index_search{
		width: 70vw;
		background-color: white;
		border-radius: 6rpx;
		padding-left: 60rpx;
	}
	.index_box{
		position: relative;
		display: flex;
		align-items: center;
	}
	.index_search_i{
		position: absolute;
		width: 40rpx;
		z-index: 99;
		left: 8rpx;
		top: 2rpx;
	}
	.index_section{
		height: calc(100% - 80rpx);
	}
	.index_tap{
		height: 60rpx;
		background-color: #3F6AF4;
		margin-top: -2rpx;
		display: flex;
		justify-content: space-around;
		padding: 4rpx 30rpx;
	}
	.index_ta_item{
		color: white;
		font-size: 15px;
		font-family: PingFang SC;
		font-weight: 400;
	}
	.index_ta_active{
		border-bottom:4rpx solid white ;
	}
	.index_content{
		height: calc(100% - 60rpx);
		overflow-y: auto;
		background-color: #FAFAFA;
	}
	.index_banner{
		height: 310rpx;
		
		img{
			width: 100%;
			height: 100%;
		}
	}
	.index_list_head{
		padding: 10rpx 20rpx;
		display: flex;
		justify-content: space-between;
	}
	.index_li_more{
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #999999;
	}
	.index_li_title{
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #333333;
	}
	.index_list{
		display: flex;
		flex-wrap: wrap;
		padding: 20rpx 30rpx;
		justify-content: space-between;
	}
	.index_li_item{
		width: calc(100% / 2 - 20rpx);
		height: 180rpx;
		margin-bottom: 80rpx;
	}
	.index_poster{
		position: relative;
		height: 200rpx;
		
		img:nth-child(1){
			width: 100%;
			height: 100%;
		};
	}
	.index_play_img{ 
		width: 80rpx;
		height: auto;
		position: absolute;
		left: 0;
		bottom: 0;
	}
	.index_name{
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #333333;
		text-align: center;
		overflow: hidden;
		text-overflow: ellipsis;
		height: 40rpx;
		border-right: none !important;
	}
	.index_cate_name2{
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		border-right: none !important;
	}
	.index_vip{
		width: 60rpx;
		height: 28rpx;
		background: #F5DABE;
		border-radius: 0px 0px 0px 4px;
		right: 0;
		position: absolute;
		top:0;
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #682604;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.index_apps{
		display: flex;
		flex-wrap: wrap;
		padding: 20rpx 30rpx;
		justify-content: space-between;
	}
	.index_ap_item{
		width: calc(100% / 5 - 20rpx);
		height: 150rpx;
		text-align: center;
		margin-top: 10rpx;
		margin-bottom: 36rpx;
	}
	.index_ap_mark{
		width: 100rpx;
		height: 100rpx;
		margin-bottom: 10rpx;
		img{
			width: 100%;
			height: 100%;
			border-radius: 50%;
			border: 1px solid black;
		}
	}
	.index_li_title1{
		font-size: 16px;
		font-family: PingFang SC;
		font-weight: bold;
		color: #333333;
	}
	.index_rec_block{
		background: #FFFFFF;
		box-shadow: 2px 2px 16px 0px rgba(0,0,0,0.14);
		border-radius: 6px;
		padding: 0 0 20rpx 0rpx;
		width: 92vw;
		margin: 0  auto;
		margin-bottom: 20rpx;
	}
	.tuijian{
		width: 92vw;
		margin: 0  auto;
		margin-bottom: 20rpx;
		font-size: 36upx;
		color: red;
	}
	.index_rec_poster{
		height: 300rpx;
		
		img{
			width: 100%;
			height: 100%;
			border-top-left-radius: 10rpx;
			border-top-right-radius: 10rpx;
			border: 1px solid #ccc;
		}
	}
	.index_rec_title{
		display: flex;
	}
	.index_rec_name{
		font-size: 18px;
		font-family: PingFang SC;
		font-weight: bold;
		margin-right: 10rpx;
		max-width: 72%;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
		color: #333333;
	}
	.index_rec_progress{
		background: #F5DABE;
		border-radius: 3px;
		font-size: 13px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #682604;
		display: flex;
		align-items: center;
		padding: 0 6rpx;
	}
	.index_rec_content{
		margin-top: 20rpx;
		padding: 0 20rpx;
	}
	.index_rec_brief{
		font-size: 13px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #333333;
		word-wrap: break-word;
	}
	.index_rec_label{
		display: flex;
		margin-top: 10rpx;
	}
	.index_label{
		background: #E1E1E1;
		border-radius: 8rpx;
		width: 100rpx;
		height: 56rpx;
		margin-right: 10px;
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: 12px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #999999;
	}
	.index_ran_tab{
		display: flex;
		height: 80rpx;
		align-items: center;
	}
	.index_rank{
		padding: 0 20rpx;
	}
	.index_ran_type{
		font-size: 15px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #666666;
		margin-right: 20rpx;
		padding-bottom: 10rpx;
		// width: 50rpx;
		white-space : nowrap;
		text-align: center;
	}
	.index_ran_active{
		color: #3F6AF4;
		border-bottom: 2px solid #3F6AF4;
	}
	.index_ran_block{
		background: #FFFFFF;
		box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
		border-radius: 10px;
		padding: 20rpx;
		margin-bottom: 28rpx;
	}
	.index_ran_more{
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 400;
		color: #999999;
	}
	.index_ran_head{
		height: 50rpx;
		align-items: center;
	}
	.index_ran_icon{
		width: 70rpx;
		height: auto;
	}
	.index_ran_title{
		display: flex;
		font-size: 20px;
		align-items: center;
	}
	.index_ran_list{
		display: flex;
		flex-wrap: wrap;
		padding: 20rpx 30rpx;
		justify-content: space-between;
	}
	.index_blog_types{
		display: flex;
		justify-content: center;
		align-items: center;
		height: 160rpx;
		margin-bottom: 20rpx;
	}
	.index_blog_type{
		height: 100%;
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #666666;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		margin:0 40rpx;
		padding-bottom: 10rpx;
		
		img{
			width: 110rpx;
			height: auto;
			margin-bottom: 12rpx;
		}
	}
	.index_blog_active{
		font-family: PingFang SC;
		font-weight: 500;
		color: #3F6AF4;
		border-bottom: 1px solid #3F6AF4;
	}
	.index_m_head{
		text-align: center;
		font-size: 18px;
		font-family: PingFang SC;
		font-weight: bold;
		color: white;
		line-height: 18px;
	}
	.index_m_panel{
		width: 95%;
		// height: 580rpx;
		background: #FFFFFF;
		border-radius: 10rpx;
		margin: 30% auto 0 auto;
		// padding: 30rpx 0;
		background-size: 100% !important;
		text-align: center;
		background: rgba(0,0,0,0);
		// img{
		// 	width: 90%;
		// 	height: auto;
		// }
	}
	.index_m_body{
		height: 400rpx;
		margin-top: 20rpx;
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: white;
		text-align: center;
	}
	.index_m_btn{
		width: 304rpx;
		height: 70rpx;
		background: #3F6AF4;
		border-radius: 36rpx;
		font-size: 18px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #FFFFFF;
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 0 auto;
	}
	.index_m_bottom{
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 0rpx;
		img{
			width: 100rpx;
			height: 100upx;
		}
	}
	.index_cate_body{
		height: calc(100% - 310rpx - 80rpx);
		// overflow-y: auto;
		display: flex;
	}
	.index_cate_name{
		height: 100%;
		width: 200rpx;
		overflow-y: auto;
		border-right: 1px solid #A1A1A1;
	}
	.index_cate_panel{
		height: 100%;
		overflow-y: auto;
		display: flex;
		flex-wrap: wrap;
		flex: 1;
	}
	.index_cate_title{
		padding: 10rpx 0;
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: 14px;
		font-family: PingFang SC;
		font-weight: 500;
		color: #666666;
	}
	.index_cate_title_act{
		color: #3F6AF4;
		border-left: 6rpx solid #3F6AF4;
	}
</style>
