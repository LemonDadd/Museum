//
//  LampView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/6.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "LampView.h"
#import "LampCollectionViewCell.h"
#import "CollectionDetailsViewController.h"

@implementation LampView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];//滚动视图的方向
        
        flowLayout.minimumInteritemSpacing =5;
        flowLayout.minimumLineSpacing = 5; //上下的间距 可以设置0看下效果
        flowLayout.sectionInset = UIEdgeInsetsMake(5.f, 5, 5.f, 5);
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_mainCollectionView setBackgroundColor:kColorWithHex(0xf6f6f8)];
        [_mainCollectionView setDelegate:self];
        [_mainCollectionView setDataSource:self];
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        //        //注册
        [_mainCollectionView registerClass:[LampCollectionViewCell class] forCellWithReuseIdentifier:@"LampCollectionViewCell"];
        [self addSubview:_mainCollectionView];
        [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _allResource = [NSMutableArray array];
        _modelClass = [LampViewClassModel new];
        [self addHistoryData];
        [self upPull];
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
    [_modelClass requestCommentaryListRequest:^(NSString *errorMsg) {
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
    LampCollectionViewCell *cell = [_mainCollectionView dequeueReusableCellWithReuseIdentifier:@"LampCollectionViewCell" forIndexPath:indexPath];
    
    if (_allResource.count>indexPath.row) {
        CollectionModel *model = _allResource[indexPath.row];
        CommentaryModel *m = model.commentaryList.firstObject;
        [cell.bgImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:nil];
        cell.titleLabel.text =[NSString stringWithFormat:@"%@",m.name];
    }
    
    return cell;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(([DeviceInfo ScreenSize].width-15)/2,([DeviceInfo ScreenSize].width-15)/2);
}

//是否可以选择Item
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//选择某个Item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionModel *model = _allResource[indexPath.row];
    CollectionDetailsViewController *vc= [CollectionDetailsViewController new];
    vc.model = model;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

@end
