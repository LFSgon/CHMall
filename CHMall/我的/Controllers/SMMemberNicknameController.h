//
//  SMMemberNicknameController.h
//  CHMall
//
//  Created by pro on 2017/1/13.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMBaseController.h"

@interface SMMemberNicknameController : SMBaseController
@property (nonatomic,copy)void (^saveSuccessBlock)(NSString *nickName);
@property (nonatomic,copy)NSString * nickName;
@end
