//
//  ForGetViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/2.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ForGetViewController.h"
#import "ForGetView.h"

@interface ForGetViewController ()

@property (nonatomic, strong)ForGetView *forgetView;

@end

@implementation ForGetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _forgetView = [ForGetView new];
    [self.view addSubview:_forgetView];
    [_forgetView mas_makeConstraints:^(MASConstraintMaker *make) {
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
