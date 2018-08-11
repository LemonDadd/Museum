//
//  CollectionDetailsModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/26.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionDetailsModelClass.h"

@implementation CollectionDetailsModelClass

/**
 藏品收藏
 
 @param request
 */

- (void)requestCollectionFavorBycategoryId:(NSString *)categoryId
                                   request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestCollectionFavorBycategoryId:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

/**
 藏品取消收藏
 
 @param request
 */
- (void)requestCollectionFavorCancleBycategoryId:(NSString *)categoryId
                                         request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestCollectionFavorCancleBycategoryId:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}
/**
 藏品是否收藏
 
 @param request
 */
- (void)requestCollectionIsFavorBycategoryId:(NSString *)categoryId
                                     request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestCollectionIsFavorById:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _isFavor = message;
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

@end
