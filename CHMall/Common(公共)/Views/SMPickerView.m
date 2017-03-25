//
//  SMPickerView.m
//  jingmaomall
//
//  Created by 了凡 on 16/9/2.
//  Copyright © 2016年 jingmaomall. All rights reserved.
//

#import "SMPickerView.h"

@interface SMPickerView ()
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@end

@implementation SMPickerView
- (void)awakeFromNib{
    [super awakeFromNib];
    [_nextBtn setRadius:4.f];
    [_cancelBtn setRadius:4.f];
//    [_nextBtn setMyBorder:kOrangeColor borderWidth:0.5];
//    [_cancelBtn setMyBorder:kOrangeColor borderWidth:0.5];
    UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelAction:)];
    [self addGestureRecognizer:tap];
}
+ (instancetype)shareInstance{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

- (IBAction)cancelAction:(UIButton *)sender {
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}
- (IBAction)nextAction:(UIButton *)sender {
    if (self.nextBlock) {
        self.nextBlock();
    }
}



@end
