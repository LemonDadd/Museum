//
//  AppDelegate+StartPage.h
//  Museum
//
//  Created by keneng17 on 2017/12/15.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "AppDelegate.h"
#import "EAIntroPage.h"
#import "EAIntroView.h"

@interface AppDelegate (StartPage)<EAIntroDelegate>

- (void)startPagesCheck;
@end
