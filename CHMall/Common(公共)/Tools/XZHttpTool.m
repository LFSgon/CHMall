 //
//  XZHttpTool.m
//
//  Created by 了凡 on 16/2/29.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "XZHttpTool.h"
#import "AFNetworking.h"

//#import "XZLoginController.h"

#define kTimeoutInterval 60

@implementation XZHttpTool

+ (void)getWithUrl:(NSString *)url params:(NSMutableDictionary *)params success:(void (^)(NSDictionary *, NSInteger, NSString *))success failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager * manager =[AFHTTPSessionManager  manager];
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    manager.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString * requestUrl = nil;
    if ([url hasPrefix:@"http"]) {
        requestUrl = url;
    }else{
        requestUrl = [tHost_URL stringByAppendingString:url];
    }
    DLog(@"requesturl:%@",requestUrl);
    DLog(@"params:%@",params);
    
    [manager GET:requestUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        DLog(@"responseObject:%@", responseObject);
       
        if (success) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            DLog(@"dict:%@",dict);
            NSInteger code = [dict[@"code"]integerValue];
            NSString * message = dict[@"message"];
            success (dict,code,message);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure (error);
            [[UIApplication sharedApplication].keyWindow.rootViewController showHint:@"网络请求错误"];
            DLog(@"Error: %@", error);
        }
    }];
}
+ (void)postWithUrl:(NSString *)url params:(NSMutableDictionary *)params success:(void (^)(NSDictionary *, NSInteger, NSString *))success failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager * manager =[AFHTTPSessionManager  manager];
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    manager.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString * requestUrl = [tHost_URL stringByAppendingString:url];
    DLog(@"requesturl:%@",requestUrl);
    DLog(@"params:%@",params);
    
    [manager POST:requestUrl parameters:params constructingBodyWithBlock:nil  progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DLog(@"responseObject:%@", responseObject);
        if (success) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            DLog(@"dict:%@",dict);
            NSInteger code = [dict[@"ResultCode"]integerValue];
            NSString * message = dict[@"Msg"];
            success (dict,code,message);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure (error);
            DLog(@"error:%@",error);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication].keyWindow.rootViewController showHint:@"网络请求错误"];
            });
        }
    }];
}

+ (void)startMultiPartUploadTaskWithUrl:(NSString *)url imagesArray:(NSArray *)images parameterOfimages:(NSArray *)parameters params:(NSMutableDictionary *)params compressionRatio:(float)ratio progress:(void (^)(float progress))progress success:(void (^)(NSDictionary * responseDict, NSInteger code, NSString *message))success failure:(void (^)(NSError *error))failure{
    DLog(@"params:%@",params);
    DLog(@"parameters:%@",parameters);
    DLog(@"images:%@",images);
    NSString * requestStr = [NSString stringWithFormat:@"%@%@",tHost_URL,url];
    DLog(@"requestStr:%@",requestStr);
    NSMutableURLRequest * request =[[AFHTTPRequestSerializer serializer]multipartFormRequestWithMethod:@"POST" URLString:requestStr parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSInteger i = 0;
        for (UIImage * image in images) {
            NSData * data = nil;
            if (UIImagePNGRepresentation(image) == nil) {
                data = UIImageJPEGRepresentation(image, ratio);
            } else {
                data = UIImagePNGRepresentation(image);
            }
            NSDate *date = [NSDate date];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyMMddHHmmss"];
            NSString *str = [formatter stringFromDate:date];
            NSString *fileName = [NSString stringWithFormat:@"%@%zd.jpg",str,i];
            [formData appendPartWithFileData:data name:parameters[i] fileName:fileName mimeType:@"image/jpg"];
            i++;
        }
    } error:nil];
    AFURLSessionManager * manager =[[AFURLSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    AFHTTPResponseSerializer * responserSerializer = [AFHTTPResponseSerializer serializer];
    responserSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
    manager.responseSerializer =responserSerializer;
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        float pro = (float)uploadProgress.completedUnitCount/(float)uploadProgress.totalUnitCount;
        progress(pro);
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        DLog(@"responseObject:%@", responseObject);
        if (error) {
            DLog(@"error:%@",error);
            if (failure) {
               failure (error);
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [[UIApplication sharedApplication].keyWindow.rootViewController showHint:@"网络请求错误"];
                });
            }
        }else{
            if (success) {
                NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                DLog(@"dict:%@",dict);
                NSInteger code = [dict[@"code"]integerValue];
                NSString * message = dict[@"message"];
                success (dict,code,message);
            }
        }
    }];
    [uploadTask resume];
}


@end
