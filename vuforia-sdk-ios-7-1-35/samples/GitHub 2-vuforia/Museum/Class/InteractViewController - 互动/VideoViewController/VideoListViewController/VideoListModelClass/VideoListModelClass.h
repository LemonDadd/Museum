//
//  VideoListModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/31.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoListModelClass : NSObject

@property (nonatomic, assign)NSInteger size;
@property (nonatomic, assign)NSInteger skip;
@property (nonatomic, strong)NSArray *allResource;

- (void)requestVideoListByCategory:(NSString *)category
                           request:(void(^)(NSString *errorMsg))request;

@end
