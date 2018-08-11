//
//  MuseumViewModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/25.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MuseumViewModelClass.h"

@implementation MuseumViewModelClass
- (instancetype)init
{
    self = [super init];
    if (self) {
        _model = nil;
    }
    return self;
}
- (void)requestGetMuseumByrequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestGetMuseumByrequest:^(MuseumModel *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _model = message;
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}
@end
