//
//  SMPickerView.h
//  jingmaomall
//
//  Created by 了凡 on 16/9/2.
//  Copyright © 2016年 jingmaomall. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SMPickerView : UIView
+ (instancetype)shareInstance;
@property (nonatomic,copy)void (^cancelBlock)();
@property (nonatomic,copy)void (^nextBlock)();

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@end
