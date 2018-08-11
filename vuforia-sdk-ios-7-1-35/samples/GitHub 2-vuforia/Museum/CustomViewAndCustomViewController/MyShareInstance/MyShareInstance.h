//
//  MyShareInstance.h
//  jinheLV
//
//  Created by 今合网技术部 on 2016/11/19.
//  Copyright © 2016年 今合网技术部. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>

@interface MyShareInstance : NSObject

+ (instancetype)getInstancetype;

/**
 分享网页

 @param platformType
 @param viewController
 @param request
 */
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
                          ShareUrl:(NSString *)url
                  byViewController:(UIViewController *)viewController
                           request:(void(^)(NSString *message,
                                            BOOL success,
                                            NSString *errorMsg,
                                            BOOL error))request;

@end
