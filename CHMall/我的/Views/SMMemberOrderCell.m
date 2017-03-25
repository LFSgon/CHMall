//
//  SMMemberOrderCell.m
//  CHMall
//
//  Created by pro on 2017/1/9.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberOrderCell.h"

@implementation SMMemberOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)btnAction:(UIButton *)sender {
    if (self.btnActionBlock) {
        int tag = (int)sender.tag;
        self.btnActionBlock(tag - 100);
    }
}

@end
