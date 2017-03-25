//
//  SMCentreNumCell.h
//  XieFei
//
//  Created by 了凡 on 16/5/6.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMCentreNumCell;
typedef NS_ENUM(NSInteger,SMCentreNumCellType) {
    centreNumCellTypeAccessory,
    centreNumCellTypeNoAccessory,
    centreNumCellTypeSwitch,
};
@protocol SMCentreNumCellDelegate <NSObject>
@optional
- (void)centreNumCell:(SMCentreNumCell *)cell didChangeValue:(BOOL)value;
@end

@interface SMCentreNumCell : UITableViewCell
@property (nonatomic,assign)NSInteger num;
@property (nonatomic,assign)SMCentreNumCellType centreNumCellType;
@property (nonatomic,strong)UISwitch * switchView;
@property (nonatomic,weak)id<SMCentreNumCellDelegate>delegate;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
