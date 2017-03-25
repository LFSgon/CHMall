//
//  SMCentreNumCell.m
//  XieFei
//
//  Created by 了凡 on 16/5/6.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "SMCentreNumCell.h"

@interface SMCentreNumCell ()

@end
@implementation SMCentreNumCell
{
    UILabel * _numL;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString * ID =@"SMCentreNumCellID";
    SMCentreNumCell * cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell =[[SMCentreNumCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = colorOf_GrayA;
        self.detailTextLabel.textColor = colorOf_GrayB;
        UILabel * numL = [[UILabel alloc]init];
        numL.backgroundColor =[UIColor redColor];
        numL.font = [UIFont systemFontOfSize:12];
        numL.textColor = [UIColor whiteColor];
        numL.textAlignment =NSTextAlignmentCenter;
        [numL setRadius:8];
        [self.contentView addSubview:numL];
        _numL = numL;
        _numL.hidden = YES;
        self.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"right_btn"]];
        self.textLabel.font = [UIFont systemFontOfSize:selfont2];
        self.detailTextLabel.font =[UIFont systemFontOfSize:selfont2];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];    
    _numL.sd_layout
    .rightSpaceToView(self.accessoryView,8)
    .centerYEqualToView(self.contentView)
    .heightIs(16);
}
-(void)setNum:(NSInteger)num{
    _num = num;
    if (num) {
        _numL.hidden = NO;
        _numL.text = [NSString stringWithFormat:@"%zd",num];
        CGFloat w = 16;
        if (num > 9) {
            w = [[NSString stringWithFormat:@"%zd",num] sizeWithFont:[UIFont systemFontOfSize:12]].width + 4;
        }
        _numL.sd_layout.widthIs(w);
    }else{
        _numL.hidden = YES;
    }
    
}
- (void)setCentreNumCellType:(SMCentreNumCellType)centreNumCellType{
    _centreNumCellType = centreNumCellType;
    if (centreNumCellType == centreNumCellTypeNoAccessory) {
        self.accessoryView = nil;
    }else if (centreNumCellType == centreNumCellTypeSwitch){
        self.accessoryView = nil;
        UISwitch * switchView =[[UISwitch alloc]initWithFrame:CGRectZero];
        switchView.onImage =[UIImage imageNamed:@"mine_on"];
        switchView.offImage =[UIImage imageNamed:@"mine_off"];
        switchView.bounds = CGRectMake(0, 0, 47, 19);
        switchView.centerY = self.contentView.centerY;
        [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        switchView.on = NO;
        self.accessoryView =switchView;
        self.switchView = switchView;
    }
}
- (void)switchAction:(UISwitch *)switchView{
    if (self.delegate && [self.delegate respondsToSelector:@selector(centreNumCell:didChangeValue:)]) {
        [self.delegate centreNumCell:self didChangeValue:switchView.on];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
