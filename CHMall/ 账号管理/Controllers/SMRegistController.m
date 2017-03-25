//
//  SMRegistController.m
//  CHMall
//
//  Created by pro on 2017/1/7.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMRegistController.h"
#import "JKCountDownButton.h"
#import "TYAttributedLabel.h"
#import "SMWebViewController.h"
@interface SMRegistController ()<TYAttributedLabelDelegate>

@property (weak, nonatomic) IBOutlet UIView *bgPhoneView;
@property (weak, nonatomic) IBOutlet UIView *bgPwdView;
@property (weak, nonatomic) IBOutlet UIView *bgCodeView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet JKCountDownButton *codeBtn;
@property (weak, nonatomic) IBOutlet UIButton *secureBtn;
@property (weak, nonatomic) IBOutlet TYAttributedLabel *protocolL;

@end

@implementation SMRegistController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup{
    [self initTitleView:@"注册"];
    [_bgPhoneView setRadius:5];
    [_bgCodeView setRadius:5];
    [_bgPwdView setRadius:5];
    [_bgPhoneView setMyBorder:colorOf_GrayD borderWidth:1];
    [_bgCodeView setMyBorder:colorOf_GrayD borderWidth:1];
    [_bgPwdView setMyBorder:colorOf_GrayD borderWidth:1];
    [_codeBtn setRadius:14];
    [_codeBtn setMyBorder:colorOf_GrayD borderWidth:0.5];
    _protocolL.delegate = self;
    _protocolL.textColor = RGB(50, 51, 51);
    _protocolL.font = [UIFont systemFontOfSize:selfont3];
    _protocolL.text = @"注册即代表同意";
    [_protocolL appendLinkWithText:@"《餐盒商城用户协议》" linkFont:[UIFont systemFontOfSize:selfont3] linkColor:RGB(225, 31, 31) underLineStyle:kCTUnderlineStyleNone linkData:nil];
    _protocolL.textAlignment = kCTTextAlignmentCenter;
}

#pragma mark - <TYAttributedLabelDelegate>
- (void)attributedLabel:(TYAttributedLabel *)attributedLabel textStorageClicked:(id<TYTextStorageProtocol>)textStorage atPoint:(CGPoint)point{
    SMWebViewController * vc =[SMWebViewController new];
    vc.webViewType = webViewTypeProtocol;
    [self.navigationController pushViewController:vc animated:YES];
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
