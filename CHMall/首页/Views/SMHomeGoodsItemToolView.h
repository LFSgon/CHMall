//
//  SMHomeGoodsItemToolView.h
//  CHMall
//
//  Created by pro on 2017/1/14.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMHomeGoodsItemToolView : UIView
+ (instancetype)shareIntance;
@property(nonatomic,copy)void(^collectionBtnActionBlock)(BOOL isCollected);
@property(nonatomic,copy)void(^addBtnActionBlock)();
@property(nonatomic,copy)void(^buyBtnAcitonBlock)();
@end
