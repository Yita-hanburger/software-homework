<template>
	<view class="content">
		<view :style='{"padding":"240rpx 30rpx 120rpx","backgroundColor":"#DFD8CC","backgroundImage":"url(http://codegen.caihongy.cn/20231129/75a2ef6b312c4b459d7ae49148603572.png)","width":"100%","backgroundSize":"100% 400rpx","position":"relative","backgroundRepeat":"no-repeat","height":"auto"}'>
			<view v-if="user" :style='{"padding":"0 24rpx","margin":"0 0 20rpx 0","borderRadius":"20rpx","background":"#FFFFFF","display":"flex","width":"100%","position":"relative","height":"320rpx"}' @tap="onPageTap('../user-info/user-info')" class="header" v-bind:class="{'status':isH5Plus}">
				<view :style='{"alignContent":"center","alignItems":"center","flex":"1","display":"flex","height":"100%"}' v-if="tableName=='yonghu'" class="userinfo">
					<image :style='{"width":"100rpx","padding":"0","margin":"0 20rpx 0 0","borderRadius":"100%","height":"100rpx"}' :src="user.touxiang?baseUrl+user.touxiang:'/static/gen/upload.png'"></image>
					<view :style='{"width":"300rpx","margin":"0 20rpx 0 0","flex":"1","flexDirection":"column","justifyContent":"center","display":"flex"}' class="info">
						<view :style='{"width":"100%","lineHeight":"36rpx","fontSize":"24rpx","color":"#000"}'>{{user.yonghuzhanghao}}<text v-if="user.vip&& user.vip=='是'">(VIP)</text></view>
					</view>
					
					<view :style='{"padding":"20rpx","borderRadius":"20rpx 20rpx 0 0","left":"20rpx","bottom":"0","background":"#D4CF5D","display":"flex","width":"calc(100% - 40rpx)","position":"absolute","justifyContent":"space-around"}' class="info">
						<view :style='{"width":"auto","lineHeight":"36rpx","fontSize":"24rpx","color":"#FFFFFF"}'>手机：{{user.mobile}}</view>
						<view :style='{"width":"auto","lineHeight":"36rpx","fontSize":"24rpx","color":"#FFFFFF"}' v-if="user.money">余额：{{user.money}}</view>
						<view :style='{"width":"auto","lineHeight":"36rpx","fontSize":"24rpx","color":"#FFFFFF"}' v-if="user.jf||user.jf==0">积分：{{user.jf}}</view>
					</view>
				</view>
				<view :style='{"alignContent":"center","alignItems":"center","flex":"1","display":"flex","height":"100%"}' v-if="tableName=='shangjia'" class="userinfo">
					<view :style='{"width":"300rpx","margin":"0 20rpx 0 0","flex":"1","flexDirection":"column","justifyContent":"center","display":"flex"}' class="info">
						<view :style='{"width":"100%","lineHeight":"36rpx","fontSize":"24rpx","color":"#000"}'>{{user.shangjiazhanghao}}<text v-if="user.vip&& user.vip=='是'">(VIP)</text></view>
					</view>
					
					<view :style='{"padding":"20rpx","borderRadius":"20rpx 20rpx 0 0","left":"20rpx","bottom":"0","background":"#D4CF5D","display":"flex","width":"calc(100% - 40rpx)","position":"absolute","justifyContent":"space-around"}' class="info">
						<view :style='{"width":"auto","lineHeight":"36rpx","fontSize":"24rpx","color":"#FFFFFF"}'>手机：{{user.lianxidianhua}}</view>
						<view :style='{"width":"auto","lineHeight":"36rpx","fontSize":"24rpx","color":"#FFFFFF"}' v-if="user.money">余额：{{user.money}}</view>
						<view :style='{"width":"auto","lineHeight":"36rpx","fontSize":"24rpx","color":"#FFFFFF"}' v-if="user.jf||user.jf==0">积分：{{user.jf}}</view>
					</view>
				</view>
				<view :style='{"alignItems":"center","top":"10rpx","display":"flex","width":"100rpx","position":"absolute","right":"20rpx","justifyContent":"center","height":"40rpx"}' class="setting">
					<text class="icon iconfont icon-qita6" :style='{"border":"0","width":"30rpx","lineHeight":"30rpx","fontSize":"30rpx","color":"#000","borderRadius":"0"}'></text>
					<text :style='{"color":"#000","lineHeight":"2","fontSize":"24rpx"}'>设置</text>
				</view>
			</view>
			
			<view v-else :style='{"padding":"0 24rpx","margin":"0 0 20rpx 0","borderRadius":"20rpx","background":"#FFFFFF","display":"flex","width":"100%","position":"relative","height":"320rpx"}' @tap="loginClick" class="header" v-bind:class="{'status':isH5Plus}">
				<view style="width: 100%;height: 100%;display: flex;align-items: center;justify-content: center;font-size: 18px;color: #666">登录/注册</view>
			</view>
			
			<view :style='{"width":"100%","height":"auto"}' class="list">
				<view :style='{"width":"100%","margin":"0 0 20rpx 0","overflow":"hidden","borderRadius":"10rpx","height":"auto"}'>
					<view :style='{"width":"100%","padding":"10rpx 20rpx","background":"#D4CF5D","justifyContent":"space-between","display":"flex","height":"auto"}'>
						<view :style='{"color":"#fff","fontSize":"28rpx","lineHeight":"72rpx"}'>我的订单</view>
						<view :style='{"color":"#fff","fontSize":"28rpx","lineHeight":"72rpx"}' @tap="onPageTap('../shop-order/shop-order')">查看全部</view>
					</view>
					<view :style='{"width":"100%","padding":"20rpx 0","background":"#ffffff","display":"flex","height":"auto"}'>
						<view class="list-item" :style='{"alignItems":"center","flex":"1","flexDirection":"column","display":"flex","height":"auto"}' @tap="onPageTap('../shop-order/shop-order?nav=未支付')">
							<span class="icon iconfont icon-menu02" :style='{"color":"#333","lineHeight":"1","fontSize":"36rpx"}'></span>
							<view :style='{"color":"#333","lineHeight":"2","fontSize":"24rpx"}' class="title">未支付</view>
						</view>
						<view class="list-item" :style='{"alignItems":"center","flex":"1","flexDirection":"column","display":"flex","height":"auto"}' @tap="onPageTap('../shop-order/shop-order?nav=已支付')">
							<span class="icon iconfont icon-menu03" :style='{"color":"#333","lineHeight":"1","fontSize":"36rpx"}'></span>
							<view :style='{"color":"#333","lineHeight":"2","fontSize":"24rpx"}' class="title">已支付</view>
						</view>
						<view class="list-item" :style='{"alignItems":"center","flex":"1","flexDirection":"column","display":"flex","height":"auto"}' @tap="onPageTap('../shop-order/shop-order?nav=已完成')">
							<span class="icon iconfont icon-menu08" :style='{"color":"#333","lineHeight":"1","fontSize":"36rpx"}'></span>
							<view :style='{"color":"#333","lineHeight":"2","fontSize":"24rpx"}' class="title">已完成</view>
						</view>
						<view class="list-item" :style='{"alignItems":"center","flex":"1","flexDirection":"column","display":"flex","height":"auto"}' @tap="onPageTap('../shop-order/shop-order?nav=已取消')">
							<span class="icon iconfont icon-menu09" :style='{"color":"#333","lineHeight":"1","fontSize":"36rpx"}'></span>
							<view :style='{"color":"#333","lineHeight":"2","fontSize":"24rpx"}' class="title">已取消</view>
						</view>
						<view class="list-item" :style='{"alignItems":"center","flex":"1","flexDirection":"column","display":"flex","height":"auto"}' @tap="onPageTap('../shop-order/shop-order?nav=已退款')">
							<span class="icon iconfont icon-menu12" :style='{"color":"#333","lineHeight":"1","fontSize":"36rpx"}'></span>
							<view :style='{"color":"#333","lineHeight":"2","fontSize":"24rpx"}' class="title">已退款</view>
						</view>
						<!-- <view class="list-item" :style='{"alignItems":"center","flex":"1","flexDirection":"column","display":"flex","height":"auto"}' @tap="onPageTap('../shop-order/shop-order?nav=已发货')">
							<span class="icon iconfont icon-menu16" :style='{"color":"#333","lineHeight":"1","fontSize":"36rpx"}'></span>
							<view :style='{"color":"#333","lineHeight":"2","fontSize":"24rpx"}' class="title">已发货</view>
						</view> -->
					</view>
				</view>
				
				<view :style='{"width":"100%","overflow":"hidden","borderRadius":"10rpx","height":"auto"}'>
					<view :style='{"width":"100%","padding":"10rpx 20rpx","background":"#D4CF5D","justifyContent":"space-between","display":"flex","height":"auto"}'>
						<view :style='{"color":"#fff","fontSize":"28rpx","lineHeight":"72rpx"}'>我的服务</view>
					</view>
					<view :style='{"width":"100%","padding":"0 24rpx","flexWrap":"wrap","background":"#ffffff","display":"flex","height":"auto"}'>
					
						<block v-for="item in menuList" v-bind:key="item.roleName">
							<block v-if="role==item.roleName" v-bind:key="index" v-for=" (menu,index) in item.backMenu">
								<block v-bind:key="sort" v-for=" (child,sort) in menu.child">
									<view :style='{"borderColor":"#ccc","margin":"10rpx 1%","alignItems":"center","borderWidth":"0","flexDirection":"column","display":"flex","width":"23%","borderStyle":"solid","justifyContent":"center","height":"160rpx"}' v-if="child.tableName!='yifahuodingdan' && child.tableName!='yituikuandingdan' &&child.tableName!='yiquxiaodingdan' && child.tableName!='weizhifudingdan' && child.tableName!='yizhifudingdan' && child.tableName!='yiwanchengdingdan' && child.tableName!='exampaper' && child.tableName!='examquestion' " @tap="onPageTap('../'+child.tableName+'/list?userid='+user.id+'&menuJump='+child.menuJump)" class="li" hover-class="hover">
										<view :style='{"color":"#d4cf5d","fontSize":"60rpx"}' :class="child.appFrontIcon"></view>
										<view :style='{"width":"100%","padding":"0","lineHeight":"88rpx","fontSize":"24rpx","color":"#9E9E9E","textAlign":"center"}' class="text">{{child.menu}}</view>
										<view :style='{"width":"28rpx","lineHeight":"28rpx","fontSize":"28rpx","color":"#999"}' class="icon iconfont "></view>
									</view>
								</block>
							</block>
						</block>
						
						<view @tap="onPageTap('../shop-recharge/pay-confirm')" :style='{"borderColor":"#ccc","margin":"10rpx 1%","alignItems":"center","borderWidth":"0","flexDirection":"column","display":"flex","width":"23%","borderStyle":"solid","justifyContent":"center","height":"160rpx"}' class="li" hover-class="hover">
							<view :style='{"color":"#d4cf5d","fontSize":"60rpx"}' class="cuIcon-moneybag"></view>
							<view class="text" :style='{"width":"100%","padding":"0","lineHeight":"88rpx","fontSize":"24rpx","color":"#9E9E9E","textAlign":"center"}'>用户充值</view>
							<view :style='{"width":"28rpx","lineHeight":"28rpx","fontSize":"28rpx","color":"#999"}' class="icon iconfont "></view>
						</view>
						<view @tap="onPageTap('../shop-cart/shop-cart')" :style='{"borderColor":"#ccc","margin":"10rpx 1%","alignItems":"center","borderWidth":"0","flexDirection":"column","display":"flex","width":"23%","borderStyle":"solid","justifyContent":"center","height":"160rpx"}' class="li" hover-class="hover">
							<view :style='{"color":"#d4cf5d","fontSize":"60rpx"}' class="cuIcon-cart"></view>
							<view class="text" :style='{"width":"100%","padding":"0","lineHeight":"88rpx","fontSize":"24rpx","color":"#9E9E9E","textAlign":"center"}'>购物车</view>
							<view :style='{"width":"28rpx","lineHeight":"28rpx","fontSize":"28rpx","color":"#999"}' class="icon iconfont "></view>
						</view>
						<view @tap="onPageTap('../shop-order/shop-order')" :style='{"borderColor":"#ccc","margin":"10rpx 1%","alignItems":"center","borderWidth":"0","flexDirection":"column","display":"flex","width":"23%","borderStyle":"solid","justifyContent":"center","height":"160rpx"}' class="li" hover-class="hover">
							<view :style='{"color":"#d4cf5d","fontSize":"60rpx"}' class="cuIcon-order"></view>
							<view class="text" :style='{"width":"100%","padding":"0","lineHeight":"88rpx","fontSize":"24rpx","color":"#9E9E9E","textAlign":"center"}'>我的订单</view>
							<view :style='{"width":"28rpx","lineHeight":"28rpx","fontSize":"28rpx","color":"#999"}' class="icon iconfont "></view>
						</view>
					</view>
				</view>
			</view>
			
			<!-- 推荐 -->
			<view class="recommend" :style='{"width":"100%","margin":"20rpx 0 ","overflow":"hidden","borderRadius":"10rpx","background":"#fff","height":"auto"}' v-if="recommendList.length">
				<view :style='{"width":"100%","padding":"0 24rpx","lineHeight":"80rpx","fontSize":"28rpx","color":"#fff","background":"#d4cf5d"}'>为你推荐</view>
				<view :style='{"padding":"0 20rpx 20rpx","flexWrap":"wrap","background":"#fff","display":"flex","width":"100%","justifyContent":"space-between","height":"auto"}'>
					<view v-for="(item,index) in recommendList" :key="index" :style='{"width":"48%","margin":"20rpx 0 0 0","background":"#fff","height":"auto"}' @click="recommendDetail(item.id)">
						<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"200rpx"}' :src="item[recommendPicture]?(baseUrl + item[recommendPicture].split(',')[0]):''"></image>
						<view :style='{"padding":"0 8rpx","lineHeight":"50rpx","fontSize":"28rpx","color":"#000","textAlign":"center"}'>{{item[recommendTitle]}}</view>
						<view :style='{"padding":"0 8rpx","lineHeight":"24rpx","fontSize":"24rpx","color":"#999","textAlign":"center"}'>{{item.addtime}}</view>
					</view>
				</view>
			</view>

		</view>
	</view>
</template>
<script>
	import menu from '@/utils/menu'
	export default {
		data() {
			return {
				isH5Plus: true,
				user: {},
				tableName:'',
				role: '',
				menuList: [],
				iconArr: [
				  'cuIcon-same',
				  'cuIcon-deliver',
				  'cuIcon-evaluate',
				  'cuIcon-shop',
				  'cuIcon-ticket',
				  'cuIcon-cascades',
				  'cuIcon-discover',
				  'cuIcon-question',
				  'cuIcon-pic',
				  'cuIcon-filter',
				  'cuIcon-footprint',
				  'cuIcon-pulldown',
				  'cuIcon-pullup',
				  'cuIcon-moreandroid',
				  'cuIcon-refund',
				  'cuIcon-qrcode',
				  'cuIcon-remind',
				  'cuIcon-profile',
				  'cuIcon-home',
				  'cuIcon-message',
				  'cuIcon-link',
				  'cuIcon-lock',
				  'cuIcon-unlock',
				  'cuIcon-vip',
				  'cuIcon-weibo',
				  'cuIcon-activity',
				  'cuIcon-friendadd',
				  'cuIcon-friendfamous',
				  'cuIcon-friend',
				  'cuIcon-goods',
				  'cuIcon-selection'
				],
				recommendList: [],
				recommendTable: '',
				recommendTitle: '',
				recommendPicture: '',
			};
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			}
		},
		async onLoad(){
			this.role = uni.getStorageSync("role");
			let table = uni.getStorageSync("nowTable");
			let res = await this.$api.session(table);
			this.user = res.data;
			this.tableName = table;
			let menus = menu.list();
			this.menuList = menus;
		},
		async onShow(){
            uni.removeStorageSync("useridTag");
			this.role = uni.getStorageSync("role");
			let table = uni.getStorageSync("nowTable");
			let res = await this.$api.session(table);
			this.user = res.data;
			this.getThumbsup()
			this.getStoreup()
			this.tableName = table;
			let menus = menu.list();
			this.menuList = menus;
			this.getRecommendList()
		},
		methods: {
			async getThumbsup(){
				let res = await this.$api.page('storeup',{userid: this.user.id,type: 21})
				this.user.thumbsnum = Number(res.data.total)
			},
			async getStoreup(){
				let res = await this.$api.page('storeup',{userid: this.user.id,type: 1})
				this.user.storenum = Number(res.data.total)
			},
			loginClick(){
				uni.navigateTo({
					url: '../login/login'
				});
			},
			onPageTap(url) {
                uni.setStorageSync("useridTag",1);
				uni.navigateTo({
					url: url,
					fail: function() {
						uni.switchTab({
							url: url
						});
					}
				});
			},
			async getRecommendList(){
				let params = {
					page: 1,
					limit: 4
				}
				let res;
				if(uni.getStorageSync("userid")) {
					res = await this.$api.recommend2('tushuxinxi', params);
				} else {
					res = await this.$api.recommend('tushuxinxi', params);
				}
				console.log(res.data)
				this.recommendList = res.data.list
				this.recommendTable = 'tushuxinxi'
				this.recommendTitle = 'tushumingcheng'
				this.recommendPicture = 'tushufengmian'
				this.$forceUpdate()
			},
			recommendDetail(id) {
				uni.navigateTo({
					url: `../${this.recommendTable}/detail?id=${id}`,
					fail: function() {
						uni.switchTab({
							url: `../${this.recommendTable}/detail?id=${id}`
						});
					}
				});
			},
		}
	}
</script>

<style lang="scss" scoped>
	.content {
		height: calc(100vh - 94px);
		box-sizing: border-box;
	}
</style>
