//
//  SMMemberAddressController.h
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMBaseController.h"

@interface SMMemberAddressController : SMBaseController
@property (nonatomic,copy)void (^selectRowBlock)(NSString * info,NSString * address);
@end
