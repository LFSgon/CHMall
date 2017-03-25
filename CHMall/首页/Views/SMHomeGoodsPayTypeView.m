//
//  SMHomeGoodsPayTypeView.m
//  CHMall
//
//  Created by pro on 2017/1/16.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsPayTypeView.h"
#import "UIView+TYAlertView.h"

@interface SMHomeGoodsPayTypeView ()

@property (weak, nonatomic) IBOutlet UILabel *infoL;
@property (weak, nonatomic) IBOutlet UILabel *priceL;

@property (weak, nonatomic) IBOutlet UILabel *typeL;
@end
@implementation SMHomeGoodsPayTypeView

- (void)setPayType:(SMHomeGoodsPayType)payType{
    _payType = payType;
    switch (payType) {
        case payTypeAlipay:
            _typeL.text = @"余额宝";
            break;
        case payTypeWeChat:
            _typeL.text = @"微信零钱";
            break;
        default:
            _typeL.text = @"我的钱包";
            break;
    }
}
- (IBAction)cancelBtnAction {
   [self hideView]; 
}

- (IBAction)nextBtnAction {
    [self hideView]; 
    if (self.nextBtnActionBlock) {
        self.nextBtnActionBlock();
    }
}

@end
