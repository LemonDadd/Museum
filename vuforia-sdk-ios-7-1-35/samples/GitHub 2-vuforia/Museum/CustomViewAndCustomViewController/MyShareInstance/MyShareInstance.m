//
//  MyShareInstance.m
//  jinheLV
//
//  Created by 今合网技术部 on 2016/11/19.
//  Copyright © 2016年 今合网技术部. All rights reserved.
//

#import "MyShareInstance.h"

@implementation MyShareInstance

static MyShareInstance *myShareInstance = nil;

+ (instancetype)getInstancetype
{
    if (!myShareInstance) {
        myShareInstance = [[self allocWithZone:NULL] init];
    }
    return myShareInstance;
}

- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
                          ShareUrl:(NSString *)url
                  byViewController:(UIViewController *)viewController
                           request:(void(^)(NSString *message,
                                            BOOL success,
                                            NSString *errorMsg,
                                            BOOL error))request {
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"太原博物馆" descr:@"我在太原博物馆" thumImage:[UIImage imageNamed:@"icon_logo.png"]];
    
    //设置网页地址
    shareObject.webpageUrl = url;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
        if (!error) {
            request(@"分享成功", true, nil, false);
        }else{
            NSString *errorMsage;
            if ([error code] == 2009) {
                errorMsage = @"分享取消";
            } else {
                errorMsage = @"分享失败";
            }
            request(nil, false, errorMsage, false);
            
        }
    }];
}

- (NSInteger)getType:(UMSocialPlatformType)UMSocialPlatformType{
    if (UMSocialPlatformType ==UMSocialPlatformType_WechatSession) {
        return 1;
    } else if (UMSocialPlatformType == UMSocialPlatformType_WechatTimeLine) {
        return 2;
    }else if (UMSocialPlatformType == UMSocialPlatformType_Sina) {
        return 3;
    }else if (UMSocialPlatformType == UMSocialPlatformType_TencentWb) {
        return 4;
    }else {
        return 5;
    }
}

@end














