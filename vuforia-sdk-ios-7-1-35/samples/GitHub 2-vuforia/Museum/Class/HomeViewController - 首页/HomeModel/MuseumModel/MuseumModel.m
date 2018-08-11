//
//  MuseumModel.m
//  Museum
//
//  Created by 关云秀 on 2017/12/23.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MuseumModel.h"

@implementation MuseumModel

+(void)load {
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"dateList" : [ResvDateModel class],
                 @"timeList" :[ResvTimeModel class]
                 };
    }];
}

@end

@implementation ResvDateModel
@end

@implementation ResvTimeModel
@end
