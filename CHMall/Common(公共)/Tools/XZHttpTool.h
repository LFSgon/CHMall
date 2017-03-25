//
//  XZHttpTool.h
//
//  Created by 了凡 on 16/2/29.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZHttpTool : NSObject

+ (void)getWithUrl:(NSString *)url params:(NSMutableDictionary *)params success:(void (^)(NSDictionary * responseDict, NSInteger code, NSString * message))success failure:(void (^)(NSError * error))failure;

+ (void)postWithUrl:(NSString *)url params:(NSMutableDictionary *)params success:(void (^)(NSDictionary * responseDict, NSInteger code, NSString *message))success failure:(void (^)(NSError *error))failure;
/*
 * 上传图片
 */

+ (void)startMultiPartUploadTaskWithUrl:(NSString *)url imagesArray:(NSArray *)images parameterOfimages:(NSArray *)parameters params:(NSMutableDictionary *)params compressionRatio:(float)ratio progress:(void (^)(float progress))progress success:(void (^)(NSDictionary * responseDict, NSInteger code, NSString *message))success failure:(void (^)(NSError *error))failure;


@end
