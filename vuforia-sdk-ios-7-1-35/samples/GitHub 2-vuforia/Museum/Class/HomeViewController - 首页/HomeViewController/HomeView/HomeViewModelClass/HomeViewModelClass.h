//
//  HomeViewModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/17.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActivityModel.h"

@interface HomeViewModelClass : NSObject

@property (nonatomic, strong)NSArray *SlideshowList;//轮播图
@property (nonatomic, strong)NSArray *activityResource;//活动列表
@property (nonatomic, strong)NSArray *mingxingRes;//明星说文物

- (void)requestHomerequest:(void(^)(NSString *errorMsg))request;

- (void) addMingxng;
- (void)addShoucang ;
- (void)addVideo;
@end
