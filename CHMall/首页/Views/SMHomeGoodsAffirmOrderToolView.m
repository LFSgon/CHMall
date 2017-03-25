//
//  SMHomeGoodsAffirmOrderToolView.m
//  CHMall
//
//  Created by pro on 2017/1/16.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsAffirmOrderToolView.h"

@interface SMHomeGoodsAffirmOrderToolView ()

@property (weak, nonatomic) IBOutlet UILabel *infoL;

@end
@implementation SMHomeGoodsAffirmOrderToolView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)shareInstance{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}
- (IBAction)submitBtnAction {
    if (self.submitBtnActionBlock) {
        self.submitBtnActionBlock();
    }
}

@end
