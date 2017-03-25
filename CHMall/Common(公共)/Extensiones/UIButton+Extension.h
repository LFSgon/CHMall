//
//  UIButton+Extension.h
//  GongDan
//
//  Created by 了凡 on 16/1/20.
//  Copyright © 2016年 河北广联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+ (UIButton *) createButtonWithImage:(NSString *)image HighImage:(NSString *)highImage Title:(NSString *)title Target:(id)target Selector:(SEL)selector;
+ (UIButton*) createButtonWithImage:(NSString *)image tag:(NSInteger)tag selectImage:(NSString *)selectImage Title:(NSString *)title normalTextColor:(UIColor *)normalColor seletTextColor:(UIColor *)selectColor Target:(id)target Selector:(SEL)selector;

-(void)bootstrapStyle:(CGFloat)cornerRadius;
//-(void)defaultStyleWithNormalTitleColor:(UIColor *)titleColor andHighTitleColor:(UIColor *)highTitleColor andBorderColor:(UIColor *)borderColor andBgColor:(UIColor *)bgColor andHighBgColor:(UIColor *)highBgColor;
-(void)defaultStyleWithNormalTitleColor:(UIColor *)titleColor andHighTitleColor:(UIColor *)highTitleColor andBorderColor:(UIColor *)borderColor andBackgroundColor:(UIColor *)bgColor andHighBgColor:(UIColor *)highBgColor withcornerRadius:(CGFloat)cornerRadius;
//-(void)primaryStyle;
//-(void)successStyle;
//-(void)infoStyle;
//-(void)warningStyle;
//-(void)dangerStyle;

/** 设置按钮的全部属性 */
-(void)defaultStyleWithNormalTitleColor:(UIColor *)titleColor andHighTitleColor:(UIColor *)highTitleColor andBorderColor:(UIColor *)borderColor andBackgroundColor:(UIColor *)bgColor andHighBgColor:(UIColor *)highBgColor andSelectedBgColor:(UIColor *)selectedBgColor withcornerRadius:(CGFloat)cornerRadius;
/** 只设置按钮的 背影颜色 */
-(void)customBtnStyleBackgroundColor:(UIColor *)bgColor andHighBgColor:(UIColor *)highBgColor andSelectedBgColor:(UIColor *)selectedBgColor;

- (void)setImageWithTitle:(UIImage *)image withTitle:(NSString *)title position:(NSString *)_position font:(UIFont *)_font forState:(UIControlState)stateType;

- (void)setFamillyImageWithTitle:(UIImage *)image withTitle:(NSString *)title position:(NSString *)_position font:(UIFont *)_font forState:(UIControlState)stateType;

- (void)setSellerDetailImageWithTitle:(UIImage *)image withTitle:(NSString *)title position:(NSString *)_position font:(UIFont *)_font forState:(UIControlState)stateType;


@end
