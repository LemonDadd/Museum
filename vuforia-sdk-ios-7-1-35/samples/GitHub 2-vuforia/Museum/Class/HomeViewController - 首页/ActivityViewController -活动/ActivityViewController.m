//
//  ActivityViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/4.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityView.h"

@interface ActivityViewController ()

@property (nonatomic, strong)ActivityView *activityView;

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"活动";
    
    _activityView = [ActivityView new];
    [self.view addSubview:_activityView];
    [_activityView mas_makeConstraints:^(MASConstraintMaker *make) {
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
