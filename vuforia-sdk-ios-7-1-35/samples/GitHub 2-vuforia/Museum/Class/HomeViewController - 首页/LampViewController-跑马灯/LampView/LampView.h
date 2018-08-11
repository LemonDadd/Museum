//
//  LampView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/6.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "LampViewClassModel.h"

@interface LampView : BaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *mainCollectionView;
@property (nonatomic, strong)NSMutableArray *allResource;
@property (nonatomic, strong)LampViewClassModel *modelClass;

@end
