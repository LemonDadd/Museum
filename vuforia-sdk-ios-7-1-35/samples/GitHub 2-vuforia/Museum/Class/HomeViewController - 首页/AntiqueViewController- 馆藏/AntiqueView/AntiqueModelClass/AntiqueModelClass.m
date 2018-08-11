//
//  AntiqueModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/24.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "AntiqueModelClass.h"

@implementation AntiqueModelClass

- (void)requestAntiqueRequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestGetCollectionCategoryByrequest:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _allResource = message;
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

@end
