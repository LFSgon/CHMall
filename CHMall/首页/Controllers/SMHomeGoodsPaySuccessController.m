//
//  SMHomeGoodsPaySuccessController.m
//  CHMall
//
//  Created by pro on 2017/1/16.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsPaySuccessController.h"

@interface SMHomeGoodsPaySuccessController ()

@end

@implementation SMHomeGoodsPaySuccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"支付成功"];
}

- (IBAction)leftBtnAction{
  
}

- (IBAction)rightBtnAction {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
