//
//  UILabel+Extension.m
//  GongDan
//
//  Created by 了凡 on 16/1/20.
//  Copyright © 2016年 河北广联. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (instancetype)initWithTitle:(NSString *)title font:(CGFloat)font color:(UIColor *)color{
    if (self =[super init]) {
        self.text =title;
        self.backgroundColor =[UIColor clearColor];
        self.font =[UIFont systemFontOfSize:font];
        self.textColor = color ? color : [UIColor blackColor];
        
    }
    return self;
}
- (instancetype)initWithTitle:(NSString *)title font:(CGFloat)font{
    if (self =[super init]) {
        self.text =title;
        self.backgroundColor =[UIColor clearColor];
        self.font =[UIFont systemFontOfSize:font];
    }
    return self;
}
@end
