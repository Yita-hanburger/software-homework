<template>
	<div class="addEdit-block" :style='{"padding":"0px 0px 30px","fontSize":"14px","color":"#000","background":"none"}'>
		<el-form
			:style='{"border":"0px solid rgba(255,255,255,1)","padding":"30px 0 10px","borderRadius":"0 0 8px 8px","alignItems":"flex-start","flexWrap":"wrap","background":"rgba(255,255,255,0)","display":"flex","fontSize":"inherit"}'
			class="add-update-preview"
			ref="ruleForm"
			:model="ruleForm"
			:rules="rules"
			label-width="160px"
		>
			<template >
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-if="type!='info'" label="图书编号" prop="tushubianhao">
					<el-input v-model="ruleForm.tushubianhao" placeholder="图书编号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-else-if="ruleForm.tushubianhao" label="图书编号" prop="tushubianhao">
					<el-input v-model="ruleForm.tushubianhao" placeholder="图书编号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-if="type!='info'"  label="图书名称" prop="tushumingcheng">
					<el-input  v-model="ruleForm.tushumingcheng" placeholder="图书名称" clearable  :readonly="ro.tushumingcheng"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-else class="input" label="图书名称" prop="tushumingcheng">
					<el-input v-model="ruleForm.tushumingcheng" placeholder="图书名称" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="select" v-if="type!='info'"  label="图书分类" prop="tushufenlei">
					<el-select :disabled="ro.tushufenlei" v-model="ruleForm.tushufenlei" placeholder="请选择图书分类" >
						<el-option
							v-for="(item,index) in tushufenleiOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-else class="input" label="图书分类" prop="tushufenlei">
					<el-input v-model="ruleForm.tushufenlei"
						placeholder="图书分类" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="upload" v-if="type!='info' && !ro.tushufengmian" label="图书封面" prop="tushufengmian">
					<file-upload
						tip="点击上传图书封面"
						action="file/upload"
						:limit="3"
						:multiple="true"
						:fileUrls="ruleForm.tushufengmian?ruleForm.tushufengmian:''"
						@change="tushufengmianUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="upload" v-else-if="ruleForm.tushufengmian" label="图书封面" prop="tushufengmian">
					<img v-if="ruleForm.tushufengmian.substring(0,4)=='http'" class="upload-img" style="margin-right:20px;" v-bind:key="index" :src="ruleForm.tushufengmian.split(',')[0]" width="100" height="100">
					<img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in ruleForm.tushufengmian.split(',')" :src="$base.url+item" width="100" height="100">
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-if="type!='info'"  label="作者" prop="zuozhe">
					<el-input  v-model="ruleForm.zuozhe" placeholder="作者" clearable  :readonly="ro.zuozhe"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-else class="input" label="作者" prop="zuozhe">
					<el-input v-model="ruleForm.zuozhe" placeholder="作者" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-if="type!='info'"  label="出版社" prop="chubanshe">
					<el-input  v-model="ruleForm.chubanshe" placeholder="出版社" clearable  :readonly="ro.chubanshe"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-else class="input" label="出版社" prop="chubanshe">
					<el-input v-model="ruleForm.chubanshe" placeholder="出版社" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="date" v-if="type!='info'" label="发布日期" prop="faburiqi">
					<el-date-picker
						format="yyyy 年 MM 月 dd 日"
						value-format="yyyy-MM-dd"
						v-model="ruleForm.faburiqi" 
						type="date"
						:readonly="ro.faburiqi"
						placeholder="发布日期"
					></el-date-picker> 
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-else-if="ruleForm.faburiqi" label="发布日期" prop="faburiqi">
					<el-input v-model="ruleForm.faburiqi" placeholder="发布日期" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-if="type!='info'"  label="商家账号" prop="shangjiazhanghao">
					<el-input  v-model="ruleForm.shangjiazhanghao" placeholder="商家账号" clearable  :readonly="ro.shangjiazhanghao"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-else class="input" label="商家账号" prop="shangjiazhanghao">
					<el-input v-model="ruleForm.shangjiazhanghao" placeholder="商家账号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-if="type!='info'"  label="商家姓名" prop="shangjiaxingming">
					<el-input  v-model="ruleForm.shangjiaxingming" placeholder="商家姓名" clearable  :readonly="ro.shangjiaxingming"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-else class="input" label="商家姓名" prop="shangjiaxingming">
					<el-input v-model="ruleForm.shangjiaxingming" placeholder="商家姓名" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-if="type!='info'"  label="单限" prop="onelimittimes">
					<el-input  v-model.number="ruleForm.onelimittimes" placeholder="单限" clearable  :readonly="ro.onelimittimes"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-else class="input" label="单限" prop="onelimittimes">
					<el-input v-model="ruleForm.onelimittimes" placeholder="单限" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-if="type!='info'"  label="库存" prop="alllimittimes">
					<el-input  v-model.number="ruleForm.alllimittimes" placeholder="库存" clearable  :readonly="ro.alllimittimes"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-else class="input" label="库存" prop="alllimittimes">
					<el-input v-model="ruleForm.alllimittimes" placeholder="库存" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' class="input" v-if="type!='info'"  label="价格" prop="price">
					<el-input type="number" v-model.number="ruleForm.price" placeholder="价格" clearable  :readonly="ro.price"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-else class="input" label="价格" prop="price">
					<el-input v-model="ruleForm.price" placeholder="价格" readonly></el-input>
				</el-form-item>
			</template>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-if="type!='info'"  label="图书详情" prop="tushuxiangqing">
					<editor 
						style="min-width: 200px; max-width: 600px;"
						v-model="ruleForm.tushuxiangqing" 
						class="editor" 
						action="file/upload">
					</editor>
				</el-form-item>
				<el-form-item :style='{"width":"48%","margin":"0 0 30px 0","fontSize":"inherit","color":"inherit"}' v-else-if="ruleForm.tushuxiangqing" label="图书详情" prop="tushuxiangqing">
                    <span :style='{"border":"2px solid #c8c8c8","padding":"0 20px","color":"inherit","background":"none","display":"inline-block","width":"auto","fontSize":"14px","lineHeight":"40px","minWidth":"350px","fontWeight":"500"}' v-html="ruleForm.tushuxiangqing"></span>
                </el-form-item>
			<el-form-item :style='{"padding":"0","margin":"30px 0","alignItems":"center","textAlign":"center","display":"flex","width":"100%","perspective":"320px","-webkitPerspective":"320px","fontSize":"48px","justifyContent":"flex-start"}' class="btn">
				<el-button class="btn3"  v-if="type!='info'" type="success" @click="onSubmit">
					<span class="icon iconfont icon-tijiao16" :style='{"margin":"0 2px","fontSize":"18px","color":"inherit","display":"none"}'></span>
					提交
				</el-button>
				<el-button class="btn4" v-if="type!='info'" type="success" @click="back()">
					<span class="icon iconfont icon-quxiao09" :style='{"margin":"0 2px","fontSize":"18px","color":"inherit","display":"none"}'></span>
					取消
				</el-button>
				<el-button class="btn5" v-if="type=='info'" type="success" @click="back()">
					<span class="icon iconfont icon-fanhui01" :style='{"margin":"0 2px","fontSize":"18px","color":"inherit","display":"none"}'></span>
					返回
				</el-button>
			</el-form-item>
		</el-form>
    

  </div>
</template>
<script>
// 数字，邮件，手机，url，身份证校验
import { isNumber,isIntNumer,isEmail,isPhone, isMobile,isURL,checkIdCard } from "@/utils/validate";
export default {
	data() {
		let self = this
		var validateIdCard = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!checkIdCard(value)) {
				callback(new Error("请输入正确的身份证号码"));
			} else {
				callback();
			}
		};
		var validateUrl = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isURL(value)) {
				callback(new Error("请输入正确的URL地址"));
			} else {
				callback();
			}
		};
		var validateMobile = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isMobile(value)) {
				callback(new Error("请输入正确的手机号码"));
			} else {
				callback();
			}
		};
		var validatePhone = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isPhone(value)) {
				callback(new Error("请输入正确的电话号码"));
			} else {
				callback();
			}
		};
		var validateEmail = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isEmail(value)) {
				callback(new Error("请输入正确的邮箱地址"));
			} else {
				callback();
			}
		};
		var validateNumber = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isNumber(value)) {
				callback(new Error("请输入数字"));
			} else {
				callback();
			}
		};
		var validateIntNumber = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isIntNumer(value)) {
				callback(new Error("请输入整数"));
			} else {
				callback();
			}
		};
		return {
			id: '',
			type: '',
			
			
			ro:{
				tushubianhao : false,
				tushumingcheng : false,
				tushufenlei : false,
				tushufengmian : false,
				zuozhe : false,
				chubanshe : false,
				tushuxiangqing : false,
				faburiqi : false,
				shangjiazhanghao : false,
				shangjiaxingming : false,
				onelimittimes : false,
				alllimittimes : false,
				clicktime : false,
				clicknum : false,
				discussnum : false,
				price : false,
				storeupnum : false,
			},
			
			
			ruleForm: {
				tushubianhao: this.getUUID(),
				tushumingcheng: '',
				tushufenlei: '',
				tushufengmian: '',
				zuozhe: '',
				chubanshe: '',
				tushuxiangqing: '',
				faburiqi: '',
				shangjiazhanghao: '',
				shangjiaxingming: '',
				onelimittimes: '1',
				alllimittimes: '1',
				clicktime: '',
				price: '',
			},
		
			tushufenleiOptions: [],

			
			rules: {
				tushubianhao: [
				],
				tushumingcheng: [
				],
				tushufenlei: [
				],
				tushufengmian: [
				],
				zuozhe: [
				],
				chubanshe: [
				],
				tushuxiangqing: [
				],
				faburiqi: [
				],
				shangjiazhanghao: [
				],
				shangjiaxingming: [
				],
				onelimittimes: [
					{ validator: validateIntNumber, trigger: 'blur' },
				],
				alllimittimes: [
					{ validator: validateIntNumber, trigger: 'blur' },
				],
				clicktime: [
				],
				clicknum: [
					{ validator: validateIntNumber, trigger: 'blur' },
				],
				discussnum: [
					{ validator: validateIntNumber, trigger: 'blur' },
				],
				price: [
					{ required: true, message: '价格不能为空', trigger: 'blur' },
					{ validator: validateNumber, trigger: 'blur' },
				],
				storeupnum: [
					{ validator: validateIntNumber, trigger: 'blur' },
				],
			}
		};
	},
	props: ["parent"],
	computed: {



	},
    components: {
    },
	created() {
		this.ruleForm.faburiqi = this.getCurDate()
	},
	methods: {
		
		// 下载
		download(file){
			window.open(`${file}`)
		},
		// 初始化
		init(id,type) {
			if (id) {
				this.id = id;
				this.type = type;
			}
			if(this.type=='info'||this.type=='else'){
				this.info(id);
			}else if(this.type=='logistics'){
				this.logistics=false;
				this.info(id);
			}else if(this.type=='cross'){
				var obj = this.$storage.getObj('crossObj');
				for (var o in obj){
						if(o=='tushubianhao'){
							this.ruleForm.tushubianhao = obj[o];
							this.ro.tushubianhao = true;
							continue;
						}
						if(o=='tushumingcheng'){
							this.ruleForm.tushumingcheng = obj[o];
							this.ro.tushumingcheng = true;
							continue;
						}
						if(o=='tushufenlei'){
							this.ruleForm.tushufenlei = obj[o];
							this.ro.tushufenlei = true;
							continue;
						}
						if(o=='tushufengmian'){
							this.ruleForm.tushufengmian = obj[o];
							this.ro.tushufengmian = true;
							continue;
						}
						if(o=='zuozhe'){
							this.ruleForm.zuozhe = obj[o];
							this.ro.zuozhe = true;
							continue;
						}
						if(o=='chubanshe'){
							this.ruleForm.chubanshe = obj[o];
							this.ro.chubanshe = true;
							continue;
						}
						if(o=='tushuxiangqing'){
							this.ruleForm.tushuxiangqing = obj[o];
							this.ro.tushuxiangqing = true;
							continue;
						}
						if(o=='faburiqi'){
							this.ruleForm.faburiqi = obj[o];
							this.ro.faburiqi = true;
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
						if(o=='onelimittimes'){
							this.ruleForm.onelimittimes = obj[o];
							this.ro.onelimittimes = true;
							continue;
						}
						if(o=='alllimittimes'){
							this.ruleForm.alllimittimes = obj[o];
							this.ro.alllimittimes = true;
							continue;
						}
						if(o=='clicktime'){
							this.ruleForm.clicktime = obj[o];
							this.ro.clicktime = true;
							continue;
						}
						if(o=='clicknum'){
							this.ruleForm.clicknum = obj[o];
							this.ro.clicknum = true;
							continue;
						}
						if(o=='discussnum'){
							this.ruleForm.discussnum = obj[o];
							this.ro.discussnum = true;
							continue;
						}
						if(o=='price'){
							this.ruleForm.price = obj[o];
							this.ro.price = true;
							continue;
						}
						if(o=='storeupnum'){
							this.ruleForm.storeupnum = obj[o];
							this.ro.storeupnum = true;
							continue;
						}
				}
				











				this.ruleForm.onelimittimes='1'

				this.ruleForm.alllimittimes='1'





			}
			
			
			// 获取用户信息
			this.$http({
				url: `${this.$storage.get('sessionTable')}/session`,
				method: "get"
			}).then(({ data }) => {
				if (data && data.code === 0) {
					
					var json = data.data;
					if(((json.shangjiazhanghao!=''&&json.shangjiazhanghao) || json.shangjiazhanghao==0) && this.$storage.get("role")!="管理员"){
						this.ruleForm.shangjiazhanghao = json.shangjiazhanghao
						this.ro.shangjiazhanghao = true;
					}
					if(((json.shangjiaxingming!=''&&json.shangjiaxingming) || json.shangjiaxingming==0) && this.$storage.get("role")!="管理员"){
						this.ruleForm.shangjiaxingming = json.shangjiaxingming
						this.ro.shangjiaxingming = true;
					}
				} else {
					this.$message.error(data.msg);
				}
			});
			
            this.$http({
				url: `option/tushufenlei/tushufenlei`,
				method: "get"
            }).then(({ data }) => {
				if (data && data.code === 0) {
					this.tushufenleiOptions = data.data;
				} else {
					this.$message.error(data.msg);
				}
            });
			
		},
    // 多级联动参数

    info(id) {
      this.$http({
        url: `tushuxinxi/info/${id}`,
        method: "get"
      }).then(({ data }) => {
        if (data && data.code === 0) {
        this.ruleForm = data.data;
        //解决前台上传图片后台不显示的问题
        let reg=new RegExp('../../../upload','g')//g代表全部
        this.ruleForm.tushuxiangqing = this.ruleForm.tushuxiangqing.replace(reg,'../../../ershoutushu/upload');
        } else {
          this.$message.error(data.msg);
        }
      });
    },


    // 提交
    onSubmit() {
		if(this.ruleForm.tushubianhao) {
			this.ruleForm.tushubianhao = String(this.ruleForm.tushubianhao)
		}
	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	if(this.ruleForm.tushufengmian!=null) {
		this.ruleForm.tushufengmian = this.ruleForm.tushufengmian.replace(new RegExp(this.$base.url,"g"),"");
	}
	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }

	  if(this.ruleForm.price<0){
		this.$message.error("价格不能输入负数");
		return
	  }
	  if(this.ruleForm.alllimittimes<0){
		this.$message.error("库存不能输入负数");
		return
	  }
	  if(this.ruleForm.onelimittimes<0){
		this.$message.error("单次购买不能输入负数");
		return
	  }


var objcross = this.$storage.getObj('crossObj');

      //更新跨表属性
       var crossuserid;
       var crossrefid;
       var crossoptnum;
       if(this.type=='cross'){
                var statusColumnName = this.$storage.get('statusColumnName');
                var statusColumnValue = this.$storage.get('statusColumnValue');
                if(statusColumnName!='') {
                        var obj = this.$storage.getObj('crossObj');
                       if(statusColumnName && !statusColumnName.startsWith("[")) {
                               for (var o in obj){
                                 if(o==statusColumnName){
                                   obj[o] = statusColumnValue;
                                 }
                               }
                               var table = this.$storage.get('crossTable');
                             this.$http({
                                 url: `${table}/update`,
                                 method: "post",
                                 data: obj
                               }).then(({ data }) => {});
                       } else {
                               crossuserid=this.$storage.get('userid');
                               crossrefid=obj['id'];
                               crossoptnum=this.$storage.get('statusColumnName');
                               crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
                        }
                }
        }
       this.$refs["ruleForm"].validate(valid => {
         if (valid) {
		 if(crossrefid && crossuserid) {
			 this.ruleForm.crossuserid = crossuserid;
			 this.ruleForm.crossrefid = crossrefid;
			let params = { 
				page: 1, 
				limit: 10, 
				crossuserid:this.ruleForm.crossuserid,
				crossrefid:this.ruleForm.crossrefid,
			} 
			this.$http({ 
				url: "tushuxinxi/page", 
				method: "get", 
				params: params 
			}).then(({ 
				data 
			}) => { 
				if (data && data.code === 0) { 
				       if(data.data.total>=crossoptnum) {
					     this.$message.error(this.$storage.get('tips'));
					       return false;
				       } else {
					 this.$http({
					   url: `tushuxinxi/${!this.ruleForm.id ? "save" : "update"}`,
					   method: "post",
					   data: this.ruleForm
					 }).then(({ data }) => {
					   if (data && data.code === 0) {
					     this.$message({
					       message: "操作成功",
					       type: "success",
					       duration: 1500,
					       onClose: () => {
						 this.parent.showFlag = true;
						 this.parent.addOrUpdateFlag = false;
						 this.parent.tushuxinxiCrossAddOrUpdateFlag = false;
						 this.parent.search();
						 this.parent.contentStyleChange();
					       }
					     });
					   } else {
					     this.$message.error(data.msg);
					   }
					 });

				       }
				} else { 
				} 
			});
		 } else {
			 this.$http({
			   url: `tushuxinxi/${!this.ruleForm.id ? "save" : "update"}`,
			   method: "post",
			   data: this.ruleForm
			 }).then(({ data }) => {
			   if (data && data.code === 0) {
			     this.$message({
			       message: "操作成功",
			       type: "success",
			       duration: 1500,
			       onClose: () => {
				 this.parent.showFlag = true;
				 this.parent.addOrUpdateFlag = false;
				 this.parent.tushuxinxiCrossAddOrUpdateFlag = false;
				 this.parent.search();
				 this.parent.contentStyleChange();
			       }
			     });
			   } else {
			     this.$message.error(data.msg);
			   }
			 });
		 }
         }
       });
    },
    // 获取uuid
    getUUID () {
      return new Date().getTime();
    },
    // 返回
    back() {
      this.parent.showFlag = true;
      this.parent.addOrUpdateFlag = false;
      this.parent.tushuxinxiCrossAddOrUpdateFlag = false;
      this.parent.contentStyleChange();
    },
    tushufengmianUploadChange(fileUrls) {
	    this.ruleForm.tushufengmian = fileUrls;
        this.$http({
            url: "tushuxinxi/baidu/ocr?fileName="+fileUrls.substr(fileUrls.lastIndexOf("/")+1), 
            method: "get", 
            params: {} 
        }).then(({ 
            data 
        }) => { 
            if (data && data.code === 0) { 
                this.ruleForm.tushumingcheng = data.data;
            }
        });
    },
  }
};
</script>
<style lang="scss" scoped>
	.amap-wrapper {
		width: 100%;
		height: 500px;
	}
	
	.search-box {
		position: absolute;
	}
	
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__label {
	  	  padding: 0 10px 0 0;
	  	  color: #999;
	  	  font-weight: 500;
	  	  display: inline-block;
	  	  width: 160px;
	  	  font-size: inherit;
	  	  line-height: 40px;
	  	  text-align: right;
	  	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__content {
	  margin-left: 160px;
	}
	
	.add-update-preview .el-input /deep/ .el-input__inner {
	  	  border: 2px solid #c8c8c8;
	  	  border-radius: 0px;
	  	  padding: 0 12px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: inherit;
	  	  background: none;
	  	  width: auto;
	  	  font-size: 14px;
	  	  min-width: 350px;
	  	  height: 36px;
	  	}
	
	.add-update-preview .el-select /deep/ .el-input__inner {
	  	  border: 2px solid #c8c8c8;
	  	  border-radius: 0px;
	  	  padding: 0 10px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: inherit;
	  	  background: none;
	  	  width: auto;
	  	  font-size: 14px;
	  	  min-width: 350px;
	  	  height: 36px;
	  	}
	
	.add-update-preview .el-date-editor /deep/ .el-input__inner {
	  	  border: 2px solid #c8c8c8;
	  	  border-radius: 0px;
	  	  padding: 0 10px 0 30px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: inherit;
	  	  background: none;
	  	  width: auto;
	  	  font-size: 14px;
	  	  min-width: 350px;
	  	  height: 36px;
	  	}
	
	.add-update-preview /deep/ .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview /deep/ .upload .upload-img {
	  	  border: 2px solid #c8c8c8;
	  	  cursor: pointer;
	  	  border-radius: 0px;
	  	  color: inherit;
	  	  background: none;
	  	  font-weight: 600;
	  	  object-fit: cover;
	  	  width: 150px;
	  	  font-size: 32px;
	  	  line-height: 80px;
	  	  text-align: center;
	  	  height: 80px;
	  	}
	
	.add-update-preview /deep/ .el-upload-list .el-upload-list__item {
	  	  border: 2px solid #c8c8c8;
	  	  cursor: pointer;
	  	  border-radius: 0px;
	  	  color: inherit;
	  	  background: none;
	  	  font-weight: 600;
	  	  object-fit: cover;
	  	  width: 150px;
	  	  font-size: 32px;
	  	  line-height: 80px;
	  	  text-align: center;
	  	  height: 80px;
	  	}
	
	.add-update-preview /deep/ .el-upload .el-icon-plus {
	  	  border: 2px solid #c8c8c8;
	  	  cursor: pointer;
	  	  border-radius: 0px;
	  	  color: inherit;
	  	  background: none;
	  	  font-weight: 600;
	  	  object-fit: cover;
	  	  width: 150px;
	  	  font-size: 32px;
	  	  line-height: 80px;
	  	  text-align: center;
	  	  height: 80px;
	  	}
	
	.add-update-preview .el-textarea /deep/ .el-textarea__inner {
	  	  border: 2px solid #c8c8c8;
	  	  border-radius: 0px;
	  	  padding: 12px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: inherit;
	  	  background: none;
	  	  width: auto;
	  	  font-size: 14px;
	  	  min-width: 350px;
	  	  height: 120px;
	  	}
	
	.add-update-preview .btn .btn1 {
				border: 0px solid rgba(126, 96, 16, .2);
				cursor: pointer;
				padding: 0 30px;
				margin: 0px 20px 0 0;
				color: #fff;
				display: inline-block;
				font-size: 14px;
				line-height: 24px;
				border-radius: 4px;
				outline: none;
				background: #ffc054;
				width: auto;
				height: 40px;
			}
	
	.add-update-preview .btn .btn1:hover {
				transform: scale(0.9);
				opacity: 0.8;
			}
	
	.add-update-preview .btn .btn2 {
				border: 0px solid rgba(126, 96, 16, .2);
				cursor: pointer;
				border-radius: 4px;
				padding: 0 30px;
				margin: 0px 20px 0 0;
				outline: none;
				color: #fff;
				background: #ffc054;
				width: auto;
				font-size: 14px;
				line-height: 24px;
				height: 40px;
			}
	
	.add-update-preview .btn .btn2:hover {
				transform: scale(0.9);
				opacity: 0.8;
			}
	
	.add-update-preview .btn .btn3 {
				border: 0px solid rgba(126, 96, 16, .2);
				cursor: pointer;
				border-radius: 4px;
				padding: 0 30px;
				margin: 0px 20px 0 0;
				outline: none;
				color: #fff;
				background: #ffc054;
				width: auto;
				font-size: 16px;
				line-height: 24px;
				height: 40px;
			}
	
	.add-update-preview .btn .btn3:hover {
				transform: scale(0.9);
				opacity: 0.8;
			}
	
	.add-update-preview .btn .btn4 {
				border: 0px solid rgba(126, 96, 16, .2);
				cursor: pointer;
				border-radius: 4px;
				padding: 0 30px;
				margin: 0px 20px 0 0;
				color: #fff;
				background: #ffc054;
				width: auto;
				font-size: 16px;
				line-height: 24px;
				height: 40px;
			}
	
	.add-update-preview .btn .btn4:hover {
				transform: scale(0.9);
				opacity: 0.8;
			}
	
	.add-update-preview .btn .btn5 {
				border: 0px solid rgba(126, 96, 16, .2);
				cursor: pointer;
				border-radius: 4px;
				padding: 0 30px;
				margin: 0px 20px 0 0;
				color: #fff;
				background: #ffc054;
				width: auto;
				font-size: 16px;
				line-height: 24px;
				height: 40px;
			}
	
	.add-update-preview .btn .btn5:hover {
				transform: scale(0.9);
				opacity: 0.8;
			}
</style>
