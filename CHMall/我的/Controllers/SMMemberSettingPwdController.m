//
//  SMMemberSettingPwdController.m
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberSettingPwdController.h"
#import "JKCountDownButton.h"

@interface SMMemberSettingPwdController ()
@property (weak, nonatomic) IBOutlet UIView *bgPhoneView;
@property (weak, nonatomic) IBOutlet UIView *bgPwdView;
@property (weak, nonatomic) IBOutlet UIView *bgCodeView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet JKCountDownButton *codeBtn;
@property (weak, nonatomic) IBOutlet UIButton *secureBtn;

@end

@implementation SMMemberSettingPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"修改密码"];
    [_codeBtn setRadius:14];
    [_codeBtn setMyBorder:colorOf_GrayD borderWidth:0.5];
}

- (IBAction)nextBtnAction:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)secureBtnAction:(UIButton *)sender {
    _pwdTF.secureTextEntry = sender.selected;
    sender.selected =!sender.selected;
}
- (IBAction)codeBtnAction:(JKCountDownButton *)sender {
    sender.enabled = NO;
    NSString * telphone = _phoneTF.text;
    [XZHttpTool postWithUrl:uUserCenterRegisterSMS params:pUserCenterRegisterSMS_params(telphone,@(1)) success:^(NSDictionary *responseDict, NSInteger code, NSString *message) {
        [self showHint:message];
        if (code == 0) {
            sender.enabled = NO;
            [sender startCountDownWithSecond:60];
        }else{
            sender.enabled = YES;
        }
        DLog(@"%@",responseDict);
    } failure:^(NSError *error) {
        sender.enabled = YES;
    }];
    [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
        NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
        return title;
    }];
    [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
        countDownButton.enabled = YES;
        return @"点击重新获取";
        
    }];
    
}



@end
