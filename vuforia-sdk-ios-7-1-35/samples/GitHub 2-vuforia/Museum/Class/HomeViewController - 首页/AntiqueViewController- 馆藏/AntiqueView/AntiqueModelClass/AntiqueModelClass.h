//
//  AntiqueModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/24.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AntiqueModelClass : NSObject

@property (nonatomic, retain)NSArray *allResource;

- (void)requestAntiqueRequest:(void(^)(NSString *errorMsg))request;
@end
