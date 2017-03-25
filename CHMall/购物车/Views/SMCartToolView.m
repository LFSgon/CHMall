//
//  SMCartToolView.m
//  CHMall
//
//  Created by pro on 2017/1/9.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMCartToolView.h"

@interface SMCartToolView ()
@property (weak, nonatomic) IBOutlet UILabel *contentL;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@end

@implementation SMCartToolView
+ (instancetype)shareInstance{
    SMCartToolView * toolView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    toolView.isEdit = NO;
    return toolView;
}
- (void)setIsEdit:(BOOL)isEdit{
    _isEdit = isEdit;
    _rightBtn.selected = isEdit;
    if (_isEdit) {
        _contentL.text = @"已选(1)";
    }else{
        NSString * price = @"198.00";
        NSMutableAttributedString * content = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"合计¥%@元",price]];
        [content addAttribute:NSForegroundColorAttributeName value:ColorOfTheme_Red range:NSMakeRange(2, price.length+1)];
        _contentL.attributedText = content;
    }
}
- (IBAction)leftBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)rightBtnAction:(UIButton *)sender {
}


@end
