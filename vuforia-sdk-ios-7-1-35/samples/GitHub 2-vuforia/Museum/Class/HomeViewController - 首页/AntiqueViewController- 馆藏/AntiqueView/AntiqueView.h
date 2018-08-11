//
//  AntiqueView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/2.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "AntiqueModelClass.h"
@interface AntiqueView : BaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *mainCollectionView;
@property (nonatomic, strong)LWDPageControl *pageControl;
@property (nonatomic, strong)NSArray *allResource;
@property (nonatomic, strong)AntiqueModelClass *antiqueModelClass;

@end
