//
//  SMCustomDatePickerView.h
//  CHMall
//
//  Created by pro on 2017/1/13.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMCustomDatePickerView : UIView
+ (instancetype)shareInstance;
@property (nonatomic,copy)void (^nextBtnActionBlock)(NSString * dateStr);

@end
