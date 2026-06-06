<template>
<mescroll-uni @init="mescrollInit" :up="upOption" :down="downOption" @down="downCallback" @up="upCallback">
	<view class="content">
		<view :style='{"width":"100%","padding":"0 0 40rpx","position":"relative","background":"#dfd8cc","height":"auto"}'>
			<view class="cu-bar bg-white search" :style='{"width":"100%","padding":"20rpx 24rpx","background":"#fff","display":"flex","height":"auto"}'>
				<picker v-if="queryList.length>1" mode="selector" :range="queryList" range-key="queryName" :value="queryIndex" @change="queryChange">
					<view :style='{"width":"40rpx","height":"auto"}'>
						<text class="icon iconfont icon-jiantou18" :style='{"width":"40rpx","fontSize":"40rpx","lineHeight":"80rpx","color":"rgb(153, 153, 153)"}'></text>
					</view>
				</picker>
				<view :style='{"margin":"0 12rpx","flex":"1","position":"relative"}' v-if="queryIndex==0" class="search-form round">
					<text class="icon iconfont icon-fangdajing07" :style='{"color":"rgb(153, 153, 153)","left":"0px","textAlign":"center","width":"80rpx","fontSize":"40rpx","lineHeight":"80rpx","position":"absolute","right":"0px"}'></text>
					<input :style='{"border":"2rpx solid #fafafa","padding":"12rpx 20rpx 12rpx 80rpx","color":"#333","borderRadius":"40rpx","background":"#fff","width":"100%","lineHeight":"56rpx","fontSize":"28rpx","height":"80rpx"}' v-model="searchForm.tushufenlei" type="text" placeholder="图书分类" ></input>
				</view>
				<button :style='{"border":"0","padding":"0px","margin":"0","color":"#fff","borderRadius":"40rpx","background":"#d4cf5d","width":"136rpx","lineHeight":"80rpx","fontSize":"28rpx","height":"80rpx"}' @tap="search" class="cu-btn shadow-blur round">搜索</button>
			</view>
			

			
			<view :style='{"padding":"10rpx 0","margin":"0","flexWrap":"wrap","background":"#fff","display":"flex"}'>
				<view @click="sortClick('addtime')" :style='{"border":"0","padding":"0 12rpx","margin":"0 8rpx 0 0","outline":"0","borderRadius":"8rpx","background":"#ffffff","display":"flex"}'>
					<text :style='{"color":"#333","lineHeight":"48rpx","fontSize":"24rpx"}'>按日期</text>
					<text v-if="listSort!='addtime'" class="icon iconfont icon-shijian18" :style='{"margin":"0 4rpx 0 0","lineHeight":"48rpx","fontSize":"24rpx","color":"#333"}'></text>
					<text v-else-if="listSort=='addtime'&&listOrder=='asc'" class="icon iconfont icon-shijian18" :style='{"margin":"0 4rpx 0 0","lineHeight":"48rpx","fontSize":"24rpx","color":"#333"}'></text>
					<text v-else-if="listSort=='addtime'&&listOrder=='desc'" class="icon iconfont icon-shijian18" :style='{"margin":"0 4rpx 0 0","lineHeight":"48rpx","fontSize":"24rpx","color":"#333"}'></text>
				</view>
			</view>

			<view :style='{"width":"100%","background":"#fff","height":"auto"}'>
			
			<!-- 样式2 -->
			<view class="list" :style='{"width":"100%","padding":"24rpx","margin":"0","background":"#DFD8CC","height":"auto"}'>
				<view @tap="onDetailTap(product)" class="listm flex flex-between" :style='{"boxShadow":"0 2rpx 4rpx rgba(0,0,0,.3)","padding":"20rpx","margin":"0 0 20rpx","borderRadius":"20rpx","flexWrap":"wrap","background":"#FFFFFF","display":"flex","width":"100%","height":"auto"}' v-for="(product,index) in list" :key="index">

					<view class="listmr" :style='{"width":"calc(100% - 260rpx)","padding":"0","margin":"0","flexWrap":"wrap","display":"flex","height":"auto"}'>
						<view :style='{"padding":"0 20rpx","order":"1"}'>
							<text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#666"}'></text>
							<text :style='{"color":"#666","lineHeight":"1.5","fontSize":"24rpx"}'>{{product.addtime}}</text>
						</view>
						<view :style='{"padding":"0 20rpx"}'>
							<text class="icon iconfont icon-geren16" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#666"}'></text>
							<text :style='{"color":"#666","lineHeight":"1.5","fontSize":"24rpx"}'>{{product.$pubPeople}}</text>
						</view>
					</view>

					<view :style='{"width":"100%","padding":"8rpx 20rpx","justifyContent":"space-between","display":"flex","height":"auto"}'>
						<view :style='{"display":"flex"}' v-if="(userid && isAuth('tushufenlei','修改')) || (!userid && isAuthFront('tushufenlei','修改'))" @click.stop="onUpdateTap(product)">
							<text :style='{"margin":"0 8rpx 0 0","fontSize":"28rpx","lineHeight":"1","color":"#666","display":"inline-block"}' class="cuIcon-edit"></text>
							<text :style='{"fontSize":"28rpx","lineHeight":"1","color":"#666","display":"inline-block"}'>修改</text>
						</view>
						<view :style='{"display":"flex"}' v-if="(userid && isAuth('tushufenlei','删除')) || (!userid && isAuthFront('tushufenlei','删除'))" @click.stop="onDeleteTap(product.id)">
							<text :style='{"margin":"0 8rpx 0 0","fontSize":"28rpx","lineHeight":"1","color":"#666","display":"inline-block"}' class="cuIcon-delete"></text>
							<text :style='{"fontSize":"28rpx","lineHeight":"1","color":"#666","display":"inline-block"}'>删除</text>
						</view>
					</view>
				</view>
			</view>
			
			
			

			

			</view>
			
			
			
		</view>

		<button :style='{"border":"0","boxShadow":"0 2rpx 12rpx rgba(0,0,0,.3)","color":"rgb(255, 255, 255)","bottom":"40rpx","right":"8rpx","outline":"none","borderRadius":"100%","background":"rgb(255, 170, 51)","width":"80rpx","lineHeight":"80rpx","fontSize":"28rpx","position":"absolute","height":"80rpx","zIndex":"999"}' v-if="userid && isAuth('tushufenlei','新增')" class="add-btn" @click="onAddTap()">新增</button>
		<button :style='{"border":"0","boxShadow":"0 2rpx 12rpx rgba(0,0,0,.3)","color":"rgb(255, 255, 255)","bottom":"40rpx","right":"8rpx","outline":"none","borderRadius":"100%","background":"rgb(255, 170, 51)","width":"80rpx","lineHeight":"80rpx","fontSize":"28rpx","position":"absolute","height":"80rpx","zIndex":"999"}' v-if="!userid && isAuthFront('tushufenlei','新增')" class="add-btn" @click="onAddTap()">新增</button>
	</view>
</mescroll-uni>
</template>

<script>
	export default {
		data() {
			return {
				leftListNews7: [],
				rightListNews7: [],
				tempListNews7: [],
				btnColor: ['#409eff','#67c23a','#909399','#e6a23c','#f56c6c','#356c6c','#351c6c','#f093a9','#a7c23a','#104eff','#10441f','#a21233','#503319'],
				queryList:[
					{
						queryName:"图书分类",
					},
				],
				queryIndex: 0,
				list: [],
				lists: [],
                userid: '',
				mescroll: null, //mescroll实例对象
				downOption: {
					auto: false //是否在初始化后,自动执行下拉回调callback; 默认true
				},
				upOption: {
					noMoreSize: 5, //如果列表已无数据,可设置列表的总数量要大于半页才显示无更多数据;避免列表数据过少(比如只有一条数据),显示无更多数据会不好看; 默认5
					textNoMore: '~ 没有更多了 ~',
				},
				hasNext: true,
				searchForm:{},
				CustomBar: '0',
				listSort: 'id',
				listOrder: 'desc',
			};
		},
		watch: {
			copyFlowListNews7(nVal, oVal) {
				this.tempListNews7 = this.cloneData(this.copyFlowListNews7);
				this.splitDataNews7();
			},
		},
		mounted() {
			this.tempListNews7 = this.cloneData(this.copyFlowListNews7);
			this.splitDataNews7();
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			},
			copyFlowListNews7() {
				return this.cloneData(this.list);
			},
		},
		async onShow() {
			this.btnColor = this.btnColor.sort(()=> {
				return (0.5-Math.random());
			});
			this.hasNext = true
			// 重新加载数据
			if (this.mescroll) this.mescroll.resetUpScroll()
		},
		onLoad(options) {
            if(options.userid) {
                this.userid=options.userid;
            } else {
                this.userid = "";
            }
			this.hasNext = true
			// 重新加载数据
			if (this.mescroll) this.mescroll.resetUpScroll()
		},
		methods: {
			async splitDataNews7() {
				if (!this.tempListNews7.length) return;
				let leftRect = await this.uGetRect('#waterfall-left-column-news-7');
				let rightRect = await this.uGetRect('#waterfall-right-column-news-7');
				// 如果左边小于或等于右边，就添加到左边，否则添加到右边
				let item = this.tempListNews7[0];
				// 解决多次快速上拉后，可能数据会乱的问题，因为经过上面的两个await节点查询阻塞一定时间，加上后面的定时器干扰
				// 数组可能变成[]，导致此item值可能为undefined
				if (!item) return;
				
				if (leftRect.height < rightRect.height) {
					this.leftListNews7.push(item);
				} else if (leftRect.height > rightRect.height) {
					this.rightListNews7.push(item);
				} else {
					// 这里是为了保证第一和第二张添加时，左右都能有内容
					// 因为添加第一张，实际队列的高度可能还是0，这时需要根据队列元素长度判断下一个该放哪边
					if (this.leftListNews7.length <= this.rightListNews7.length) {
						this.leftListNews7.push(item);
					} else {
						this.rightListNews7.push(item);
					}
				}
				// 移除临时列表的第一项
				this.tempListNews7.splice(0, 1);
				// 如果临时数组还有数据，继续循环
				if (this.tempListNews7.length) {
					setTimeout(()=>{
						this.splitDataNews7();
					}, 100)
					return
				}
			},
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
            priceChange(price) {
                return Number(price).toFixed(2);
            },
            preHttp(str) {
                return str && str.substr(0,4)=='http';
            },
			//查询条件切换
			queryChange(e) {
				this.queryIndex=e.detail.value;
				this.searchForm.tushufenlei="";
			},
			//类别搜索
			// mescroll组件初始化的回调,可获取到mescroll对象
			mescrollInit(mescroll) {
				this.mescroll = mescroll;
			},
			/*下拉刷新的回调 */
			downCallback(mescroll) {
				this.hasNext = true
				// 重置分页参数页数为1
				mescroll.resetUpScroll()
			},
			/*上拉加载的回调: mescroll携带page的参数, 其中num:当前页 从1开始, size:每页数据条数,默认10 */
			async upCallback(mescroll) {
				let params = {
					page: mescroll.num,
					limit: mescroll.size
				}
				params['sort'] = this.listSort;
				params['order'] = this.listOrder;

				if(this.searchForm.tushufenlei){
					params['tushufenlei'] = '%' + this.searchForm.tushufenlei + '%'
				}



                let res = {}
                if(this.userid) {
                    res = await this.$api.page(`tushufenlei`, params);
                } else {
                    res = await this.$api.list(`tushufenlei`, params);
                }
				// 如果是第一页数据置空
				if (mescroll.num == 1) this.list = [];
				
				this.list = this.list.concat(res.data.list);
				let length = Math.ceil(this.list.length/6)
				let arr = [];
				for (let i = 0; i<length; i++){
					arr[i] = this.list.slice(i*6, (i+1)*6)
				}
				this.lists = arr
				if (res.data.list.length == 0) this.hasNext = false;
				mescroll.endSuccess(mescroll.size, this.hasNext);
				
				this.tempListNews7 = this.copyFlowListNews7;
				this.splitDataNews7();
			},
			// 详情
			onDetailTap(item) {
                uni.setStorageSync("useridTag",this.userid);
				this.$utils.jump(`./detail?id=${item.id}&userid=`+this.userid)
			},
			// 修改
			onUpdateTap(row){
                uni.setStorageSync("useridTag",this.userid);
				this.$utils.jump(`./add-or-update?id=${row.id}`)
			},
			// 添加
			onAddTap(){
                uni.setStorageSync("useridTag",this.userid);
				this.$utils.jump(`./add-or-update`)
			},
			onDeleteTap(id){
				var _this = this;
				uni.showModal({
					title: '提示',
					content: '是否确认删除',
					success: async function(res) {
						if (res.confirm) {
							await _this.$api.del('tushufenlei', JSON.stringify([id]));
							_this.hasNext = true
							// 重置分页参数页数为1
							_this.mescroll.resetUpScroll()
						}
					}
				});
			},
			// 搜索
			async search(){
				this.mescroll.num = 1
				let searchForm = {
					page: this.mescroll.num,
					limit: this.mescroll.size
				}
				searchForm['sort'] = this.listSort;
				searchForm['order'] = this.listOrder;

				if(this.searchForm.tushufenlei){
					searchForm['tushufenlei'] = '%' + this.searchForm.tushufenlei + '%'
				}
                let res = {};
                if(this.userid) {
                    res = await this.$api.page(`tushufenlei`, searchForm);
                } else {
                    res = await this.$api.list(`tushufenlei`, searchForm);
                }
				// 如果是第一页数据置空
				if (this.mescroll.num == 1) this.list = [];
				this.list = this.list.concat(res.data.list);
				let length = Math.ceil(this.list.length/6)
				let arr = [];
				for (let i = 0; i<length; i++){
					arr[i] = this.list.slice(i*6, (i+1)*6)
				}
				this.lists = arr
				if (res.data.list.length == 0) this.hasNext = false;
				this.mescroll.endSuccess(this.mescroll.size, this.hasNext);
			}
		}
	};
</script>

<style lang="scss" scoped>
	.content {
		min-height: calc(100vh - 44px);
		box-sizing: border-box;
	}
	
	.category-one .tab {
		cursor: pointer;
		border-radius: 100rpx;
		padding: 0 20rpx;
		margin: 0 10rpx;
		color: #000;
		background: #FFFFFF;
		display: inline-block;
		width: auto;
		font-size: 28rpx;
		line-height: 80rpx;
	}
	
	.category-one .tab.active {
		cursor: pointer;
		border-radius: 100rpx;
		padding: 0 20rpx;
		color: #fff;
		background: #D4CF5D;
		display: inline-block;
		width: auto;
		font-size: 28rpx;
		line-height: 80rpx;
	}
	
	.category-two .tab {
		cursor: pointer;
		padding: 0;
		color: #fff;
		background: blue;
		display: inline-block;
		width: 100%;
		font-size: 28rpx;
		line-height: 80rpx;
		text-align: center;
	}
	
	.category-two .tab.active {
		cursor: pointer;
		padding: 0;
		color: #fff;
		background: #000;
		display: inline-block;
		width: 100%;
		font-size: 28rpx;
		line-height: 80rpx;
		text-align: center;
	}
	
	.category-three .tab {
		cursor: pointer;
		padding: 0;
		color: #fff;
		background: burlywood;
		display: inline-block;
		width: 100%;
		font-size: 28rpx;
		line-height: 80rpx;
		text-align: center;
	}
	
	.category-three .tab.active {
		cursor: pointer;
		padding: 0;
		color: #fff;
		background: #000;
		display: inline-block;
		width: 100%;
		font-size: 28rpx;
		line-height: 80rpx;
		text-align: center;
	}
</style>
