//
//  ArViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/14.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ArViewController.h"
#import "ARScanViewController.h"
#import "ARModelViewController.h"
#import "BaseNavigationController.h"
#import "AppDelegate.h"
#import "ImageTargetsViewController.h"


@interface ArViewController ()

@end

@implementation ArViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:true];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:false];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    // Do any additional setup after loading the view.
    UIImageView *bgView = [UIImageView new];
    bgView.image = [UIImage imageNamed:@"ar_bg"];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIImage *scanImage = [UIImage imageNamed:@"ar_scan"];
    UIButton *scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [scanBtn setImage:scanImage forState:UIControlStateNormal];
    [scanBtn addTarget:self action:@selector(scanBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanBtn];
    [scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(bgView);
        make.size.mas_equalTo(scanImage.size);
    }];
}
- (void)scanBtnEvent {
    
    //ARModelViewController *vc = [ARModelViewController new];
    ImageTargetsViewController *vc = [ImageTargetsViewController new];
    [self.navigationController pushViewController:vc animated:YES];
//    OpenCVTemplateVC *vc = [OpenCVTemplateVC new];
//    [self.navigationController pushViewController:vc animated:YES];
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
