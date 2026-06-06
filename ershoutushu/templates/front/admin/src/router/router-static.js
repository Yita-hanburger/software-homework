import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
    import aboutus from '@/views/modules/aboutus/list'
    import ziyuanfenxiang from '@/views/modules/ziyuanfenxiang/list'
    import qiugouxinxi from '@/views/modules/qiugouxinxi/list'
    import storeup from '@/views/modules/storeup/list'
    import shangjia from '@/views/modules/shangjia/list'
    import tousuxinxi from '@/views/modules/tousuxinxi/list'
    import discusstushuxinxi from '@/views/modules/discusstushuxinxi/list'
    import tushufenlei from '@/views/modules/tushufenlei/list'
    import systemintro from '@/views/modules/systemintro/list'
    import yonghu from '@/views/modules/yonghu/list'
    import discussqiugouxinxi from '@/views/modules/discussqiugouxinxi/list'
    import orders from '@/views/modules/orders/list'
    import gonggaoxinxi from '@/views/modules/gonggaoxinxi/list'
    import ziyuanfenlei from '@/views/modules/ziyuanfenlei/list'
    import config from '@/views/modules/config/list'
    import tushuxinxi from '@/views/modules/tushuxinxi/list'


//2.配置路由   注意：名字
export const routes = [{
    path: '/',
    name: '系统首页',
    component: Index,
    children: [{
      // 这里不设置值，是把main作为默认页面
      path: '/',
      name: '系统首页',
      component: Home,
      meta: {icon:'', title:'center', affix: true}
    }, {
      path: '/updatePassword',
      name: '修改密码',
      component: UpdatePassword,
      meta: {icon:'', title:'updatePassword'}
    }, {
      path: '/pay',
      name: '支付',
      component: pay,
      meta: {icon:'', title:'pay'}
    }, {
      path: '/center',
      name: '个人信息',
      component: center,
      meta: {icon:'', title:'center'}
    }
      ,{
	path: '/aboutus',
        name: '关于我们',
        component: aboutus
      }
      ,{
	path: '/ziyuanfenxiang',
        name: '资源分享',
        component: ziyuanfenxiang
      }
      ,{
	path: '/qiugouxinxi',
        name: '求购信息',
        component: qiugouxinxi
      }
      ,{
	path: '/storeup',
        name: '我的收藏管理',
        component: storeup
      }
      ,{
	path: '/shangjia',
        name: '商家',
        component: shangjia
      }
      ,{
	path: '/tousuxinxi',
        name: '投诉信息',
        component: tousuxinxi
      }
      ,{
	path: '/discusstushuxinxi',
        name: '图书信息评论',
        component: discusstushuxinxi
      }
      ,{
	path: '/tushufenlei',
        name: '图书分类',
        component: tushufenlei
      }
      ,{
	path: '/systemintro',
        name: '系统简介',
        component: systemintro
      }
      ,{
	path: '/yonghu',
        name: '用户',
        component: yonghu
      }
      ,{
	path: '/discussqiugouxinxi',
        name: '求购信息评论',
        component: discussqiugouxinxi
      }
      ,{
        path: '/orders/:status',
        name: '订单管理',
        component: orders
      }
      ,{
	path: '/gonggaoxinxi',
        name: '公告信息',
        component: gonggaoxinxi
      }
      ,{
	path: '/ziyuanfenlei',
        name: '资源分类',
        component: ziyuanfenlei
      }
      ,{
	path: '/config',
        name: '轮播图管理',
        component: config
      }
      ,{
	path: '/tushuxinxi',
        name: '图书信息',
        component: tushuxinxi
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {icon:'', title:'login'}
  },
  {
    path: '/register',
    name: 'register',
    component: register,
    meta: {icon:'', title:'register'}
  },
  {
    path: '*',
    component: NotFound
  }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
  mode: 'hash',
  /*hash模式改为history*/
  routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
   return originalPush.call(this, location).catch(err => err)
}
export default router;
