
//
//  TowViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "TowViewController.h"
#import "CollectionDetailsViewController.h"

@interface TowViewController ()

@end

@implementation TowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"zhdl_del_bg"];
    [self.view addSubview:imageview];
    imageview.userInteractionEnabled = YES;
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [imageview addGestureRecognizer:gr];
    
    UIImage *image = [UIImage imageNamed:@"test-3"];
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
    
    UIView *bottom = [UIView new];
    bottom.backgroundColor =[UIColor colorWithWhite:0 alpha:0.8];
    [self.view addSubview:bottom];
    [bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@50);
    }];
    
    NSMutableArray *masonryViewArray = [NSMutableArray array];
    NSArray *imageArray = @[@"wisdom_dl_icon",@"wisdom_lx_icon",@"wisdom_rm_icon",@"wisdom_location_icon"];
    NSArray *titleArray = @[@"展馆导览",@"推荐路线",@"热门展品",@"我的位置"];
    for (int i=0; i<imageArray.count; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        //[btn addTarget:self action:@selector(bottomFunctionEvent:) forControlEvents:UIControlEventTouchUpInside];
        [bottom addSubview:btn];
        [masonryViewArray addObject:btn];
        
        UILabel *label = [UILabel new];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont fontByName:MFONT fontSize:14];
        label.text = titleArray[i];
        [bottom addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btn.mas_bottom);
            make.centerX.equalTo(btn);
        }];
    }
    [masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
    
    [masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottom).offset(5);
    }];
}

- (void)click {
    CollectionDetailsViewController *vc =[CollectionDetailsViewController new];
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
