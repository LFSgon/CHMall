//
//  SMHomeHeaderView.m
//  CHMall
//
//  Created by pro on 2017/1/7.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeHeaderView.h"
#import "SDCycleScrollView.h"

@interface SMHomeHeaderView ()<SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView * cycleScrollView;

@end
@implementation SMHomeHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.backgroundColor =[UIColor redColor];
    SDCycleScrollView * cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView.pageDotColor = RGB(217, 187, 184);
    cycleScrollView.currentPageDotColor = ColorOfTheme_Yellow;
    [self addSubview:cycleScrollView];
    _cycleScrollView = cycleScrollView;
}

- (void)setImagesURLStrings:(NSArray *)imagesURLStrings{
    _imagesURLStrings = imagesURLStrings;
    _cycleScrollView.imageURLStringsGroup = imagesURLStrings;
}
#pragma mark - <SDCycleScrollViewDelegate>
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}

@end
