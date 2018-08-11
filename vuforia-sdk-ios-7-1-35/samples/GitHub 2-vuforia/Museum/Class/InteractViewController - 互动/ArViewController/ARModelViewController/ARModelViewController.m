//
//  ARModelViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/15.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ARModelViewController.h"
#import "ArViewController.h"
#import <WebKit/WebKit.h>
#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "ScreenManager.h"
#import "ScreeImageView.h"
#import "UShareUI.h"
#import "ArXiangQingViewController.h"

@interface ARModelViewController ()<WKNavigationDelegate,WKScriptMessageHandler,WKUIDelegate>
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) WKUserContentController *userContentController;
@end

@implementation ARModelViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     [self.navigationController.navigationBar setHidden:true];
    //强制旋转竖屏
    [self forceOrientationLandscape];
    BaseNavigationController *navi = (BaseNavigationController *)self.navigationController;
    //[self.navigationController setNavigationBarHidden:YES animated:animated];
    navi.interfaceOrientation =   UIInterfaceOrientationLandscapeRight;
    navi.interfaceOrientationMask = UIInterfaceOrientationMaskLandscapeRight;
    
    //强制翻转屏幕，Home键在右边。
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:false];
}

//强制竖屏
- (void)forceOrientationPortrait
{
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait=YES;
    appdelegate.isForceLandscape=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
    
    BaseNavigationController *navi = (BaseNavigationController *)self.navigationController;
    navi.interfaceOrientation = UIInterfaceOrientationPortrait;
    navi.interfaceOrientationMask = UIInterfaceOrientationMaskPortrait;
    
    //设置屏幕的转向为竖屏
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
}

#pragma  mark 横屏设置
//强制横屏
- (void)forceOrientationLandscape
{
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForceLandscape=YES;
    appdelegate.isForcePortrait=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ArBase,self.arScanModel.TransUrl]];
    //    // 3.创建Request
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0,1, [[UIScreen mainScreen] bounds].size.height, 2)];
    self.progressView.backgroundColor =kColorWithHex(MCOLOR);
    //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    [self.view addSubview:self.progressView];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    if (@available(iOS 11.0, *)) {
        self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
         self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.webView.estimatedProgress;
        if (self.progressView.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

//开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载网页");
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    [self.view bringSubviewToFront:self.progressView];
}

//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
    //加载完成后隐藏progressView
    //self.progressView.hidden = YES;
}

//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败");
    //加载失败同样需要隐藏progressView
    //self.progressView.hidden = NO;
}


- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    [webView reload];
}
- (void)back {
    if ([_delegate respondsToSelector:@selector(ARModelViewControllerPop)]) {
        [_delegate ARModelViewControllerPop];
    }
    for (UIViewController* vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[ArViewController class]]) {
            //强制旋转竖屏
            [self forceOrientationPortrait];
            [self.navigationController popToViewController:vc animated:YES];
            
        }
    }
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"jietu"]) {
        [self share];
    } else if ([message.name isEqualToString:@"saomiao"]) {
        //强制旋转竖屏
        [self forceOrientationPortrait];
        [self.navigationController popViewControllerAnimated:YES];
    } else if ([message.name isEqualToString:@"fuwei"]) {
        [self back];
    } else if ([message.name isEqualToString:@"details"]) {
        ArXiangQingViewController *vc = [ArXiangQingViewController new];
        vc.url = [NSString stringWithFormat:@"%@%@",ArBase,self.arScanModel.DetailsUrl];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}

- (WKWebView *)webView {
    if (_webView == nil) {
        // js配置
        _userContentController = [[WKUserContentController alloc] init];
        [_userContentController addScriptMessageHandler:self name:@"saomiao"];
        [_userContentController addScriptMessageHandler:self name:@"fuwei"];
        [_userContentController addScriptMessageHandler:self name:@"jietu"];
        [_userContentController addScriptMessageHandler:self name:@"details"];
        
        // WKWebView的配置
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.userContentController = _userContentController;
        
        // 显示WKWebView
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.height, self.view.frame.size.width) configuration:configuration];
        _webView.UIDelegate = self; // 设置WKUIDelegate代理
        _webView.scrollView.bounces = NO;
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (void)share {
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine)]];
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMarginLeft =100;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMarginRight =-100;
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        [[MyShareInstance getInstancetype]shareWebPageToPlatformType:platformType ShareUrl:[NSString stringWithFormat:@"%@%@",ArBase,self.arScanModel.VerticalUrl] byViewController:self request:^(NSString *message, BOOL success, NSString *errorMsg, BOOL error) {
            
        }];
    }];
}

- (void)dealloc {
    [_userContentController removeScriptMessageHandlerForName:@"saomiao"];
    [_userContentController removeScriptMessageHandlerForName:@"fuwei"];
    [_userContentController removeScriptMessageHandlerForName:@"jietu"];
    [_userContentController removeScriptMessageHandlerForName:@"details"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    self.webView.navigationDelegate = nil;
    self.webView.UIDelegate = nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
