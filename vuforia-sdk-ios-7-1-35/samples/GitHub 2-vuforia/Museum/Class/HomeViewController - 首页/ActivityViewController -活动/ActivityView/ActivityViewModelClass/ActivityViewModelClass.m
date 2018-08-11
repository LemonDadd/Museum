//
//  ActivityViewModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/24.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ActivityViewModelClass.h"

@implementation ActivityViewModelClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size =10;
    }
    return self;
}

- (void)requestActivityrequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestGetActivityListBySize:self.size Skip:self.skip*self.size request:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _activityResource = message;
            request(nil);
        } else {
            request(errorMsg);
        }
    }];
}

@end
