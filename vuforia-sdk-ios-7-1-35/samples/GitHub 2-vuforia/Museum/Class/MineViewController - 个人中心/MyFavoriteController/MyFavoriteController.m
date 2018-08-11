//
//  MyFavoriteController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/7.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyFavoriteController.h"
#import "MyFavoriteView.h"
#import "SeltedTopView.h"
#import "MyFavoriteActityView.h"

@interface MyFavoriteController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *mainScrView;
@property (nonatomic, strong)SeltedTopView *myFavoriteTopView;
@property (nonatomic, strong)MyFavoriteActityView *myFavoriteActityView;
@property (nonatomic, strong)MyFavoriteActityView *myFavoriteExpoView;
@property (nonatomic, strong)MyFavoriteView *myFavoriteView;

@end

@implementation MyFavoriteController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _myFavoriteTopView = [[SeltedTopView alloc]initWithFrame:CGRectMake(0, [DeviceInfo ScreenTTop], [DeviceInfo ScreenSize].width, 50) andSeletedArray:@[@"展品",@"展览",@"活动"]];
    [self.view addSubview:_myFavoriteTopView];
    
    _mainScrView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_myFavoriteTopView.frame), [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height-CGRectGetMaxY(_myFavoriteTopView.frame))];
    _mainScrView.pagingEnabled = YES;
    _mainScrView.scrollEnabled =NO;
    _mainScrView.showsHorizontalScrollIndicator=NO;
    _mainScrView.showsVerticalScrollIndicator =NO;
    _mainScrView.bounces=NO;
    _mainScrView.delegate =self;
    [self.view addSubview:_mainScrView];
    
    [self createFavorite];
    [self createExpoView];
    [self createActityView];
    _mainScrView.contentSize = CGSizeMake([DeviceInfo ScreenSize].width*3, CGRectGetHeight(_mainScrView.frame));
    
    
    kWeakSelf(self);
    _myFavoriteTopView.didselted = ^(NSInteger indx) {
        if (indx == 0) {
            [weakself.mainScrView scrollRectToVisible:weakself.myFavoriteView.frame animated:YES];
        }
        if (indx == 1) {
            [weakself.mainScrView scrollRectToVisible:weakself.myFavoriteExpoView.frame animated:YES];
        }
        if (indx == 2) {
            [weakself.mainScrView scrollRectToVisible:weakself.myFavoriteActityView.frame animated:YES];
        }
    };
   
}

- (void)createFavorite {
    _myFavoriteView = [[MyFavoriteView alloc]initWithFrame:CGRectMake(0, 0, [DeviceInfo ScreenSize].width, CGRectGetHeight(_mainScrView.frame))];
    [_mainScrView addSubview:_myFavoriteView];
}

- (void)createExpoView {
    _myFavoriteExpoView = [[MyFavoriteActityView alloc]initWithFrame:CGRectMake([DeviceInfo ScreenSize].width, 0, [DeviceInfo ScreenSize].width, CGRectGetHeight(_mainScrView.frame))];
    _myFavoriteExpoView.type = 0;
    [_mainScrView addSubview:_myFavoriteExpoView];
}

- (void)createActityView {
    _myFavoriteActityView = [[MyFavoriteActityView alloc]initWithFrame:CGRectMake([DeviceInfo ScreenSize].width*2,0, [DeviceInfo ScreenSize].width, CGRectGetHeight(_mainScrView.frame))];
    _myFavoriteActityView.type =1;
    [_mainScrView addSubview:_myFavoriteActityView];
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
