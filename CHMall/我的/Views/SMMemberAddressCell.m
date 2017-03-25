//
//  SMMemberAddressCell.m
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberAddressCell.h"

@interface SMMemberAddressCell ()


@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;

@end
@implementation SMMemberAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setIsDefault:(BOOL)isDefault{
    _isDefault = isDefault;
    self.defaultBtn.selected = isDefault;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
   

    // Configure the view for the selected state
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
}

- (IBAction)defaultBtnAction:(UIButton *)sender {
    self.isDefault = !_isDefault;
    if (self.defaultActionBlock) {
        self.defaultActionBlock(_isDefault);
    }
}
- (IBAction)editBtnAction {
    if (self.editActionBlock) {
        self.editActionBlock();
    }
}
- (IBAction)deleteBtnAction {
    if (self.deleteActionBlock) {
        self.deleteActionBlock();
    }
}


@end
