<template>
<view class="content">
	<view class="box" :style='{"padding":"80rpx 0 0 0","backgroundColor":"#fff","backgroundImage":"url(https://picx.zhimg.com/v2-9b439a94465dc0ce405ef64595003e39_r.jpg)","width":"100%","backgroundSize":"100% 100%","position":"relative","height":"100%"}'>
		<view :style='{"width":"100%","padding":"24rpx 100rpx","display":"block","height":"auto"}'>
			<image :style='{"width":"160rpx","margin":"0 auto 24rpx auto","borderRadius":"8rpx","display":"none","height":"160rpx"}' src="http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg" mode="aspectFill"></image>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='yonghu'" class="uni-form-item uni-column">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">用户账号</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"20rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"0","flex":"1","background":"#F6F6F4","fontSize":"28rpx","lineHeight":"88rpx"}'  v-model="ruleForm.yonghuzhanghao"  type="text"  class="uni-input" name="" placeholder="用户账号" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='yonghu'" class="uni-form-item uni-column">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">密码</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"20rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"0","flex":"1","background":"#F6F6F4","fontSize":"28rpx","lineHeight":"88rpx"}'  v-model="ruleForm.mima" type="password"  class="uni-input" name="" placeholder="密码" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='yonghu'" class="uni-form-item uni-column">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">确认密码</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"20rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"0","flex":"1","background":"#F6F6F4","fontSize":"28rpx","lineHeight":"88rpx"}' v-model="ruleForm.mima2" type="password" class="uni-input" name="" placeholder="确认密码" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='yonghu'" class="uni-form-item uni-column">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">用户姓名</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"20rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"0","flex":"1","background":"#F6F6F4","fontSize":"28rpx","lineHeight":"88rpx"}'  v-model="ruleForm.yonghuxingming"  type="text"  class="uni-input" name="" placeholder="用户姓名" />
			</view>
			<picker :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='yonghu'"  @change="yonghuxingbieChange" :value="yonghuxingbieIndex" :range="yonghuxingbieOptions">
				<view>
					<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">请选择性别</view>
					<view :style='{"lineHeight":"88rpx","fontSize":"28rpx","color":"#D4CF5D","flex":"1"}' class="uni-input">{{ruleForm.xingbie?ruleForm.xingbie:"请选择性别"}}</view>
				</view>
			</picker>
            <view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='yonghu'" @tap="yonghutouxiangTap" class="">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">请上传头像</view>
				<image :style='{"width":"80rpx","borderRadius":"16rpx","background":"#F6F6F4","display":"block","height":"80rpx"}' v-if="ruleForm.touxiang" class="avator" :src="baseUrl+ruleForm.touxiang" mode=""></image>
                <image :style='{"width":"80rpx","borderRadius":"16rpx","background":"#F6F6F4","display":"block","height":"80rpx"}' v-else class="avator" src="../../static/gen/upload.png" mode=""></image>
            </view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='yonghu'" class="uni-form-item uni-column">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">手机</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"20rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"0","flex":"1","background":"#F6F6F4","fontSize":"28rpx","lineHeight":"88rpx"}' v-model="ruleForm.mobile" type="text" class="uni-input" name="" placeholder="手机号码" />
			</view>

			<view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='shangjia'" class="uni-form-item uni-column">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">商家账号</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"20rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"0","flex":"1","background":"#F6F6F4","fontSize":"28rpx","lineHeight":"88rpx"}'  v-model="ruleForm.shangjiazhanghao"  type="text"  class="uni-input" name="" placeholder="商家账号" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='shangjia'" class="uni-form-item uni-column">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">密码</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"20rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"0","flex":"1","background":"#F6F6F4","fontSize":"28rpx","lineHeight":"88rpx"}'  v-model="ruleForm.mima" type="password"  class="uni-input" name="" placeholder="密码" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='shangjia'" class="uni-form-item uni-column">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">确认密码</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"20rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"0","flex":"1","background":"#F6F6F4","fontSize":"28rpx","lineHeight":"88rpx"}' v-model="ruleForm.mima2" type="password" class="uni-input" name="" placeholder="确认密码" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='shangjia'" class="uni-form-item uni-column">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">商家姓名</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"20rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"0","flex":"1","background":"#F6F6F4","fontSize":"28rpx","lineHeight":"88rpx"}'  v-model="ruleForm.shangjiaxingming"  type="text"  class="uni-input" name="" placeholder="商家姓名" />
			</view>
			<picker :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='shangjia'"  @change="shangjiaxingbieChange" :value="shangjiaxingbieIndex" :range="shangjiaxingbieOptions">
				<view>
					<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">请选择性别</view>
					<view :style='{"lineHeight":"88rpx","fontSize":"28rpx","color":"#D4CF5D","flex":"1"}' class="uni-input">{{ruleForm.xingbie?ruleForm.xingbie:"请选择性别"}}</view>
				</view>
			</picker>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='shangjia'" class="uni-form-item uni-column">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">联系电话</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"20rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"0","flex":"1","background":"#F6F6F4","fontSize":"28rpx","lineHeight":"88rpx"}'  v-model="ruleForm.lianxidianhua"  type="text"  class="uni-input" name="" placeholder="联系电话" />
			</view>
            <view :style='{"width":"100%","margin":"0 0 24rpx 0","flexDirection":"column","display":"flex","height":"auto"}' v-if="tableName=='shangjia'" @tap="shangjiatouxiangTap" class="">
				<view :style='{"width":"200rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000"}' class="label">请上传头像</view>
				<image :style='{"width":"80rpx","borderRadius":"16rpx","background":"#F6F6F4","display":"block","height":"80rpx"}' v-if="ruleForm.touxiang" class="avator" :src="baseUrl+ruleForm.touxiang" mode=""></image>
                <image :style='{"width":"80rpx","borderRadius":"16rpx","background":"#F6F6F4","display":"block","height":"80rpx"}' v-else class="avator" src="../../static/gen/upload.png" mode=""></image>
            </view>
			<button :style='{"border":"0","padding":"0px","margin":"0 0 24rpx 0","color":"rgb(255, 255, 255)","borderRadius":"8rpx","background":"#D4CF5D","width":"100%","lineHeight":"88rpx","fontSize":"48rpx","height":"88rpx"}' class="btn-submit" @tap="register" type="primary">注册</button>
			
			<view class="idea1" :style='{"color":"#000000","top":"40rpx","display":"none","width":"100%","fontSize":"72rpx","position":"absolute","height":"80rpx"}'>欢迎注册</view>
			<view class="idea2" :style='{"width":"100%","background":"red","display":"none","height":"80rpx"}'>idea2</view>
			<view class="idea3" :style='{"width":"100%","background":"red","display":"none","height":"80rpx"}'>idea3</view>
		</view>
	</view>
</view>
</template>

<script>
    import multipleSelect from "@/components/momo-multipleSelect/momo-multipleSelect";
	export default {
		data() {
			return {
                yonghuxingbieOptions: [],
                yonghuxingbieIndex: 0,
                shangjiaxingbieOptions: [],
                shangjiaxingbieIndex: 0,
				ruleForm: {
                yonghuzhanghao: '',
                mima: '',
                yonghuxingming: '',
                xingbie: '',
                touxiang: '',
                mobile: '',
                money: '',
                shangjiazhanghao: '',
                mima: '',
                shangjiaxingming: '',
                xingbie: '',
                lianxidianhua: '',
                touxiang: '',
                money: '',
				},
				smscode: "",
				// 倒计时定时器
				inter: null,
				// 倒计时
				count: 10,
				//倒计时结束标识
				isEndFlag: true,
				tableName:""
			}
		},
        components: {
            multipleSelect
        },
        computed: {
            baseUrl() {
                return this.$base.url;
            },
			SecondToDate: function() {
				var time = this.count;
				time = parseInt(time) + "秒后重发";
				return time;
			}
        },
		async onLoad() {
			let res = [];
			let table = uni.getStorageSync("loginTable");
            this.tableName = table;

                        // 自定义下拉框值
			if(this.tableName=='yonghu'){
                this.yonghuxingbieOptions = "男,女".split(',');
				this.ruleForm.xingbie=this.yonghuxingbieOptions[0]
			}
                        // 自定义下拉框值
			if(this.tableName=='shangjia'){
                this.shangjiaxingbieOptions = "男,女".split(',');
				this.ruleForm.xingbie=this.shangjiaxingbieOptions[0]
			}
			
			this.styleChange()
		},
		methods: {
			// 发送邮箱验证码
			async sendsmscode(){
				if(!this.ruleForm.mobile){
					this.$utils.msg(`手机号码不能为空`);
					return
				}
				if(this.ruleForm.mobile&&(!this.$validate.isMobile(this.ruleForm.mobile))){
					this.$utils.msg(`请输入正常的手机格式`);
					return
				}
				if (this.count > 0) {
					this.isEndFlag = false;
					var _this = this;
					this.inter = setInterval(function() {
						_this.count = _this.count - 1;
						if (_this.count <= 0) {
							clearInterval(_this.inter);
							_this.count=60;
							_this.isEndFlag = true;
						}
					}, 1000);
				}
				let res = await this.$api.sendsms(`${this.tableName}`, this.ruleForm.mobile);
				if (res.code == 0) {
					this.$utils.msg(`发送成功`);
				} else {
					this.$utils.errMsg(`服务器异常，请稍后重试`);
					return;
				}
			},

            // 下拉变化
            yonghuxingbieChange(e) {
                    this.yonghuxingbieIndex = e.target.value
                    this.ruleForm.xingbie = this.yonghuxingbieOptions[this.yonghuxingbieIndex]
            },
            yonghutouxiangTap() {
                let _this = this;
                this.$api.upload(function(res) {
                    _this.ruleForm.touxiang = 'upload/' + res.file;
                    _this.$forceUpdate();
                });
            },
            // 下拉变化
            shangjiaxingbieChange(e) {
                    this.shangjiaxingbieIndex = e.target.value
                    this.ruleForm.xingbie = this.shangjiaxingbieOptions[this.shangjiaxingbieIndex]
            },
            shangjiatouxiangTap() {
                let _this = this;
                this.$api.upload(function(res) {
                    _this.ruleForm.touxiang = 'upload/' + res.file;
                    _this.$forceUpdate();
                });
            },
            toggleTab(str) {
                this.$refs[str].show();
            },

			styleChange() {
				this.$nextTick(()=>{
					// document.querySelectorAll('.uni-input .uni-input-input').forEach(el=>{
					//   el.style.backgroundColor = this.registerFrom.content.input.backgroundColor
					// })
				})
			},
			// 获取uuid
			getUUID () {
				return new Date().getTime();
			},
			// 注册
			async register() {
				if((!this.ruleForm.yonghuzhanghao) && `yonghu` == this.tableName){
					this.$utils.msg(`用户账号不能为空`);
					return
				}
				if((!this.ruleForm.mima) && `yonghu` == this.tableName){
					this.$utils.msg(`密码不能为空`);
					return
				}
                if(`yonghu` == this.tableName && (this.ruleForm.mima!=this.ruleForm.mima2)){
                    this.$utils.msg(`两次密码输入不一致`);
                    return
                }
				if((!this.ruleForm.yonghuxingming) && `yonghu` == this.tableName){
					this.$utils.msg(`用户姓名不能为空`);
					return
				}
				if(`yonghu` == this.tableName && this.ruleForm.mobile&&(!this.$validate.isMobile(this.ruleForm.mobile))){
					this.$utils.msg(`手机号应输入手机格式`);
					return
				}
				if(`yonghu` == this.tableName && this.ruleForm.money&&(!this.$validate.isNumber(this.ruleForm.money))){
					this.$utils.msg(`余额应输入数字`);
					return
				}
				if((!this.ruleForm.shangjiazhanghao) && `shangjia` == this.tableName){
					this.$utils.msg(`商家账号不能为空`);
					return
				}
				if((!this.ruleForm.mima) && `shangjia` == this.tableName){
					this.$utils.msg(`密码不能为空`);
					return
				}
                if(`shangjia` == this.tableName && (this.ruleForm.mima!=this.ruleForm.mima2)){
                    this.$utils.msg(`两次密码输入不一致`);
                    return
                }
				if((!this.ruleForm.shangjiaxingming) && `shangjia` == this.tableName){
					this.$utils.msg(`商家姓名不能为空`);
					return
				}
				if(`shangjia` == this.tableName && this.ruleForm.lianxidianhua&&(!this.$validate.isMobile(this.ruleForm.lianxidianhua))){
					this.$utils.msg(`联系电话应输入手机格式`);
					return
				}
				if(`shangjia` == this.tableName && this.ruleForm.money&&(!this.$validate.isNumber(this.ruleForm.money))){
					this.$utils.msg(`余额应输入数字`);
					return
				}
				await this.$api.registerSms(`${this.tableName}`, this.ruleForm, this.smscode);
				this.$utils.msgBack('注册成功');;
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
