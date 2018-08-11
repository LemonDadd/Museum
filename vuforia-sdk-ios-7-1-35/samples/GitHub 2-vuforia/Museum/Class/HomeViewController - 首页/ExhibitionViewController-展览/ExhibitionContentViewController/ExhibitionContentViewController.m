//
//  ExhibitionContentViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ExhibitionContentViewController.h"
#import "ExhibitionContentView.h"

@interface ExhibitionContentViewController ()
@property (nonatomic, strong)ExhibitionContentView *exhibitionContentView;
@end

@implementation ExhibitionContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"展览";
    // Do any additional setup after loading the view.
    _exhibitionContentView = [ExhibitionContentView new];
    _exhibitionContentView.model = self.model;
    [self.view addSubview:_exhibitionContentView];
    [_exhibitionContentView mas_makeConstraints:^(MASConstraintMaker *make) {
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
