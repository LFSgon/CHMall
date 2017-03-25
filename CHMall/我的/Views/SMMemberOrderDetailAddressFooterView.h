//
//  SMMemberOrderDetailAddressFooterView.h
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMMemberOrderDetailAddressFooterView : UITableViewHeaderFooterView
@property(nonatomic,copy)void(^deliveryActionBlock)(UILabel * label);

@end
