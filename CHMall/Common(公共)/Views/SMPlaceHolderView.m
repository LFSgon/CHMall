//
//  SMPlaceHolderView.m
//  jingmaomall
//
//  Created by 了凡 on 16/9/2.
//  Copyright © 2016年 jingmaomall. All rights reserved.
//

#import "SMPlaceHolderView.h"

@interface SMPlaceHolderView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation SMPlaceHolderView

+ (instancetype)shareInstance{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}
- (void)setPlaceHolderType:(SMPlaceHolderType)placeHolderType{
    _placeHolderType = placeHolderType;
    UIImage * image = nil;
    switch (placeHolderType) {
        case SMPlaceHolderCart:
            image = [UIImage imageNamed:@"placeholder_cart"];
            break;
        case SMPlaceHolderCoupon:
            image =[UIImage imageNamed:@"placeholder_coupon"];
            break;
        case SMPlaceHolderOrder:
            image =[UIImage imageNamed:@"placeholder_order"];
            break;
        case SMPlaceHolderEvaluation:
            image =[UIImage imageNamed:@"placeholder_evaluation"];
            break;
        default:
            break;
    }
    _imageView.image = image;

}
@end
