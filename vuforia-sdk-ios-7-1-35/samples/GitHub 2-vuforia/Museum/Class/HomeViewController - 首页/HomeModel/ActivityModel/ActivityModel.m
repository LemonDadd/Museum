//
//  ActivityModel.m
//  Museum
//
//  Created by 关云秀 on 2017/12/23.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel

+(void)load {
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"participantList" : [ActivityParticipantModel class]
                 };
    }];
}

@end

@implementation ActivityParticipantModel

@end
