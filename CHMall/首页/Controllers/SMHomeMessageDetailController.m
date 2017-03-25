//
//  SMHomeMessageDetailController.m
//  CHMall
//
//  Created by pro on 2017/1/10.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeMessageDetailController.h"
#import "SMHomeMessageDetailCell.h"
#import "SMHomeMessageDetailHeaderView.h"

static NSString * const messageDetailCellID = @"SMHomeMessageDetailCell";
static NSString * const messageDetailHeaderViewID = @"SMHomeMessageDetailHeaderView";
@interface SMHomeMessageDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;

@end

@implementation SMHomeMessageDetailController
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[[NSMutableArray alloc]init];
        for (int i = 0; i < 5; i++) {
            [_dataSource addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _dataSource;
}
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 50;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeMessageDetailCell class]) bundle:nil] forCellReuseIdentifier:messageDetailCellID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeMessageDetailHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:messageDetailHeaderViewID];
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"我的消息"];
    [self.tableView reloadData];
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SMHomeMessageDetailHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:messageDetailHeaderViewID];
    headerView.backgroundColor =[UIColor redColor];
    return headerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMHomeMessageDetailCell * cell =[tableView dequeueReusableCellWithIdentifier:messageDetailCellID];
    return cell;
}


@end
