//
//  BaseTabBarController.m
//  Museum
//
//  Created by 关云秀 on 2017/11/26.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "GuideViewController.h"
#import "InteractViewController.h"
#import "StaffViewController.h"
#import "MineViewController.h"
#import "BaseNavigationController.h"


@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HomeViewController *home = [HomeViewController new];
    [self addChildVc:home title:@"首页" image:@"home_icon" selectedImage:@"home_icon_true"];
    
    GuideViewController *guide = [GuideViewController new];
   [self addChildVc:guide title:@"智慧导览" image:@"zhdl_icon" selectedImage:@"zhdl_icon_true"];
    
    InteractViewController *interact = [InteractViewController new];
    [self addChildVc:interact title:@"体验互动" image:@"tyhd_icon" selectedImage:@"tyhd_icon_true"];
    
//    StaffViewController *staff = [StaffViewController new];
//    [self addChildViewControllerByController:staff Title:@"首页" Image:nil];
    
    MineViewController *mine = [MineViewController new];
    [self addChildVc:mine title:@"我的" image:@"mine_icon" selectedImage:@"mine_icon_true"];
    
    
    
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    if (kSystemVersion >= 7.0) {
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    } else {
        childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
        childVc.tabBarItem.image = [UIImage imageNamed:image];
    }
    
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = kColorWithHex(BLACKCOLOR);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = kColorWithHex(0X804000);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    nav.interfaceOrientation = UIInterfaceOrientationPortrait;
    nav.interfaceOrientationMask = UIInterfaceOrientationMaskPortrait;
    // 添加为子控制器
    [self addChildViewController:nav];
}

#pragma mark - - orientation
// 是否支持转屏
- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}
// 返回nav栈中的最后一个对象支持的旋转方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}
// 返回nav栈中最后一个对象,坚持旋转的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
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
