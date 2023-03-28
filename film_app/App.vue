<script>
	export default {
		onLaunch: function() {
			console.log('App Launch')
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>

<style  lang='scss'>
	@import "uview-ui/index.scss";
	*{
		box-sizing: border-box;
		margin: 0;
		padding: 0;
	}
	/*每个页面公共css */
	.modal{
		position: fixed;
		z-index: 999;
		height: 100%;
		width: 100%;
		top: 0;
		left: 0;
		background-color: rgba(0,0,0,0.5);
	}
	.dis{
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.disc{
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	}
</style>
