
//
//  SMSearchBarView.m
//  jingmaomall
//
//  Created by 了凡 on 16/8/28.
//  Copyright © 2016年 jingmaomall. All rights reserved.
//

#import "SMSearchBarView.h"

@interface SMSearchBarView ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (nonatomic,copy)TapBlock tapBlock;

@end
@implementation SMSearchBarView
- (void)awakeFromNib{
    [super awakeFromNib];
    _textField.delegate = self;
    [_textField setValue:colorOf_GrayC forKeyPath:@"_placeholderLabel.textColor"];
    [_textField setValue:[UIFont boldSystemFontOfSize:selfont3] forKeyPath:@"_placeholderLabel.font"];
    [self setRadius:16];
    [self setMyBorder:colorOf_LineGray borderWidth:1];
}
+ (instancetype)shareIntance{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
+ (instancetype)shareIntanceWithFrame:(CGRect)frame tap:(TapBlock)block{
    SMSearchBarView * searchBar = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    searchBar.frame = frame;
    searchBar.tapBlock = block;
    UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = searchBar.bounds;
    [btn addTarget:searchBar action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor =[UIColor clearColor];
    [searchBar addSubview:btn];
    return searchBar;
}

#pragma mark - action
- (void)btnAction{
    if (self.tapBlock) {
        self.tapBlock();
    }
}
- (IBAction)searchAction:(UIButton *)sender {
    if ([_textField isFirstResponder]) {
        if (self.searchBlock) {
            [_textField resignFirstResponder];
            self.searchBlock(_textField.text);
        }
    }else{
        [_textField becomeFirstResponder];
    }
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}
@end
