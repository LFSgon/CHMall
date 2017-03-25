
//
//  SMHomeGoodsItemToolView.m
//  CHMall
//
//  Created by pro on 2017/1/14.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsItemToolView.h"

@implementation SMHomeGoodsItemToolView

+ (instancetype)shareIntance{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (IBAction)collectBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.collectionBtnActionBlock) {
        self.collectionBtnActionBlock(sender.selected);
    }
}
- (IBAction)addBtnAction {
    if (self.addBtnActionBlock) {
        self.addBtnActionBlock();
    }
}
- (IBAction)buyBtnAction {
    if (self.buyBtnAcitonBlock) {
        self.buyBtnAcitonBlock();
    }
}

@end
