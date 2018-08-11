//
//  ExhibitionContentViewModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/27.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExhibitionContentViewModelClass : NSObject
@property (nonatomic, assign)NSInteger isFavor;

- (void)requestExhibitionFavorBycategoryId:(NSString *)categoryId
                                   request:(void(^)(NSString *errorMsg))request;

- (void)requestExhibitionFavorCancleBycategoryId:(NSString *)categoryId
                                         request:(void(^)(NSString *errorMsg))request;

- (void)requestExhibitionIsFavorByActivityId:(NSString *)categoryId
                                   request:(void(^)(NSString *errorMsg))request;
@end
