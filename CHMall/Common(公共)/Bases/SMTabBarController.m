//
//  SMTabBarController.m
//  XieFei
//
//  Created by 了凡 on 16/5/6.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "SMTabBarController.h"
#import "SMHomeController.h"
#import "SMSortController.h"
#import "SMCartController.h"
#import "SMMemberController.h"
#import "SMBaseTabBar.h"
#import "SMBaseNavigationController.h"

@interface SMTabBarController ()
@property (nonatomic,strong)NSArray * classNames;
@property(nonatomic,strong)NSArray * dataSource;
@end
@implementation SMTabBarController
- (NSArray *)classNames{
    if (!_classNames) {
        _classNames =@[
                        NSStringFromClass([SMHomeController class]),
                        NSStringFromClass([SMSortController class]),
                        NSStringFromClass([SMCartController class]),
                        NSStringFromClass([SMMemberController class])
                       ];
    }
    return _classNames;
}
- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource =@[@{@"image":@"tabBar_home",@"title":@"首页"},
                       @{@"image":@"tabBar_sort",@"title":@"分类"},
                       @{@"image":@"tabBar_cart",@"title":@"购物车"},
                       @{@"image":@"tabBar_member",@"title":@"我的"}];
    }
    return _dataSource;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self addAllChildControllers];
    [self setValue:[[SMBaseTabBar alloc]init] forKeyPath:@"tabBar"];
}
- (void)addAllChildControllers{
    for (int i = 0; i < self.classNames.count; i++) {
        NSString * className = self.classNames[i];
        Class class = NSClassFromString(className);
        if (class) {
            UIViewController * childVc = class.new;
            NSString * normalImageName = self.dataSource[i][@"image"];
            NSString * selectedImageName = [normalImageName stringByAppendingString:@"_s"];
            UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
            UIImage *normalImage = [UIImage imageNamed:normalImageName];
            if (kiOS7Later) {
                //声明这张图用原图
                selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            }
            childVc.tabBarItem.image = normalImage;
            childVc.tabBarItem.selectedImage = selectedImage;
            childVc.tabBarItem.title = self.dataSource[i][@"title"];
            SMBaseNavigationController * nvc = [[SMBaseNavigationController alloc]initWithRootViewController:childVc];
            //添加导航控制器
            [self addChildViewController:nvc];
        }
    }
}

+ (void)initialize
{
    //设置底部tabbar的主题样式
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ColorOfTheme_Yellow, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
}

@end
