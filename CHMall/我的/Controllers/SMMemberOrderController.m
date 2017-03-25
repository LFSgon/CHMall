//
//  SMMemberOrderController.m
//  CHMall
//
//  Created by pro on 2017/1/9.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberOrderController.h"
#import "SMMemberOrderItemController.h"

@interface SMMemberOrderController ()

@end

@implementation SMMemberOrderController

- (instancetype)init {
    if (self = [super init]) {
        self.menuHeight = 40.0;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = SCREEN_WIDTH/5;
        self.titleColorNormal =colorOf_GrayA;
        self.titleColorSelected =ColorOfTheme_Yellow;
        self.titleSizeNormal = 15;
        self.menuBGColor =[UIColor whiteColor];
    }
    return self;
}
- (NSArray<NSString *> *)titles{
    return @[@"全部",@"待付款",@"待发货",@"待收货",@"待评价"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [self initTitleView:@"我的订单"];
}

#pragma mark - WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    SMMemberOrderItemController * vc = [SMMemberOrderItemController new];
    switch (index) {
        case 0:{
            vc.orderType = orderTypeAll;
        }
            break;
        case 1:{
            vc.orderType = orderTypePay;
        }
            break;
        case 2:{
            vc.orderType = orderTypeDeliver;
        }
            break;
        case 3:{
            vc.orderType = orderTypeReceive;
        }
            break;
        default:{
            vc.orderType = orderTypeEvaluate;
        }
            break;
    }
    return vc;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}
- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    NSLog(@"%@", info);
}




@end
