//
//  ActivityContentViewModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/27.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ActivityContentViewModelClass.h"

@implementation ActivityContentViewModelClass

/**
 收藏
 
 @param request
 */

- (void)requestActivityFavorBycategoryId:(NSString *)categoryId
                                   request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestActivityFavorBycategoryId:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
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
- (void)requestActivityFavorCancleBycategoryId:(NSString *)categoryId
                                         request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestActivityFavorCancleBycategoryId:categoryId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

- (void)requestActivityParticipateByActivityId:(NSString *)ActivityId
                                       request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestActivityParticipateByActivityId:ActivityId IdNumber:self.idCord Mobile:self.phone Name:self.name request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

- (void)requestActivityIsFavorByActivityId:(NSString *)ActivityId
                                   request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestActivityIsFavorById:ActivityId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _isFavor = message;
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}


@end
