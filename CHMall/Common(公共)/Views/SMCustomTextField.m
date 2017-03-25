//
//  SMCustomTextField.m
//  XieFei
//
//  Created by 了凡 on 16/7/23.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "SMCustomTextField.h"

@implementation SMCustomTextField

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder{
    self =[super initWithFrame:frame];
    if (self) {
        self.borderStyle = UITextBorderStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:12];
        self.placeholder = placeholder;
        UIImage * image =[UIImage imageNamed:@"sousuo-xiao"];
        UIImageView * leftView =[[UIImageView alloc]initWithImage:image];
        leftView.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return self;
}
- (void)drawTextInRect:(CGRect)rect{
    
}

- (void)drawPlaceholderInRect:(CGRect)rect{
    
}


@end
