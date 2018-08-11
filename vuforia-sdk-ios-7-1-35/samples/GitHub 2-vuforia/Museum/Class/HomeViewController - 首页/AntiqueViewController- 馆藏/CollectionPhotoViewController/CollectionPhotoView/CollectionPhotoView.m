//
//  CollectionPhotoView.m
//  Museum
//
//  Created by 关云秀 on 2018/1/6.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import "CollectionPhotoView.h"
#import "CollectionPhotoCell.h"
#import "CollectionModel.h"

@implementation CollectionPhotoView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];//滚动视图的方向
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_mainCollectionView setBackgroundColor:[UIColor clearColor]];
        [_mainCollectionView setDelegate:self];
        [_mainCollectionView setDataSource:self];
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        _mainCollectionView.pagingEnabled = YES;
        _mainCollectionView.bounces = false;
        //        //注册
        [_mainCollectionView registerClass:[CollectionPhotoCell class] forCellWithReuseIdentifier:@"CollectionPhotoCell"];
        [self addSubview:_mainCollectionView];
        [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        
       
    }
    return self;
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
    CollectionPhotoCell *cell = [_mainCollectionView dequeueReusableCellWithReuseIdentifier:@"CollectionPhotoCell" forIndexPath:indexPath];
    CollectionMicroModel *model = _allResource[indexPath.row];
    cell.title.text = model.name;
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:nil];
    return cell;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.bounds.size;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = currentPage;
}

-(void)setAllResource:(NSArray *)allResource {
    _allResource =allResource;
    _pageControl = [[LWDPageControl alloc] initWithFrame:CGRectMake(0, [DeviceInfo ScreenSize].height-100, [DeviceInfo ScreenSize].width, 40) indicatorMargin:5.f indicatorWidth:20.f currentIndicatorWidth:20.f indicatorHeight:5.f];
    _pageControl.numberOfPages = _allResource.count;
    _pageControl.scrollView = _mainCollectionView;
    [self addSubview:_pageControl];
    [_mainCollectionView reloadData];
}

@end
