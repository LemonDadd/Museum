//
//  SubscribeViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/7.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SubscribeViewController.h"
#import "SubscribeView.h"

@interface SubscribeViewController ()

@property (nonatomic, strong)SubscribeView *subscribeView;

@end

@implementation SubscribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"参观预约";
    // Do any additional setup after loading the view.
    _subscribeView = [SubscribeView new];
    [self.view addSubview:_subscribeView];
    _subscribeView.model = self.model;
    [_subscribeView mas_makeConstraints:^(MASConstraintMaker *make) {
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
