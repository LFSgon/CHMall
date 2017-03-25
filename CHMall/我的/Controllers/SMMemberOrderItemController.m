//
//  SMMemberOrderItemController.m
//  CHMall
//
//  Created by pro on 2017/1/9.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberOrderItemController.h"
#import "SMMemberOrderItemFooterView.h"
#import "SMMemberOrderItemHeaderView.h"
#import "SMMemberOrderItemCell.h"
#import "SMMemberOrderDetailController.h"
#import "SMMemberGoEvaluateController.h"
#import "UIView+TYAlertView.h"

static NSString * const cellID = @"SMMemberOrderItemCell";
static NSString * const footerViewID = @"SMMemberOrderItemFooterView";
static NSString * const headerViewID = @"SMMemberOrderItemHeaderView";
@interface SMMemberOrderItemController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;
@end

@implementation SMMemberOrderItemController
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        NSMutableArray * dataSource = [[NSMutableArray alloc]init];
        for (int i = 0; i < 5; i++) {
            NSMutableArray * list = [NSMutableArray array];
            for (int j =0; j < i+1; j++) {
                [list addObject:[NSString stringWithFormat:@"%d===%d",i,j]];
            }
            [dataSource addObject:list];
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
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderItemFooterView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:footerViewID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderItemHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:headerViewID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderItemCell class]) bundle:nil] forCellReuseIdentifier:cellID];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        _tableView = tableView;
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * list = self.dataSource[section];
    return list.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 85;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SMMemberOrderItemHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewID];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    SMMemberOrderItemFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:footerViewID];
    footerView.orderType = self.orderType;
    @weakify(self);
    footerView.btnActionBlock = ^(SMMemberOrderItemFooterViewBtnType btnType){
        DLog(@"%ld",btnType);
        switch (btnType) {
            case orderItemFooterViewBtnTypePay:
                [weak_self payAction];
                break;
            case orderItemFooterViewBtnTypeCancel:
                [weak_self cancelAction];
                break;
            case orderItemFooterViewBtnTypeDeliver:
                [weak_self deliverAction];
                break;
            case orderItemFooterViewBtnTypeDelete:
                [weak_self deleteActionWithSection:section];
                break;
            case orderItemFooterViewBtnTypeEvaluate:
                [weak_self evaluateAction];
                break;
            default:
                [weak_self receiveAction];
                break;
        }
    };
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMMemberOrderItemCell * cell =[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SMMemberOrderDetailController * vc =[SMMemberOrderDetailController new];
    vc.orderType = self.orderType;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - action
- (void)cancelAction{
    
}
- (void)payAction{
    
}
- (void)deliverAction{
    
}
- (void)deleteActionWithSection:(NSInteger)section{
    DLog(@"%ld",section);
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"确定取消订单?" message:nil];
    alertView.titleLable.font =[UIFont systemFontOfSize:selfont1];
    alertView.titleLable.textColor = colorOf_GrayB;
    alertView.buttonDestructiveBgColor = ColorOfTheme_Yellow;
    alertView.buttonCancelBgColor = RGB(242, 242, 242);
    alertView.buttonFont = [UIFont systemFontOfSize:selfont3_5];
    alertView.buttonTitleColor = colorOf_GrayA;
    alertView.buttonCornerRadius = 0;
    alertView.buttonContentViewEdge = 0;
    alertView.buttonSpace = 0;
    alertView.buttonHeight = 45;
    alertView.contentViewBottomSpace = 0;
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    @weakify(self);
    [alertView addAction:[TYAlertAction actionWithTitle:@"确定" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
        DLog(@"%ld",section);
        if (weak_self.dataSource.count == 1) {
            [weak_self.dataSource removeAllObjects];
            [weak_self.tableView reloadData];
            return ;
        }
        [weak_self.dataSource removeObjectAtIndex:section];
        [weak_self.tableView deleteSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationTop];
        NSLog(@"%@",action.title);
    }]];
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleAlert];
    
    [self presentViewController:alertController animated:YES completion:nil];

}
- (void)evaluateAction{
    SMMemberGoEvaluateController * vc =[SMMemberGoEvaluateController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)receiveAction{
    
}


@end
