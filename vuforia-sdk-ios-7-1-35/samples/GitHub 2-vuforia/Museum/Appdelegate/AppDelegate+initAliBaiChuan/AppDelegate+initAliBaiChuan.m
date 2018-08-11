//
//  AppDelegate+initAliBaiChuan.m
//  Museum
//
//  Created by 关云秀 on 2018/3/24.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import "AppDelegate+initAliBaiChuan.h"
#import <AlibabaAuthSDK/ALBBSDK.h>

@implementation AppDelegate (initAliBaiChuan)

- (void)initAliBaiChuan {
    
    //百川平台基础SDK初始化，加载并初始化各个业务能力插件
    [[ALBBSDK sharedInstance] openDebugLog];//开发阶段打开日志开关，方便排查错误信息
    [[ALBBSDK sharedInstance] setAuthOption:NormalAuth];//使用淘宝H5页面打开商品详情
    [[ALBBSDK sharedInstance] setAppkey:@"24832082"];//设置全局的app标识，在电商模块里等同于isv_code
    [[ALBBSDK sharedInstance]ALBBSDKInit];
    [[ALBBSDK sharedInstance] auth:nil successCallback:^(ALBBSession *session) {
        
    } failureCallback:^(ALBBSession *session, NSError *error) {
        
    }];
    
}

@end
