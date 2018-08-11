//
//  BaseModel.m
//  Museum
//
//  Created by 关云秀 on 2017/12/26.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [BaseModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                     @"Id" : @"id"
                     };
        }];
    }
    return self;
}

@end
