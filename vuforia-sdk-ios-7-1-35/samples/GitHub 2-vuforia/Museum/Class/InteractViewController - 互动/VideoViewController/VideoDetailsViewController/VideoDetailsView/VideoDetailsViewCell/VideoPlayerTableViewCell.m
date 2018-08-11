//
//  VideoPlayerTableViewCell.m
//  Museum
//
//  Created by 关云秀 on 2018/1/7.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import "VideoPlayerTableViewCell.h"
#import "AppDelegate.h"
#import "BaseNavigationController.h"

@implementation VideoPlayerTableViewCell

{
    CGRect videoFrame;
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier url:(NSString *)url
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _url =url;// @"http://61.233.140.28/vod.cntv.lxdns.com/flash/mp4video61/TMS/2017/08/17/63bf8bcc706a46b58ee5c821edaee661_h264818000nero_aac32-5.mp4?wsrid_tag=5acf60a7_ydong188_28685-51994&wsiphost=local";
        _bgView = [UIView new];
        [self.contentView addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self.contentView);
            make.height.mas_equalTo([DeviceInfo ScreenSize].width/2);
        }];
        
        self.playerOptions = [[ZFTPlayerOption alloc]init];
        ZFTInterfaceOrientationType directionType = [self.playerOptions getCurrentScreenDirection];
        self.playerOptions.isPlaying = true;
        self.playerOptions.isBeingActiveState = YES;
        self.playerOptions.isBeingAppearState = YES;
        self.playerOptions.screenDirection = directionType;
        [self createPlayerViewWithScreenDirection:directionType isPlaying:YES currentTime:0.00];
        
    }
    return self;
}
#pragma mark - 创建并显示netShowView
-(void)setUpNetShowViewWithNetWorkNotiViewType:( ZFTNetNotiViewType )netWorkNotiViewType
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    __weak typeof(self) weakSelf = self;
    
    if (!self.netShowView) {
        
        self.netShowView = [[ZFTNetNotiView alloc]init];
        
        [self addSubview:self.netShowView];
        self.netShowView.hidden = NO;
        
    }
    else
    {
        self.netShowView.hidden = NO;
    }
    
    
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    //如果这个时候屏幕是向右横屏的状态
    if (orientation == UIInterfaceOrientationLandscapeRight)
    {
        self.netShowView.frame = CGRectMake(0, 0, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height);
    }
    //如果当前的屏幕方向是向左横屏的状态
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        self.netShowView.frame = CGRectMake(0, 0, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height);
    }
    
    //如果当前的屏幕方向是竖直的状态
    if (orientation == UIInterfaceOrientationPortrait) {
        self.netShowView.frame = videoFrame;
    }
    
    
    
    
    if (netWorkNotiViewType == ZFTNetNotiViewTypeOfNoNetWork || netWorkNotiViewType == ZFTNetNotiViewTypeOfBecomeWWAN) {
        [self.netShowView showNetNotiViewWithType:netWorkNotiViewType];
    }
    else
    {
        if (delegate.netWorkStatesCode == AFNetworkReachabilityStatusNotReachable) {
            [self.netShowView showNetNotiViewWithType:ZFTNetNotiViewTypeOfNoNetWork];
        }
        if (delegate.netWorkStatesCode == AFNetworkReachabilityStatusReachableViaWWAN) {
            [self.netShowView showNetNotiViewWithType:ZFTNetNotiViewTypeOfBecomeWWAN];
        }
    }
    //点击了确定按钮
    self.netShowView.btnClickblock = ^{
        //如果这个时候还是没有网的界面，啥也不变
        if (delegate.netWorkStatesCode == AFNetworkReachabilityStatusNotReachable) {
            return ;
        }
        else
        {
            [weakSelf.playerShowView removeFromSuperview];
            weakSelf.playerShowView = nil;
            
            if (weakSelf.playerOptions.totalTime) {
                
                [weakSelf createPlayerViewWithScreenDirection:weakSelf.playerOptions.screenDirection isPlaying:weakSelf.playerOptions.isPlaying currentTime:weakSelf.playerOptions.currenTime];
            }
            else
            {
                ZFTInterfaceOrientationType directionType = [weakSelf.playerOptions getCurrentScreenDirection];
                [weakSelf createPlayerViewWithScreenDirection:directionType isPlaying:YES currentTime:0.00];
            }
        }
    };
    
    self.netShowView.backBlock = ^{
        if (KScreenWidth > KScreenHeight) {
            NSNumber * value  = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        }
        else
        {
            
            [weakSelf.netShowView removeFromSuperview];
            weakSelf.netShowView = nil;
            if  (weakSelf.videoPlayerTableViewCellBack) {
                weakSelf.videoPlayerTableViewCellBack(true);
                
            }
        }
    };
    
}

#pragma mark - *******************************相关的通知方法***************************************
-(void)addNotiFicationEvent
{
    //转屏的通知方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    //网络状态发生变化的时候的通知方法
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(playerNetWorkStatesChange:) name:NetWorkChangeEventNotification
                                              object:nil];
}

#pragma mark - 创建播放器的相关操作
-(void)createPlayerViewWithScreenDirection:(ZFTInterfaceOrientationType)screenDirection isPlaying:(BOOL)isPlaying currentTime:(NSTimeInterval)playerCureentTime
{
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    __weak typeof(self) weakSelf = self;
    
    
    if (self.playerShowView) {
        //[self releasePlayerView];
    }
    videoFrame = CGRectMake(0, 0, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].width/2);
    self.playerShowView = [[ZFTPlayerView alloc]initWithFrame:videoFrame delegate:self url:self.url placeHolderImg:nil playerOption:self.playerOptions];
    [_bgView addSubview:self.playerShowView];
    if (self.playerOptions.totalTime) {
        self.playerShowView.playerPlaceHolderImg.hidden = YES;
    }
    //配置播放器类的相关代理方法
    self.playerShowView.playLoadStatesDelegate = self;
    self.playerShowView.playStatesDelegate = self;
    self.playerShowView.playBackStateDidChangeDelgate = self;
    self.playerShowView.fullBtnOrBackBtnClickDelegate = self;
    
    //如果创建完成之后需要直接播放，就直接执行播放的方法
    if (isPlaying) {
        [self.playerShowView.player prepareToPlay];
        [self.playerShowView.player play];
        [self.playerShowView pause];
    }
    
    if (delegate.netWorkStatesCode == AFNetworkReachabilityStatusReachableViaWWAN) {
        [self playerNetworkReachabilityStatusReachableViaWWAN];
    }
    
    
    
    //网络提醒框里面的返回按钮点击之后（目前遵循的点击返回按钮的逻辑）
    self.playerShowView.netShowView.backBlock = ^{
        //网络提醒框的返回按钮点击之后如果是全屏，就变成小屏，如果是小屏，就返回上一级界面
        [weakSelf backBtnCLick:nil];
    };
    
    self.playerShowView.netShowView.btnClickblock = ^{
        //如果当前显示的是无网界面
        if (weakSelf.playerShowView.netShowView.netWorkNotiViewType == ZFTNetNotiViewTypeOfNoNetWork) {
            //没有网，点击了也不会有反应
            if (delegate.netWorkStatesCode == AFNetworkReachabilityStatusNotReachable) {
                return ;
            }
            //有网了，恢复之前的状态
            //隐藏网络提示框
            weakSelf.playerShowView.playerPlaceHolderImg.hidden =YES;
            [weakSelf.playerShowView.netShowView hideNetNotiView];
            [weakSelf RestoreTheAtatusOfPlayer];
            
        }
        //流量提醒界面,点击之后直接恢复状态
        else if (weakSelf.playerShowView.netShowView.netWorkNotiViewType == ZFTNetNotiViewTypeOfBecomeWWAN)
        {
            //隐藏网络提示框
            weakSelf.playerShowView.playerPlaceHolderImg.hidden =YES;
            [weakSelf.playerShowView.netShowView hideNetNotiView];
            [weakSelf RestoreTheAtatusOfPlayer];
        }
    };
    
}

#pragma mark - ********************************播放器的全屏/退出按钮点击的代理方法**************************
#pragma mark - 点击播放器全屏按钮的代理方法
-(void)fullBtnClick:(UIButton *)sender
{
    //点击全屏按钮的处理方法
    [self optionsWithFullBtnClick];
    
}
#pragma mark - 点击全屏按钮所进行的处理逻辑
-(void)optionsWithFullBtnClick
{
    
    ZFTInterfaceOrientationType directionType = [self.playerOptions getCurrentScreenDirection];
    
    if (directionType == ZFTInterfaceOrientationPortrait) {
        directionType = ZFTInterfaceOrientationLandscapeRight;
    }
    else if (directionType == ZFTInterfaceOrientationLandscapeRight) {
        directionType = ZFTInterfaceOrientationPortrait;
    }
    else  if (directionType == ZFTInterfaceOrientationLandscapeLeft) {
        directionType = ZFTInterfaceOrientationPortrait;
    }
    else  if ((directionType == ZFTInterfaceOrientationUnknown)||(directionType == ZFTInterfaceOrientationPortraitUpsideDown)) {
        directionType = ZFTInterfaceOrientationPortrait;
    }
    self.playerOptions.screenDirection = directionType;
    
    if (directionType ==  ZFTInterfaceOrientationLandscapeRight ) {//小屏->全屏
        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self.contentView);
            make.height.mas_equalTo([DeviceInfo ScreenSize].height);
        }];
        [self layoutIfNeeded];
        if (_videoPlayerTableViewCellFull) {
            _videoPlayerTableViewCellFull();
        }
        
    }else{//全屏->小屏
        
        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(videoFrame.size.height);
        }];
        [self layoutIfNeeded];
        self.playerShowView.frame = videoFrame;
        if (_videoPlayerTableViewCellBack) {
            _videoPlayerTableViewCellBack(false);
        }
        
        
    }
}
#pragma mark - 视频播放器返回按钮点击的代理方法
-(void)backBtnCLick:(UIButton *)sender
{
    ZFTInterfaceOrientationType directionType = [self.playerOptions getCurrentScreenDirection];
    if (directionType == ZFTInterfaceOrientationPortrait) {
        [self releasePlayerView];
        if (_videoPlayerTableViewCellBack) {
            _videoPlayerTableViewCellBack(true);

        }
    }
    else
    {
        [self optionsWithFullBtnClick];
    }
    
    
}

#pragma mark - *********************************player加载状态相关的代理方法******************************
#pragma mark - 缓冲完成状态->一般用缓冲数据到可以播放的状态
-(void)playerMPMovieLoadStatePlaythroughOK
{
    NSLog(@"缓冲完成状态");
}
#pragma mark - 缓存数据足够开始播放状态
-(void)playerMPMovieLoadStatePlayable
{
    NSLog(@"缓存数据足够开始播放状态");
    
    //有时候即使数据缓冲完毕，如果当前不是第一响应者，并且不是在可见的界面里面，当前不是正在播放的状态，也不要进行播放，直接暂停就可以了，等到用户看到的时候再进行播放
    
    if (self.playerOptions.isPlaying && self.playerOptions.isBeingAppearState && self.playerOptions.isBeingActiveState) {
        
        if (fabs(self.playerShowView.player.currentPlaybackTime - self.playerOptions.currenTime) < 5) {
            
            //进度也是记录下来的进度，就可以播放了
            [self.playerShowView play];
            self.playerShowView.playerPlaceHolderImg.hidden = YES;
        }
        else
        {
            //如果不是（一般都是创建播放器之后从开始加载），先把时间校对过来
            self.playerShowView.player.currentPlaybackTime = self.playerOptions.currenTime;
        }
    }
    else
    {
        //目前的处理逻辑是如果达不到可以播放的要求，不论什么情况，都是直接暂停，但是这个暂停的状态不会记录，等到用户看到的时候会继续之前的状态进行播放或者暂停
        [self.playerShowView pauseWithoutRecoder];
    }
    
    
}
#pragma mark - 数据缓冲已经停止状态
-(void)playerMPMovieLoadStateStalled
{
    NSLog(@"缓冲数据已经停止状态");
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //先记录一下视频播放器的状态
    self.playerShowView.playerOption.isPlaying = [self.playerShowView.player isPlaying];
    self.playerOptions = self.playerShowView.playerOption;
    
    //缓冲数据停止的时候需要把当前的视频播放器暂停
    [self.playerShowView pauseWithoutRecoder];
    //如果是没有网络的情况，说明出现异常了，需要显示无网界面
    if (delegate.netWorkStatesCode == AFNetworkReachabilityStatusNotReachable) {
        self.playerShowView.netShowView.netWorkNotiViewType = ZFTNetNotiViewTypeOfNoNetWork;
        [self.playerShowView.netShowView showNetNotiViewWithType:ZFTNetNotiViewTypeOfNoNetWork];
    }
}
#pragma mark - 数据缓冲变成了未知状态
-(void)playerMPMovieLoadStateUnknown
{
    NSLog(@"数据缓冲变成了未知状态");
}
#pragma mark - **************************播放器播放状态变化相关代理方法********************************
#pragma mark - 播放器当前的播放状态是停止状态（如果这里面不作任何处理，其实视频播放器还在，并没有被释放掉，在视频播放完毕的时候会执行这个方法，但是这里面没有做任何处理，而是在视频播放完毕的时候做的处理）
-(void)playerMPMoviePlaybackStateStopped
{
    NSLog(@"视频播放器当前的播放状态时停止播放状态");
}
#pragma mark - 播放器当前的播放状态是正在播放状态
-(void)playerMPMoviePlaybackStatePlaying
{
    NSLog(@"视频播放器当前的状态是正在播放状态");
}
#pragma mark - 播放器当前的播放状态是暂停状态
-(void)playerMPMoviePlaybackStatePaused
{
    NSLog(@"视频播放器当前的播放状态是暂停状态");
}
#pragma mark - 播放器当前的播放状态是中断状态
-(void)playerMPMoviePlaybackStateInterrupted
{
    NSLog(@"视频播放器当前的状态时中断状态");
}
#pragma mark - 播放器当前的播放状态是向前拖动状态
-(void)playerMPMoviePlaybackStateSeekingForward
{
    NSLog(@"视频播放器当前的状态是向前拖动状态");
    
}
#pragma mark - 播放器当前的播放状态是向后拖动状态
-(void)playerMPMoviePlaybackStateSeekingBackward
{
    NSLog(@"视频播放器当前的状态时向后拖动状态");
}
#pragma mark - 播放器当前的播放状态是未知状态
-(void)playerMPMoviePlaybackStateUnKnown
{
    NSLog(@"视频播放器当前的状态是未知状态");
}
#pragma mark - ******************************播放器发生变化的时候需要执行的代理方法*********************
#pragma mark - 播放器播放完毕的原因是视频播放完毕
-(void)playerMPMovieFinishReasonPlaybackEnded
{
    NSLog(@"播放器播放完毕的原因是视频正常播放，播放完了");
    //目前在播放完毕之后是直接暂停，按照目前的模式，再继续播放就会从头开始播，如果有了新的需求可以再做修改
    [self.playerShowView pause];
    
    self.playerShowView.playerOption.currenTime = 0.00;
    self.playerOptions.currenTime = 0.00;
    self.playerOptions.isPlaying = NO;
}
#pragma mark - 播放器播放完毕的原因是用户退出
-(void)playerMPMovieFinishReasonUserExited
{
    NSLog(@"播放器播放完毕的原因是用户退出");
}
#pragma mark - 播放器播放完毕的原因是播放器错误
-(void)playerMPMovieFinishReasonPlaybackError
{
    NSLog(@"播放器播放完毕的原因是播放器错误");
    //目前已知的引起视频播放器错误的原因是没有网了，所以需要显示无网界面，
    ZFTInterfaceOrientationType directionType = [self.playerOptions getCurrentScreenDirection];
    
    
    self.playerShowView.playerOption.isPlaying = YES;
    self.playerShowView.playerOption.screenDirection = directionType;
    self.playerOptions = self.playerShowView.playerOption;

    
    AppDelegate *delegate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (delegate.netWorkStatesCode == AFNetworkReachabilityStatusNotReachable) {
        [self setUpNetShowViewWithNetWorkNotiViewType:ZFTNetNotiViewTypeOfNoNetWork];
        
    }
    if (delegate.netWorkStatesCode == AFNetworkReachabilityStatusReachableViaWWAN) {
        [self setUpNetShowViewWithNetWorkNotiViewType:ZFTNetNotiViewTypeOfBecomeWWAN];
    }
    if (delegate.netWorkStatesCode == AFNetworkReachabilityStatusReachableViaWiFi) {
        [self releasePlayerView];
        [self createPlayerViewWithScreenDirection:self.playerOptions.screenDirection isPlaying:self.playerOptions.isPlaying currentTime:self.playerOptions.currenTime];
//        if (self.playerOptions.totalTime) {
//
//        }
    }
    
}
#pragma mark - *************************************网络切换处理代理方法***********************************
#pragma mark - 网络状态发生变化通知方法
-(void)playerNetWorkStatesChange:(NSNotification *)sender
{
    
    int networkState = [[sender object] intValue];
    switch (networkState) {
        case -1:
            //未知网络状态
            [self playerNetworkReachabilityStatusUnknown];
            break;
            
        case 0:
            //没有网络
            //代理方法
            [self playerNetworkReachabilityStatusNotReachable];
            break;
            
        case 1:
            //3G或者4G，反正用的是流量
            //代理方法
            [self playerNetworkReachabilityStatusReachableViaWWAN];
            break;
            
        case 2:
            //WIFI网络
            //Wifi网络情况下，不需要记录视频播放器状态
            [self playerNetworkReachabilityStatusReachableViaWiFi];
            break;
            
        default:
            break;
    }
    
}

#pragma mark - 网络切换成了WIFI状态：如果不是在可见界面，或者不是第一响应者，就不需要做任何处理
-(void)playerNetworkReachabilityStatusReachableViaWiFi
{
    NSLog(@"网络切换成了wifi状态");
    
    if (self.playerOptions.isBeingActiveState && self.playerOptions.isBeingAppearState) {
        if (!self.playerShowView) {
            [self.netShowView removeFromSuperview];
            self.netShowView = nil;
            if (self.playerOptions.totalTime) {
                [self createPlayerViewWithScreenDirection:self.playerOptions.screenDirection isPlaying:self.playerOptions.isPlaying currentTime:self.playerOptions.currenTime];
            }
            
            else
            {
                
                ZFTInterfaceOrientationType directionType = [self.playerOptions getCurrentScreenDirection];
                [self createPlayerViewWithScreenDirection:directionType isPlaying:YES currentTime:0.00];
                self.playerOptions.screenDirection = directionType;
                self.playerOptions.isPlaying = YES;
                self.playerOptions.currenTime = 0.00;
                self.playerShowView.playerOption.screenDirection  = directionType;
                self.playerShowView.playerOption.isPlaying = YES;
                self.playerShowView.playerOption.currenTime = 0.00;
            }
            
        }
        else
        {
            //隐藏网络提示框
            [self.playerShowView.netShowView hideNetNotiView];
            //恢复视频播放器的状态
            [self RestoreTheAtatusOfPlayer];
        }
        
    }
}



#pragma mark - 网络切换成了流量状态
-(void)playerNetworkReachabilityStatusReachableViaWWAN
{
    NSLog(@"网络切换成了流量状态");
    if (!self.playerShowView) {
        [self setUpNetShowViewWithNetWorkNotiViewType:ZFTNetNotiViewTypeOfBecomeWWAN];
    }
    else
    {
        //使用的时候，需要记录一下视频播放器的属性，这个已经在ZFTPlayerView里面做好了
        //先把视频暂停，虽然暂停了，但是这个时候要是有缓冲的
        [self.playerShowView pauseWithoutRecoder];
        
        
        //显示流量提醒界面
        self.playerShowView.netShowView.netWorkNotiViewType = ZFTNetNotiViewTypeOfBecomeWWAN;
        [self.playerShowView.netShowView showNetNotiViewWithType:ZFTNetNotiViewTypeOfBecomeWWAN];
    }
    
}
#pragma mark - 网络切换成了无网状态

-(void)playerNetworkReachabilityStatusNotReachable
{
    NSLog(@"网络切换成了无网状态");
    if (self.playerOptions.isBeingAppearState) {
        if (!self.playerShowView) {
            [self setUpNetShowViewWithNetWorkNotiViewType:ZFTNetNotiViewTypeOfNoNetWork];
        }
        else
        {
            //没网的时候，需要记录一下视频播放器的属性，这个已经在ZFTPlayerView里面做好了
            if (self.playerShowView.player) {
                [self.playerShowView RecordThePropertiesOfThePlayer];
                self.playerOptions = self.playerShowView.playerOption;
            }
            
            //把视频暂停
            [self.playerShowView pauseWithoutRecoder];
            //显示无网界面
            self.playerShowView.netShowView.netWorkNotiViewType = ZFTNetNotiViewTypeOfNoNetWork;
            [self.playerShowView.netShowView showNetNotiViewWithType:ZFTNetNotiViewTypeOfNoNetWork];
        }
        
    }
}
#pragma mark - 网络切换成了未知状态
-(void)playerNetworkReachabilityStatusUnknown
{
    NSLog(@"网络切换成了其他状态");
}


#pragma mark - 屏幕旋转的通知方法。
- (void)statusBarOrientationChange:(NSNotification *)notification
{
    
    if (!(self.playerOptions.isBeingActiveState && self.playerOptions.isBeingAppearState)) {
        
        return;
    }
    
    //没有视频播放器，这个时候需要显示对应的网络提醒框，反正不能空着
    if (!self.playerShowView) {
        //这个里面有屏幕方向的处理逻辑
        [self setUpNetShowViewWithNetWorkNotiViewType:999];
    }
    else
    {
        
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        if (orientation == UIInterfaceOrientationLandscapeRight) // home键靠右
        {
            
            self.playerShowView.playerOption.screenDirection = ZFTInterfaceOrientationLandscapeRight;
            
            [UIView animateWithDuration:0.01 animations:^{
                self.playerShowView.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
                self.playerShowView.player.view.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
            }];
        }
        
        else if (orientation ==UIInterfaceOrientationLandscapeLeft) // home键靠左
        {
            self.playerShowView.playerOption.screenDirection = ZFTInterfaceOrientationLandscapeLeft ;
            
            [UIView animateWithDuration:0.01 animations:^{
                self.playerShowView.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
                self.playerShowView.player.view.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
            }];
        }
        else if (orientation == UIInterfaceOrientationPortrait)
        {
            
            self.playerShowView.playerOption.screenDirection = ZFTInterfaceOrientationPortrait;
            
            [UIView animateWithDuration:0.01 animations:^{
                self.playerShowView.transform= CGAffineTransformMakeRotation(0);
                self.playerShowView.frame = CGRectMake(0, 0, KScreenWidth, KScreenWidth*(KScreenWidth/KScreenHeight)*1.3);
                self.playerShowView.player.view.frame = self.playerShowView.frame;
            }];
            
        }
        else if (orientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            self.playerShowView.playerOption.screenDirection = ZFTInterfaceOrientationPortraitUpsideDown;
        }
        else if (orientation == UIInterfaceOrientationUnknown) {
            self.playerShowView.playerOption.screenDirection = ZFTInterfaceOrientationUnknown;
        }
        self.playerOptions = self.playerShowView.playerOption;
    }
}
#pragma mark - *******************************播放器前后台切换处理逻辑***********************************
#pragma mark - 当播放器失去第一响应者的时候触发的通知方法
-(void)playerRegistActiveNotificationEvent:(NSNotification *)sender
{
    
    
    
    NSLog(@"播放器失去了第一响应者");
    if (!self.playerShowView) {
        self.playerOptions.isBeingActiveState = NO;
    }
    else
    {
        
        //先把有关播放器的一些状态记录一下
        self.playerShowView.playerOption.isBeingActiveState = NO;
        
        
        //出现了无网界面，这个时候视频播放器是暂停的，但是这个不一定是之前的真实状态，所以不要记录状态
        if (((!self.netShowView.hidden) && self.netShowView)||(!self.playerShowView.netShowView.hidden)) {
            NSLog(@"%d",self.netShowView.hidden);
            NSLog(@"%d",self.playerShowView.netShowView.hidden);
            return;
        }
        
        
        
        
        //记录一下当前着各视频播放器的属性
        
        [self.playerShowView RecordThePropertiesOfThePlayer];
        if (self.playerShowView.playerOption) {
            self.playerOptions = self.playerShowView.playerOption;
        }
        //在这个代理方法执行出来之前，ZFTPlayerView已经记录了视频播放器的一些属性
        //把视频播放器进行暂停
        [self.playerShowView pauseWithoutRecoder];
    }
    
}
#pragma mark - 当播放器成为第一响应者的时候触发的通知方法
-(void)playerBecomeActiveNotificationEvent:(NSNotification *)sender
{
    
    NSLog(@"方向：%ld",(long)self.playerOptions.screenDirection);
    NSLog(@"播放器成为了第一响应者");
    self.playerOptions.isBeingActiveState = YES;
    
    if (self.playerShowView) {
        self.playerShowView.playerOption.isBeingActiveState = YES;
        //   self.playerOptions = self.playerShowView.playerOption;
    }
    
    
    
    //成为了第一响应者之后，需要和变成可见界面的时候需要执行的方法是一样的,这个方法里面会有线管的处理和判断逻辑
    [self eventWithBecomeASctiveStateOrBecomeAppearState];
    
}
#pragma mark - 当视频成为了第一响应者或者成为可见界面的时候需要通过该方法进行相关逻辑的处理（主要是播放器的创建和释放业务）能走到这个方法，说明一定是变成了第一响应者或者成为了可见页面。
-(void)eventWithBecomeASctiveStateOrBecomeAppearState
{
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //大前提就是处于可见界面，而且是第一响应者,能到这一步，说明不需要显示创建网络提醒框，
    if (self.playerOptions.isBeingActiveState && self.playerOptions.isBeingAppearState && delegate.netWorkStatesCode == AFNetworkReachabilityStatusReachableViaWiFi) {
        
        //如果这个时候连基本的playerBaseView都没有，需要重头创建视频播放器
        if (!self.playerShowView) {
            [self.netShowView removeFromSuperview];
            self.netShowView = nil;
            //如果这个时候已经没有视频播放器了,就需要创建视频播放器
            if (self.playerOptions.totalTime) {
                [self createPlayerViewWithScreenDirection:self.playerOptions.screenDirection isPlaying:self.playerOptions.isPlaying currentTime:self.playerOptions.currenTime];
            }
            else
            {
                ZFTInterfaceOrientationType directionType = [self.playerOptions getCurrentScreenDirection];
                [self createPlayerViewWithScreenDirection:directionType isPlaying:YES currentTime:0.00];
            }
            
        }
        
        else
        {
            [self.playerShowView.netShowView hideNetNotiView];
            
            //恢复视频播放器的状态（播放暂停，全屏小屏）
            [self RestoreTheAtatusOfPlayer];
        }
    }
}
#pragma mark - 恢复视频播放器的播放暂停状态以及全屏小屏状态
-(void)RestoreTheAtatusOfPlayer
{
    //如果这个时候视频播放器还在，只需要恢复之前的播放器状态就可以了,进度条估计没啥问题，需要重新设置的就是播放还是暂停的属性，以及是不是全屏这个属性
    if (!self.playerOptions.isPlaying) {
        //之前如果是播放，回来之后还需要继续播放
        [self.playerShowView play];
    }
    ZFTInterfaceOrientationType directionType = self.playerOptions.screenDirection;
    
    
    if (directionType == ZFTInterfaceOrientationPortrait) {
        
        NSNumber * value  = [NSNumber numberWithInt:UIDeviceOrientationPortrait];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        CGRect frame =videoFrame;
        self.playerShowView.frame = frame;
    }
    else if (directionType == ZFTInterfaceOrientationLandscapeLeft) {
        NSNumber * value  = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        CGRect frame = CGRectMake(0, 0, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height);
        self.playerShowView.frame = frame;
    }
    else if (directionType == ZFTInterfaceOrientationLandscapeRight) {
        NSNumber * value  = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        CGRect frame = CGRectMake(0, 0, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height);
        self.playerShowView.frame = frame;
    }
    else if ((directionType == ZFTInterfaceOrientationPortraitUpsideDown) ||(directionType == ZFTInterfaceOrientationUnknown )) {
        NSNumber * value  = [NSNumber numberWithInt:UIDeviceOrientationPortrait];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        self.playerShowView.frame = videoFrame;
    }
    
    
    
    
    
    if (self.playerShowView.player.currentPlaybackTime != self.playerShowView.playerOption.currenTime) {
        self.playerShowView.player.currentPlaybackTime = self.playerShowView.playerOption.currenTime;
    }
}

#pragma mark - 把视频播放器以及子控件全部释放掉
-(void)releasePlayerView{
    [self removeNotificationEvent];
    [self.playerShowView releasePlayer];
    [self.playerShowView removeFromSuperview];
    self.playerShowView = nil;
    
}

#pragma mark - *************************************Other***********************************
#pragma mark - 移除通知方法
-(void)removeNotificationEvent
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"netWorkChangeEventNotification" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}


////强制竖屏
//- (void)forceOrientationPortrait
//{
//    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
//    appdelegate.isForcePortrait=YES;
//    appdelegate.isForceLandscape=NO;
//    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
//
//    BaseNavigationController *navi = (BaseNavigationController *)self.navigationController;
//    navi.interfaceOrientation = UIInterfaceOrientationPortrait;
//    navi.interfaceOrientationMask = UIInterfaceOrientationMaskPortrait;
//    [self.navigationController setNavigationBarHidden:false animated:YES];
//    //设置屏幕的转向为竖屏
//    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
//    //刷新
//    [UIViewController attemptRotationToDeviceOrientation];
//}
//
//#pragma  mark 横屏设置
////强制横屏
//- (void)forceOrientationLandscape
//{
//    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
//    appdelegate.isForceLandscape=YES;
//    appdelegate.isForcePortrait=NO;
//    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
//    BaseNavigationController *navi = (BaseNavigationController *)self.navigationController;
//    navi.interfaceOrientation =   UIInterfaceOrientationLandscapeRight;
//    navi.interfaceOrientationMask = UIInterfaceOrientationMaskLandscapeRight;
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//
//    //强制翻转屏幕，Home键在右边。
//    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
//    //刷新
//    [UIViewController attemptRotationToDeviceOrientation];
//}


@end
