//
//  SMSearchBarView.h
//  jingmaomall
//
//  Created by 了凡 on 16/8/28.
//  Copyright © 2016年 jingmaomall. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapBlock) ();

@interface SMSearchBarView : UIView
+ (instancetype)shareIntance;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic,copy)void (^searchBlock)(NSString * searchText);

+ (instancetype)shareIntanceWithFrame:(CGRect)frame tap:(TapBlock)block;

@end
