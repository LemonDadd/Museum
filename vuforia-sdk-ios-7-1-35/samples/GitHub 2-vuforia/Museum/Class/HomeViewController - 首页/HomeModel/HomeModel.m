//
//  HomeModel.m
//  Museum
//
//  Created by 关云秀 on 2017/12/24.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//                                                                                  

#import "HomeModel.h"
#import "SlideshowListModel.h"
#import "CommentaryModel.h"
#import "ActivityModel.h"

@implementation HomeModel

+(void)load {
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"slideshowList" : [SlideshowListModel class],
                 @"commentaryList" : [CommentaryModel class],
                 @"activityList" :[ActivityModel class]
                 };
    }];
}



@end
