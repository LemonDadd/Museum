//
//  CollectionDetailsView+BottomFunctionView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/5.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionDetailsView.h"

@interface CollectionDetailsView (BottomFunctionView)<playerPlayLoadStatesDelegate,playerPlayBackStateDidChangeDelgate>

@property (nonatomic, strong)NSMutableArray *masonryViewArray;

- (void)createBottomFunctionView;
-(void)releasePlayerView;

@end
