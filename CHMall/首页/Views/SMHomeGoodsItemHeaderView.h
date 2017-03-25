//
//  SMHomeGoodsItemHeaderView.h
//  CHMall
//
//  Created by pro on 2017/1/14.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMHomeGoodsItemHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong)NSArray *imagesURLStrings;
@property(nonatomic,copy)void(^selectBtnActionBlock)();
@end
