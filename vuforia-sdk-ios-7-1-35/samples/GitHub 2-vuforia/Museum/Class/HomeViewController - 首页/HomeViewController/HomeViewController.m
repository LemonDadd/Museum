//
//  HomeViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/11/26.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "AppDelegate.h"


@interface HomeViewController ()

@property (nonatomic, strong)HomeView *homeView;

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:true];
     AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if ([UserInfoClass getUserInfoClass] ==nil && delegate.youkLogin == NO) {
        [self gotoLoginViewController];
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:false];
}

-(void)viewDidLoad {
    [super viewDidLoad];
     self.automaticallyAdjustsScrollViewInsets = NO;
    _homeView = [HomeView new];
    [self.view addSubview:_homeView];
    [_homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
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
