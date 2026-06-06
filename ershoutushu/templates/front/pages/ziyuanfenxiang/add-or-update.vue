<template>
<view class="content">
	<view :style='{"width":"100%","padding":"0","position":"relative","background":"#fff","height":"100%"}'>
		<form :style='{"width":"100%","padding":"24rpx","background":"#fff","display":"block","height":"auto"}' class="app-update-pv">
			<view :style='{"padding":"12rpx 0","margin":"0 0 24rpx 0","borderColor":"#ccc","alignItems":"center","borderWidth":"0 0 2rpx 0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="">
				<view :style='{"width":"160rpx","padding":"0 20rpx 0 0","lineHeight":"80rpx","fontSize":"28rpx","color":"#333","textAlign":"right"}' class="title">资源编号</view>
				<view :style='{"padding":"0px 24rpx","margin":"0px","lineHeight":"80rpx","fontSize":"28rpx","color":"rgb(0, 0, 0)","flex":"1"}' class="right-input">
					{{ruleForm.ziyuanbianhao}}
				</view>
			</view>
			<view :style='{"padding":"12rpx 0","margin":"0 0 24rpx 0","borderColor":"#ccc","alignItems":"center","borderWidth":"0 0 2rpx 0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="">
				<view :style='{"width":"160rpx","padding":"0 20rpx 0 0","lineHeight":"80rpx","fontSize":"28rpx","color":"#333","textAlign":"right"}' class="title">资源名称</view>
				<input :style='{"border":"0","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"8rpx","flex":"1","background":"rgba(255, 255, 255, 0)","fontSize":"28rpx","height":"80rpx"}' :disabled="ro.ziyuanmingcheng" v-model="ruleForm.ziyuanmingcheng" placeholder="资源名称"></input>
			</view>
			<view :style='{"padding":"12rpx 0","margin":"0 0 24rpx 0","borderColor":"#ccc","alignItems":"center","borderWidth":"0 0 2rpx 0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class=" select">
				<view :style='{"width":"160rpx","padding":"0 20rpx 0 0","lineHeight":"80rpx","fontSize":"28rpx","color":"#333","textAlign":"right"}' class="title">资源分类</view>
				<picker :disabled="ro.ziyuanfenlei" :style='{"width":"100%","flex":"1","height":"auto"}' @change="ziyuanfenleiChange" :value="ziyuanfenleiIndex" :range="ziyuanfenleiOptions">
					<view :style='{"width":"100%","lineHeight":"80rpx","fontSize":"28rpx","color":"#D4CF5D"}' class="uni-input">{{ruleForm.ziyuanfenlei?ruleForm.ziyuanfenlei:"请选择资源分类"}}</view>
				</picker>
			</view>
			<view :style='{"padding":"12rpx 0","margin":"0 0 24rpx 0","borderColor":"#ccc","alignItems":"center","borderWidth":"0 0 2rpx 0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="" @tap="ziyuantupianTap">
				<view :style='{"width":"160rpx","padding":"0 20rpx 0 0","lineHeight":"80rpx","fontSize":"28rpx","color":"#333","textAlign":"right"}' class="title">资源图片</view>
				<image :style='{"width":"80rpx","borderRadius":"100%","objectFit":"cover","display":"block","height":"80rpx"}' class="avator" v-if="ruleForm.ziyuantupian" :src="baseUrl+ruleForm.ziyuantupian.split(',')[0]" mode="aspectFill"></image>
				<image :style='{"width":"80rpx","borderRadius":"100%","objectFit":"cover","display":"block","height":"80rpx"}' class="avator" v-else src="../../static/gen/upload.png" mode="aspectFill"></image>
			</view>
			<view :style='{"padding":"12rpx 0","margin":"0 0 24rpx 0","borderColor":"#ccc","alignItems":"center","borderWidth":"0 0 2rpx 0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="" @tap="ziyuanwendangTap">
				<view :style='{"width":"160rpx","padding":"0 20rpx 0 0","lineHeight":"80rpx","fontSize":"28rpx","color":"#333","textAlign":"right"}' class="title">资源文档</view>
				<input :style='{"border":"0","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"8rpx","flex":"1","background":"rgba(255, 255, 255, 0)","fontSize":"28rpx","height":"80rpx"}' v-if="ruleForm.ziyuanwendang"  v-model="baseUrl+ruleForm.ziyuanwendang" placeholder="资源文档"></input>
				<image :style='{"width":"80rpx","borderRadius":"100%","objectFit":"cover","display":"block","height":"80rpx"}' class="avator" v-else src="../../static/gen/upload.png" mode="aspectFill"></image>
			</view>
			<view :style='{"padding":"12rpx 0","margin":"0 0 24rpx 0","borderColor":"#ccc","alignItems":"center","borderWidth":"0 0 2rpx 0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class=" select">
				<view :style='{"width":"160rpx","padding":"0 20rpx 0 0","lineHeight":"80rpx","fontSize":"28rpx","color":"#333","textAlign":"right"}' class="title">发布时间</view>
				<picker :disabled="ro.fabushijian" :style='{"width":"100%","flex":"1","height":"auto"}' mode="date" :value="ruleForm.fabushijian" @change="fabushijianChange">
					<view :style='{"width":"100%","lineHeight":"80rpx","fontSize":"28rpx","color":"#D4CF5D"}' class="uni-input">{{ruleForm.fabushijian?ruleForm.fabushijian:"请选择发布时间"}}</view>
				</picker>
			</view>
			<view :style='{"padding":"12rpx 0","margin":"0 0 24rpx 0","borderColor":"#ccc","alignItems":"center","borderWidth":"0 0 2rpx 0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="">
				<view :style='{"width":"160rpx","padding":"0 20rpx 0 0","lineHeight":"80rpx","fontSize":"28rpx","color":"#333","textAlign":"right"}' class="title">商家账号</view>
				<input :style='{"border":"0","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"8rpx","flex":"1","background":"rgba(255, 255, 255, 0)","fontSize":"28rpx","height":"80rpx"}' :disabled="ro.shangjiazhanghao" v-model="ruleForm.shangjiazhanghao" placeholder="商家账号"></input>
			</view>
			<view :style='{"padding":"12rpx 0","margin":"0 0 24rpx 0","borderColor":"#ccc","alignItems":"center","borderWidth":"0 0 2rpx 0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="">
				<view :style='{"width":"160rpx","padding":"0 20rpx 0 0","lineHeight":"80rpx","fontSize":"28rpx","color":"#333","textAlign":"right"}' class="title">商家姓名</view>
				<input :style='{"border":"0","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"8rpx","flex":"1","background":"rgba(255, 255, 255, 0)","fontSize":"28rpx","height":"80rpx"}' :disabled="ro.shangjiaxingming" v-model="ruleForm.shangjiaxingming" placeholder="商家姓名"></input>
			</view>
			<view :style='{"padding":"12rpx 0","margin":"0 0 24rpx 0","borderColor":"#ccc","alignItems":"center","borderWidth":"0 0 2rpx 0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="">
				<view :style='{"width":"160rpx","padding":"0 20rpx 0 0","lineHeight":"80rpx","fontSize":"28rpx","color":"#333","textAlign":"right"}' class="title">收藏数</view>
				<input :style='{"border":"0","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"8rpx","flex":"1","background":"rgba(255, 255, 255, 0)","fontSize":"28rpx","height":"80rpx"}' :disabled="ro.storeupnum" v-model.number="ruleForm.storeupnum" placeholder="收藏数"></input>
			</view>
 

			<view :style='{"padding":"12rpx 0","margin":"0 0 24rpx 0","borderColor":"#ccc","borderWidth":"0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="">
				<view :style='{"width":"160rpx","lineHeight":"80rpx","fontSize":"28rpx","color":"#333","textAlign":"center","fontWeight":"500"}' class="title">资源详情</view>
                <xia-editor ref="editor" :style='{"minHeight":"300rpx","border":"2rpx solid #efefef","width":"100%","height":"auto"}' v-model="ruleForm.ziyuanxiangqing" placeholder="资源详情" @editorChange="ziyuanxiangqingChange"></xia-editor>
			</view>
			
			<view :style='{"width":"100%","alignItems":"center","justifyContent":"center","display":"flex","height":"auto"}' class="btn" >
				<button :style='{"border":"0","padding":"0px","margin":"0","color":"rgb(255, 255, 255)","background":"#D4CF5D","width":"48%","lineHeight":"80rpx","fontSize":"28rpx","height":"80rpx"}' @tap="onSubmitTap" class="bg-red">提交</button>
			</view>
		</form>

	</view>
</view>
</template>

<script>
	import wPicker from "@/components/w-picker/w-picker.vue";
    import xiaEditor from '@/components/xia-editor/xia-editor';
    import multipleSelect from "@/components/momo-multipleSelect/momo-multipleSelect";
	export default {
		data() {
			return {
				cross:'',
				ruleForm: {
				ziyuanbianhao: this.getUUID(),
				ziyuanmingcheng: '',
				ziyuanfenlei: '',
				ziyuantupian: '',
				ziyuanwendang: '',
				fabushijian: '',
				ziyuanxiangqing: '',
				shangjiazhanghao: '',
				shangjiaxingming: '',
				storeupnum: '',
				},
				ziyuanfenleiOptions: [],
				ziyuanfenleiIndex: 0,
				// 登录用户信息
				user: {},
                ro:{
                   ziyuanbianhao : false,
                   ziyuanmingcheng : false,
                   ziyuanfenlei : false,
                   ziyuantupian : false,
                   ziyuanwendang : false,
                   fabushijian : false,
                   ziyuanxiangqing : false,
                   shangjiazhanghao : false,
                   shangjiaxingming : false,
                   storeupnum : false,
                },
			}
		},
		components: {
			wPicker,
            xiaEditor,
            multipleSelect,
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			},



		},
		async onLoad(options) {
            this.ruleForm.fabushijian = this.$utils.getCurDate();
			let table = uni.getStorageSync("nowTable");
			// 获取用户信息
			let res = await this.$api.session(table);
			this.user = res.data;
			
			// ss读取
			this.ruleForm.shangjiazhanghao = this.user.shangjiazhanghao
			this.ro.shangjiazhanghao = true;
			this.ruleForm.shangjiaxingming = this.user.shangjiaxingming
			this.ro.shangjiaxingming = true;


			// 下拉框
			res = await this.$api.option(`ziyuanfenlei`,`ziyuanfenlei`,{});
			this.ziyuanfenleiOptions = res.data;
            this.ziyuanfenleiOptions.unshift("请选择资源分类");

			// 如果有登录，获取登录后保存的userid
			this.ruleForm.userid = uni.getStorageSync("userid")
			if (options.refid) {
				// 如果上一级页面传递了refid，获取改refid数据信息
				this.ruleForm.refid = options.refid;
				this.ruleForm.nickname = uni.getStorageSync("nickname");
			}
			// 如果是更新操作
			if (options.id) {
				this.ruleForm.id = options.id;
				// 获取信息
				res = await this.$api.info(`ziyuanfenxiang`, this.ruleForm.id);
				this.ruleForm = res.data;
			}
			// 跨表
			this.cross = options.cross;
			if(options.cross){
				var obj = uni.getStorageSync('crossObj');
				for (var o in obj){
					if(o=='ziyuanbianhao'){
					this.ruleForm.ziyuanbianhao = obj[o];
					this.ro.ziyuanbianhao = true;
					continue;
					}
					if(o=='ziyuanmingcheng'){
					this.ruleForm.ziyuanmingcheng = obj[o];
					this.ro.ziyuanmingcheng = true;
					continue;
					}
					if(o=='ziyuanfenlei'){
					this.ruleForm.ziyuanfenlei = obj[o];
					this.ro.ziyuanfenlei = true;
					continue;
					}
					if(o=='ziyuantupian'){
					this.ruleForm.ziyuantupian = obj[o].split(",")[0];
					this.ro.ziyuantupian = true;
					continue;
					}
					if(o=='ziyuanwendang'){
					this.ruleForm.ziyuanwendang = obj[o];
					this.ro.ziyuanwendang = true;
					continue;
					}
					if(o=='fabushijian'){
					this.ruleForm.fabushijian = obj[o];
					this.ro.fabushijian = true;
					continue;
					}
					if(o=='ziyuanxiangqing'){
					this.ruleForm.ziyuanxiangqing = obj[o];
					this.ro.ziyuanxiangqing = true;
					continue;
					}
					if(o=='shangjiazhanghao'){
					this.ruleForm.shangjiazhanghao = obj[o];
					this.ro.shangjiazhanghao = true;
					continue;
					}
					if(o=='shangjiaxingming'){
					this.ruleForm.shangjiaxingming = obj[o];
					this.ro.shangjiaxingming = true;
					continue;
					}
					if(o=='storeupnum'){
					this.ruleForm.storeupnum = obj[o];
					this.ro.storeupnum = true;
					continue;
					}
				}
			}
			this.styleChange()
            this.$forceUpdate()
		},
		methods: {
            ziyuanxiangqingChange(e) {
                this.ruleForm.ziyuanxiangqing = e
            },
			styleChange() {
				this.$nextTick(()=>{
					// document.querySelectorAll('.app-update-pv . .uni-input-input').forEach(el=>{
					//   el.style.backgroundColor = this.addUpdateForm.input.content.backgroundColor
					// })
				})
			},

			// 多级联动参数

			fabushijianChange(e) {
				this.ruleForm.fabushijian = e.target.value;
				this.$forceUpdate();
			},


			// 下拉变化
			ziyuanfenleiChange(e) {
				this.ziyuanfenleiIndex = e.target.value
				this.ruleForm.ziyuanfenlei = this.ziyuanfenleiOptions[this.ziyuanfenleiIndex]
			},

			ziyuantupianTap() {
				let _this = this;
				this.$api.upload(function(res) {
					_this.ruleForm.ziyuantupian = 'upload/' + res.file;
					_this.$forceUpdate();
					_this.$nextTick(()=>{
						_this.styleChange()
					})
				});
			},
			ziyuanwendangTap() {
				let _this = this;
				this.$api.upload(function(res) {
					_this.ruleForm.ziyuanwendang = 'upload/' + res.file;
					_this.$forceUpdate();
					_this.$nextTick(()=>{
						_this.styleChange()
					})
				});
			},

			getUUID () {
				return new Date().getTime();
			},
			async onSubmitTap() {




















//跨表计算判断
				var obj;
				if(this.ruleForm.storeupnum&&(!this.$validate.isIntNumer(this.ruleForm.storeupnum))){
					this.$utils.msg(`收藏数应输入整数`);
					return
				}
				//更新跨表属性
			       var crossuserid;
			       var crossrefid;
			       var crossoptnum;
				if(this.cross){
                    uni.setStorageSync('crossCleanType',true);
					var statusColumnName = uni.getStorageSync('statusColumnName');
					var statusColumnValue = uni.getStorageSync('statusColumnValue');
					if(statusColumnName!='') {
                        if(!obj) {
						    obj = uni.getStorageSync('crossObj');
                        }
						if(!statusColumnName.startsWith("[")) {
							for (var o in obj){
								if(o==statusColumnName){
									obj[o] = statusColumnValue;
								}

							}
							var table = uni.getStorageSync('crossTable');
							await this.$api.update(`${table}`, obj);
						} else {
						       crossuserid=Number(uni.getStorageSync('userid'));
						       crossrefid=obj['id'];
						       crossoptnum=uni.getStorageSync('statusColumnName');
						       crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
						}
					}
				}
				if(crossrefid && crossuserid) {
					this.ruleForm.crossuserid=crossuserid;
					this.ruleForm.crossrefid=crossrefid;
					let params = {
						page: 1,
						limit:10,
						crossuserid:crossuserid,
						crossrefid:crossrefid,
					}
					let res = await this.$api.list(`ziyuanfenxiang`, params);
					if (res.data.total >= crossoptnum) {
						this.$utils.msg(uni.getStorageSync('tips'));
                        uni.removeStorageSync('crossCleanType');
						return false;
					} else {
                //跨表计算
						if(this.ruleForm.id){
							await this.$api.update(`ziyuanfenxiang`, this.ruleForm);
						}else{
							await this.$api.add(`ziyuanfenxiang`, this.ruleForm);
						}
						this.$utils.msgBack('提交成功');
					}
				} else {
                //跨表计算
					if(this.ruleForm.id){
						await this.$api.update(`ziyuanfenxiang`, this.ruleForm);
					}else{
						await this.$api.add(`ziyuanfenxiang`, this.ruleForm);
					}
					this.$utils.msgBack('提交成功');
				}
			},
			optionsChange(e) {
				this.index = e.target.value
			},
			bindDateChange(e) {
				this.date = e.target.value
			},
			getDate(type) {
				const date = new Date();
				let year = date.getFullYear();
				let month = date.getMonth() + 1;
				let day = date.getDate();
				if (type === 'start') {
					year = year - 60;
				} else if (type === 'end') {
					year = year + 2;
				}
				month = month > 9 ? month : '0' + month;;
				day = day > 9 ? day : '0' + day;
				return `${year}-${month}-${day}`;
			},
			toggleTab(str) {
				if(this.ro[str]){
					return false
				}
				this.$refs[str].show();
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
