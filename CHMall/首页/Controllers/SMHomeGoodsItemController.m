//
//  SMHomeGoodsItemController.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsItemController.h"
#import "SMHomeGoodsItemHeaderView.h"
#import "SMHomeGoodsCommentItemCell.h"
#import "SMHomeGoodsItemFooterView.h"
#import "SMHomeGoodsItemToolView.h"
#import "SMHomeGoodsAffirmOrderController.h"
#import "LFGoodAttributesView.h"
#import "LFGoodDetailModel.h"

static NSString * const commentItemCellID = @"SMHomeGoodsCommentItemCell";
static NSString * const headerViewID = @"SMHomeGoodsItemHeaderView";
static NSString * const footerViewID = @"SMHomeGoodsItemFooterView";
@interface SMHomeGoodsItemController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataSource;
@property(nonatomic,strong)NSArray *imagesURLStrings;
@property(nonatomic,strong)NSMutableArray * attrDataSource;
@end

@implementation SMHomeGoodsItemController
- (NSMutableArray *)attrDataSource{
    if (!_attrDataSource) {
        _attrDataSource =[[NSMutableArray alloc]init];
        for (int i = 0; i < 1; i++) {
            /*
             id = 2;
             name = "\U5927\U5c0f";
             sid = "5,6";
             val = "s,m";
             */
            LFGoodSpecListModel * model = [LFGoodSpecListModel new];
            model.name = @"型号";
            model.sid = @"1,2,3";
            model.val = @"FZ001,FZ002,FZ003";
            model.ID = @"100";
            [_attrDataSource addObject:model];
        }
    }
    return _attrDataSource;
}
- (NSArray *)imagesURLStrings{
    if (!_imagesURLStrings) {
        _imagesURLStrings = @[
                              @"http://d.hiphotos.baidu.com/lvpics/h=800/sign=9931b79f1dd5ad6eb5f969eab1ca39a3/a8773912b31bb051b3333f73307adab44aede052.jpg",
                              @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                              @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                              ];
        
    }
    return _imagesURLStrings;
}
- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@"消息推送"];
    }
    return _dataSource;
}
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 85.f;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeGoodsItemHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:headerViewID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeGoodsCommentItemCell class]) bundle:nil] forCellReuseIdentifier:commentItemCellID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeGoodsItemFooterView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:footerViewID];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(0, 0, 48, 0));
        _tableView = tableView;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    SMHomeGoodsItemToolView * toolView =[SMHomeGoodsItemToolView shareIntance];
    @weakify(self);
    toolView.collectionBtnActionBlock =^(BOOL isCollected){
        if (isCollected) {
            [weak_self showHint:@"已成功收藏"];
        }else{
            [weak_self showHint:@"已取消收藏"];
        }
    };
    toolView.addBtnActionBlock =^(){
        [weak_self createAttributesView];
    };
    toolView.buyBtnAcitonBlock =^(){
        [weak_self createAttributesView];
    };
    [self.view addSubview:toolView];
    toolView.sd_layout
    .topSpaceToView(self.tableView,0)
    .leftEqualToView(self.tableView)
    .rightEqualToView(self.tableView)
    .bottomSpaceToView(self.view,0);
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 204+264*2*WIDTH_SCALE;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return self.dataSource.count ? 44.f : 0.1f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SMHomeGoodsItemHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewID];
    headerView.imagesURLStrings = self.imagesURLStrings;
    @weakify(self);
    headerView.selectBtnActionBlock =^(){
       [weak_self createAttributesView];
    };
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    SMHomeGoodsItemFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:footerViewID];
    footerView.nextBtnActionBlock =^(){
        [[NSNotificationCenter defaultCenter]postNotificationName:kNoticeCheckAllComment object:nil];
    };
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMHomeGoodsCommentItemCell * cell =[tableView dequeueReusableCellWithIdentifier:commentItemCellID];
    cell.iconWidth = 30.f;
    return cell;
}
#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)createAttributesView {
    LFGoodAttributesView *attributesView = [[LFGoodAttributesView alloc] initWithFrame:(CGRect){0, 0, SCREEN_WIDTH, SCREEN_HEIGHT}];
    attributesView.goodAttrsArr = self.attrDataSource;
    attributesView.sureBtnsClick = ^(NSString * count,SureBtnType sureBtnType){
        DLog(@"====%@",count);
        @weakify(self);
        switch (sureBtnType) {
            case SureBtnTypeAddCart:{
                DLog(@"加入购物车");
                [weak_self showHint:@"已成功加入购物车"];
            }
                break;
            case SureBtnTypeBuy:{
                DLog(@"立即购买");
                SMHomeGoodsAffirmOrderController * vc =[SMHomeGoodsAffirmOrderController new];
                [weak_self.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
                break;
        }
    };
    [attributesView showInView:self.navigationController.view];
}


@end
