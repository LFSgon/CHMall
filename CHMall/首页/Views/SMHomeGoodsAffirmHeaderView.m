//
//  SMHomeGoodsAffirmHeaderView.m
//  CHMall
//
//  Created by pro on 2017/1/16.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsAffirmHeaderView.h"

@interface SMHomeGoodsAffirmHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *infoL;
@property (weak, nonatomic) IBOutlet UILabel *addressL;

@end
@implementation SMHomeGoodsAffirmHeaderView


- (IBAction)btnAciton {
    if (self.btnActionBlock) {
        self.btnActionBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
