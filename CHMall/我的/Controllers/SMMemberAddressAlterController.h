//
//  SMMemberAddressAlterController.h
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMBaseController.h"
typedef NS_ENUM(NSUInteger,SMMemberAddressAlterType) {
   addressAlterTypeEdit,
   addressAlterTypeAdd
};
@interface SMMemberAddressAlterController : SMBaseController
@property(nonatomic,assign)SMMemberAddressAlterType addressAlterType;
@end
