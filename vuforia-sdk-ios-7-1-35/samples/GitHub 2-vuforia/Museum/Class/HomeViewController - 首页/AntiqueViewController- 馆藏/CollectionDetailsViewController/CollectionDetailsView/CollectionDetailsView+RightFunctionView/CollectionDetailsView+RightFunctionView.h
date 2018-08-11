//
//  CollectionDetailsView+RightFunctionView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/5.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionDetailsView.h"

@interface CollectionDetailsView (RightFunctionView)

@property (nonatomic, strong)NSMutableArray *masonryrightViewArray;
@property (nonatomic, strong)NSArray *btnFrameArray;

- (void)createRightFunctionView;

@end
