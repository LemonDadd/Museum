//
//  AppointmentViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "AppointmentViewController.h"
#import "AppointmentView.h"

@interface AppointmentViewController ()

@property (nonatomic, strong)AppointmentView *appointmentView;

@end

@implementation AppointmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的预约";
    // Do any additional setup after loading the view.
    _appointmentView = [AppointmentView new];
    [self.view addSubview:_appointmentView];
    [_appointmentView mas_makeConstraints:^(MASConstraintMaker *make) {
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
