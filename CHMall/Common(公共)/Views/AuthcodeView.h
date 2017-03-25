//
//  AuthcodeView.h
//  jingmaomall
//
//  Created by 了凡 on 16/8/21.
//  Copyright © 2016年 jingmaomall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthcodeView : UIView
@property (strong, nonatomic) NSArray *dataArray;//字符素材数组

@property (strong, nonatomic) NSMutableString *authCodeStr;//验证码字符串
- (void)recoverCode;//重新获取验证码

@end
