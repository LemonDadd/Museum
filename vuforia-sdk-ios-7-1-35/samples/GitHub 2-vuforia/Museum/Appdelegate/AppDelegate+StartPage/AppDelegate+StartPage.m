//
//  AppDelegate+StartPage.m
//  Museum
//
//  Created by keneng17 on 2017/12/15.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "AppDelegate+StartPage.h"

@implementation AppDelegate (StartPage)
- (void)startPagesCheck {
    //第一次启动的时候
    //if (![[CacheDeal getInstancetype] getObject:START_ONCE_KEY]) {
    UIViewController *vc = [UIViewController new];
    
    UIWindow *winndow = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    winndow.windowLevel = UIWindowLevelAlert;
    winndow.rootViewController = vc;
    self.windowStartPage = winndow;
    [self showIntroWithCrossDissolve:vc.view];
    [winndow makeKeyAndVisible];
    //}
}

- (void)showIntroWithCrossDissolve:(UIView *)view {
    NSArray* imageNameArray = @[@"StartPage_1.jpg", @"StartPage_3.jpg"];
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.bgImage = [UIImage imageNamed:imageNameArray[0]];
    
//    EAIntroPage *page2 = [EAIntroPage page];
//    page2.bgImage = [UIImage imageNamed:imageNameArray[1]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.bgImage =[UIImage imageNamed:imageNameArray[1]];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:view.bounds andPages:@[page1,page3]];
    [intro setDelegate:self];
    [intro.pageControl setHidden:true];
    [intro showInView:view animateDuration:0.3];
}

- (void)introDidFinish:(EAIntroView *)introView {
    //[[CacheDeal getInstancetype] saveObject:@"marked" key:START_ONCE_KEY];
    [self.window makeKeyAndVisible];
    [self.windowStartPage removeFromSuperview];
    self.windowStartPage = nil;
    TTVIEW_RELEASE_SAFELY(introView);
}

@end
