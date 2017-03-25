//
//  SMMemberOrderItemCell.m
//  CHMall
//
//  Created by pro on 2017/1/9.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberOrderItemCell.h"

@interface SMMemberOrderItemCell ()

@property (weak, nonatomic) IBOutlet UILabel *numL;

@end
@implementation SMMemberOrderItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setOrderItemCellType:(SMMemberOrderItemCellType)orderItemCellType{
    _orderItemCellType = orderItemCellType;
    _numL.hidden = (orderItemCellType == orderItemCellTypeNone) ? YES : NO;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
