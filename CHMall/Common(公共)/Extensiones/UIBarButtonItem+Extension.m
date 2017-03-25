//
//  UIBarButtonItem+Extension.m
//  GongDan
//
//  Created by 了凡 on 16/1/14.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)BarButtonItemWithTitle:(NSString *)title selTitle:(NSString *)selTitle target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:selTitle forState:UIControlStateSelected];
    [button setTitleColor:colorOf_GrayB forState:UIControlStateNormal];
    button.frame =CGRectMake(0, 0, 80, 36);
    button.titleLabel.font =[UIFont systemFontOfSize:14];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:button];

}
+ (instancetype)BarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    return [self BarButtonItemWithTitle:title selTitle:nil target:target action:action];
}

+ (instancetype)BarButtonItemWithBackgroudImageName:(NSString *)backgroudImage highBackgroudImageName:(NSString *)highBackgroudImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    
    [button setBackgroundImage:[UIImage imageNamed:backgroudImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highBackgroudImageName] forState:UIControlStateHighlighted];
    
    // 设置按钮的尺寸为背景图片的尺寸
    button.size =  button.currentBackgroundImage.size;
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

/**
 *  设置tarbuttoonItem
 *
 *  @param imageName     图片名称
 *  @param highImageName 高亮图片名称
 *  @param title         标题
 *  @param target        回调对象
 *  @param action        回调方法
 *
 *  @return UIBarButtonItem
 */
+ (instancetype)BarButtonItemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:nil forState:UIControlStateHighlighted];
        button.titleLabel.font =[UIFont fontWithName:@"Helvetica-Bold" size:10 ];
        
    }
    
    // 设置按钮的尺寸为背景图片的尺寸+文字大小
    UIFont * font = button.titleLabel.font;
    CGSize size =[title sizeWithFont:font];
    button.width = size.width;
    button.height = button.currentImage.size.height+size.height;
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    //设置title在button上的位置（上top，左left，下bottom，右right）
    button.titleEdgeInsets = UIEdgeInsetsMake(30,-30, 0, 0);
    
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}
@end
