//
//  SMMemberOrderDetailAddressHeaderView.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberOrderDetailAddressHeaderView.h"

@interface SMMemberOrderDetailAddressHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *statusL;

@end
@implementation SMMemberOrderDetailAddressHeaderView

- (void)setOrderType:(MemberOrderType)orderType{
    _orderType = orderType;
    switch (orderType) {
        case orderTypePay:
            _statusL.text = @"待付款";
            break;
        case orderTypeDeliver:
            _statusL.text = @"待发货";
            break;
        case orderTypeReceive:
            _statusL.text = @"待收货";
            break;
        case orderTypeEvaluate:
            _statusL.text = @"待评价";
        default:
            break;
    }
}
- (IBAction)addressBtnAction {
    if (self.addressActionBlock) {
        self.addressActionBlock(_infoL,_addressL);
    }
    
}


@end
