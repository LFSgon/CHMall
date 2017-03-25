//
//  SMMemberOrderDetailAddressHeaderView.h
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMMemberOrderDetailAddressHeaderView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UILabel *infoL;
@property (weak, nonatomic) IBOutlet UILabel *addressL;
@property(nonatomic,assign)MemberOrderType orderType;
@property (nonatomic,copy)void (^addressActionBlock)(UILabel *infoL,UILabel *addressL);

@end
