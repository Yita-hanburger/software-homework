# 基于微信小程序的校园二手图书交易系统

## 技术栈
- **后端**: Django 2.0 + MySQL 5.7, Python 3
- **前端**: 微信小程序 (mp-weixin), 后台管理: Vue (dist) 或 jQuery (layui)
- **可选**: PySpark/Hive/HDFS 大数据组件

## 目录结构
```
unmodifiedCode/
├── ershoutushu/          # Django后端主项目
│   ├── dj2/              # Django项目配置 (settings, urls, wsgi)
│   ├── main/             # 主应用 (所有业务逻辑)
│   │   ├── model.py      # BaseModel基类 (CRUD抽象, 分页, 统计)
│   │   ├── models.py     # 所有业务表Model定义
│   │   ├── users_model.py # 管理员用户表
│   │   ├── config_model.py # 配置表
│   │   ├── *_v.py        # 每个表对应的视图文件 (API接口实现)
│   │   ├── schema_v.py   # 通用接口 (上传/下载/统计/审核)
│   │   ├── users_v.py    # 管理员用户接口
│   │   ├── config_v.py   # 配置接口
│   │   └── urls.py       # 动态URL路由 (自动扫描*_v.py生成)
│   ├── templates/front/  # 前端静态资源 (admin, index.html)
│   ├── util/             # 工具模块 (auth, codes, baidu API, Hive等)
│   ├── xmiddleware/       # 自定义中间件 (xauth认证, xparam参数解析)
│   ├── db/ershoutushu.sql # 数据库初始化SQL
│   └── manage.py         # Django入口
├── mp-weixin/            # 微信小程序前端
│   ├── app.js/json/wxss  # 小程序入口
│   └── pages/            # 页面 (按功能表名分目录)
├── code/                 # 代码副本 (与ershoutushu和mp-weixin内容相同)
└── 文档/                 # .doc/.docx 开发文档
```

## 核心架构：低代码动态路由框架

这是一个**代码自动生成框架**，通过表名命名约定的方式自动生成CRUD接口和路由。

### 动态路由生成 (`main/urls.py`)
- 排除 `schema_v.py`, `users_v.py`, `config_v.py` 三个特殊文件
- 自动扫描 `main/` 目录下所有 `*_v.py` 文件
- 对每个 `{TableName}_v.py`，自动注册以下标准路径（以 `${tablename}` 为前缀）:
  - `register`, `login`, `logout`, `resetPass` — 注册/登录/登出/重置密码
  - `session` — 获取当前登录用户信息
  - `page` — 分页列表 (后台)
  - `list`, `lists` — 前台分页/无分页列表
  - `save`, `add` — 后台/前台新增
  - `info/<id_>`, `detail/<id_>` — 单条详情
  - `update` — 更新
  - `delete` — 批量删除 (传ids数组)
  - `thumbsup/<id_>` — 点赞/踩
  - `vote/<id_>` — 投票
  - `importExcel`, `sendemail` — Excel导入/邮件发送
  - `autoSort`, `autoSort2` — 智能推荐/购买推荐
  - `value/<x>/<y>`, `value/<x>/<y>/<type>` — 按值统计
  - `valueMul/<x>`, `valueMul/<x>/<type>` — 多列值统计
  - `group/<column>` — 分组统计
- 另外注册通用接口: `cal/`, `file/download`, `file/upload`, `follow/`, `option/`, `sh/`, `remind/`, `upload/`, `group/`, `value/`, `spider/`

### 视图函数 (`*_v.py`) 模式
每个 `*_v.py` 中的函数命名规则: `{tablename}_{action}(request, ...)`
- 所有请求参数从 `request.session.get("req_dict")` 获取（由xparam中间件注入）
- 调用 `BaseModel` 方法完成数据库操作
- 返回 `JsonResponse`，统一格式: `{"code": 0, "msg": "...", "data": {...}}`

### BaseModel (`main/model.py`) 提供的CRUD方法
| 方法 | 说明 |
|------|------|
| `page(model, params)` | 分页查询 (支持sort/order/page/limit, %模糊搜索, 日期范围) |
| `getbyparams(model, params)` | 精确条件查询 |
| `getbyid(model, id)` | 按ID查询 |
| `createbyreq(model, params)` | 创建记录, 自动生成ID=`time.time()*1000` |
| `updatebyparams(model, params)` | 按ID更新, 自动类型转换 |
| `deletes(model, ids)` | 批量按ID删除 |
| `deletebyparams(model, params)` | 按条件批量删除 |
| `getbyColumn(model, col, params)` | 获取某列去重值列表 |
| `getcomputedbycolumn(model, col)` | 聚合计算 (sum/max/min/avg) |
| `groupbycolumnname(model, col, where)` | 分组统计 COUNT |
| `getvaluebyxycolumnname(model, x, y, where)` | 按x分组, 对y求和 |
| `getbetweenparams(model, col, params)` | 数值/日期范围查询 |

### Model属性系统 (`models.py`)
每个表定义通过类属性声明行为:
- `__tablename__` — 数据库表名
- `__authPeople__` — '是'表示此表为用户表，需密码登录
- `__loginUserColumn__` — 登录用户名字段名
- `__loginUser__` — 登录字段名（用于getbyparams时映射username到实际字段）
- `__authTables__` — `{关联字段: 关联用户表}` 多租户数据隔离
- `__authSeparate__` — '是'时按userid隔离数据
- `__sfsh__` — '是'时需要审核
- `__isAdmin__` — '是'时该表用户可查看所有记录
- `__foreEndList__` — '是'/否/'前要登' 控制前台列表访问
- `__foreEndListAuth__` — '是'时前台list仅能查看自己的记录
- `__intelRecom__` — '是'时启用智能推荐
- `__browseClick__` — '是'时点击自动+1
- `__thumbsUp__` — '是'时有点赞/踩功能

## API接口规范
- **URL前缀**: `/{数据库名}/` (默认: `/ershoutushu/`)
- **请求方式**: 同时接受GET和POST
- **参数**: 通过request body传递JSON, xparam中间件解析后存入 `request.session["req_dict"]`
- **响应格式**: `{"code": 0, "msg": "成功", "data": {...}}`
- **分页响应**: `{"code": 0, "data": {"currPage": 1, "totalPage": 1, "total": 100, "pageSize": 10, "list": [...]}}`
- **认证**: 通过xauth中间件, session中存储登录用户params(含id, tablename等)

## 数据表 (16张业务表)
| 表名 | 中文名 | 说明 |
|------|--------|------|
| `users` | 管理员表 | username/password/role |
| `config` | 配置表 | name/value键值对 |
| `yonghu` | 用户 | 用户账号/密码/姓名/性别/头像/手机/余额 |
| `shangjia` | 商家 | 商家账号/密码/姓名/联系电话/头像/余额 |
| `tushufenlei` | 图书分类 | 图书分类名称 |
| `tushuxinxi` | 图书信息 | 图书编号/名称/分类/封面/作者/出版社/详情/价格/库存/点击量/收藏数/商家关联 |
| `ziyuanfenlei` | 资源分类 | 资源分类名称 |
| `ziyuanfenxiang` | 资源分享 | 资源编号/名称/分类/图片/文档/详情/商家关联 |
| `qiugouxinxi` | 求购信息 | 求购编号/图书名称/分类/价格/数量/用户关联 |
| `tousuxinxi` | 投诉信息 | 标题/封面/投诉内容/审核状态/审核回复 |
| `gonggaoxinxi` | 公告信息 | 标题/封面/内容/发布时间/赞/踩/收藏 |
| `cart` | 购物车 | userid/goodid/商品信息/数量/价格/商家 |
| `orders` | 订单 | 订单编号/商品信息/数量/总价/支付类型/状态/地址/收货人/物流/审核 |
| `address` | 地址 | userid/地址/收货人/电话/是否默认 |
| `storeup` | 收藏表 | userid/refid/表名/名称/图片/类型(收藏/赞/踩/关注) |
| `aboutus` | 关于我们 | 标题/副标题/内容/图片 |
| `systemintro` | 系统介绍 | 同上结构 |
| `smsregistercode` | 短信验证码 | mobile/role/code |
| `discusstushuxinxi` | 图书评论 | refid/userid/头像/用户名/内容/评分/回复 |
| `discussqiugouxinxi` | 求购评论 | refid/userid/头像/用户名/内容/回复 |

## 数据库配置
- 数据库名: `ershoutushu`
- 配置来源: `config.ini` (host/port/user/passwd/db/charset)
- 支持Spark+Hive读取 (通过 `hasHadoop` 配置)

## 启动方式
```bash
cd ershoutushu
python manage.py runserver 0.0.0.0:8080
# 访问 http://localhost:8080/ershoutushu/admin/dist/index.html (Vue管理后台)
```

## 微信小程序
- 项目名: 基于微信程序的校园二手图书交易系统
- TabBar: 首页/图书信息/资源分享/购物车/我的
- 页面按表名组织: `pages/{表名}/list`, `pages/{表名}/add-or-update`, `pages/{表名}/detail`
- 额外页面: login, register, forget, center, user-info, shop-*系列
- 组件: mescroll-uni, uni-popup, zebra-swiper

