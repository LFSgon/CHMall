//
//  SMMemberEvaluateFooterView.m
//  CHMall
//
//  Created by pro on 2017/1/13.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberEvaluateFooterView.h"
#import "HCSStarRatingView.h"

@interface SMMemberEvaluateFooterView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *contentL;

@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet HCSStarRatingView *starView;
@end
@implementation SMMemberEvaluateFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
    _starView.emptyStarImage = [UIImage imageNamed:@"icon_star_nomal"];
    _starView.filledStarImage =[UIImage imageNamed:@"icon_star_pre"];
    _starView.spacing = 5.f;
    _starView.value = 3;
}

@end
