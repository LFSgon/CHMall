//
//  SMLoginController.m
//  CHMall
//
//  Created by pro on 2017/1/7.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMLoginController.h"
#import "SMForgetPwdController.h"
#import "SMRegistController.h"

@interface SMLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@property (weak, nonatomic) IBOutlet UIView *bgPhoneView;

@property (weak, nonatomic) IBOutlet UIView *bgPasswordView;
@end

@implementation SMLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup{
    [self initTitleView:@"登录"];
    [_bgPhoneView setRadius:5];
    [_bgPasswordView setRadius:5];
    [_bgPhoneView setMyBorder:colorOf_GrayD borderWidth:1];
    [_bgPasswordView setMyBorder:colorOf_GrayD borderWidth:1];
}

- (IBAction)loginAction:(UIButton *)sender {
}
- (IBAction)forgetAction {
    SMForgetPwdController * vc =[SMForgetPwdController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)registAction {
    SMRegistController * vc =[SMRegistController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)otherLoginAction:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
            DLog(@"QQ登录");
            break;
        case 101:
            DLog(@"微信登录");
            break;
        case 102:
            DLog(@"新浪登录");
        default:
            break;
    }
}

@end
