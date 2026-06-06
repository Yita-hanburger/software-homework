<template>
<view class="content">
	<view :style='{"width":"100%","padding":"130rpx 2%","position":"relative","background":"#DFD8CC","height":"auto"}'>
		<swiper :style='{"width":"100%","overflow":"hidden","borderRadius":"10rpx","background":"#fff","height":"360rpx"}' class="swiper" :indicator-dots='true' :autoplay='true' :circular='true' indicator-active-color='#000000' indicator-color='rgba(0, 0, 0, .3)' :duration='500' :interval='5000' :vertical='true'>
			<swiper-item :style='{"width":"100%","background":"#fff","height":"360rpx"}' v-for="(swiper,index) in swiperList" :key="index" @tap="onSwiperTap(swiper)">
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"360rpx"}' mode="aspectFill" :src="baseUrl+swiper.img"></image>
				<view v-if="false" :style='{"width":"100%","padding":"0 8rpx","lineHeight":"60rpx","fontSize":"28rpx","color":"#333","background":"#fff"}'>{{ swiper.title }}</view>
			</swiper-item>
		</swiper>


		<!-- menu -->
		<view v-if="true" class="menu" :style='{"width":"100%","padding":"0","margin":"0","flexWrap":"wrap","display":"flex","height":"auto"}'>
            <block v-for="item in menuList" v-bind:key="item.roleName">
                <block v-if="role==item.roleName" v-bind:key="index" v-for=" (menu,index) in item.frontMenu">
                    <block v-bind:key="sort" v-for=" (child,sort) in menu.child">
                        <block v-bind:key="sort2" v-for=" (button,sort2) in child.buttons">
                            <view :style='{"width":"23%","padding":"12rpx 0","margin":"10rpx 1%","height":"auto"}' class="menu-list" v-if="button=='查看' && child.tableName!='yifahuodingdan' && child.tableName!='yituikuandingdan' &&child.tableName!='yiquxiaodingdan' && child.tableName!='weizhifudingdan' && child.tableName!='yizhifudingdan' && child.tableName!='yiwanchengdingdan' " @tap="onPageTap2('../'+child.tableName+'/list')">
                                <view class="iconarr" :class="child.appFrontIcon" :style='{"padding":"0","margin":"0px auto","color":"#333","borderRadius":"10rpx","textAlign":"center","background":"#D4CF5D","display":"block","width":"100rpx","lineHeight":"100rpx","fontSize":"64rpx","height":"100rpx"}'></view>
                                <view :style='{"padding":"0","margin":"12rpx auto 0","color":"#333","textAlign":"center","width":"100%","lineHeight":"28rpx","fontSize":"28rpx"}'>{{child.menu.split("列表")[0]}}</view>
                            </view>
                        </block>
                    </block>
                </block>
            </block>
		</view>
		<!-- menu -->
		
		<!-- 关于我们 -->
		<view :style='{"padding":"30rpx","margin":"0 0 20rpx","borderRadius":"20rpx","background":"#fff","flexDirection":"column","display":"flex","width":"100%","position":"relative","height":"640rpx"}'>
			<view :style='{"width":"65%","lineHeight":"60rpx","fontSize":"48rpx","color":"#D4CF5D"}'>{{aboutUsDetail.title}}</view>
			<view :style='{"width":"65%","margin":"0","lineHeight":"40rpx","fontSize":"32rpx","color":"#D4CF5D"}'>{{aboutUsDetail.subtitle}}</view>
			<view :style='{"padding":"0","top":"0","left":"0","display":"flex","width":"100%","position":"absolute","height":"100%","order":"1"}'>
				<img :style='{"margin":"0 10rpx","objectFit":"cover","top":"20rpx","borderRadius":"10rpx ","display":"block","width":"25%","position":"absolute","right":"20rpx","height":"360rpx"}' v-if="aboutUsDetail.picture1" :src="baseUrl+aboutUsDetail.picture1">
				<img :style='{"margin":"0","objectFit":"cover","borderRadius":"10rpx ","left":"20rpx","bottom":"20rpx","display":"block","width":"63%","position":"absolute","height":"200rpx","order":"1"}' v-if="aboutUsDetail.picture2" :src="baseUrl+aboutUsDetail.picture2"">
				<img :style='{"margin":"0 10rpx","objectFit":"cover","borderRadius":"10rpx ","bottom":"20rpx","display":"block","width":"25%","position":"absolute","right":"20rpx","height":"200rpx","order":"2"}' v-if="aboutUsDetail.picture3" :src="baseUrl+aboutUsDetail.picture3"">
			</view>
			<view :style='{"padding":"0","margin":"0 0 20rpx 0","overflow":"hidden","color":"#000000","width":"65%","lineHeight":"50rpx","fontSize":"28rpx","height":"250rpx"}' v-html="aboutUsDetail.content"></view>
			<view :style='{"border":"0","padding":"0 30rpx","margin":"0 auto","textAlign":"center","background":"#409EFF","display":"none","width":"auto","lineHeight":"56rpx"}'>
			  <text :style='{"color":"#f5f5f5","fontSize":"24rpx"}'>更多</text>
			  <text class="icon iconfont icon-gengduo1" :style='{"color":"#f5f5f5","fontSize":"24rpx"}'></text>
			</view>
			<view :style='{"width":"50%","background":"url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat","display":"none","height":"160rpx"}' />
			<view :style='{"width":"50%","background":"url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat","display":"none","height":"160rpx"}' />
		</view>

		<!-- 系统简介 -->
		<view :style='{"padding":"30rpx","margin":"0 0 20rpx","borderRadius":"20rpx","flexWrap":"wrap","background":"#fff","display":"flex","width":"100%","height":"auto"}'>
			<view :style='{"width":"100%","lineHeight":"1.5","fontSize":"48rpx","color":"#D4CF5D"}'>{{systemIntroductionDetail.title}}</view>
			<view :style='{"width":"100%","margin":"0","lineHeight":"1.5","fontSize":"32rpx","color":"#D4CF5D"}'>{{systemIntroductionDetail.subtitle}}</view>
			<view :style='{"width":"100%","padding":"0","flexWrap":"wrap","display":"flex","height":"auto","order":"1"}'>
				<img :style='{"margin":"0 10rpx","objectFit":"cover","borderRadius":"10rpx","flex":1,"display":"block","height":"300rpx"}' v-if="systemIntroductionDetail.picture1" :src="baseUrl+systemIntroductionDetail.picture1">
				<img :style='{"margin":"0 10rpx","objectFit":"cover","flex":1,"display":"none","height":"160rpx"}' v-if="systemIntroductionDetail.picture2" :src="baseUrl+systemIntroductionDetail.picture2">
				<img :style='{"margin":"0 10rpx","objectFit":"cover","flex":1,"display":"none","height":"160rpx"}' v-if="systemIntroductionDetail.picture3" :src="baseUrl+systemIntroductionDetail.picture3">
			</view>
			<view :style='{"width":"100%","padding":"0","margin":"0 0 20rpx 0","lineHeight":"2","fontSize":"28rpx","color":"#000000"}' v-html="systemIntroductionDetail.content"></view>
			<view :style='{"border":"0","padding":"0 30rpx","margin":"0 auto","textAlign":"center","background":"#409EFF","display":"none","width":"auto","lineHeight":"56rpx"}'>
			  <text :style='{"color":"#f5f5f5","fontSize":"24rpx"}'>更多</text>
			  <text class="icon iconfont icon-gengduo1" :style='{"color":"#f5f5f5","fontSize":"24rpx"}'></text>
			</view>
			<view :style='{"width":"50%","background":"url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat","display":"none","height":"160rpx"}' />
			<view :style='{"width":"50%","background":"url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat","display":"none","height":"160rpx"}' />
		</view>
		
		<!-- 商品推荐 -->
		<view class="listBox recommend" :style='{"width":"100%","margin":"0 0 20rpx","overflow":"hidden","borderRadius":"20rpx","background":"#fff","height":"auto"}'>
			<view v-if="false && 1 == 1" class="idea recommendIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex","height":"auto"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
			
			<view class="title" :style='{"width":"100%","padding":"0 24rpx","margin":"0","background":"#D4CF5D"}'>
				<view :style='{"fontSize":"48rpx","lineHeight":"88rpx","color":"#fff","textAlign":"center"}'>图书信息推荐</view>
			</view>
			
			<view v-if="false && 1 == 2" class="idea recommendIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex","height":"auto"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
			
			
			
			
			  
			<!-- 样式5 -->
			<view class="list-box style5">
				<swiper :style='{"width":"100%","padding":"30rpx 40rpx 50rpx","background":"#fff","height":"440rpx"}' class="swiper" :indicator-dots='true' :autoplay='true' :circular='true' indicator-active-color='#000000' indicator-color='rgba(0, 0, 0, .3)' :duration='500' :interval='5000' :vertical='true'>
					<swiper-item :style='{"width":"100%","overflow":"hidden","borderRadius":"16rpx","background":"#fff","height":"360rpx"}' @tap="onDetailTap('tushuxinxi',product.id)" v-for="(product,index) in tushuxinxilist" :key="index">
						<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"360rpx"}' class="list-item-image" mode="aspectFill" v-if="product.tushufengmian.substring(0,4)=='http'" :src="product.tushufengmian"></image>
						<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"360rpx"}' class="list-item-image" mode="aspectFill" v-else :src="product.tushufengmian?baseUrl+product.tushufengmian.split(',')[0]:''"></image>
						<view :style='{"width":"100%","padding":"10rpx","position":"absolute","left":"0","background":"rgba(223,216,204,0.7)","bottom":"0"}'>
							<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"28rpx","color":"#000000"}'>{{product.tushumingcheng}}</view>
							<view :style='{"padding":"0 20rpx"}'>
							  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
							  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{product.addtime}}</text>
							</view>
							<view :style='{"padding":"0 20rpx","display":"inline-block"}'>
							  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
							  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{product.shangjiazhanghao}}</text>
							</view>
							<view :style='{"padding":"0 20rpx","display":"inline-block"}'>
							  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
							  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{product.storeupnum}}</text>
							</view>
							<view :style='{"padding":"0 20rpx","display":"inline-block"}'>
							  <text class="icon iconfont icon-chakan9" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
							  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{product.clicknum}}</text>
							</view>
						</view>
					</swiper-item>
				</swiper>
			</view>
			
			
			  
			

			  
			<view v-if="false && 1 == 3" class="idea recommendIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex","height":"auto"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
		</view>
		<!-- 商品推荐 -->
		
		<!-- 商品列表 -->
		<view class="listBox list" :style='{"margin":"0 0 20rpx","overflow":"hidden","borderRadius":"20rpx","background":"#fff"}'>
			<view v-if="false && 1 == 1" class="idea listIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
		  
			<view class="title" :style='{"width":"100%","padding":"0 24rpx","margin":"0","background":"#D4CF5D","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"color":"#fff","fontSize":"48rpx","lineHeight":"88rpx"}'>资源分享</view>
				<view :style='{"alignItems":"center","justifyContent":"center","display":"flex"}' @tap="onPageTap('ziyuanfenxiang')">
				  <text :style='{"color":"#fff","fontSize":"28rpx"}'>更多</text>
				  <text class="icon iconfont icon-gengduo1" :style='{"color":"#fff","fontSize":"28rpx"}'></text>
				</view>
			</view>
			
			<view v-if="false && 1 == 2" class="idea listIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
			
		  
		  
		  
		  <!-- 样式4 -->
		  <view v-if="4 == 4" class="list-box style4" :style='{"width":"100%","padding":"24rpx","margin":"0","height":"auto"}'>
			<view class="list-item" :style='{"width":"100%","padding":"0","margin":"0 0 20rpx","justifyContent":"space-between","display":"flex","height":"auto"}'>
			  <view v-if="homeziyuanfenxianglist.length > 0" @tap="onDetailTap('ziyuanfenxiang',homeziyuanfenxianglist[0].id)" class="box box1" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"60%","position":"relative","height":"auto"}'>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"672rpx"}' class="list-item-image" mode="aspectFill" v-if="homeziyuanfenxianglist[0].ziyuantupian.substring(0,4)=='http'" :src="homeziyuanfenxianglist[0].ziyuantupian"></image>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"672rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeziyuanfenxianglist[0].ziyuantupian?baseUrl+homeziyuanfenxianglist[0].ziyuantupian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeziyuanfenxianglist[0].ziyuanmingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[0].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[0].shangjiazhanghao}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[0].storeupnum}}</text>
					</view>
				</view>
			  </view>
			  <view class="list-item-body" :style='{"width":"38%","padding":"0","margin":"0","height":"auto"}'>
				<view v-if="homeziyuanfenxianglist.length > 1" @tap="onDetailTap('ziyuanfenxiang',homeziyuanfenxianglist[1].id)" class="box box2" :style='{"padding":"0","margin":"0 0 20rpx","overflow":"hidden","borderRadius":"20rpx","width":"100%","position":"relative","height":"auto"}'>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homeziyuanfenxianglist[1].ziyuantupian.substring(0,4)=='http'" :src="homeziyuanfenxianglist[1].ziyuantupian"></image>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeziyuanfenxianglist[1].ziyuantupian?baseUrl+homeziyuanfenxianglist[1].ziyuantupian.split(',')[0]:''"></image>
				  <view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeziyuanfenxianglist[1].ziyuanmingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[1].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[1].shangjiazhanghao}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[1].storeupnum}}</text>
					</view>
				  </view>
				</view>
				<view v-if="homeziyuanfenxianglist.length > 2" @tap="onDetailTap('ziyuanfenxiang',homeziyuanfenxianglist[2].id)" class="box box3" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"100%","position":"relative","height":"auto"}'>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homeziyuanfenxianglist[2].ziyuantupian.substring(0,4)=='http'" :src="homeziyuanfenxianglist[2].ziyuantupian"></image>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeziyuanfenxianglist[2].ziyuantupian?baseUrl+homeziyuanfenxianglist[2].ziyuantupian.split(',')[0]:''"></image>
				  <view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeziyuanfenxianglist[2].ziyuanmingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[2].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[2].shangjiazhanghao}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[2].storeupnum}}</text>
					</view>
				  </view>
				</view>
			  </view>
			</view>
			<view class="list-item" :style='{"width":"100%","padding":"0","margin":"0 0 20rpx","justifyContent":"space-between","display":"flex","height":"auto"}'>
			  <view v-if="homeziyuanfenxianglist.length > 3" @tap="onDetailTap('ziyuanfenxiang',homeziyuanfenxianglist[3].id)" class="box box4" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"60%","position":"relative","height":"auto"}'>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homeziyuanfenxianglist[3].ziyuantupian.substring(0,4)=='http'" :src="homeziyuanfenxianglist[3].ziyuantupian"></image>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeziyuanfenxianglist[3].ziyuantupian?baseUrl+homeziyuanfenxianglist[3].ziyuantupian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeziyuanfenxianglist[3].ziyuanmingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[3].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[3].shangjiazhanghao}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[3].storeupnum}}</text>
					</view>
				</view>
			  </view>
			  <view v-if="homeziyuanfenxianglist.length > 4" @tap="onDetailTap('ziyuanfenxiang',homeziyuanfenxianglist[4].id)" class="box box5" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"38%","position":"relative","height":"auto"}'>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homeziyuanfenxianglist[4].ziyuantupian.substring(0,4)=='http'" :src="homeziyuanfenxianglist[4].ziyuantupian"></image>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeziyuanfenxianglist[4].ziyuantupian?baseUrl+homeziyuanfenxianglist[4].ziyuantupian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeziyuanfenxianglist[4].ziyuanmingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[4].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[4].shangjiazhanghao}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[4].storeupnum}}</text>
					</view>
				</view>
			  </view>
			</view>
			<view v-if="homeziyuanfenxianglist.length > 5" @tap="onDetailTap('ziyuanfenxiang',homeziyuanfenxianglist[5].id)" class="box box6" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"100%","position":"relative","height":"auto"}'>
			  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homeziyuanfenxianglist[5].ziyuantupian.substring(0,4)=='http'" :src="homeziyuanfenxianglist[5].ziyuantupian"></image>
			  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeziyuanfenxianglist[5].ziyuantupian?baseUrl+homeziyuanfenxianglist[5].ziyuantupian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeziyuanfenxianglist[5].ziyuanmingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[5].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[5].shangjiazhanghao}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeziyuanfenxianglist[5].storeupnum}}</text>
					</view>
				</view>
			</view>
		  </view>
		  
		  
		  
		  
		  

		  
			<view v-if="false && 1 == 3" class="idea listIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
		</view>
		<view class="listBox list" :style='{"margin":"0 0 20rpx","overflow":"hidden","borderRadius":"20rpx","background":"#fff"}'>
			<view v-if="false && 1 == 1" class="idea listIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
		  
			<view class="title" :style='{"width":"100%","padding":"0 24rpx","margin":"0","background":"#D4CF5D","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"color":"#fff","fontSize":"48rpx","lineHeight":"88rpx"}'>求购信息</view>
				<view :style='{"alignItems":"center","justifyContent":"center","display":"flex"}' @tap="onPageTap('qiugouxinxi')">
				  <text :style='{"color":"#fff","fontSize":"28rpx"}'>更多</text>
				  <text class="icon iconfont icon-gengduo1" :style='{"color":"#fff","fontSize":"28rpx"}'></text>
				</view>
			</view>
			
			<view v-if="false && 1 == 2" class="idea listIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
			
		  
		  
		  
		  <!-- 样式4 -->
		  <view v-if="4 == 4" class="list-box style4" :style='{"width":"100%","padding":"24rpx","margin":"0","height":"auto"}'>
			<view class="list-item" :style='{"width":"100%","padding":"0","margin":"0 0 20rpx","justifyContent":"space-between","display":"flex","height":"auto"}'>
			  <view v-if="homeqiugouxinxilist.length > 0" @tap="onDetailTap('qiugouxinxi',homeqiugouxinxilist[0].id)" class="box box1" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"60%","position":"relative","height":"auto"}'>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"672rpx"}' class="list-item-image" mode="aspectFill" v-if="homeqiugouxinxilist[0].tushufengmian.substring(0,4)=='http'" :src="homeqiugouxinxilist[0].tushufengmian"></image>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"672rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeqiugouxinxilist[0].tushufengmian?baseUrl+homeqiugouxinxilist[0].tushufengmian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeqiugouxinxilist[0].tushumingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[0].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[0].yonghuzhanghao}}</text>
					</view>
				</view>
			  </view>
			  <view class="list-item-body" :style='{"width":"38%","padding":"0","margin":"0","height":"auto"}'>
				<view v-if="homeqiugouxinxilist.length > 1" @tap="onDetailTap('qiugouxinxi',homeqiugouxinxilist[1].id)" class="box box2" :style='{"padding":"0","margin":"0 0 20rpx","overflow":"hidden","borderRadius":"20rpx","width":"100%","position":"relative","height":"auto"}'>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homeqiugouxinxilist[1].tushufengmian.substring(0,4)=='http'" :src="homeqiugouxinxilist[1].tushufengmian"></image>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeqiugouxinxilist[1].tushufengmian?baseUrl+homeqiugouxinxilist[1].tushufengmian.split(',')[0]:''"></image>
				  <view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeqiugouxinxilist[1].tushumingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[1].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[1].yonghuzhanghao}}</text>
					</view>
				  </view>
				</view>
				<view v-if="homeqiugouxinxilist.length > 2" @tap="onDetailTap('qiugouxinxi',homeqiugouxinxilist[2].id)" class="box box3" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"100%","position":"relative","height":"auto"}'>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homeqiugouxinxilist[2].tushufengmian.substring(0,4)=='http'" :src="homeqiugouxinxilist[2].tushufengmian"></image>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeqiugouxinxilist[2].tushufengmian?baseUrl+homeqiugouxinxilist[2].tushufengmian.split(',')[0]:''"></image>
				  <view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeqiugouxinxilist[2].tushumingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[2].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[2].yonghuzhanghao}}</text>
					</view>
				  </view>
				</view>
			  </view>
			</view>
			<view class="list-item" :style='{"width":"100%","padding":"0","margin":"0 0 20rpx","justifyContent":"space-between","display":"flex","height":"auto"}'>
			  <view v-if="homeqiugouxinxilist.length > 3" @tap="onDetailTap('qiugouxinxi',homeqiugouxinxilist[3].id)" class="box box4" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"60%","position":"relative","height":"auto"}'>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homeqiugouxinxilist[3].tushufengmian.substring(0,4)=='http'" :src="homeqiugouxinxilist[3].tushufengmian"></image>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeqiugouxinxilist[3].tushufengmian?baseUrl+homeqiugouxinxilist[3].tushufengmian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeqiugouxinxilist[3].tushumingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[3].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[3].yonghuzhanghao}}</text>
					</view>
				</view>
			  </view>
			  <view v-if="homeqiugouxinxilist.length > 4" @tap="onDetailTap('qiugouxinxi',homeqiugouxinxilist[4].id)" class="box box5" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"38%","position":"relative","height":"auto"}'>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homeqiugouxinxilist[4].tushufengmian.substring(0,4)=='http'" :src="homeqiugouxinxilist[4].tushufengmian"></image>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeqiugouxinxilist[4].tushufengmian?baseUrl+homeqiugouxinxilist[4].tushufengmian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeqiugouxinxilist[4].tushumingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[4].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[4].yonghuzhanghao}}</text>
					</view>
				</view>
			  </view>
			</view>
			<view v-if="homeqiugouxinxilist.length > 5" @tap="onDetailTap('qiugouxinxi',homeqiugouxinxilist[5].id)" class="box box6" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"100%","position":"relative","height":"auto"}'>
			  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homeqiugouxinxilist[5].tushufengmian.substring(0,4)=='http'" :src="homeqiugouxinxilist[5].tushufengmian"></image>
			  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homeqiugouxinxilist[5].tushufengmian?baseUrl+homeqiugouxinxilist[5].tushufengmian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homeqiugouxinxilist[5].tushumingcheng}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[5].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homeqiugouxinxilist[5].yonghuzhanghao}}</text>
					</view>
				</view>
			</view>
		  </view>
		  
		  
		  
		  
		  

		  
			<view v-if="false && 1 == 3" class="idea listIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
		</view>
		<view class="listBox list" :style='{"margin":"0 0 20rpx","overflow":"hidden","borderRadius":"20rpx","background":"#fff"}'>
			<view v-if="false && 1 == 1" class="idea listIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
		  
			<view class="title" :style='{"width":"100%","padding":"0 24rpx","margin":"0","background":"#D4CF5D","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"color":"#fff","fontSize":"48rpx","lineHeight":"88rpx"}'>公告信息</view>
				<view :style='{"alignItems":"center","justifyContent":"center","display":"flex"}' @tap="onPageTap('gonggaoxinxi')">
				  <text :style='{"color":"#fff","fontSize":"28rpx"}'>更多</text>
				  <text class="icon iconfont icon-gengduo1" :style='{"color":"#fff","fontSize":"28rpx"}'></text>
				</view>
			</view>
			
			<view v-if="false && 1 == 2" class="idea listIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
			
		  
		  
		  
		  <!-- 样式4 -->
		  <view v-if="4 == 4" class="list-box style4" :style='{"width":"100%","padding":"24rpx","margin":"0","height":"auto"}'>
			<view class="list-item" :style='{"width":"100%","padding":"0","margin":"0 0 20rpx","justifyContent":"space-between","display":"flex","height":"auto"}'>
			  <view v-if="homegonggaoxinxilist.length > 0" @tap="onDetailTap('gonggaoxinxi',homegonggaoxinxilist[0].id)" class="box box1" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"60%","position":"relative","height":"auto"}'>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"672rpx"}' class="list-item-image" mode="aspectFill" v-if="homegonggaoxinxilist[0].fengmian.substring(0,4)=='http'" :src="homegonggaoxinxilist[0].fengmian"></image>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"672rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homegonggaoxinxilist[0].fengmian?baseUrl+homegonggaoxinxilist[0].fengmian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homegonggaoxinxilist[0].biaoti}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[0].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-zan10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[0].thumbsupnum}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[0].storeupnum}}</text>
					</view>
				</view>
			  </view>
			  <view class="list-item-body" :style='{"width":"38%","padding":"0","margin":"0","height":"auto"}'>
				<view v-if="homegonggaoxinxilist.length > 1" @tap="onDetailTap('gonggaoxinxi',homegonggaoxinxilist[1].id)" class="box box2" :style='{"padding":"0","margin":"0 0 20rpx","overflow":"hidden","borderRadius":"20rpx","width":"100%","position":"relative","height":"auto"}'>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homegonggaoxinxilist[1].fengmian.substring(0,4)=='http'" :src="homegonggaoxinxilist[1].fengmian"></image>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homegonggaoxinxilist[1].fengmian?baseUrl+homegonggaoxinxilist[1].fengmian.split(',')[0]:''"></image>
				  <view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homegonggaoxinxilist[1].biaoti}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[1].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-zan10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[1].thumbsupnum}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[1].storeupnum}}</text>
					</view>
				  </view>
				</view>
				<view v-if="homegonggaoxinxilist.length > 2" @tap="onDetailTap('gonggaoxinxi',homegonggaoxinxilist[2].id)" class="box box3" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"100%","position":"relative","height":"auto"}'>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homegonggaoxinxilist[2].fengmian.substring(0,4)=='http'" :src="homegonggaoxinxilist[2].fengmian"></image>
				  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homegonggaoxinxilist[2].fengmian?baseUrl+homegonggaoxinxilist[2].fengmian.split(',')[0]:''"></image>
				  <view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homegonggaoxinxilist[2].biaoti}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[2].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-zan10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[2].thumbsupnum}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[2].storeupnum}}</text>
					</view>
				  </view>
				</view>
			  </view>
			</view>
			<view class="list-item" :style='{"width":"100%","padding":"0","margin":"0 0 20rpx","justifyContent":"space-between","display":"flex","height":"auto"}'>
			  <view v-if="homegonggaoxinxilist.length > 3" @tap="onDetailTap('gonggaoxinxi',homegonggaoxinxilist[3].id)" class="box box4" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"60%","position":"relative","height":"auto"}'>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homegonggaoxinxilist[3].fengmian.substring(0,4)=='http'" :src="homegonggaoxinxilist[3].fengmian"></image>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homegonggaoxinxilist[3].fengmian?baseUrl+homegonggaoxinxilist[3].fengmian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homegonggaoxinxilist[3].biaoti}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[3].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-zan10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[3].thumbsupnum}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[3].storeupnum}}</text>
					</view>
				</view>
			  </view>
			  <view v-if="homegonggaoxinxilist.length > 4" @tap="onDetailTap('gonggaoxinxi',homegonggaoxinxilist[4].id)" class="box box5" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"38%","position":"relative","height":"auto"}'>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homegonggaoxinxilist[4].fengmian.substring(0,4)=='http'" :src="homegonggaoxinxilist[4].fengmian"></image>
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homegonggaoxinxilist[4].fengmian?baseUrl+homegonggaoxinxilist[4].fengmian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homegonggaoxinxilist[4].biaoti}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[4].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-zan10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[4].thumbsupnum}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[4].storeupnum}}</text>
					</view>
				</view>
			  </view>
			</view>
			<view v-if="homegonggaoxinxilist.length > 5" @tap="onDetailTap('gonggaoxinxi',homegonggaoxinxilist[5].id)" class="box box6" :style='{"padding":"0","margin":"0","overflow":"hidden","borderRadius":"20rpx","width":"100%","position":"relative","height":"auto"}'>
			  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-if="homegonggaoxinxilist[5].fengmian.substring(0,4)=='http'" :src="homegonggaoxinxilist[5].fengmian"></image>
			  <image :style='{"width":"100%","objectFit":"cover","display":"block","height":"328rpx"}' class="list-item-image" mode="aspectFill" v-else :src="homegonggaoxinxilist[5].fengmian?baseUrl+homegonggaoxinxilist[5].fengmian.split(',')[0]:''"></image>
				<view :style='{"width":"100%","position":"absolute","left":"0","bottom":"0","background":"rgba(223,216,204,0.7)"}'>
					<view :style='{"padding":"0 20rpx","lineHeight":"1.5","fontSize":"32rpx","color":"#000000"}' class="title ">{{homegonggaoxinxilist[5].biaoti}}</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[5].addtime}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-zan10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[5].thumbsupnum}}</text>
					</view>
					<view :style='{"padding":"0 20rpx","display":"none"}'>
					  <text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#000000"}'></text>
					  <text :style='{"color":"#000000","lineHeight":"1.5","fontSize":"24rpx"}'>{{homegonggaoxinxilist[5].storeupnum}}</text>
					</view>
				</view>
			</view>
		  </view>
		  
		  
		  
		  
		  

		  
			<view v-if="false && 1 == 3" class="idea listIdea" :style='{"padding":"40rpx","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box1"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box2"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#fff","height":"160rpx"}' class="box box4"></view>
			</view>
		</view>
		<!-- 商品列表 -->
		
		<!-- 新闻资讯 -->
		<!-- 新闻资讯 -->

	</view>
</view>
</template>

<script>
    import menu from '@/utils/menu'
	import '@/assets/css/global-restaurant.css'
	import uniIcons from "@/components/uni-ui/lib/uni-icons/uni-icons.vue"
	export default {
		components: {
			uniIcons
		},
		data() {
			return {
				options2: {
					effect: 'flip',
					loop : true
				},
				options3: {
					effect: 'cube',
					loop : true,
					cubeEffect: {
						shadow: true,
						slideShadows: true,
						shadowOffset: 20,
						shadowScale: 0.94,
					}
				},
				rows: 2,
				column: 4,
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
                role : '',
                aboutUsDetail: {},
                systemIntroductionDetail: {},
                menuList: [],
                swiperMenuList:[],
                user: {},
                tableName:'',

				//轮播
				swiperList: [],
				tushuxinxilist: [],
				homeziyuanfenxianglist: [],
				homeqiugouxinxilist: [],
				homegonggaoxinxilist: [],
				news: [],









































































			}
		},
		watch: {








































































		},
		mounted() {








































































		},
		computed: {
			baseUrl() {
				return this.$base.url;
			},









































































		},
        async onLoad(){
            this.role = uni.getStorageSync("role");
            let table = uni.getStorageSync("nowTable");
            let res = await this.$api.session(table);
            this.user = res.data;
            this.tableName = table;
            let menus = menu.list();
            this.menuList = menus;
            this.menuList.forEach((item,key) => {
                if(this.role==item.roleName) {
                    item.frontMenu.forEach((item2,key2) => {
                        if(item2.child[0].buttons.indexOf("查看")>-1) {
                            this.swiperMenuList.push(item2);
                        }
                    })
                }
            })
        },
		async onShow() {
            let res;
			// 轮播图
			let swiperList = []
			res = await this.$api.list('config', {
				page: 1,
				limit: 5
			});
			for (let item of res.data.list) {
				if (item.name.indexOf('picture') >= 0 && item.value && item.value!="" && item.value!=null ) {
					swiperList.push({
						img: item.value,
                        title: item.name,
						url: item.url
					});
				}
			}
			if (swiperList) {
				this.swiperList = swiperList;
			}
			

            this.getAboutUs();
            this.getSystemIntroduction();

			// 推荐信息
			this.getRecommendList()
			this.getHomeList()
			this.getNewsList()
		},

		methods: {








































































			uGetRect(selector, all) {
				return new Promise(resolve => {
					uni.createSelectorQuery()
					.in(this)
					[all ? 'selectAll' : 'select'](selector)
					.boundingClientRect(rect => {
						if (all && Array.isArray(rect) && rect.length) {
							resolve(rect);
						}
						if (!all && rect) {
							resolve(rect);
						}
					})
					.exec();
				});
			},
			cloneData(data) {
				return JSON.parse(JSON.stringify(data));
			},
			newsTabClick2(index){
				this.newsIndex2 = index
				this.getNewsList()
			},
			async getNewsList(){
				let res;
				let params = {
					page: 1,
					limit: 6,
					sort: 'id',
					order: 'desc',
				}
			},
			homeTabClick2(index,name){
				this['home' + name + 'Index2'] = index
				this.getHomeList()
			},
			async getHomeList(){
				let res;
				let params;
				params = {
					page:1,
					limit: 6,
				}
				res = await this.$api.list('ziyuanfenxiang', params);
				this.homeziyuanfenxianglist = res.data.list
				

				params = {
					page:1,
					limit: 6,
				}
				res = await this.$api.list('qiugouxinxi', params);
				this.homeqiugouxinxilist = res.data.list
				

				params = {
					page:1,
					limit: 6,
				}
				res = await this.$api.list('gonggaoxinxi', params);
				this.homegonggaoxinxilist = res.data.list
				

			},
			recommendTabClick2(index,name){
				this[name + 'Index2'] = index
				this.getRecommendList()
			},
			async getRecommendList(){
				let res;
				let params;
				// 推荐信息
				params = {
					page: 1,
					limit: 4,
				}
				if(uni.getStorageSync("userid")) {
					res = await this.$api.recommend2('tushuxinxi', params);
				} else {
					res = await this.$api.recommend('tushuxinxi', params);
				}
				this.tushuxinxilist = res.data.list
				

			},
			//轮播图跳转
			onSwiperTap(e) {
				if(e.url) {
					if (e.url.indexOf('https') != -1) {
						window.open(e.url)
					} else {
						this.$utils.jump(e.url)
					}
				}
			},
            async getAboutUs() {
                let res = await this.$api.info('aboutus', 1)
                this.aboutUsDetail = res.data;
            },
            async getSystemIntroduction() {
                let res = await this.$api.info('systemintro', 1)
                this.systemIntroductionDetail = res.data;
            },
			// 新闻详情
			onNewsDetailTap(id) {
				this.$utils.jump(`../news-detail/news-detail?id=${id}`)
			},
			// 推荐列表点击详情
			onDetailTap(tableName, id) {
				this.$utils.jump(`../${tableName}/detail?id=${id}`)
			},
			onPageTap(tableName){

				uni.navigateTo({
					url: `../${tableName}/list`,
					fail: function(){
						uni.switchTab({
							url: `../${tableName}/list`
						});
					}
				});
				// this.$utils.jump(`../${tableName}/list`)
			},
            onPageTap2(url) {
                uni.setStorageSync("useridTag",0);
                uni.navigateTo({
                    url: url,
                    fail: function() {
                        uni.switchTab({
                            url: url
                        });
                    }
                });
            }
		}
	}
</script>

<style lang="scss" scoped>
	.content {
		min-height: calc(100vh - 44px);
		box-sizing: border-box;
	}

</style>
