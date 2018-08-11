//
//  ExhibitionModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/17.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ExhibitionModelClass.h"

@implementation ExhibitionModelClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size =10;
    }
    return self;
}

- (void)requestExhibitionrequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestGetExhibitionListBySize:self.size Skip:self.skip*self.size request:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _allResource = message;
            request(nil);
        } else {
            request(errorMsg);
        }
    }];
}

@end
