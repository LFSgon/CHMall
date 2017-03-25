//
//  SMWebViewController.h
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMBaseController.h"
typedef NS_ENUM(NSUInteger,SMWebViewType) {
    webViewTypeProtocol,//用户协议
    webViewTypeAboutUs,//关于我们
    webViewTypeUseHelp,//使用帮助
};

@interface SMWebViewController : SMBaseController
@property(nonatomic,assign)SMWebViewType webViewType;
@end
