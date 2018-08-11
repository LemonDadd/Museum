//
//  ActivityViewModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/24.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityViewModelClass : NSObject

@property (nonatomic, assign)NSInteger size;
@property (nonatomic, assign)NSInteger skip;
@property (nonatomic, strong)NSArray *activityResource;

- (void)requestActivityrequest:(void(^)(NSString *errorMsg))request;

@end
