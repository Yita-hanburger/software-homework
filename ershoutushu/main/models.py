#coding:utf-8
__author__ = "ila"
from django.db import models

from .model import BaseModel

from datetime import datetime



class yonghu(BaseModel):
    __doc__ = u'''yonghu'''
    __tablename__ = 'yonghu'

    __loginUser__='yonghuzhanghao'


    __authTables__={}
    __authPeople__='是'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __loginUserColumn__='yonghuzhanghao'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    yonghuzhanghao=models.CharField ( max_length=255,null=False,unique=True, verbose_name='用户账号' )
    mima=models.CharField ( max_length=255,null=False, unique=False, verbose_name='密码' )
    yonghuxingming=models.CharField ( max_length=255,null=False, unique=False, verbose_name='用户姓名' )
    xingbie=models.CharField ( max_length=255, null=True, unique=False, verbose_name='性别' )
    touxiang=models.TextField   (  null=True, unique=False, verbose_name='头像' )
    mobile=models.CharField ( max_length=255, null=True, unique=False, verbose_name='手机号' )
    money=models.FloatField   (  null=True, unique=False,default='0', verbose_name='余额' )
    '''
    yonghuzhanghao=VARCHAR
    mima=VARCHAR
    yonghuxingming=VARCHAR
    xingbie=VARCHAR
    touxiang=Text
    mobile=VARCHAR
    money=Float
    '''
    class Meta:
        db_table = 'yonghu'
        verbose_name = verbose_name_plural = '用户'
class shangjia(BaseModel):
    __doc__ = u'''shangjia'''
    __tablename__ = 'shangjia'

    __loginUser__='shangjiazhanghao'


    __authTables__={}
    __authPeople__='是'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __loginUserColumn__='shangjiazhanghao'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    shangjiazhanghao=models.CharField ( max_length=255,null=False,unique=True, verbose_name='商家账号' )
    mima=models.CharField ( max_length=255,null=False, unique=False, verbose_name='密码' )
    shangjiaxingming=models.CharField ( max_length=255,null=False, unique=False, verbose_name='商家姓名' )
    xingbie=models.CharField ( max_length=255, null=True, unique=False, verbose_name='性别' )
    lianxidianhua=models.CharField ( max_length=255, null=True, unique=False, verbose_name='联系电话' )
    touxiang=models.TextField   (  null=True, unique=False, verbose_name='头像' )
    money=models.FloatField   (  null=True, unique=False,default='0', verbose_name='余额' )
    '''
    shangjiazhanghao=VARCHAR
    mima=VARCHAR
    shangjiaxingming=VARCHAR
    xingbie=VARCHAR
    lianxidianhua=VARCHAR
    touxiang=Text
    money=Float
    '''
    class Meta:
        db_table = 'shangjia'
        verbose_name = verbose_name_plural = '商家'
class tushufenlei(BaseModel):
    __doc__ = u'''tushufenlei'''
    __tablename__ = 'tushufenlei'



    __authTables__={}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    tushufenlei=models.CharField ( max_length=255, null=True, unique=False, verbose_name='图书分类' )
    '''
    tushufenlei=VARCHAR
    '''
    class Meta:
        db_table = 'tushufenlei'
        verbose_name = verbose_name_plural = '图书分类'
class tushuxinxi(BaseModel):
    __doc__ = u'''tushuxinxi'''
    __tablename__ = 'tushuxinxi'



    __authTables__={'shangjiazhanghao':'shangjia',}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='是'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='是'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='前要登'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    tushubianhao=models.CharField ( max_length=255, null=True,unique=True, verbose_name='图书编号' )
    tushumingcheng=models.CharField ( max_length=255, null=True, unique=False, verbose_name='图书名称' )
    tushufenlei=models.CharField ( max_length=255, null=True, unique=False, verbose_name='图书分类' )
    tushufengmian=models.TextField   (  null=True, unique=False, verbose_name='图书封面' )
    zuozhe=models.CharField ( max_length=255, null=True, unique=False, verbose_name='作者' )
    chubanshe=models.CharField ( max_length=255, null=True, unique=False, verbose_name='出版社' )
    tushuxiangqing=models.TextField   (  null=True, unique=False, verbose_name='图书详情' )
    faburiqi=models.DateField   (  null=True, unique=False, verbose_name='发布日期' )
    shangjiazhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='商家账号' )
    shangjiaxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='商家姓名' )
    onelimittimes=models.IntegerField  (  null=True, unique=False, verbose_name='单限' )
    alllimittimes=models.IntegerField  (  null=True, unique=False, verbose_name='库存' )
    clicktime=models.DateTimeField  (  null=True, unique=False, verbose_name='最近点击时间' )
    clicknum=models.IntegerField  (  null=True, unique=False,default='0', verbose_name='点击次数' )
    discussnum=models.IntegerField  (  null=True, unique=False,default='0', verbose_name='评论数' )
    price=models.FloatField   ( null=False, unique=False, verbose_name='价格' )
    storeupnum=models.IntegerField  (  null=True, unique=False,default='0', verbose_name='收藏数' )
    '''
    tushubianhao=VARCHAR
    tushumingcheng=VARCHAR
    tushufenlei=VARCHAR
    tushufengmian=Text
    zuozhe=VARCHAR
    chubanshe=VARCHAR
    tushuxiangqing=Text
    faburiqi=Date
    shangjiazhanghao=VARCHAR
    shangjiaxingming=VARCHAR
    onelimittimes=Integer
    alllimittimes=Integer
    clicktime=DateTime
    clicknum=Integer
    discussnum=Integer
    price=Float
    storeupnum=Integer
    '''
    class Meta:
        db_table = 'tushuxinxi'
        verbose_name = verbose_name_plural = '图书信息'
class ziyuanfenlei(BaseModel):
    __doc__ = u'''ziyuanfenlei'''
    __tablename__ = 'ziyuanfenlei'



    __authTables__={}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    ziyuanfenlei=models.CharField ( max_length=255, null=True, unique=False, verbose_name='资源分类' )
    '''
    ziyuanfenlei=VARCHAR
    '''
    class Meta:
        db_table = 'ziyuanfenlei'
        verbose_name = verbose_name_plural = '资源分类'
class ziyuanfenxiang(BaseModel):
    __doc__ = u'''ziyuanfenxiang'''
    __tablename__ = 'ziyuanfenxiang'



    __authTables__={'shangjiazhanghao':'shangjia',}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='前要登'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    ziyuanbianhao=models.CharField ( max_length=255, null=True,unique=True, verbose_name='资源编号' )
    ziyuanmingcheng=models.CharField ( max_length=255, null=True, unique=False, verbose_name='资源名称' )
    ziyuanfenlei=models.CharField ( max_length=255, null=True, unique=False, verbose_name='资源分类' )
    ziyuantupian=models.TextField   (  null=True, unique=False, verbose_name='资源图片' )
    ziyuanwendang=models.TextField   (  null=True, unique=False, verbose_name='资源文档' )
    fabushijian=models.DateField   (  null=True, unique=False, verbose_name='发布时间' )
    ziyuanxiangqing=models.TextField   (  null=True, unique=False, verbose_name='资源详情' )
    shangjiazhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='商家账号' )
    shangjiaxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='商家姓名' )
    storeupnum=models.IntegerField  (  null=True, unique=False,default='0', verbose_name='收藏数' )
    '''
    ziyuanbianhao=VARCHAR
    ziyuanmingcheng=VARCHAR
    ziyuanfenlei=VARCHAR
    ziyuantupian=Text
    ziyuanwendang=Text
    fabushijian=Date
    ziyuanxiangqing=Text
    shangjiazhanghao=VARCHAR
    shangjiaxingming=VARCHAR
    storeupnum=Integer
    '''
    class Meta:
        db_table = 'ziyuanfenxiang'
        verbose_name = verbose_name_plural = '资源分享'
class qiugouxinxi(BaseModel):
    __doc__ = u'''qiugouxinxi'''
    __tablename__ = 'qiugouxinxi'



    __authTables__={'yonghuzhanghao':'yonghu',}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='前要登'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    qiugoubianhao=models.CharField ( max_length=255, null=True,unique=True, verbose_name='求购编号' )
    tushumingcheng=models.CharField ( max_length=255, null=True, unique=False, verbose_name='图书名称' )
    tushufenlei=models.CharField ( max_length=255, null=True, unique=False, verbose_name='图书分类' )
    tushufengmian=models.TextField   (  null=True, unique=False, verbose_name='图书封面' )
    qiugoujiage=models.FloatField   (  null=True, unique=False, verbose_name='求购价格' )
    qiugoushuliang=models.IntegerField  (  null=True, unique=False, verbose_name='求购数量' )
    qiugoushijian=models.DateField   (  null=True, unique=False, verbose_name='求购时间' )
    yonghuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户账号' )
    yonghuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户姓名' )
    qiugouxiangqing=models.TextField   (  null=True, unique=False, verbose_name='求购详情' )
    discussnum=models.IntegerField  (  null=True, unique=False,default='0', verbose_name='评论数' )
    '''
    qiugoubianhao=VARCHAR
    tushumingcheng=VARCHAR
    tushufenlei=VARCHAR
    tushufengmian=Text
    qiugoujiage=Float
    qiugoushuliang=Integer
    qiugoushijian=Date
    yonghuzhanghao=VARCHAR
    yonghuxingming=VARCHAR
    qiugouxiangqing=Text
    discussnum=Integer
    '''
    class Meta:
        db_table = 'qiugouxinxi'
        verbose_name = verbose_name_plural = '求购信息'
class tousuxinxi(BaseModel):
    __doc__ = u'''tousuxinxi'''
    __tablename__ = 'tousuxinxi'



    __authTables__={'yonghuzhanghao':'yonghu',}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='是'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='前要登'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    biaoti=models.CharField ( max_length=255, null=True, unique=False, verbose_name='标题' )
    fengmian=models.TextField   (  null=True, unique=False, verbose_name='封面' )
    yonghuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户账号' )
    yonghuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户姓名' )
    tousuriqi=models.DateField   (  null=True, unique=False, verbose_name='投诉日期' )
    tousuneirong=models.TextField   (  null=True, unique=False, verbose_name='投诉内容' )
    sfsh=models.CharField ( max_length=255, null=True, unique=False,default='待审核', verbose_name='是否审核' )
    shhf=models.TextField   (  null=True, unique=False, verbose_name='审核回复' )
    '''
    biaoti=VARCHAR
    fengmian=Text
    yonghuzhanghao=VARCHAR
    yonghuxingming=VARCHAR
    tousuriqi=Date
    tousuneirong=Text
    sfsh=VARCHAR
    shhf=Text
    '''
    class Meta:
        db_table = 'tousuxinxi'
        verbose_name = verbose_name_plural = '投诉信息'
class gonggaoxinxi(BaseModel):
    __doc__ = u'''gonggaoxinxi'''
    __tablename__ = 'gonggaoxinxi'



    __authTables__={}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='是'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='是'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    biaoti=models.CharField ( max_length=255, null=True, unique=False, verbose_name='标题' )
    fengmian=models.TextField   (  null=True, unique=False, verbose_name='封面' )
    neirong=models.TextField   (  null=True, unique=False, verbose_name='内容' )
    fabushijian=models.DateField   (  null=True, unique=False, verbose_name='发布时间' )
    thumbsupnum=models.IntegerField  (  null=True, unique=False,default='0', verbose_name='赞' )
    crazilynum=models.IntegerField  (  null=True, unique=False,default='0', verbose_name='踩' )
    storeupnum=models.IntegerField  (  null=True, unique=False,default='0', verbose_name='收藏数' )
    '''
    biaoti=VARCHAR
    fengmian=Text
    neirong=Text
    fabushijian=Date
    thumbsupnum=Integer
    crazilynum=Integer
    storeupnum=Integer
    '''
    class Meta:
        db_table = 'gonggaoxinxi'
        verbose_name = verbose_name_plural = '公告信息'
class cart(BaseModel):
    __doc__ = u'''cart'''
    __tablename__ = 'cart'



    __authTables__={}
    __authSeparate__='是'#后台列表权限
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    tablename=models.CharField ( max_length=255, null=True, unique=False,default='tushuxinxi', verbose_name='商品表名' )
    userid=models.BigIntegerField  ( null=False, unique=False, verbose_name='用户id' )
    goodid=models.BigIntegerField  ( null=False, unique=False, verbose_name='商品id' )
    goodname=models.CharField ( max_length=255, null=True, unique=False, verbose_name='商品名称' )
    picture=models.TextField   (  null=True, unique=False, verbose_name='图片' )
    buynumber=models.IntegerField  ( null=False, unique=False, verbose_name='购买数量' )
    price=models.FloatField   (  null=True, unique=False, verbose_name='单价' )
    shangjiazhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='商户名称' )
    goodtype=models.CharField ( max_length=255, null=True, unique=False, verbose_name='商品类型' )
    '''
    tablename=VARCHAR
    userid=BigInteger
    goodid=BigInteger
    goodname=VARCHAR
    picture=Text
    buynumber=Integer
    price=Float
    shangjiazhanghao=VARCHAR
    goodtype=VARCHAR
    '''
    class Meta:
        db_table = 'cart'
        verbose_name = verbose_name_plural = '购物车表'
class orders(BaseModel):
    __doc__ = u'''orders'''
    __tablename__ = 'orders'



    __authTables__={'shangjiazhanghao':'shangjia',}
    __authSeparate__='是'#后台列表权限
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    orderid=models.CharField ( max_length=255,null=False,unique=True, verbose_name='订单编号' )
    tablename=models.CharField ( max_length=255, null=True, unique=False,default='tushuxinxi', verbose_name='商品表名' )
    userid=models.BigIntegerField  ( null=False, unique=False, verbose_name='用户id' )
    goodid=models.BigIntegerField  ( null=False, unique=False, verbose_name='商品id' )
    goodname=models.CharField ( max_length=255, null=True, unique=False, verbose_name='商品名称' )
    picture=models.TextField   (  null=True, unique=False, verbose_name='商品图片' )
    buynumber=models.IntegerField  ( null=False, unique=False, verbose_name='购买数量' )
    price=models.FloatField   ( null=False, unique=False,default='0', verbose_name='价格' )
    total=models.FloatField   ( null=False, unique=False,default='0', verbose_name='总价格' )
    type=models.IntegerField  (  null=True, unique=False,default='1', verbose_name='支付类型' )
    status=models.CharField ( max_length=255, null=True, unique=False, verbose_name='状态' )
    address=models.CharField ( max_length=255, null=True, unique=False, verbose_name='地址' )
    tel=models.CharField ( max_length=255, null=True, unique=False, verbose_name='电话' )
    consignee=models.CharField ( max_length=255, null=True, unique=False, verbose_name='收货人' )
    logistics=models.TextField   (  null=True, unique=False, verbose_name='物流' )
    remark=models.CharField ( max_length=255, null=True, unique=False, verbose_name='备注' )
    shangjiazhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='商户名称' )
    goodtype=models.CharField ( max_length=255, null=True, unique=False, verbose_name='商品类型' )
    sfsh=models.CharField ( max_length=255, null=True, unique=False,default='', verbose_name='是否审核' )
    shhf=models.TextField   (  null=True, unique=False, verbose_name='审核回复' )
    role=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户角色' )
    '''
    orderid=VARCHAR
    tablename=VARCHAR
    userid=BigInteger
    goodid=BigInteger
    goodname=VARCHAR
    picture=Text
    buynumber=Integer
    price=Float
    total=Float
    type=Integer
    status=VARCHAR
    address=VARCHAR
    tel=VARCHAR
    consignee=VARCHAR
    logistics=Text
    remark=VARCHAR
    shangjiazhanghao=VARCHAR
    goodtype=VARCHAR
    sfsh=VARCHAR
    shhf=Text
    role=VARCHAR
    '''
    class Meta:
        db_table = 'orders'
        verbose_name = verbose_name_plural = '订单'
class address(BaseModel):
    __doc__ = u'''address'''
    __tablename__ = 'address'



    __authTables__={}
    __authSeparate__='是'#后台列表权限
    __foreEndListAuth__='是'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    userid=models.BigIntegerField  ( null=False, unique=False, verbose_name='用户id' )
    address=models.CharField ( max_length=255,null=False, unique=False, verbose_name='地址' )
    name=models.CharField ( max_length=255,null=False, unique=False, verbose_name='收货人' )
    phone=models.CharField ( max_length=255,null=False, unique=False, verbose_name='电话' )
    isdefault=models.CharField ( max_length=255,null=False, unique=False, verbose_name='是否默认地址[是/否]' )
    '''
    userid=BigInteger
    address=VARCHAR
    name=VARCHAR
    phone=VARCHAR
    isdefault=VARCHAR
    '''
    class Meta:
        db_table = 'address'
        verbose_name = verbose_name_plural = '地址'
class storeup(BaseModel):
    __doc__ = u'''storeup'''
    __tablename__ = 'storeup'



    __authTables__={}
    __authSeparate__='是'#后台列表权限
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    userid=models.BigIntegerField  ( null=False, unique=False, verbose_name='用户id' )
    refid=models.BigIntegerField  (  null=True, unique=False, verbose_name='商品id' )
    tablename=models.CharField ( max_length=255, null=True, unique=False, verbose_name='表名' )
    name=models.CharField ( max_length=255,null=False, unique=False, verbose_name='名称' )
    picture=models.TextField   ( null=False, unique=False, verbose_name='图片' )
    type=models.CharField ( max_length=255, null=True, unique=False,default='1', verbose_name='类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)' )
    inteltype=models.CharField ( max_length=255, null=True, unique=False, verbose_name='推荐类型' )
    remark=models.CharField ( max_length=255, null=True, unique=False, verbose_name='备注' )
    '''
    userid=BigInteger
    refid=BigInteger
    tablename=VARCHAR
    name=VARCHAR
    picture=Text
    type=VARCHAR
    inteltype=VARCHAR
    remark=VARCHAR
    '''
    class Meta:
        db_table = 'storeup'
        verbose_name = verbose_name_plural = '收藏表'
class aboutus(BaseModel):
    __doc__ = u'''aboutus'''
    __tablename__ = 'aboutus'



    __authTables__={}
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    title=models.CharField ( max_length=255,null=False, unique=False, verbose_name='标题' )
    subtitle=models.CharField ( max_length=255, null=True, unique=False, verbose_name='副标题' )
    content=models.TextField   ( null=False, unique=False, verbose_name='内容' )
    picture1=models.TextField   (  null=True, unique=False, verbose_name='图片1' )
    picture2=models.TextField   (  null=True, unique=False, verbose_name='图片2' )
    picture3=models.TextField   (  null=True, unique=False, verbose_name='图片3' )
    '''
    title=VARCHAR
    subtitle=VARCHAR
    content=Text
    picture1=Text
    picture2=Text
    picture3=Text
    '''
    class Meta:
        db_table = 'aboutus'
        verbose_name = verbose_name_plural = '关于我们'
class systemintro(BaseModel):
    __doc__ = u'''systemintro'''
    __tablename__ = 'systemintro'



    __authTables__={}
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    title=models.CharField ( max_length=255,null=False, unique=False, verbose_name='标题' )
    subtitle=models.CharField ( max_length=255, null=True, unique=False, verbose_name='副标题' )
    content=models.TextField   ( null=False, unique=False, verbose_name='内容' )
    picture1=models.TextField   (  null=True, unique=False, verbose_name='图片1' )
    picture2=models.TextField   (  null=True, unique=False, verbose_name='图片2' )
    picture3=models.TextField   (  null=True, unique=False, verbose_name='图片3' )
    '''
    title=VARCHAR
    subtitle=VARCHAR
    content=Text
    picture1=Text
    picture2=Text
    picture3=Text
    '''
    class Meta:
        db_table = 'systemintro'
        verbose_name = verbose_name_plural = '关于我们'
class smsregistercode(BaseModel):
    __doc__ = u'''smsregistercode'''
    __tablename__ = 'smsregistercode'



    __authTables__={}
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    mobile=models.CharField ( max_length=255,null=False, unique=False, verbose_name='手机' )
    role=models.CharField ( max_length=255,null=False, unique=False, verbose_name='角色' )
    code=models.CharField ( max_length=255,null=False, unique=False, verbose_name='验证码' )
    '''
    mobile=VARCHAR
    role=VARCHAR
    code=VARCHAR
    '''
    class Meta:
        db_table = 'smsregistercode'
        verbose_name = verbose_name_plural = '短信验证码'
class discusstushuxinxi(BaseModel):
    __doc__ = u'''discusstushuxinxi'''
    __tablename__ = 'discusstushuxinxi'



    __authTables__={}
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    refid=models.BigIntegerField  ( null=False, unique=False, verbose_name='关联表id' )
    userid=models.BigIntegerField  ( null=False, unique=False, verbose_name='用户id' )
    avatarurl=models.TextField   (  null=True, unique=False, verbose_name='头像' )
    nickname=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户名' )
    content=models.TextField   ( null=False, unique=False, verbose_name='评论内容' )
    score=models.FloatField   (  null=True, unique=False, verbose_name='评分' )
    reply=models.TextField   (  null=True, unique=False, verbose_name='回复内容' )
    '''
    refid=BigInteger
    userid=BigInteger
    avatarurl=Text
    nickname=VARCHAR
    content=Text
    score=Float
    reply=Text
    '''
    class Meta:
        db_table = 'discusstushuxinxi'
        verbose_name = verbose_name_plural = '图书信息评论表'
class discussqiugouxinxi(BaseModel):
    __doc__ = u'''discussqiugouxinxi'''
    __tablename__ = 'discussqiugouxinxi'



    __authTables__={}
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    refid=models.BigIntegerField  ( null=False, unique=False, verbose_name='关联表id' )
    userid=models.BigIntegerField  ( null=False, unique=False, verbose_name='用户id' )
    avatarurl=models.TextField   (  null=True, unique=False, verbose_name='头像' )
    nickname=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户名' )
    content=models.TextField   ( null=False, unique=False, verbose_name='评论内容' )
    reply=models.TextField   (  null=True, unique=False, verbose_name='回复内容' )
    '''
    refid=BigInteger
    userid=BigInteger
    avatarurl=Text
    nickname=VARCHAR
    content=Text
    reply=Text
    '''
    class Meta:
        db_table = 'discussqiugouxinxi'
        verbose_name = verbose_name_plural = '求购信息评论表'
