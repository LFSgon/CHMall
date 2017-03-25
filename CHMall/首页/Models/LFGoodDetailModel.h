//
//  LFGoodDetailModel.h
//  HFCBuyer
//
//  Created by 了凡 on 2016/11/14.
//  Copyright © 2016年 ZTB. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LFGoodEvalutateNumModel;
@class LFGoodEvalutatesModel;
@class LFGoodsDetailModel;
@class LFStoreInfoModel;

@interface LFGoodDetailModel : NSObject

@property (nonatomic,strong)NSArray * address;
@property (nonatomic,copy)NSString * defAddId;
@property (nonatomic,strong)LFGoodEvalutatesModel * evalutates;
@property (nonatomic,strong)NSArray * goodSpecList;
@property (nonatomic,strong)LFGoodsDetailModel * goodsDetail;
@property (nonatomic,strong)LFStoreInfoModel * storeInfo;

@end

@interface LFGoodEvalutatesModel : NSObject

@property (nonatomic,strong)NSArray * evaluate;
@property (nonatomic,strong)LFGoodEvalutateNumModel * num;

@end

@interface LFGoodEvalutateModel : NSObject
/*
 addTime = "2016-11-04 08:38:25";
 "evaluate_info" = 111111111111111111111;
 "goods_spec" = "\U5927\U5c0f:s \U989c\U8272:\U767d\U8272 ";
 id = 362;
 photo = "upload/avatar/32946_big.jpg";
 userName = andy123456;
 */
@property (nonatomic,copy)NSString * addTime;
@property (nonatomic,copy)NSString * evaluate_info;
@property (nonatomic,copy)NSString * goods_spec;
@property (nonatomic,copy)NSString * ID;
@property (nonatomic,copy)NSString * photo;
@property (nonatomic,copy)NSString * userName;

@end

@interface LFGoodEvalutateNumModel : NSObject

@property (nonatomic,assign)NSInteger badNum;
@property (nonatomic,assign)NSInteger commonNum;
@property (nonatomic,assign)NSInteger goodNum;
@property (nonatomic,assign)NSInteger totalNum;

@end

@interface LFGoodSpecListModel : NSObject
/*
 id = 2;
 name = "\U5927\U5c0f";
 sid = "5,6";
 val = "s,m";
 */
@property (nonatomic,copy)NSString * ID;
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSString * sid;
@property (nonatomic,copy)NSString * val;
@property (nonatomic,assign)NSInteger indexSelected;

@end

@interface LFGoodsDetailModel : NSObject
/*
 "activity_status" = 0;
 "ag_price" = 0;
 "bargain_status" = 0;
 "delivery_status" = 0;
 distributionPrice = "<null>";
 dldp = 0;//代理店铺数量
 "ems_trans_fee" = 0;
 "express_trans_fee" = 0;
 fenlei = 39;
 goodsFav = 0;
 "goods_current_price" = 44;
 "goods_fee" = "<null>";
 "goods_name" = "\U4f0a\U5229\U725b\U5976\U5473\U53ef\U6ecb\U54c8\U5bc6\U74dc\U725b\U5976300ml*12\U7ef5\U5bc6\U9999\U751c\U7ec6\U817b\U67d4\U6ed1";
 "goods_price" = 50;
 "goods_property" =             (
 );
 "goods_salenum" = 52;
 "goods_status" = 0;
 "mail_trans_fee" = 0;
 pfenlei = 2;
 photos =             (
 {
 height = 160;
 name = "9c1353bd-7cc8-4695-92d0-97a6bdecc461.jpg";
 path = "upload/store/32904/2016/10/20";
 size = 0;
 width = 160;
 }
 );
 sc = 2;
 storeprice = 44;
 */
@property (nonatomic,assign)NSInteger activity_status;
@property (nonatomic,assign)CGFloat ag_price;
@property (nonatomic,assign)NSInteger bargain_status;
@property (nonatomic,assign)NSInteger delivery_status;
@property (nonatomic,assign)CGFloat distributionPrice;
@property (nonatomic,assign)NSInteger dldp;//代理店铺数量
@property (nonatomic,assign)CGFloat ems_trans_fee;
@property (nonatomic,assign)CGFloat express_trans_fee;
@property (nonatomic,copy)NSString * fenlei;
@property (nonatomic,assign)NSInteger goodsFav;
@property (nonatomic,assign)CGFloat goods_current_price;
@property (nonatomic,assign)CGFloat goods_fee;
@property (nonatomic,copy)NSString * goods_name;
@property (nonatomic,assign)CGFloat goods_price;
@property (nonatomic,assign)NSInteger goods_salenum;
@property (nonatomic,assign)NSInteger goods_status;
@property (nonatomic,assign)CGFloat mail_trans_fee;
@property (nonatomic,copy)NSString * pfenlei;
@property (nonatomic,strong)NSArray * photos;
@property (nonatomic,assign)NSInteger sc;
@property (nonatomic,assign)CGFloat storeprice;
@property (nonatomic,copy)NSString * inventory_type;

@end

@interface LFStoreInfoModel : NSObject
/*
 height = 132;
 id = 32904;
 name = "32945_big.jpg";
 path = "upload/avatar";
 "store_name" = "\U4e09\U4ee3\U5382\U5546ly";
 "store_status" = 2;
 "store_type" = 2;
 width = 132;
 */
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,copy)NSString * ID;
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSString * path;
@property (nonatomic,copy)NSString * store_name;
@property (nonatomic,assign)NSInteger store_status;
@property (nonatomic,assign)NSInteger store_type;
@property (nonatomic,assign)CGFloat width;


@end

@interface LFPhotoModel : NSObject;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSString * path;
@property (nonatomic,assign)CGFloat size;
@property (nonatomic,assign)CGFloat width;
@end
