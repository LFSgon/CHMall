//
//  SMHomeGoodsCommentItemController.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsCommentItemController.h"
#import "SMHomeGoodsCommentItemCell.h"
static NSString * const commentItemCellID = @"SMHomeGoodsCommentItemCell";
@interface SMHomeGoodsCommentItemController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;
@end

@implementation SMHomeGoodsCommentItemController
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[[NSMutableArray alloc]init];
        for (int i = 0; i < 20; i++) {
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
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeGoodsCommentItemCell class]) bundle:nil] forCellReuseIdentifier:commentItemCellID];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMHomeGoodsCommentItemCell * cell =[tableView dequeueReusableCellWithIdentifier:commentItemCellID];
    return cell;
}
#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
