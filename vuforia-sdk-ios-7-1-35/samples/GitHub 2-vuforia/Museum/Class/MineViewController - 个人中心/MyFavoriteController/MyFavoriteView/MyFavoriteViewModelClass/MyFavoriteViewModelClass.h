//
//  MyFavoriteViewModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/27.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyFavoriteViewModelClass : NSObject

@property (nonatomic, retain)NSArray *allResource;
@property (nonatomic, assign)NSInteger size;
@property (nonatomic, assign)NSInteger skip;

- (void)requestCollectionMyFavoriteViewRequest:(void(^)(NSString *errorMsg))request;

- (void)requestCollectionFavorCancleBycategoryId:(NSString *)categoryId
                                         Request:(void(^)(NSString *errorMsg))request;

- (void)requestActivityMyFavoriteViewRequest:(void(^)(NSString *errorMsg))request;

- (void)requestActivityFavorCancleBycategoryId:(NSString *)categoryId
                                         Request:(void(^)(NSString *errorMsg))request;

- (void)requestExhibitionMyFavoriteViewRequest:(void(^)(NSString *errorMsg))request;

- (void)requestExhibitionFavorCancleBycategoryId:(NSString *)categoryId
                                         Request:(void(^)(NSString *errorMsg))request;

@end
