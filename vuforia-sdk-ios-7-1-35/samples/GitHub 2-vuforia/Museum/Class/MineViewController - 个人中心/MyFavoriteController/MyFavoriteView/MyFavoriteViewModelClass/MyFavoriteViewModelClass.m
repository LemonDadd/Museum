//
//  MyFavoriteViewModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/27.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyFavoriteViewModelClass.h"

@implementation MyFavoriteViewModelClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size =10;
    }
    return self;
}
- (void)requestCollectionMyFavoriteViewRequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestCollectionFavorListBySize:self.size Skip:self.skip*self.size request:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _allResource = message;
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

- (void)requestCollectionFavorCancleBycategoryId:(NSString *)categoryId
                                         Request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestCollectionFavorCancleBycategoryId:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

- (void)requestActivityMyFavoriteViewRequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestActivityFavorListBySize:self.size Skip:self.skip*self.size request:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _allResource = message;
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

- (void)requestActivityFavorCancleBycategoryId:(NSString *)categoryId
                                       Request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestActivityFavorCancleBycategoryId:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

- (void)requestExhibitionMyFavoriteViewRequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestExhibitionFavorListBySize:self.size Skip:self.skip*self.size request:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _allResource = message;
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

- (void)requestExhibitionFavorCancleBycategoryId:(NSString *)categoryId
                                         Request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestExhibitionFavorCancleBycategoryId:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

@end
