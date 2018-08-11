//
//  VideoDetailsViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "VideoDetailsViewController.h"
#import "VideoDetailsView.h"

@interface VideoDetailsViewController ()
@property (nonatomic, strong)UILabel *topTitleView;
@property (nonatomic, strong)VideoDetailsView *videoDetailsView;
@end

@implementation VideoDetailsViewController
{
    CGRect videoFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"视频故事";
    
    id traget = self.navigationController.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:traget action:nil];
    [self.view addGestureRecognizer:pan];
    
    _videoDetailsView = [VideoDetailsView new];
    _videoDetailsView.videoModel = self.model;
    [self.view addSubview:_videoDetailsView];
    [_videoDetailsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:true];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:false];
}

-(void)dealloc {
     [_videoDetailsView relessVideo];
    TTVIEW_RELEASE_SAFELY(_videoDetailsView);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[SDImageCache sharedImageCache] clearMemory];
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
