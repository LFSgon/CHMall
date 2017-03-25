//
//  SMCustomAddressPickerView.h
//  CHMall
//
//  Created by pro on 2017/1/17.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMCustomAddressPickerView : UIView

+ (instancetype)shareInstance;

@property (nonatomic,copy)void (^selectAreaBlock)();
@end
