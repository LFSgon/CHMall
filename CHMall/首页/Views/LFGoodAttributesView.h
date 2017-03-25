//
//  LFGoodAttributesView.h
//  HFCBuyer
//
//  Created by 了凡 on 2016/11/28.
//  Copyright © 2016年 ZTB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SureBtnType) {
   SureBtnTypeNone,
   SureBtnTypeAddCart,//加入购物车
   SureBtnTypeBuy,//立即购买
   
};

@interface LFGoodAttributesView : UIView

@property(nonatomic,strong)UIImageView * iconImageView;
/** 购买数量 */
@property (nonatomic, assign) int buyNum;

@property (nonatomic, strong) NSArray *goodAttrsArr;

@property (nonatomic,assign)SureBtnType sureBtnType;

@property (nonatomic, copy) void (^sureBtnsClick)(NSString *count,SureBtnType sureBtnType);
/**
 *  显示属性选择视图
 *
 *  @param view 要在哪个视图中显示
 */
- (void)showInView:(UIView *)view;
/**
 *  属性视图的消失
 */
- (void)removeView;
@end
