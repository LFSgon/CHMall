//
//  SMTextView.m
//  XieFei
//
//  Created by 了凡 on 16/6/11.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "SMTextView.h"

@implementation SMTextView

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        DLog(@"rect:%@",NSStringFromCGRect(frame));
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor =[UIColor whiteColor];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
}
- (void)drawRect:(CGRect)rect{
    if (self.hasText) return;
    NSMutableDictionary * attrs =[NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor ? self.placeholderColor : [UIColor grayColor];
    DLog(@"rect:%@",NSStringFromCGRect(rect));
    CGFloat x = 5;
    CGFloat w = rect.size.width - 2 * x;
    CGFloat y = 8;
    CGFloat h = w - 2 * y;
    CGRect placeholderRect = CGRectMake(x, y, w, h);
    [self.placeholder drawInRect:placeholderRect withAttributes:attrs];
}
- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = [placeholder copy];
    [self setNeedsDisplay];
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}
- (void)setText:(NSString *)text{
    [super setText:text];
    [self setNeedsDisplay];
}
- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self setNeedsDisplay];
}
- (void)setFont:(UIFont *)font{
    [super setFont:font];
    [self setNeedsDisplay];
}

#pragma mark - notice
- (void)textDidChange{
    [self setNeedsDisplay];
}


@end
