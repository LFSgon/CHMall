//
//  SMTextView.h
//  XieFei
//
//  Created by 了凡 on 16/6/11.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMTextView : UITextView
/**
 *  占位文字
 */
@property (nonatomic,copy)NSString * placeholder;
/**
 *  占位文字颜色
 */
@property (nonatomic,strong)UIColor * placeholderColor;

@end
