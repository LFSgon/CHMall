//
//  SMMemberEvaluateController.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberEvaluateController.h"
#import "SMMemberEvaluateCell.h"
#import "SMMemberOrderItemHeaderView.h"

#import "SMMemberEvaluateFooterView.h"
static NSString * const evaluateCellID = @"SMMemberEvaluateCell";
static NSString * const headerViewID = @"SMMemberOrderItemHeaderView";

static NSString * const footerViewID = @"SMMemberEvaluateFooterView";
@interface SMMemberEvaluateController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;

@end

@implementation SMMemberEvaluateController
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
        tableView.estimatedSectionFooterHeight = 85.f;
//        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberEvaluateFooterCell class]) bundle:nil] forCellReuseIdentifier:evaluateFooterCellID];
  
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderItemHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:headerViewID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberEvaluateFooterView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:footerViewID];
        
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberEvaluateCell class]) bundle:nil] forCellReuseIdentifier:evaluateCellID];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"我的评价"];
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
    return 35.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SMMemberOrderItemHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewID];
    headerView.statusL.hidden = YES;
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    SMMemberEvaluateFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:footerViewID];
    footerView.backgroundColor =[UIColor redColor];
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMMemberEvaluateCell * cell =[tableView dequeueReusableCellWithIdentifier:evaluateCellID forIndexPath:indexPath];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


@end
