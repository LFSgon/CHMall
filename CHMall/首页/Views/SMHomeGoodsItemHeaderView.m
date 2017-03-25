//
//  SMHomeGoodsItemHeaderView.m
//  CHMall
//
//  Created by pro on 2017/1/14.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsItemHeaderView.h"
#import "SDCycleScrollView.h"

@interface SMHomeGoodsItemHeaderView ()<SDCycleScrollViewDelegate>

@property (weak, nonatomic) IBOutlet SDCycleScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *contentL;
@property (weak, nonatomic) IBOutlet UILabel *priceL;
@property (weak, nonatomic) IBOutlet UILabel *numL;
@property (weak, nonatomic) IBOutlet UILabel *selectL;
@property (weak, nonatomic) IBOutlet UILabel *evaluateL;

@end
@implementation SMHomeGoodsItemHeaderView


- (void)awakeFromNib{
    [super awakeFromNib];
    _scrollView.pageDotColor = RGB(217, 187, 184);
    _scrollView.currentPageDotColor = ColorOfTheme_Yellow;
    _scrollView.delegate = self;
}
- (IBAction)selectBtnAction {
    if (self.selectBtnActionBlock) {
        self.selectBtnActionBlock();
    }
}
- (void)setImagesURLStrings:(NSArray *)imagesURLStrings{
    _imagesURLStrings = imagesURLStrings;
    self.scrollView.imageURLStringsGroup = imagesURLStrings;
}
#pragma mark - <SDCycleScrollViewDelegate>
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}
@end
