//
//  SMHomeMessageDetailCell.m
//  CHMall
//
//  Created by pro on 2017/1/10.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeMessageDetailCell.h"

@interface SMHomeMessageDetailCell ()

@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
@implementation SMHomeMessageDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_bgView setMyBorder:colorOf_LineGray borderWidth:1];
    [_bgView setRight:5];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
