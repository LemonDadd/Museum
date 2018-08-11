//
//  LampViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/6.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "LampViewController.h"
#import "LampView.h"

@interface LampViewController ()

@property (nonatomic, strong)LampView *lampView;

@end

@implementation LampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"文物大家说";
    // Do any additional setup after loading the view.
    _lampView = [LampView new];
    [self.view addSubview:_lampView];
    [_lampView mas_makeConstraints:^(MASConstraintMaker *make) {
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
