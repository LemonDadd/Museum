//
//  MyActivityViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyActivityViewController.h"
#import "MyActivityView.h"

@interface MyActivityViewController ()

@property (nonatomic, strong)MyActivityView *myActivityView;

@end

@implementation MyActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的活动";
    // Do any additional setup after loading the view.
    _myActivityView = [MyActivityView new];
    [self.view addSubview:_myActivityView];
    [_myActivityView mas_makeConstraints:^(MASConstraintMaker *make) {
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
