//
//  SMMemberSettingFeedbackController.m
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberSettingFeedbackController.h"
#import "SMTextView.h"

@interface SMMemberSettingFeedbackController ()
@property (weak, nonatomic) IBOutlet SMTextView *textView;

@end

@implementation SMMemberSettingFeedbackController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =colorOf_White;
    [self initTitleView:@"意见反馈"];
    _textView.placeholder = @"请输入您对我们的意见和建议";
    _textView.placeholderColor = colorOf_GrayC;
    _textView.backgroundColor =[UIColor clearColor];
    _textView.scrollEnabled = NO;
}
- (IBAction)nextBtnAction {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
