//
//  LampViewClassModel.h
//  Museum
//
//  Created by 关云秀 on 2018/1/2.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LampViewClassModel : NSObject

@property (nonatomic, assign)NSInteger size;
@property (nonatomic, assign)NSInteger skip;
@property (nonatomic, strong)NSArray *allResource;

- (void)requestCommentaryListRequest:(void(^)(NSString *errorMsg))request;

@end
