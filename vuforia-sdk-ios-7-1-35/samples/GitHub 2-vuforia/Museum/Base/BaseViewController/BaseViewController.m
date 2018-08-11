//
//  BaseViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/11/26.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginViewController.h"
#import "BaseNavigationController.h"
#import "AppDelegate.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem =right;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    [UIViewController attemptRotationToDeviceOrientation];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)gotoLoginViewController {
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait=YES;
    appdelegate.isForceLandscape=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
    
    LoginViewController *login = [LoginViewController new];
    BaseNavigationController *navi = [[BaseNavigationController  alloc]initWithRootViewController:login];
    navi.interfaceOrientation = UIInterfaceOrientationPortrait;
    navi.interfaceOrientationMask = UIInterfaceOrientationMaskPortrait;
    [self presentViewController:navi animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
