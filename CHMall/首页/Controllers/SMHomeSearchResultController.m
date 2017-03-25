//
//  SMHomeSearchResultController.m
//  CHMall
//
//  Created by pro on 2017/1/17.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeSearchResultController.h"
#import "SMHomeSearchResultCell.h"
#import "SMSearchBarView.h"
#import "AppDelegate.h"

static NSString * const searchResultCellID = @"SMHomeSearchResultCell";
@interface SMHomeSearchResultController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *priceImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableArray * dataSource;

@property (weak, nonatomic) IBOutlet UIView *customTabBarView;
@end


@implementation SMHomeSearchResultController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[[NSMutableArray alloc]init];
        for (int i = 0; i < 10; i++) {
            [_dataSource addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SMSearchBarView * searchBar =[SMSearchBarView shareIntance];
    searchBar.frame = CGRectMake(0, 0, SCREEN_WIDTH * 0.75, 30);
    self.navigationItem.titleView = searchBar;
    self.navigationItem.leftBarButtonItem =[UIBarButtonItem BarButtonItemWithBackgroudImageName:@"nav_btn_back" highBackgroudImageName:nil target:self action:@selector(leftAction)];
    self.navigationItem.rightBarButtonItem =[UIBarButtonItem BarButtonItemWithBackgroudImageName:@"nav_dh" highBackgroudImageName:nil target:self action:@selector(rightAction)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeSearchResultCell class]) bundle:nil] forCellReuseIdentifier:searchResultCellID];
}
#pragma mark - action
- (void)leftAction{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightAction{
    [self.view endEditing:YES];
    [AppDelegate sharedInstance].tvc.selectedIndex = 1;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMHomeSearchResultCell * cell =[tableView dequeueReusableCellWithIdentifier:searchResultCellID];
    return cell;
}
#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark - action
- (IBAction)sortBtnAction:(UIButton *)sender {
    for (UIView * subView in _customTabBarView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton * btn = (UIButton *)subView;
            if ([btn isEqual:sender]) {
                btn.selected = YES;
            }else{
                btn.selected = NO;
            }
        }
    }
    [self.tableView reloadData];
}

@end
