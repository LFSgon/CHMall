//
//  Defines.h
//  XieFei
//
//  Created by 了凡 on 16/5/6.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

#import "UIDefine.h"
#import "URLDefine.h"

typedef NS_ENUM(NSUInteger,MemberOrderType) {
    orderTypeAll,
    orderTypePay,
    orderTypeDeliver,
    orderTypeReceive,
    orderTypeEvaluate
};
typedef NS_ENUM(NSUInteger,SMMemberOrderItemFooterViewBtnType) {
    orderItemFooterViewBtnTypeCancel,//取消订单
    orderItemFooterViewBtnTypePay,//去付款
    orderItemFooterViewBtnTypeDeliver,//待发货
    orderItemFooterViewBtnTypeDelete,//删除订单
    orderItemFooterViewBtnTypeEvaluate,//去评价
    orderItemFooterViewBtnTypeReceive,//确认收货
};


typedef NS_ENUM(NSInteger,SMTicketListCellType) {
    ticketListCellUnused,
    ticketListCellUsed,
    ticketListCellstale
};
typedef NS_ENUM(NSInteger,VerifyPwdType) {
    verifyPwdBindTel,
    verifyPwdUnbindTel,
    verifyPwdBindEmail,
    verifyPwdUnbindEmail
};

typedef NS_ENUM(NSInteger,SMCategorySortType) {
    categorySortTypeNormal,
    categorySortTypeSearch
};

#define kNoticeCheckAllComment @"kNoticeCheckAllComment"

#define kNoticeAHTagAction @"kNoticeAHTagAction"
#define kNoticeOrderListBtnAction @"kNoticeOrderListBtnAction"

#define kNoticeDidSelectGood @"kNoticeDidSelectGood"
#define kNoticeSwitchGoodTXT @"kNoticeSwitchGoodTXT"
#define kNoticePublishSuccess @"kNoticePublishSuccess"
// 表情选中的通知
#define HWEmotionDidSelectNotification @"HWEmotionDidSelectNotification"
#define HWSelectEmotionKey @"HWSelectEmotionKey"
// 删除文字的通知
#define HWEmotionDidDeleteNotification @"HWEmotionDidDeleteNotification"

#define kNoticeSearchLiveList @"kNoticeSearchLiveList"

#define kNoticeReceiveFriendPush @"kNoticeReceiveFriendPush"
//支付宝支付成功通知
#define kNoticeAliaySuccess @"kNoticeAliaySuccess"

#define KNoticeMoreCategory @"KNoticeMoreCategory"

#define kNoticeReceivePushMessage @"kNoticeReceivePushMessage"

#define kNoticeHandlerPushMessage @"kNoticeHandlerPushMessage"
/**
 *  第三方登录
 */
//友盟appkey
#define UMENGAPPKEY @"5694de56e0f55a7391002425"

//回调url
#define XZUM_URL @"http://a.yoocii.com:8080/sunlake/client/info/codescan.do"

//微信
#define WECHATAPPKEY @"wxd3adc14547de1dc0"
#define WECHATAPPSECRET @"57876f3468317256fa14ffd0ae42f8a2"

//QQ
#define QQAPPID @"1105085774"
#define QQAPPSECRET @"Q8cb7J0AuMEWQ3AT"

/** 极光推送 */
#define JPUSHAPPKEY @"5974e0417cadad15cfa8182e"
#define JPUSHCHANNEL @"App Store"
/** 环信 */
#define EMAPPKEY @"240944930#rtsg"

#endif /* Defines_h */
