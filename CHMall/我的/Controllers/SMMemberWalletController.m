//
//  SMMemberWalletController.m
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberWalletController.h"
#import "SMMemberWalletDetailsController.h"
#import "SMMemberRechargeWalletController.h"
@interface SMMemberWalletController ()
@property (weak, nonatomic) IBOutlet UILabel *balanceL;

@end

@implementation SMMemberWalletController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =colorOf_White;
    [self initTitleView:@"我的钱包"];
    self.navigationItem.rightBarButtonItem =[UIBarButtonItem BarButtonItemWithTitle:@"明细" target:self action:@selector(rightAction)];
}
#pragma mark - action
- (void)rightAction{
    SMMemberWalletDetailsController * vc =[SMMemberWalletDetailsController new];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)nextBtnAction {
    SMMemberRechargeWalletController * vc =[SMMemberRechargeWalletController new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
