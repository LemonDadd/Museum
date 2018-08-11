//
//  InteractView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/9.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "CardScrollView.h"

@interface InteractView : BaseView<CardScrollViewDelegate,CardScrollViewDataSource>

@property (nonatomic, strong)CardScrollView *cardScrollView;
@property (nonatomic, strong)NSArray *imageArray;
@property (nonatomic, strong)LWDPageControl *pageControl;

@end
