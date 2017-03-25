//
//  SMHomeGoodsPaySelectFooterView.m
//  CHMall
//
//  Created by pro on 2017/1/16.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsPaySelectFooterView.h"

@implementation SMHomeGoodsPaySelectFooterView

- (IBAction)rechargeBtnAction {
    if (self.rechargeBtnActionBlock) {
        self.rechargeBtnActionBlock();
    }
}

@end
