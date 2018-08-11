//
//  CollectionView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/3.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionView.h"
#import "CollectionViewCell.h"
#import "CollectionModel.h"
#import "CollectionDetailsViewController.h"

@implementation CollectionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        PCollectionViewLayout *flowLayout = [[PCollectionViewLayout alloc] init];
        flowLayout.columns = 2;
        flowLayout.columMargin =10;
        flowLayout.rowMargin = 10;
        flowLayout.delegate = self;
        
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_mainCollectionView setBackgroundColor:kColorWithHex(0xf6f6f8)];
        [_mainCollectionView setDelegate:self];
        [_mainCollectionView setDataSource:self];
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        //        //注册
        [_mainCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
        [self addSubview:_mainCollectionView];
        [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _allResource = [NSMutableArray array];
        _modelClass = [CollectionViewModelClass new];
    }
    return self;
}

/**
 *  刷新数据
 */
- (void)addHistoryData{
    
    kWeakSelf(self);
    _mainCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakself.modelClass.skip = 0;
        [weakself reStartRequestData];
    }];
    // 马上进入刷新状态
    [_mainCollectionView.mj_header beginRefreshing];
}

- (void)upPull {
    kWeakSelf(self);
    _mainCollectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakself.modelClass.skip++;
        [weakself reStartRequestData];
    }];
}

- (void)reStartRequestData {
    kWeakSelf(self);
    [_modelClass requestCollectionrRequest:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            [weakself updateData:weakself.modelClass.allResource];
        } else {
            [weakself.mainCollectionView .mj_header endRefreshing];
            [weakself.mainCollectionView.mj_footer endRefreshing];
            [CustomView alertMessage:errorMsg view:weakself];
        }
    }];
}

- (void)updateData:(NSArray *)resourceData {
    [_mainCollectionView.mj_header endRefreshing];
    [_mainCollectionView.mj_footer endRefreshing];
    [_mainCollectionView.mj_footer setHidden:false];
    if (_modelClass.skip == 0) {
        [_allResource removeAllObjects];
        [_allResource addObjectsFromArray:[resourceData copy]];
        [_mainCollectionView reloadData];
        if (resourceData.count < _modelClass.size) {
            [_mainCollectionView.mj_footer setHidden:true];
        }
    } else {
        [_allResource addObjectsFromArray:[resourceData copy]];
        [_mainCollectionView reloadData];
        if (_allResource.count<(_modelClass.skip+1) *_modelClass.size) {
            [_mainCollectionView.mj_footer setHidden:true];
        }
    }
}

#pragma mark - PCollectionViewLayoutDelegate

-(CGFloat)waterFlow:(PCollectionViewLayout *)flow heightForWidth:(CGFloat)width indexPath:(NSIndexPath *)index {
    CollectionModel *model =_allResource[index.row];
    return  [_modelClass getCellHightByCollectionModel:model andCellWidth:width];
}

#pragma mark -
//section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _allResource.count;
}

//每个item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [_mainCollectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    CollectionModel *model =_allResource[indexPath.row];
    [cell.topimage sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@""]];
    cell.titleLabel.text =[NSString stringWithFormat:@"【%@】%@",model.period,model.name];
    cell.idLabel.text = [NSString stringWithFormat:@"  编号: %@",model.no];
    [self layoutIfNeeded];
    return cell;
}

//是否可以选择Item
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//选择某个Item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionModel *model =_allResource[indexPath.row];
    CollectionDetailsViewController *vc = [CollectionDetailsViewController new];
    vc.model =model;
    [self.viewController.navigationController pushViewController:vc animated:YES];
    
}


- (void)setCategoryId:(NSString *)categoryId {
    _categoryId = categoryId;
    _modelClass.categoryId = _categoryId;
    [self addHistoryData];
    [self upPull];
}

@end
