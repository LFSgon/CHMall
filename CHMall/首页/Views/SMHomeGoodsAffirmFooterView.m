//
//  SMHomeGoodsAffirmFooterView.m
//  CHMall
//
//  Created by pro on 2017/1/16.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsAffirmFooterView.h"

@implementation SMHomeGoodsAffirmFooterView

- (IBAction)deliveryBtnAction:(UIButton *)sender {
    if (self.deliveryBtnActionBlock) {
        self.deliveryBtnActionBlock();
    }
}
@end
