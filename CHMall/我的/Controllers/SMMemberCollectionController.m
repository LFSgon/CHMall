//
//  SMMemberCollectionController.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberCollectionController.h"
#import "SMMemberOrderItemCell.h"
static NSString * const cellID = @"SMMemberOrderItemCell";
@interface SMMemberCollectionController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;

@end

@implementation SMMemberCollectionController
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
    [self initTitleView:@"我的收藏"];
    [self.tableView reloadData];
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMMemberOrderItemCell * cell =[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.orderItemCellType = orderItemCellTypeNone;
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
}


@end
