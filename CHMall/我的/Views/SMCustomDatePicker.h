//
//  SMCustomDatePicker.h
//  CHMall
//
//  Created by pro on 2017/1/13.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SMCustomDatePickerDelegate < NSObject >

- (void)CustomPickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component year:(NSString *)year month:(NSString *)month day:(NSString *)day;

@end

@interface SMCustomDatePicker : UIView
@property (nonatomic,strong) UIPickerView *pickerView;

@property (nonatomic, weak) id< SMCustomDatePickerDelegate > delegate;

@end
