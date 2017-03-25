//
//  SMHomeGoodsItemFooterView.m
//  CHMall
//
//  Created by pro on 2017/1/14.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsItemFooterView.h"

@interface SMHomeGoodsItemFooterView ()

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end
@implementation SMHomeGoodsItemFooterView
- (void)awakeFromNib{
    [super awakeFromNib];
    [_nextBtn setMyBorder:colorOf_GrayE borderWidth:1];
    [_nextBtn setRadius:5];
}
- (IBAction)nextBtnAction {
    if (self.nextBtnActionBlock) {
        self.nextBtnActionBlock();
    }
}

@end
