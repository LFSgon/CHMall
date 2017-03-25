//
//  SMMemberWalletDetailsCell.m
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberWalletDetailsCell.h"

@interface SMMemberWalletDetailsCell ()

@property (weak, nonatomic) IBOutlet UILabel *sortL;
@property (weak, nonatomic) IBOutlet UILabel *priceL;
@property (weak, nonatomic) IBOutlet UILabel *timeL;

@end
@implementation SMMemberWalletDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
