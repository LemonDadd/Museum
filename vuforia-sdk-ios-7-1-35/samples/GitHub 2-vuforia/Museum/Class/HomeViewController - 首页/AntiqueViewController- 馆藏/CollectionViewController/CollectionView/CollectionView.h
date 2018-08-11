//
//  CollectionView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/3.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "PCollectionViewLayout.h"
#import "CollectionViewModelClass.h"

@interface CollectionView : BaseView<UICollectionViewDelegate,UICollectionViewDataSource,PCollectionViewLayoutDelegate>
@property (nonatomic, copy)NSString *categoryId;
@property (nonatomic, strong)UICollectionView *mainCollectionView;
@property (nonatomic, strong)NSMutableArray *allResource;
@property (nonatomic, strong)CollectionViewModelClass *modelClass;

@end
