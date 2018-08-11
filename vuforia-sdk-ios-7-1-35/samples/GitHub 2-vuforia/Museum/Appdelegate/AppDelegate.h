//
//  AppDelegate.h
//  Museum
//
//  Created by 关云秀 on 2017/11/26.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleGLResourceHandler.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIWindow *windowStartPage;
@property (assign , nonatomic) BOOL isForceLandscape;
@property (assign , nonatomic) BOOL isForcePortrait;
@property (assign , nonatomic) BOOL youkLogin;
@property (nonatomic, weak) id<SampleGLResourceHandler> glResourceHandler;

/*
 当前的网络状态
 */
@property(nonatomic,assign)int netWorkStatesCode;

@end

