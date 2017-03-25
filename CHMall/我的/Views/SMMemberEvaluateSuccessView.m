//
//  SMMemberEvaluateSuccessView.m
//  CHMall
//
//  Created by pro on 2017/1/17.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberEvaluateSuccessView.h"

@implementation SMMemberEvaluateSuccessView

+ (instancetype)shareInstance{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

@end
