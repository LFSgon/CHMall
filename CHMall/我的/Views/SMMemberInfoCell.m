//
//  SMMemberInfoCell.m
//  CHMall
//
//  Created by pro on 2017/1/13.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberInfoCell.h"

@interface SMMemberInfoCell ()


@end
@implementation SMMemberInfoCell

- (void)setInfoCellType:(SMMemberInfoCellType)infoCellType{
    _infoCellType = infoCellType;
    if (infoCellType == infoCellTyeIcon) {
        _contentL.hidden = YES;
        _iconImageView.hidden = NO;
    }else{
        _contentL.hidden = NO;
        _iconImageView.hidden = YES;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [_iconImageView setRadius:25];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
