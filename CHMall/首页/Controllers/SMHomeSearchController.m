//
//  SMHomeSearchController.m
//  CHMall
//
//  Created by pro on 2017/1/10.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeSearchController.h"
#import "SMSearchBarView.h"
#import "SKTagView.h"
#import "SMHomeSearchResultController.h"

@interface SMHomeSearchController ()
@property (strong, nonatomic) SKTagView *tagView;
@end

@implementation SMHomeSearchController
{
    UILabel * _titleL;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup{
    SMSearchBarView * searchBar =[SMSearchBarView shareIntance];
    searchBar.frame = CGRectMake(0, 0, SCREEN_WIDTH * 0.75, 30);
    self.navigationItem.titleView = searchBar;
    self.navigationItem.leftBarButtonItem =[UIBarButtonItem BarButtonItemWithBackgroudImageName:@"nav_btn_back" highBackgroudImageName:nil target:self action:@selector(leftAction)];
    self.navigationItem.rightBarButtonItem =[UIBarButtonItem BarButtonItemWithTitle:@"搜索" target:self action:@selector(rightAction)];
    UILabel * titleL =[[UILabel alloc]initWithTitle:@"推荐搜索" font:selfont3 color:colorOf_GrayB];
    [self.view addSubview:titleL];
    titleL.sd_layout
    .topSpaceToView(self.view,25 + 64)
    .leftSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .autoHeightRatio(0);
    _titleL = titleL;
    
    [self setupTagView];
}
- (void)setupTagView {
    self.tagView = ({
        SKTagView *view = [SKTagView new];
        view.backgroundColor = [UIColor clearColor];
        view.padding = UIEdgeInsetsMake(15, 15, 15, 15);
        view.interitemSpacing = 5;
        view.lineSpacing = 5;
        @weakify(self);
        view.didTapTagAtIndex = ^(NSUInteger index){
            SMHomeSearchResultController * vc =[SMHomeSearchResultController new];
            [weak_self.navigationController pushViewController:vc animated:YES];
        };
        view;
    });
    [self.view addSubview:self.tagView];
    self.tagView.sd_layout
    .topSpaceToView(_titleL,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
    //Add Tags
    [@[@"一次性餐盒", @"一次性纸杯", @"高脚杯", @"餐盒", @"木质筷子", @"酒店餐具", @"象牙筷子"] enumerateObjectsUsingBlock: ^(NSString *text, NSUInteger idx, BOOL *stop) {
        SKTag *tag = [SKTag tagWithText: text];
        tag.textColor = colorOf_GrayA;
        tag.fontSize = selfont3_5;
        tag.borderColor = colorOf_GrayE;
        tag.borderWidth = 0.5f;
        tag.padding = UIEdgeInsetsMake(11, 10, 11, 10);
        tag.bgColor =[UIColor clearColor];
        tag.cornerRadius = 5;
        [self.tagView addTag:tag];
    }];
}
#pragma mark - action
- (void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightAction{
//    [self.view endEditing:YES];
    SMHomeSearchResultController * vc =[SMHomeSearchResultController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
