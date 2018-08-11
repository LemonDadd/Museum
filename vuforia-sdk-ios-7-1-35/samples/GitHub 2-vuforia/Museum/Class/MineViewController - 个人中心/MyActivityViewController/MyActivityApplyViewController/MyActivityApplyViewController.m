//
//  MyActivityApplyViewController.m
//  Museum
//
//  Created by keneng17 on 2017/12/14.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyActivityApplyViewController.h"
#import "MyActivityApplyView.h"

@interface MyActivityApplyViewController ()

@property (nonatomic, strong)MyActivityApplyView *myActivityApplyView;

@end

@implementation MyActivityApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的预约";
    _myActivityApplyView = [MyActivityApplyView new];
    _myActivityApplyView.allResource = self.allResource;
    [self.view addSubview:_myActivityApplyView];
    [_myActivityApplyView mas_makeConstraints:^(MASConstraintMaker *make) {
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
