//
//  CollectionDetailsModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/26.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionDetailsModelClass : NSObject
@property (nonatomic, assign)NSInteger isFavor;

/**
 藏品收藏
 
 @param request
 */

- (void)requestCollectionFavorBycategoryId:(NSString *)categoryId
                                   request:(void(^)(NSString *errorMsg))request;

/**
 藏品取消收藏
 
 @param request
 */
- (void)requestCollectionFavorCancleBycategoryId:(NSString *)categoryId
                                        request:(void(^)(NSString *errorMsg))request;

/**
 藏品是否收藏
 
 @param request
 */
- (void)requestCollectionIsFavorBycategoryId:(NSString *)categoryId
                                         request:(void(^)(NSString *errorMsg))request;

@end
