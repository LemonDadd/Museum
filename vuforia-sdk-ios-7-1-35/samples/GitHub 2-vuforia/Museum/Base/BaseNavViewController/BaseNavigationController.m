//
//  BaseNavigationController.m
//  Museum
//
//  Created by 关云秀 on 2017/11/26.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController
+ (void)initialize
{
    // 导航
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barTintColor = kColorWithHex(MCOLOR);
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [navBar setTitleTextAttributes:dict];
    
    
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];

    // 设置普通状态
    UIFont *font = [UIFont systemFontOfSize:15];
    NSDictionary *normalAttr = @{
                                 NSForegroundColorAttributeName: [UIColor whiteColor],
                                 NSFontAttributeName: font
                                 };
    [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];

    // 设置不可用状态
    NSDictionary *disableAttr = @{
                                  NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                  NSFontAttributeName: font
                                  };
    [item setTitleTextAttributes:disableAttr forState:UIControlStateDisabled];
    // 返回按钮
    [item setBackButtonBackgroundImage:[[UIImage imageNamed:@"backitem"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 40, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setTintColor:[UIColor whiteColor]];
    // 设置文字，水平偏移到看不见的位置
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(-500, 0) forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

//设置是否允许自动旋转
- (BOOL)shouldAutorotate {
    return YES;
}

//设置支持的屏幕旋转方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.interfaceOrientationMask;
}

//设置presentation方式展示的屏幕方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.interfaceOrientation;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
