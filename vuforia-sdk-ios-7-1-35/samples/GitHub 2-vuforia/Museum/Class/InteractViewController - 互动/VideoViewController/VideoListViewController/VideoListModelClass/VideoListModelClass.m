//
//  VideoListModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/31.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "VideoListModelClass.h"

@implementation VideoListModelClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size =10;
    }
    return self;
}

- (void)requestVideoListByCategory:(NSString *)category
                           request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestVideoListBySize:self.size Skip:self.skip*self.size Category:category request:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _allResource = message;
            request(nil);
        } else {
            request(errorMsg);
        }
    }];
}


@end
