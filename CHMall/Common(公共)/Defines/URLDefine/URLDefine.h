//
//  URLDefine.h
//  showjianghu
//
//  Created by 了凡 on 16/2/29.
//  Copyright © 2016年  All rights reserved.
//

#ifndef URLDefine_h
#define URLDefine_h


#if DEBUG
/**
 *测试环境
 **/
#define tHost_URL @"http://222.223.251.109:8070"
#else
/**
 *正式环境
 **/
#define tHost_URL @"http://222.223.251.109:8070"

#endif

/*
 *支付宝回调地址
 */
/*
 *购买商品订单成功后回调地址
 */
#define kAlipayShopNotifyURL @"/area/Order/zhiFuSuccess"
#define pAlipayShopNotifyURL_params(mainid,paymoney) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
mainid,@"mainid",\
paymoney,@"paymoney",nil]



//----------------------------- 账号管理------------------------------
/*
 *注册
 *请求方式：post
 *username用户名
 *Password密码
 *Qq 是否第三方登录后QQ注册 不是为空
 *Registercode 注册是否为手机号 不是为空 是为获取到的验证码
 */
#define uUserCenterRegister @"/UserCenter/UserRegister"
#define pUserCenterRegister_params(username,password,qq,registercode) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
username,@"username",\
password,@"password",\
qq,@"qq",\
registercode,@"registercode",nil]

/*
 *第三方QQ登录
 *Qq 是否第三方登录后QQ注册 不是为空
 */
#define uUserCenterLoginQQ @"/UserCenter/UserLoginQQ"
#define pUserCenterLoginQQ_params(qq) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
qq,@"qq",nil]

/*
 *获取验证码
 *请求方式：post
 *telphone：手机号
 *Type：1:注册、绑定,2:忘记密码,0:解除绑定
 */
#define uUserCenterRegisterSMS @"/UserCenter/GetRegisterSMS"
#define pUserCenterRegisterSMS_params(telphone,type) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
telphone,@"telphone",\
type,@"type",nil]

/*
 *获取邮箱验证码
 *请求方式：post
 *email：邮箱
 *Type：0 注册 1绑定 2解绑 3找回密码
 */
#define uUserCenterRegisterEmail @"/UserPage/EnterptiseRegisterEmail"
#define pUserCenterRegisterEmail_params(name,email,type) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
name,@"name",\
email,@"email",\
type,@"type",nil]

/*
 *会员登录
 *请求方式：post
 *username用户名
 *Password密码
 */
#define uUserCenterLogin @"/UserCenter/UserLogin"
#define pUserCenterLogin_params(username,password) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
username,@"username",\
password,@"password",nil]

/*
 *找回密码
 *请求方式：post
 *username用户名
 *Password密码
 */
#define uUserCenterFindPassword @"/usercenter/FindPassword"
#define pUserCenterFindPassword_params(str) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
str,@"str",nil]

/*
 *找回密码
 *请求方式：post
 *username用户名
 *Password密码
 */
#define uUserCenterSetNewPassword @"/usercenter/SetNewPwd"
#define pUserCenterSetNewPassword_params(userid,newPwd) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
newPwd,@"newPwd",nil]


//----------------------------- 首页 ------------------------------

/*
 *手机端首页
 *请求方式：post
 *无
 */
#define uProductPortProAndPic @"/ProductPort/GetProAndPic"

/*
 *首页搜索
 *请求方式：post
 *where：商品名称
 *orderNum：（1销量，2价格，3上架时间）
 *upOrDown：（0正序，1倒序） 默认为按上架时间倒序排序
 *page：页数
 *rows：条数   默认为第一页25条记录
 */
#define uProductSearchByName @"/ProductPort/SearchByName"
#define pProductSearchByName_params(where,orderNum,upOrDown,page,rows) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
where,@"where",\
orderNum,@"orderNum",\
upOrDown,@"upOrDown",\
page,@"page",\
rows,@"rows",nil]

/*
 *点击级别菜单时 首页搜索
 *请求方式：post
 *levelId：级别（1、2、3级）
 *menuId：菜单ID（点击的菜单的ID）
 *orderNum：（1销量，2价格，3上架时间）
 *upOrDown：（0正序，1倒序） 默认为按上架时间倒序排序
 *page：页数
 *rows：条数   默认为第一页25条记录
 */
#define uProductGetProListByMenu @"/ProductPort/GetProListByMenu"
#define pProductGetProListByMenu_params(levelId,menuId,orderNum,upOrDown,page,rows) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
levelId,@"levelId",\
menuId,@"menuId",\
orderNum,@"orderNum",\
upOrDown,@"upOrDown",\
page,@"page",\
rows,@"rows",nil]

/*
 *商品详情
 *请求方式：post
 *productId：商品ID
 *userId：当前登录人
 */
#define uProductProductXQ @"/ProductPort/ProductXQ"
#define pProductProductXQ_params(productId) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
productId,@"productId",nil]

/*
 *首页点击导航栏进入页
 *请求方式：post
 *typeName：当前登录人
 */
#define uProductByTypeNames @"/ProductPort/ProductByTypeNames"
#define pProductByTypeNames_params(typeName) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
typeName,@"typeName",nil]


//-----------------------------商品分类------------------------------
/*
 *商品分类一级
 *请求方式：post
 *typeName：当前登录人
 */
#define uProductMenuList @"/ProductMenu/GetProductMenus"

/*
 *商品分类二级
 *param: Infos [{ "productID": "1", "num": "2"},{"productID": "2","num": "2"}]
 *param: userID 用户ID
 *请求方式：post
 */
#define uProductMenuGetChildProductMenu @"/ProductMenu/GetChildProductMenu"
#define pProductMenuGetChildProductMenu_params(productMenuId) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
productMenuId,@"productMenuId",nil]

/*
 *商品分类二级
 *param: Infos [{ "productID": "1", "num": "2"},{"productID": "2","num": "2"}]
 *param: userID 用户ID
 *请求方式：post
 */
#define uProductPortSearchByName @"/ProductPort/SearchByName"
#define pProductPortSearchByName_params(where,orderNum,upOrDown,page,rows) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
where,@"where",\
orderNum,@"orderNum",\
upOrDown,@"upOrDown",\
page,@"page",\
rows,@"rows",nil]

/*
 *商品评论列表
 *param: Infos [{ "productID": "1", "num": "2"},{"productID": "2","num": "2"}]
 *param: userID 用户ID
 *Type 0 全部 1 有内容 2 有晒图
 *请求方式：post
 */
#define uProductPortCommentList @"/UserCenter/ProduceCommentList"
#define pProductPortCommentList_params(productid,type,rows,page) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
productid,@"productid",\
type,@"type",\
rows,@"rows",\
page,@"page",nil]





//-----------------------------购物车------------------------------
/*
 *添加或修改某用户购物车内商品
 *param: Infos [{ "productID": "1", "num": "2"},{"productID": "2","num": "2"}]
 *param: userID 用户ID
 *param: type 0 加入购物车 1 编辑购物车
 *请求方式：post
 */
#define uShoppingCartAddOrUpdate @"/ShoppingCart/AddOrUpdateShoppingCartOne"
#define pShoppingCartAddOrUpdate_params(userID,Infos,type) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userID,@"userID",\
Infos,@"infos",\
type,@"type",nil]


/*
 *获取我的购物车商品列表
 *param: userid 用户ID
 *请求方式：post
 */
#define uShoppingCartGetList @"/ShoppingCart/GetShoppingCartList"
#define pShoppingCartGetList_params(userid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userID",nil]

/*
 *删除某人购物车内的商品
 *param: userID 用户ID
 *param: ProductIDs 要删除的商品ID序列(英文逗号隔开)
 *请求方式：post
 */
#define uShoppingCartDeleteMenu @"/ShoppingCart/DeleteMenuInShoppingCart"
#define pShoppingCartDeleteMenu_params(userid,ProductIDs) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userID",\
ProductIDs,@"ProductIDs",nil]


/*
 *用户添加收藏商品
 *请求方式：post
 *userid：用户id
 *productid：商品id
 */
#define uUserCenterFavoriteProduct @"/UserCenter/UserFavoriteProduct"
#define pUserCenterFavoriteProduct_params(userid,productid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
productid,@"productid",nil]

/*
 *用户收藏列表
 *请求方式：post
 *userid：用户id
 */
#define uUserCenterProductList @"/UserCenter/UserFavoriteProductList"
#define pUserCenterProductList_params(userid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",nil]

/*
 *删除收藏商品
 *请求方式：post
 *userid：用户id
 *favoriteids：收藏id(逗号链接分割) 1,2
 */
#define uUserCenterDelUserFavoriteProduct @"/UserCenter/DelUserFavoriteProduct"
#define pUserCenterDelUserFavoriteProduct_params(userid,favoriteids) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
favoriteids,@"favoriteids",nil]

/*
 *确认订单
 *请求方式：post
 *userid：用户id
 *product：购买id(逗号链接分割) 1,2
 */
#define uUserCenterConfirmOrder @"/area/Order/ConfirmOrder"

#define pUserCenterConfirmOrder_params(userid,product) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
product,@"product",nil]

/*
 *生成订单
 Post请求
 参数：
 userid：int  		用户编号
 Restid:int   		商家编号
 Detail:			数组
 [
 Menuid:int  		商品编号
 Num：int   		商品数量
 //Price：decimal  	商品价格（单个价格）
 //Restid: int		商家编号
 ]
 Sendmoney:decimal运费
// Express:string		快递名称
 Shouldpay:decimal 应付价钱
 //Telphone:string	用户电话号码
 //Useraddress:string用户地址
 Couponid:int		优惠券编号
 Invoiceneed:string 是否需要发票（是、否）
 Invoicehead:string	发票头
 orderType:string	个人（公司）
 Remark:string		订单备注（留言）
 */

#define uUserCenterSubOrder @"/area/Order/SubOrder"

#define pUserCenterSubOrder_params(userid,addressid,restid,detail,sendMoney,Express,shouldPay,Couponid,invoiceneed,invoicehead,orderType,Remark) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
addressid,@"addressid",\
restid,@"restid",\
detail,@"detail",\
sendMoney,@"sendMoney",\
Express,@"Express",\
shouldPay,@"shouldPay",\
Couponid,@"Couponid",\
invoiceneed,@"invoiceneed",\
invoicehead,@"invoicehead",\
orderType,@"orderType",\
Remark,@"Remark",nil]

//----------------------------- 个人中心 ------------------------------

/*
 *个人中心
 *请求方式：post
 */
#define uUserCenterUserCount @"/UserCenter/UserCount"
#define pUserCenterUserCount_params(userid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",nil]



/*
 *我的成长值
 *请求方式：post
 */
#define uUserCenterUserLeval @"/UserCenter/UserLeval"
#define pUserCenterUserLeval_params(userid,rows,page) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
rows,@"rows",\
page,@"page",nil]

/*
 *我的优惠券列表
 *请求方式：post
 *Type 类型 1未使用 0已使用 2 已过期
 */
#define uUserCenterGetUserCoupons @"/UserPage/GetUserCoupons"
#define pUserCenterGetUserCoupons_params(userid,type,rows,page) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
type,@"type",\
rows,@"rows",\
page,@"page",nil]

/*
 *余额详情
 *请求方式：post
 */
#define uUserCenterUserBalance @"/UserCenter/UserBalance"
#define pUserCenterUserBalance_params(userid,rows,page) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
rows,@"rows",\
page,@"page",nil]

/*
 *余额详情
 *请求方式：post
 */
#define uUserCenterUserCount @"/UserCenter/UserCount"
#define pUserCenterUserCount_params(userid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",nil]

/*
 *常见问题
 *请求方式：get
 */
#define uUserCenterQuestionList @"/AboutService/QuestionList"

/*
 *第三方登陆后绑定已有账户
 *请求方式：post
 *username：用户名
 *Password：密码
  *Qq：当前第三方登录的QQ
 */
#define uUserCenterRegisterByQQ @"/UserCenter/UserRegisterByQQ"
#define pUserCenterRegisterByQQ_params(username,password,qq) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
username,@"username",\
password,@"Password",\
qq,@"Qq",nil]

/*
 *我的积分
 *请求方式：post
 *userid：用户id
 */
#define uUserCenterUserScore @"/UserCenter/UserScore"
#define pUserCenterUserScore_params(userid,rows,page) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
rows,@"rows",\
page,@"page",nil]

/*
 *订单列表（全部订单、取消订单、退货订单）
 *请求方式：post
 *Userid:用户编号
 *type: int 1：全部订单 2：取消订单 3：退货订单; 4:待付款5:待发货
 6：待收货 7：待评价
 *Page 页数 
 *Rows 行数
 */
#define uUserCenterOrderList @"/area/Order/OrderList"
#define pUserCenterOrderList_params(userid,type,page,rows) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
type,@"type",\
page,@"page",\
rows,@"rows",nil]



/*
 *个人资料-绑定手机-第一步验证密码
 *请求方式：post
 *userid：用户id
 */
#define uUserCenterUserTel @"/UserCenter/BindUserTel"
#define pUserCenterUserTel_params(userid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",nil]

/*
 *个人资料-绑定手机-第二步验证手机短信和图文验证
 *请求方式：post
 *userid：用户id
 *telphone：绑定手机号或绑定邮箱
  *ValidateCode：图文验证码
 */
#define uUserCenterBindTelYZ @"/UserCenter/BindUserTelYZ"
#define pUserCenterBindTelYZ_params(userid,telphone,ValidateCode) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
telphone,@"telphone",\
ValidateCode,@"ValidateCode",nil]

/*
 *用户设置用户名
 *请求方式：post
 *userid：用户id
 *name：用户名
 */
#define uUserCenterEditUser @"/UserCenter/EditUser"
#define pUserCenterEditUser_params(userid,name) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
name,@"Name",nil]


/*
 *编辑个人信息
 *请求方式：post
  *userid：用户编号
 *fullname：姓名
 *nickname：昵称
 *sex：性别
  *birthday：生日
 *province：省份
 *city：城市
 *town：区县
 *address：详细地址
 */
#define uUserCenterAccount @"/UserCenter/EditUserAccount"
#define pUserCenterAccount_params(userid,fullname,nickname,sex,birthday,province,city,town,address) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
fullname,@"fullname",\
nickname,@"nickname",\
sex,@"sex",\
birthday,@"birthday",\
province,@"province",\
city,@"city",\
town,@"town",\
address,@"address",nil]

/*
 *添加收货地址
 *请求方式：post
 *userid：用户id
 *province：省份
 *city：城市
 *town：区县
 *code：邮编
 *telphone：联系电话
 *username：姓名
 *isdefault：是否默认,默认传1
 *addressDetail：详细地址
 */
#define uUserCenterAddUserAddress @"/UserCenter/AddUserAddress"
#define pUserCenterAddUserAddress_params(userid,province,city,town,code,telphone,username,isdefault,addressDetail) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
province,@"Province",\
city,@"City",\
town,@"Town",\
code,@"Code",\
telphone,@"Telphone",\
username,@"Username",\
isdefault,@"Isdefault",\
addressDetail,@"addressDetail",nil]


/*
 *编辑收货地址
 *请求方式：post
 *addressid：序号id
 *province：省份
 *city：城市
 *town：区县
 *code：邮编
 *telphone：联系电话
 *username：姓名
 *isdefault：是否默认,默认传1
 *addressDetail：详细地址
 */
#define uUserCenterEditUserAddress @"/UserCenter/EditUserAddress"
#define pUserCenterEditUserAddress_params(addressid,province,city,town,code,telphone,username,isdefault,addressDetail,userid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
addressid,@"addressid",\
province,@"province",\
city,@"city",\
town,@"town",\
code,@"code",\
telphone,@"telphone",\
username,@"username",\
isdefault,@"isdefault",\
addressDetail,@"addressDetail",\
userid,@"userid",nil]

/*
 *删除收货地址
 *请求方式：post
 *addressid：序号id
 */
#define uUserCenterdelUserAddress @"/UserCenter/delUserAddress"
#define pUserCenterdelUserAddress_params(addressid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
addressid,@"addressid",nil]

/*
 *收货地址列表
 *请求方式：post
 *userid：用户id
 */
#define uUserCenterAddressList @"/UserCenter/UserAddressList"
#define pUserCenterAddressList_params(userid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",nil]

/*
 *修改密码
 *请求方式：post
 *userid：用户id
 *oldPwd：旧密码
 *newPwd：新密码
 */
#define uUserCenterChangePwd @"/UserCenter/ChangePwd"
#define pUserCenterChangePwd_params(userid,oldPwd,newPwd) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
oldPwd,@"oldPwd",\
newPwd,@"newPwd",nil]

/*
 *设置支付密码
 *请求方式：post
 *userid：用户id
 *oldPwd：旧密码
 */
#define uUserCenterSetPayPwd @"/UserCenter/SetPayPwd"
#define pUserCenterSetPayPwd_params(userid,oldPwd) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
oldPwd,@"oldPwd",nil]

/*
 *修改支付密码
 *请求方式：post
 *userid：用户id
 *oldPwd：旧密码
 *newPwd：新密码
 */
#define uUserCenterChangePayPwd @"/UserCenter/ChangePayPwd"
#define pUserCenterChangePayPwd_params(userid,oldPwd,newPwd) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
oldPwd,@"oldPwd",\
newPwd,@"newPwd",nil]

/*
 *我的评价管理
 *请求方式：post
 *userid：用户id
 */
#define uUserCenterCommentList @"/UserCenter/CommentList"
#define pUserCenterCommentList_params(userid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",nil]

/*
 *我的咨询
 *请求方式：post
 *userid：用户id
 */
#define uUserCenterProductZxList @"/UserCenter/ProductZxList"
#define pUserCenterProductZxList_params(userid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",nil]

/*
 *获取省份
 *请求方式：post
 *参数:无
 */
#define ucityGetProvince @"/city/GetProvince"


/*
 *获取城市
 *请求方式：post
 *参数:无
 */
#define ucityGetCitys @"/city/GetCitys"

/*
 *获取区县
 *请求方式：post
 *参数:无
 */
#define ucityGetTowns @"/city/GetTowns"

/*
 *找回密码
 *请求方式：post
 *str：填写的用户名/手机/邮箱 str = 1
 */
#define uUserCenterFindPassword @"/usercenter/FindPassword"
#define pUserCenterFindPassword_params(str) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
str,@"str",nil]

/*
 *找回密码验证成功后设置新密码
 *请求方式：post
 *userid：用户id
  *newPwd：新密码 123
 */
#define uUserCenterNewPwd @"/usercenter/SetNewPwd"
#define pUserCenterNewPwd_params(userid,newPwd) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
newPwd,@"newPwd",nil]

/*
 *商品评价
 post请求
 参数：
 Userid:int 		用户编号
 subid:int			订单中商品记录的编号
 Grades:int		商品分数
 Psgrades:int		配送分数
 Servergrades:int	服务分数
 Comcontent:string	评价内容
 PingJia:	    1是 好评 0是差评 2 是中评
 Type:int			1:匿名0：非匿名
 评价照片是文件流
 */
#define uAreaOrderComment @"/area/Order/Comment"
#define pAreaOrderComment_params(UserId,subid,Grades,PsGrades,ServerGrades,ComContent,PingJia,Type) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
UserId,@"UserId",\
subid,@"subid",\
Grades,@"Grades",\
PsGrades,@"PsGrades",\
ServerGrades,@"ServerGrades",\
ComContent,@"ComContent",\
PingJia,@"PingJia",\
Type,@"Type",nil]


/*
 *意见反馈
 *请求方式：post
 *userid：用户id
 *newPwd：新密码 123
 */
#define uUserCenterSuggestions @"/area/Order/Suggestions"
#define pUserCenterSuggestions_params(userid,suggestions) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
suggestions,@"suggestions",nil]



/*
 *第一步验证密码
 *请求方式：post
 *userid：用户id
 *newPwd：新密码 123
 */
#define uUserCenterBindUserTel @"/UserCenter/BindUserTel"
#define pUserCenterBindUserTel_params(userid,password) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
password,@"password",nil]

/*
 *解除绑定
 *请求方式：post
 *userid：用户id
 *Telphone发送短信的手机号
 *Type 0 解绑手机 1 解绑邮箱
 *ValidateCode 图文验证码
 *Registercode 短信验证码 不是手机传空
 */
#define uUserCenterDelBindUserTelYZ @"/UserCenter/DelBindUserTelYZ"
#define pUserCenterDelBindUserTelYZ_params(userid,telphone,type,registercode) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
telphone,@"telphone",\
type,@"type",\
@"",@"ValidateCode",\
registercode,@"registercode",nil]

/*
 *绑定
 *请求方式：post
 *userid：用户id
 *Telphone发送短信的手机号
 *ValidateCode 图文验证码
 *Registercode 短信验证码 不是手机传空
 */
#define uUserCenterBindUserTelYZ @"/UserCenter/BindUserTelYZ"
#define pUserCenterBindUserTelYZ_params(userid,telphone,registercode) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
userid,@"userid",\
telphone,@"telphone",\
@"",@"ValidateCode",\
registercode,@"registercode",nil]

/*
 *获取省份
 *请求方式：post
 */
#define uUserCenterGetProvince @"/city/GetProvince"

/*
 *获取城市
 *请求方式：post
 */
#define uUserCenterGetCitys @"/city/GetCitys"
#define pUserCenterGetCitys_params(provinceId) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
provinceId,@"provinceId",nil]

/*
 *获取区县
 *请求方式：post
 */
#define uUserCenterGetTowns @"/city/GetTowns"
#define pUserCenterGetTowns_params(cityid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
cityid,@"cityid",nil]

/*
 *取消订单
 *请求方式：post
 *Mainorderid:string 		订单编号
 *Statues:string 			订单状态
 *Yuanyin:string			取消原因
 */
#define uUserCenterOrderCancel @"/area/Order/Cancel"
#define pUserCenterOrderCancel_params(mainOrderId,yuanyin) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
mainOrderId,@"mainOrderId",\
@"订单关闭",@"Statues",\
yuanyin,@"yuanyin",nil]

/*
 *提醒发货
 *请求方式：post
 *Mainorderid:string 		订单编号
 */
#define uUserCenterOrderFaHuo @"/area/Order/FaHuo"
#define pUserCenterOrderFaHuo_params(mainOrderId) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
mainOrderId,@"mainOrderId",nil]

/*
 *查看物流信息
 *请求方式：post
 *Mainorderid:string 		订单编号
 */
#define uUserCenterAppLogistics @"/userpage/AppLogistics"
#define pUserCenterAppLogistics_params(MainOrderId) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
MainOrderId,@"MainOrderId",nil]


/*
 *订单详情
 *请求方式：post
 *Mainorderid:string 		订单编号
 */
#define uUserCenterOrderDetail @"/area/Order/Detail"
#define pUserCenterOrderDetail_params(mainOrderId) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
mainOrderId,@"mainOrderId",nil]


/*
 *请求方式：post
 *Mainorderid:string 		订单编号
 *orderState 确认收货  ：@“订单完成”
 */
#define uUserCenterOrderUpdateOrderState @"/area/Order/UpdateOrderState"
#define pUserCenterOrderUpdateOrderState_params(mainOrder,orderState) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
mainOrder,@"mainOrder",\
orderState,@"orderState",nil]

/*
 *申请退货
 *请求方式：post
 */
#define uUserCenterOrderTH @"/area/Order/TH"
#define pUserCenterOrderTH_params(subid,reason,shuoMing) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
subid,@"subid",\
reason,@"reason",\
shuoMing,@"shuoMing",nil]

/*
 *退货详情
 *请求方式：post
 */
#define uUserCenterOrderTHDetail @"/area/Order/THDetail"
#define pUserCenterOrderTHDetail_params(subid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
subid,@"subid",nil]

/*
 *退货详情
 *请求方式：post
 */
#define uUserCenterOrderTHE @"/area/Order/THE"
#define pUserCenterOrderTHE_params(subid) [NSMutableDictionary dictionaryWithObjectsAndKeys:\
subid,@"subid",nil]









#endif






