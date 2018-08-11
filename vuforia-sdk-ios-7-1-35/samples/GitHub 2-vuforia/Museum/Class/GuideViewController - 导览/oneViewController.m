//
//  oneViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "oneViewController.h"
#import "TowViewController.h"

@interface oneViewController ()

@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"zhdl_del_bg"];
    [self.view addSubview:imageview];
    imageview.userInteractionEnabled = YES;
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [imageview addGestureRecognizer:gr];
    
    UIImage *image = [UIImage imageNamed:@"zhdl_del_img"];
    CGFloat width = [DeviceInfo ScreenSize].width-80;
    CGFloat hight = [DeviceInfo scalHeightByWidth:width BySize:image.size];
    UIImageView *centerImage = [UIImageView new];
    centerImage.image = image;
    [self.view addSubview:centerImage];
    [centerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(imageview);
        make.width.mas_offset(width);
        make.height.mas_offset(hight);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"zhdl_fanhui"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.left.equalTo(@20);
        make.width.height.equalTo(@40);
    }];
    
}

- (void)btnEvent {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)click {
    TowViewController *vc= [TowViewController new];
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
