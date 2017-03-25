//
//  SMMemberOrderDetailAddressFooterView.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberOrderDetailAddressFooterView.h"

@interface SMMemberOrderDetailAddressFooterView ()

@property (weak, nonatomic) IBOutlet UILabel *deliveryL;

@end
@implementation SMMemberOrderDetailAddressFooterView

- (IBAction)deliveryBtnAction {
    if (self.deliveryActionBlock) {
        self.deliveryActionBlock(_deliveryL);
    }
}

@end
