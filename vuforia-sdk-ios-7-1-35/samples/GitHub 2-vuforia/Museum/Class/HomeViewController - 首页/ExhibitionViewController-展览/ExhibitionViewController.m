//
//  ExhibitionViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/6.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ExhibitionViewController.h"
#import "ExhibitionView.h"

@interface ExhibitionViewController ()

@property (nonatomic, strong)ExhibitionView *exhibitionView;

@end

@implementation ExhibitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"展览";
    // Do any additional setup after loading the view.
    _exhibitionView = [ExhibitionView new];
    [self.view addSubview:_exhibitionView];
    [_exhibitionView mas_makeConstraints:^(MASConstraintMaker *make) {
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
