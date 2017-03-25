//
//  SMMemberOrderDetailToolView.h
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMMemberOrderDetailToolView : UIView
@property(nonatomic,assign)MemberOrderType orderType;
@property (nonatomic,copy)void(^btnActionBlock)(SMMemberOrderItemFooterViewBtnType btnType);
+ (instancetype)shareInstance;
@end
