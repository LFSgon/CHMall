//
//  SMHomeGoodsController.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsController.h"
#import "SMHomeGoodsDetailItemController.h"
#import "SMHomeGoodsItemController.h"
#import "SMHomeGoodsCommentItemController.h"

@interface SMHomeGoodsController ()

@end

@implementation SMHomeGoodsController
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kNoticeCheckAllComment object:nil];
}
-(instancetype)init
{
    if (self = [super init]) {
        self.titleSizeSelected = 18;
        self.titleSizeNormal = 16;
        self.titleColorNormal = colorOf_GrayA;
        self.titleColorSelected = ColorOfTheme_Yellow;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.pageAnimatable = YES;
        self.showOnNavigationBar = YES;
    }
    return self;
    
}
- (NSArray<NSString *> *)titles{
    return @[@"商品", @"详情", @"评价"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuView.backgroundColor =colorOf_Clean;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(checkAllComment) name:kNoticeCheckAllComment object:nil];
}
#pragma mark - WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    switch (index) {
        case 0:{
            SMHomeGoodsItemController * vc =[SMHomeGoodsItemController new];
            return vc;
        }
            break;
        case 1:{
            SMHomeGoodsDetailItemController * vc = [SMHomeGoodsDetailItemController new];
            
            return vc;
        }
            break;
        default:{
            SMHomeGoodsCommentItemController * vc = [SMHomeGoodsCommentItemController new];
            return vc;
        }
            break;
    }
    
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    NSLog(@"%@", info);
}
#pragma mark - notice
- (void)checkAllComment{
    self.selectIndex = (int)(self.titles.count - 1);
}


@end
