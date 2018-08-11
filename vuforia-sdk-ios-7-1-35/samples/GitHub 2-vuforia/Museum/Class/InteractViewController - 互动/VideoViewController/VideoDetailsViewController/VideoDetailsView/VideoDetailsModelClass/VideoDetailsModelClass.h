//
//  VideoDetailsModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/31.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoDetailsModelClass : NSObject

@property (nonatomic, assign)NSInteger size;
@property (nonatomic, assign)NSInteger skip;
@property (nonatomic, strong)NSArray *allResource;


- (void)requestVideoCommentListByVideoId:(NSString *)VideoId
                                 request:(void(^)(NSString *errorMsg))request;

- (void)requestVideoAddCommentByVideoId:(NSString *)VideoId
                                Content:(NSString *)content
                                request:(void(^)(NSString *errorMsg))request;

- (void)requestVideoFavorByVideoId:(NSString *)VideoId
                                   request:(void(^)(NSString *errorMsg))request;

- (void)requestVideoFavorCancleByVideoId:(NSString *)VideoId
                                         request:(void(^)(NSString *errorMsg))request;
@end
