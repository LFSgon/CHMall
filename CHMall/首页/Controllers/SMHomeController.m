//
//  SMHomeController.m
//  CHMall
//
//  Created by pro on 2017/1/7.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeController.h"
#import "SMHomeCell.h"
#import "SMHomeSortHeaderView.h"
#import "SMHomeHeaderView.h"
#import "SMHomeRecommendCell.h"
#import "SMSearchBarView.h"
#import "SMHomeSearchController.h"
#import "SMHomeMessageController.h"
#import "SMHomeGoodsController.h"

//#define colMargin 8
//#define colCount 2
//#define rolMargin 8
#define boundMargin 10

static NSString * const homeCellID = @"SMHomeCell";
static NSString * const homeSortHeaderViewID = @"SMHomeSortHeaderView";
static NSString * const homeHeaderViewID = @"SMHomeHeaderView";
static NSString * const homeRecommendCellID = @"SMHomeRecommendCell";
@interface SMHomeController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,assign)CGFloat itemWidth;
@property(nonatomic,strong)NSMutableArray * dataSource;
@property(nonatomic,strong)NSArray *imagesURLStrings;

@end

@implementation SMHomeController
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

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[[NSMutableArray alloc]init];
        for (int i = 0; i < 5; i++) {
            NSMutableArray * list = [NSMutableArray array];
            for (int j = 0; j < 6; j++) {
                [list addObject:[NSString stringWithFormat:@"第%d个",j]];
            }
            [_dataSource addObject:list];
        }
    }
    return _dataSource;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.sectionInset = UIEdgeInsetsMake(boundMargin, boundMargin, boundMargin, boundMargin);
        _collectionView =[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor =[UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeCell class]) bundle:nil] forCellWithReuseIdentifier:homeCellID];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeSortHeaderView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:homeSortHeaderViewID];
        [_collectionView registerClass:[SMHomeHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:homeHeaderViewID];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeRecommendCell class]) bundle:nil] forCellWithReuseIdentifier:homeRecommendCellID];
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.navigationItem.rightBarButtonItem =[UIBarButtonItem BarButtonItemWithBackgroudImageName:@"nav_message" highBackgroudImageName:@"nav_message_innomal" target:self action:@selector(rightAction:)];
    @weakify(self);
    SMSearchBarView * searchBar =[SMSearchBarView shareIntanceWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.83, 30) tap:^{
        SMHomeSearchController * vc =[SMHomeSearchController new];
        [weak_self.navigationController pushViewController:vc animated:YES];
    }];
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:searchBar];
}
#pragma mark - action

- (void)rightAction:(UIButton *)btn{
    btn.highlighted = !btn.highlighted;
    SMHomeMessageController * vc =[SMHomeMessageController new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - <UICollectionViewDataSource>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        SMHomeRecommendCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:homeRecommendCellID forIndexPath:indexPath];
        return cell;
    }
    SMHomeCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:homeCellID forIndexPath:indexPath];
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count + 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (!section) {
        return 0;
    }
    NSArray * list = self.dataSource[section - 1];
    return list.count;
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (!section) {
       return CGSizeMake(SCREEN_WIDTH, 300 *WIDTH_SCALE);
    }
    return CGSizeMake(SCREEN_WIDTH, 118*WIDTH_SCALE);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger colCount = 2;
    CGFloat margin = 8;
    CGFloat scale = isGTPhone5 ? 370.0/330.0 : 400.0/330.0;
    if (indexPath.section == 1) {
        colCount = 3;
        margin = 11;
        scale = 1;
    }
    CGFloat w = (CGRectGetWidth(self.view.frame) - (colCount-1)*margin - 2*boundMargin)/colCount;
    return CGSizeMake(w, w*scale);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return section == 1 ? 11 : 8;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return section == 1 ? 11 : 8;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (!indexPath.section) {
        SMHomeHeaderView * headerView =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:homeHeaderViewID forIndexPath:indexPath];
        headerView.imagesURLStrings = self.imagesURLStrings;
        return headerView;
    }
    SMHomeSortHeaderView * sortHeaderView =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:homeSortHeaderViewID forIndexPath:indexPath];
    return sortHeaderView;
}
#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SMHomeGoodsController * vc =[SMHomeGoodsController new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
