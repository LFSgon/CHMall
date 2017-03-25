//
//  SMBaseNavigationController.m
//  XieFei
//
//  Created by 了凡 on 16/5/6.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "SMBaseNavigationController.h"

@implementation SMBaseNavigationController
+ (void)initialize{
    UINavigationBar * bar =[UINavigationBar appearance];
    [bar setBarTintColor:[UIColor whiteColor]];
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"nav_btn_back"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"nav_btn_back"] forState:UIControlStateHighlighted];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        button.bounds = CGRectMake(0, 0, 30, 30);
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    [super pushViewController:viewController animated:animated];
}
- (void)back{
    DLog(@"%@",self.childViewControllers);
    [self popViewControllerAnimated:YES];
}
@end
