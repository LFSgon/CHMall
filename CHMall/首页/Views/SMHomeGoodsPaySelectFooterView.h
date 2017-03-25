//
//  SMHomeGoodsPaySelectFooterView.h
//  CHMall
//
//  Created by pro on 2017/1/16.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMHomeGoodsPaySelectFooterView : UITableViewHeaderFooterView
@property (weak, nonatomic) IBOutlet UILabel *sunmL;
@property(nonatomic,copy)void(^rechargeBtnActionBlock)();
@end
