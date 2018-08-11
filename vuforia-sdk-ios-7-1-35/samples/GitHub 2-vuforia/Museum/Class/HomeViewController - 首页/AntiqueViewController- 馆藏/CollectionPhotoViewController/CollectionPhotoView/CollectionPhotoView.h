//
//  CollectionPhotoView.h
//  Museum
//
//  Created by 关云秀 on 2018/1/6.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import "BaseView.h"

@interface CollectionPhotoView : BaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *mainCollectionView;
@property (nonatomic, strong)NSArray *allResource;
@property (nonatomic, strong)LWDPageControl *pageControl;

@end
