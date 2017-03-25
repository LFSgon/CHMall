
//
//  SMHomeGoodsPayTypeView.h
//  CHMall
//
//  Created by pro on 2017/1/16.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,SMHomeGoodsPayType) {
    payTypeAlipay,
    payTypeWeChat,
    payTypeWallet
};
@interface SMHomeGoodsPayTypeView : UIView
@property (nonatomic,assign)SMHomeGoodsPayType payType;
@property (nonatomic,copy)void (^nextBtnActionBlock)();
@end
