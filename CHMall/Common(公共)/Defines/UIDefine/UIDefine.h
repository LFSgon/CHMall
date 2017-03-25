//
//  UIDefine.h
//  showjianghu
//
//  Created by 了凡 on 16/2/29.
//  Copyright © 2016年 潘多拉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIDefine : NSObject

float GDDeviceSystemVersion();

#ifndef kSystemVersion
#define kSystemVersion GDDeviceSystemVersion()
#endif

#ifndef kiOS6Later
#define kiOS6Later (kSystemVersion >= 6)
#endif

#ifndef kiOS7Later
#define kiOS7Later (kSystemVersion >= 7)
#endif

#ifndef kiOS8Later
#define kiOS8Later (kSystemVersion >= 8)
#endif

#ifndef kiOS9Later
#define kiOS9Later (kSystemVersion >= 9)
#endif

#define iPhone6                                                                \
([UIScreen instancesRespondToSelector:@selector(currentMode)]                \
? CGSizeEqualToSize(CGSizeMake(750, 1334),                              \
[[UIScreen mainScreen] currentMode].size)           \
: NO)
#define iPhone6Plus                                                            \
([UIScreen instancesRespondToSelector:@selector(currentMode)]                \
? CGSizeEqualToSize(CGSizeMake(1242, 2208),                             \
[[UIScreen mainScreen] currentMode].size)           \
: NO)

//判断是否为5代以上尺寸
#define isGTPhone5     SCREEN_WIDTH > 320.0


//设备号(唯一标示符)
#define kDeviceuUUID [[UIDevice currentDevice].identifierForVendor UUIDString]

// 宽度系数
#define WIDTH_SCALE     SCREEN_WIDTH/720.0

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCALE ([UIScreen mainScreen].scale)
//状态栏、导航栏、标签栏高度
#define STATUS_HEIGHT ([UIApplication sharedApplication].statusBarFrame.size.height)
#define NAVIGATIONBAR_HEIGHT (self.navigationController.navigationBar.frame.size.height)
#define TABBAR_HEIGHT (self.tabBarController.tabBar.frame.size.height)

/*
 Create UIColor with a hex string.
 Example: UIColorHex(0xF0F), UIColorHex(66ccff), UIColorHex(#66CCFF88)
 
 Valid format: #RGB #RGBA #RRGGBB #RRGGBBAA 0xRGB ...
 The `#` or "0x" sign is not required.
 */
#ifndef UIColorHex
#define UIColorHex(_hex_)   [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif


// 字体大小
#define fontSize(size) [UIFont systemFontOfSize:size]
#define selfont1 isGTPhone5?17:16  // 1级字体大小     导航栏标题字体
#define selfont2 isGTPhone5?16:15  // 2级字体大小     内容文字
#define selfont3_5 isGTPhone5?15:14// 3.5级字体大小   列表内容文字
#define selfont3 isGTPhone5?13:12  // 3级字体大小
//#define selfont4_5 26*WidthScale  // 4.5级字体大小
#define selfont4 isGTPhone5?12:11  // 4级字体大小

// 字体背景颜色
#define colorOf_Clean  [UIColor clearColor] //透明字体背景
#define colorOf_White  [UIColor whiteColor] //白色字体背景
#define colorOf_Black  [UIColor blackColor] //通用字体背景
// 主调-橙色
#define ColorOfTheme_Main     RGB(255,128,39)
// 辅助色-红色
#define ColorOfTheme_Red      RGB(219,33,33)
// 辅助色-黄色
#define ColorOfTheme_Yellow      RGB(246,205,78)

//// 辅助色-浅蓝色
//#define ColorOfTheme_Blue      [UIColor colorWithHexString:@"#53a4ff"]
// 辅助色-绿色
#define ColorOfTheme_green   RGB(26,153,249)
// 辅助色-紫色
#define ColorOfTheme_Purple   RGB(185,143,228)
// 深深深灰色  ---菜单栏，标题文字，重点突出文字 333333
#define colorOf_GrayA         RGB(51,51,51)
// 深深灰色    ---文字，内容文字
#define colorOf_GrayB         RGB(102,102,102) //666666
// 浅灰色      ---提示文字、时间文字
#define colorOf_GrayC         RGB(153,153,153) //999999
// 浅浅灰色    ---分割线颜色
#define colorOf_GrayD         RGB(221,221,221)
// 浅浅浅灰色  ---背景色、输入框背景色
#define colorOf_GrayE         RGB(209,209,209)
// 视图背景色
#define BackColorOfController RGB(238,238,238)
// 下划线／分割线的颜色
#define colorOf_LineGray colorOf_GrayD
// 颜色的简单构成宏
#define RGB(A, B, C)        [UIColor colorWithRed:A/255.0f green:B/255.0f blue:C/255.0f alpha:1.0f]

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//日至输出
#ifdef DEBUG
#define DLog(fmt, ...)      NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 
 */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


/**
 归档的实现
 */
#define MJCodingImplementation \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self decode:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self encode:encoder]; \
}
@end
