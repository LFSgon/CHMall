//
//  SMHomeGoodsAffirmOrderToolView.h
//  CHMall
//
//  Created by pro on 2017/1/16.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMHomeGoodsAffirmOrderToolView : UIView
+ (instancetype)shareInstance;
@property (nonatomic,copy)void (^submitBtnActionBlock)();
@end
