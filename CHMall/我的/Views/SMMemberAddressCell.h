//
//  SMMemberAddressCell.h
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMMemberAddressCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *infoL;
@property (weak, nonatomic) IBOutlet UILabel *addressL;

@property(nonatomic,assign)BOOL isDefault;
@property(nonatomic,copy)void(^editActionBlock)();
@property(nonatomic,copy)void(^deleteActionBlock)();
@property(nonatomic,copy)void(^defaultActionBlock)(BOOL isDefault);
@end
