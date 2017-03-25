//
//  SMMemberOrderDetailController.m
//  CHMall
//
//  Created by pro on 2017/1/10.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberOrderDetailController.h"
#import "SMMemberOrderDetailAddressHeaderView.h"
#import "SMMemberOrderDetailAddressFooterView.h"
#import "SMMemberOrderItemCell.h"
#import "SMMemberOrderItemHeaderView.h"
#import "SMMemberOrderDetailToolView.h"

static NSString * const detailAddressHeaderViewID = @"SMMemberOrderDetailAddressHeaderView";
static NSString * const detailAddressFooterViewID = @"SMMemberOrderDetailAddressFooterView";
static NSString * const orderItemCellID = @"SMMemberOrderItemCell";
static NSString * const orderItemHeaderViewID = @"SMMemberOrderItemHeaderView";
@interface SMMemberOrderDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;
@property(nonatomic,strong)SMMemberOrderDetailToolView * toolView;
@end

@implementation SMMemberOrderDetailController
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        NSMutableArray * dataSource = [[NSMutableArray alloc]init];
        for (int i = 0; i < 5; i++) {
            [dataSource addObject:@(i)];
        }
        _dataSource = dataSource;
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderItemCell class]) bundle:nil] forCellReuseIdentifier:orderItemCellID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderDetailAddressHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:detailAddressHeaderViewID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderDetailAddressFooterView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:detailAddressFooterViewID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderItemHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:orderItemHeaderViewID];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(0, 0, 96*WIDTH_SCALE, 0));
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    [self initTitleView:@"订单详情"];
    [self.tableView reloadData];
    SMMemberOrderDetailToolView * toolView = [SMMemberOrderDetailToolView shareInstance];
    toolView.orderType = self.orderType;
    [self.view addSubview:toolView];
    toolView.sd_layout
    .topSpaceToView(self.tableView,0)
    .leftEqualToView(self.tableView)
    .rightEqualToView(self.tableView)
    .bottomSpaceToView(self.view,0);
    _toolView = toolView;
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section ? self.dataSource.count : 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (!section) {
        return 167 * WIDTH_SCALE + 68;
    }
    return 35;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (!section) {
        return 10;
    }
    return 160;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (!section) {
        SMMemberOrderDetailAddressHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:detailAddressHeaderViewID];
        headerView.orderType = self.orderType;
        headerView.addressActionBlock = ^(UILabel *infoL,UILabel *addressL){
            DLog(@"选择收货地址");
        };
        return headerView;
    }
    SMMemberOrderItemHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:orderItemHeaderViewID];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section) {
        SMMemberOrderDetailAddressFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:detailAddressFooterViewID];
        footerView.deliveryActionBlock = ^(UILabel * label){
            label.text = @"你好,我还没实现";
        };
        return footerView;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMMemberOrderItemCell * cell =[tableView dequeueReusableCellWithIdentifier:orderItemCellID forIndexPath:indexPath];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
