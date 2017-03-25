//
//  LFGoodDetailModel.m
//  HFCBuyer
//
//  Created by 了凡 on 2016/11/14.
//  Copyright © 2016年 ZTB. All rights reserved.
//

#import "LFGoodDetailModel.h"

@implementation LFGoodDetailModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"goodSpecList" : @"LFGoodSpecListModel",
             };
}

@end

@implementation LFGoodEvalutatesModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"evaluate" : @"LFGoodEvalutateModel",
             };
}

@end
@implementation LFGoodEvalutateModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end

@implementation LFGoodEvalutateNumModel


@end

@implementation LFGoodSpecListModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end

@implementation LFGoodsDetailModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"photos" : @"LFPhotoModel"
             };
}
@end
@implementation LFStoreInfoModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}
//- (NSString *)path{
//    return [NSString stringWithFormat:@"%@/%@/%@",urlS,_path,_name];
//}
@end

@implementation LFPhotoModel
//- (NSString *)path{
//    return [NSString stringWithFormat:@"%@/%@/%@",urlS,_path,_name];
//}

@end
