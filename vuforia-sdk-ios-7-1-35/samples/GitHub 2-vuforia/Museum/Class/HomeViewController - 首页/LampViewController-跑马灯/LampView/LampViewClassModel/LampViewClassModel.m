//
//  LampViewClassModel.m
//  Museum
//
//  Created by 关云秀 on 2018/1/2.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import "LampViewClassModel.h"

@implementation LampViewClassModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size =10;
    }
    return self;
}

- (void)requestCommentaryListRequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestCommentaryListBySize:self.size Skip:self.skip*self.size request:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _allResource = message;
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

@end
