//
//  SMHomeGoodsCommentItemCell.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsCommentItemCell.h"
#import "HCSStarRatingView.h"

@interface SMHomeGoodsCommentItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *contentL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconconstraintWidth;

@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet HCSStarRatingView *starView;
@end
@implementation SMHomeGoodsCommentItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _starView.emptyStarImage = [UIImage imageNamed:@"icon_star_nomal"];
    _starView.filledStarImage =[UIImage imageNamed:@"icon_star_pre"];
    _starView.spacing = 5.f;
    _starView.value = 3;
    
}
- (void)setIconWidth:(CGFloat)iconWidth{
    _iconWidth = iconWidth;
    _iconconstraintWidth.constant = iconWidth;
    [_iconImageView setRadius:iconWidth/2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
