//
//  AntiqueView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/2.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "AntiqueView.h"
#import "AntiqueCollectionViewCell.h"
#import "CollectionViewController.h"
#import "AntiqueModel.h"

@implementation AntiqueView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];//滚动视图的方向
        
        flowLayout.minimumInteritemSpacing =0;
        flowLayout.minimumLineSpacing = 5; //上下的间距 可以设置0看下效果
        flowLayout.sectionInset = UIEdgeInsetsMake(0.f,5, 0.f, 5);
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_mainCollectionView setBackgroundColor:kColorWithHex(0xf6f6f8)];
        [_mainCollectionView setDelegate:self];
        [_mainCollectionView setDataSource:self];
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        //        //注册
        [_mainCollectionView registerClass:[AntiqueCollectionViewCell class] forCellWithReuseIdentifier:@"AntiqueCollectionViewCell"];
        [self addSubview:_mainCollectionView];
        [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _antiqueModelClass = [AntiqueModelClass new];
        [self addHistoryData];
//        if (@available(iOS 11.0, *)) {
//            _mainCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        } else {
//            self.viewController.automaticallyAdjustsScrollViewInsets = NO;
//        }
//        _pageControl = [[LWDPageControl alloc] initWithFrame:CGRectMake(0, [DeviceInfo ScreenSize].height-50, [DeviceInfo ScreenSize].width, 40) indicatorMargin:5.f indicatorWidth:20.f currentIndicatorWidth:20.f indicatorHeight:5.f];
//        _pageControl.numberOfPages = 4;
//        _pageControl.scrollView = _mainCollectionView;
//        [self addSubview:_pageControl];
        
    }
    return self;
}

/**
 *  刷新数据
 */
- (void)addHistoryData{
    
    kWeakSelf(self);
    _mainCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself reStartRequestData];
    }];
    // 马上进入刷新状态
    [_mainCollectionView.mj_header beginRefreshing];
}

- (void)reStartRequestData {
    kWeakSelf(self);
    [_antiqueModelClass requestAntiqueRequest:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            [weakself updateData];
        }else {
            [weakself.mainCollectionView .mj_header endRefreshing];
            [CustomView alertMessage:errorMsg view:weakself];
        }
    }];
}


- (void)updateData {
    [_mainCollectionView .mj_header endRefreshing];
    [_mainCollectionView reloadData];
}

//section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _antiqueModelClass.allResource.count;
}

//每个item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AntiqueCollectionViewCell *cell = [_mainCollectionView dequeueReusableCellWithReuseIdentifier:@"AntiqueCollectionViewCell" forIndexPath:indexPath];
    
    if (_antiqueModelClass.allResource.count >indexPath.row) {
        AntiqueModel *model = _antiqueModelClass.allResource[indexPath.row];
        [cell.image sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:SmallDefault]];
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
    AntiqueModel *model = _antiqueModelClass.allResource[indexPath.row];
    CollectionViewController *vc= [CollectionViewController new];
    vc.categoryId =model.Id;
    vc.title = model.name;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = currentPage;
}


@end
