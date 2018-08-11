//
//  ActivityContentViewModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/27.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityContentViewModelClass : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *idCord;
@property (nonatomic, copy)NSString *phone;
@property (nonatomic, assign) BOOL isFavor;

- (void)requestActivityFavorBycategoryId:(NSString *)categoryId
                                   request:(void(^)(NSString *errorMsg))request;

- (void)requestActivityFavorCancleBycategoryId:(NSString *)categoryId
                                         request:(void(^)(NSString *errorMsg))request;
- (void)requestActivityParticipateByActivityId:(NSString *)ActivityId
                                       request:(void(^)(NSString *errorMsg))request;
- (void)requestActivityIsFavorByActivityId:(NSString *)ActivityId
                                       request:(void(^)(NSString *errorMsg))request;

@end
