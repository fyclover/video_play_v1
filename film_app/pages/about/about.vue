<template>
	<view style="text-align: center;color: indianred">
		<br/><br/>
		{{guanyuwomen}}
	</view>
</template>

<script>
	export default {
		data() {
			return {
				guanyuwomen:'',
			}
		},
		methods: {
				
		},
		created(){
			this.guanyuwomen = localStorage.getItem('guanyuwomen')
		}
	}
</script>

<style>

</style>
