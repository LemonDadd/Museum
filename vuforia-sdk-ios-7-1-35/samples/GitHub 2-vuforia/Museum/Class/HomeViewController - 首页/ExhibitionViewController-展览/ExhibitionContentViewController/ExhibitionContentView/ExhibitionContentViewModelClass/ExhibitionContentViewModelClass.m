//
//  ExhibitionContentViewModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/27.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ExhibitionContentViewModelClass.h"

@implementation ExhibitionContentViewModelClass

/**
 收藏
 
 @param request
 */

- (void)requestExhibitionFavorBycategoryId:(NSString *)categoryId
                                 request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestExhibitionFavorBycategoryId:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

/**
 取消收藏
 
 @param request
 */
- (void)requestExhibitionFavorCancleBycategoryId:(NSString *)categoryId
                                       request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestExhibitionFavorCancleBycategoryId:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}
- (void)requestExhibitionIsFavorByActivityId:(NSString *)categoryId
                                     request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestExhibitionIsFavorById:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _isFavor = message;
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

@end
