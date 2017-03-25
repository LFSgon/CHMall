//
//  SMBaseController.m
//  XieFei
//
//  Created by 了凡 on 16/5/6.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "SMBaseController.h"

@implementation SMBaseController
{
    UILabel * _titleLabel;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = BackColorOfController;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES; 
}
- (void)initTitleView:(NSString *)title{
    if (!_titleLabel) {
        UILabel * titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
        titleLabel.textColor = colorOf_GrayA;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        self.navigationItem.titleView = titleLabel;
        _titleLabel =titleLabel;
    }
    _titleLabel.text = title;

}
@end
