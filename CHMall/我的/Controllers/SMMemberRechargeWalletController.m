//
//  SMMemberRechargeWalletController.m
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberRechargeWalletController.h"

@interface SMMemberRechargeWalletController ()

@property (weak, nonatomic) IBOutlet UITextField *sumTF;
@property (weak, nonatomic) IBOutlet UIButton *weChatBtn;

@property (weak, nonatomic) IBOutlet UIButton *alipayBtn;
@end

@implementation SMMemberRechargeWalletController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"账户充值"];
}
- (IBAction)alipayBtnAction {
    if (_weChatBtn.selected) {
        _weChatBtn.selected = NO;
    }
    _alipayBtn.selected = !_alipayBtn.selected;
}

- (IBAction)weChatBtnAction {
    if (_alipayBtn.selected) {
        _alipayBtn.selected = NO;
    }
    _weChatBtn.selected = !_weChatBtn.selected;
}
- (IBAction)nextBtnAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
