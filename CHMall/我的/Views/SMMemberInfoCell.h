//
//  SMMemberInfoCell.h
//  CHMall
//
//  Created by pro on 2017/1/13.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,SMMemberInfoCellType) {
    infoCellTyeIcon,
    infoCellTypeText
};
@interface SMMemberInfoCell : UITableViewCell
@property (nonatomic,assign)SMMemberInfoCellType infoCellType;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *contentL;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end
