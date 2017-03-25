//
//  SMMemberGoEvaluateController.m
//  CHMall
//
//  Created by pro on 2017/1/14.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberGoEvaluateController.h"
#import "SMTextView.h"
#import "HCSStarRatingView.h"
#import "MBProgressHUD.h"
#import "SMMemberEvaluateSuccessView.h"

@interface SMMemberGoEvaluateController ()
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *priceL;
@property (weak, nonatomic) IBOutlet UILabel *numL;
@property (weak, nonatomic) IBOutlet UILabel *bitL;

@property (weak, nonatomic) IBOutlet HCSStarRatingView *starView;
@property (weak, nonatomic) IBOutlet SMTextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation SMMemberGoEvaluateController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"写评价"];
    _starView.emptyStarImage = [UIImage imageNamed:@"icon_star_nomal"];
    _starView.filledStarImage =[UIImage imageNamed:@"icon_star_pre"];
    _starView.spacing = 5.f;
    _starView.value = 3;
    _textView.placeholder = @"分享一下你的购买心得吧";
    _textView.placeholderColor = colorOf_GrayC;
    _textView.backgroundColor =[UIColor clearColor];
    _textView.scrollEnabled = NO;
}

- (IBAction)nextBtnAction {
    [self showHint:@"您已评价成功!"];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
