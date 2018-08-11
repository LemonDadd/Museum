//
//  VideoListViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "VideoListViewController.h"
#import "SeltedTopView.h"
#import "VideoListView.h"
@interface VideoListViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *mainScrView;
@property (nonatomic, strong)SeltedTopView *videoListTopView;
@property (nonatomic, strong)VideoListView *tuijinVideoView;
@property (nonatomic, strong)VideoListView *dongmanVideoView;
@end

@implementation VideoListViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:false];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频故事";
    // Do any additional setup after loading the view.
    
    _videoListTopView = [[SeltedTopView alloc]initWithFrame:CGRectMake(0, [DeviceInfo ScreenTTop], [DeviceInfo ScreenSize].width, 50) andSeletedArray:@[@"推荐故事",@"趣味动漫"]];
    [self.view addSubview:_videoListTopView];
    
    _mainScrView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_videoListTopView.frame)+5, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height-CGRectGetMaxY(_videoListTopView.frame))];
    _mainScrView.pagingEnabled = YES;
    _mainScrView.scrollEnabled =NO;
    _mainScrView.showsHorizontalScrollIndicator=NO;
    _mainScrView.showsVerticalScrollIndicator =NO;
    _mainScrView.bounces=NO;
    _mainScrView.delegate =self;
    [self.view addSubview:_mainScrView];
    
    [self createTj];
    [self createDM];
    _mainScrView.contentSize = CGSizeMake([DeviceInfo ScreenSize].width*2, CGRectGetHeight(_mainScrView.frame));
    
    kWeakSelf(self);
    _videoListTopView.didselted = ^(NSInteger indx) {
        if (indx == 0) {
            [weakself.mainScrView scrollRectToVisible:weakself.tuijinVideoView.frame animated:YES];
        }
        if (indx == 1) {
            [weakself.mainScrView scrollRectToVisible:weakself.dongmanVideoView.frame animated:YES];
        }
    };
    
}

- (void)createTj {
    _tuijinVideoView = [[VideoListView alloc]initWithFrame:CGRectMake(0, 0, [DeviceInfo ScreenSize].width, CGRectGetHeight(_mainScrView.frame))];
    _tuijinVideoView.type = 1;
    [_mainScrView addSubview:_tuijinVideoView];
}

- (void)createDM{
    _dongmanVideoView = [[VideoListView alloc]initWithFrame:CGRectMake([DeviceInfo ScreenSize].width, 0, [DeviceInfo ScreenSize].width, CGRectGetHeight(_mainScrView.frame))];
    _dongmanVideoView.type =2;
    [_mainScrView addSubview:_dongmanVideoView];
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
