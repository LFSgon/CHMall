//
//  SMMemberNicknameController.m
//  CHMall
//
//  Created by pro on 2017/1/13.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberNicknameController.h"

@interface SMMemberNicknameController ()
@property (strong, nonatomic) IBOutlet UITextField *nameTF;
@end

@implementation SMMemberNicknameController

- (void)setNickName:(NSString *)nickName{
    _nickName = nickName;
    _nameTF.text = nickName;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = colorOf_White;
    [self initTitleView:@"修改昵称"];
}
- (IBAction)nextBtnAction {
    NSString * newName = _nameTF.text;
    if (!newName.length) {
        [self showHint:@"昵称不能为空!"];
        return;
    }
    if ([newName isEqualToString:_nickName]) {
        [self showHint:@"不能与旧昵称相同!"];
        return;
    }
    if (self.saveSuccessBlock) {
        self.saveSuccessBlock(newName);
        [self.navigationController popViewControllerAnimated:YES];
    }
}



@end
