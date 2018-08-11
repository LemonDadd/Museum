//
//  GuideViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/11/26.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "GuideViewController.h"
#import "oneViewController.h"
@interface GuideViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *mainScrView;

@end

@implementation GuideViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    _mainScrView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height)];
    _mainScrView.pagingEnabled = YES;
    _mainScrView.showsHorizontalScrollIndicator=NO;
    _mainScrView.showsVerticalScrollIndicator =NO;
    _mainScrView.bounces=NO;
    _mainScrView.delegate =self;
    [self.view addSubview:_mainScrView];
    if (@available(iOS 11.0, *)) {
        _mainScrView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    for (int i=0; i<4; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, i*[DeviceInfo ScreenSize].height, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height)];
        [_mainScrView addSubview:image];
        image.userInteractionEnabled = YES;
        image.image = [UIImage imageNamed:@"wisdom_one_img"];
        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
        [image addGestureRecognizer:gr];
        
    }
    _mainScrView.contentSize = CGSizeMake([DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height*4);
}

- (void)click {
    oneViewController *vc =[oneViewController new];
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
