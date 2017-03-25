//
//  SMMemberOrderItemFooterView.h
//  CHMall
//
//  Created by pro on 2017/1/9.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMMemberOrderItemFooterView : UITableViewHeaderFooterView
@property (nonatomic,copy)void(^btnActionBlock)(SMMemberOrderItemFooterViewBtnType btnType);
@property (nonatomic,assign)MemberOrderType orderType;
@end
