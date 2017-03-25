//
//  UIBarButtonItem+Extension.h
//  GongDan
//
//  Created by 了凡 on 16/1/14.
//  Copyright © 2016年 河北广联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)BarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (instancetype)BarButtonItemWithTitle:(NSString *)title selTitle:(NSString *)selTitle target:(id)target action:(SEL)action;

+ (instancetype)BarButtonItemWithBackgroudImageName:(NSString *)backgroudImage highBackgroudImageName:(NSString *)highBackgroudImageName target:(id)target action:(SEL)action;

+ (instancetype)BarButtonItemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName title:(NSString *)title target:(id)target action:(SEL)action;

@end
