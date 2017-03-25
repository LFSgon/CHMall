//
//  SMMemberOrderItemCell.h
//  CHMall
//
//  Created by pro on 2017/1/9.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,SMMemberOrderItemCellType) {
    orderItemCellTypeNum,
    orderItemCellTypeNone
};
@interface SMMemberOrderItemCell : UITableViewCell
@property(nonatomic,assign)SMMemberOrderItemCellType orderItemCellType;
@end
