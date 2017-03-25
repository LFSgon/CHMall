//
//  SMMemberHeaderView.h
//  CHMall
//
//  Created by pro on 2017/1/9.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMMemberHeaderView : UITableViewHeaderFooterView
+ (instancetype)shareInstance;
@property (nonatomic,copy)void(^rightActionBlock)();
@property (nonatomic,copy)void(^leftActionBlock)();
@property (nonatomic,copy)void(^iconActionBlock)();
@end
