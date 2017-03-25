//
//  SMMemberHeaderView.m
//  CHMall
//
//  Created by pro on 2017/1/9.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberHeaderView.h"

@interface SMMemberHeaderView ()

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameL;

@end
@implementation SMMemberHeaderView
- (void)awakeFromNib{
    [super awakeFromNib];
    [_iconBtn setRadius:30];
    [_iconBtn setMyBorder:colorOf_White borderWidth:1];
}
+ (instancetype)shareInstance{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

- (IBAction)rightBtnAction:(UIButton *)sender {
    if (self.rightActionBlock) {
        self.rightActionBlock();
    }
}
- (IBAction)leftBtnAction:(UIButton *)sender {
    if (self.leftActionBlock) {
        self.leftActionBlock();
    }
}
- (IBAction)iconBtnAction:(UIButton *)sender {
    if (self.iconActionBlock) {
        self.iconActionBlock();
    }
    
}

@end
