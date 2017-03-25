//
//  SMPlaceHolderView.h
//  jingmaomall
//
//  Created by 了凡 on 16/9/2.
//  Copyright © 2016年 jingmaomall. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,SMPlaceHolderType) {
    SMPlaceHolderCart,
    SMPlaceHolderCoupon,
    SMPlaceHolderOrder,
    SMPlaceHolderEvaluation
};
@interface SMPlaceHolderView : UIScrollView
+ (instancetype)shareInstance;
@property (nonatomic,assign)SMPlaceHolderType placeHolderType;
@end
