//
//  ActivityContentViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/14.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ActivityContentViewController.h"
#import "ActivityContentView.h"
#import "MyActivityApplyViewController.h"
@interface ActivityContentViewController ()

@property (nonatomic, strong)ActivityContentView *activityContentView;

@end

@implementation ActivityContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"活动详情";
    _activityContentView = [ActivityContentView new];
    _activityContentView.model = self.model;
    [self.view addSubview:_activityContentView];
    [_activityContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    if (_isMy) {
        UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"my_yuyueItem_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
        self.navigationItem.rightBarButtonItem = right;
    }
}

- (void)rightClick {
    MyActivityApplyViewController *vc=  [MyActivityApplyViewController new];
    vc.allResource = self.model.participantList;
    [self.navigationController pushViewController:vc animated:YES];
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
