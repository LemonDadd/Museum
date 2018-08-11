//
//  ZanAndShareView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ZanAndShareView.h"
#import "UShareUI.h"
#import "BaseViewController.h"

@implementation ZanAndShareView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor whiteColor];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.width.equalTo(@1);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
        }];
        
        _zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zanBtn setTitle:@"点赞" forState:UIControlStateNormal];
        _zanBtn.titleLabel.font = [UIFont fontByName:MFONT fontSize:15];
        [_zanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_zanBtn addTarget:self action:@selector(zanBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_zanBtn];
        [_zanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
            make.right.equalTo(line.mas_left);
        }];
        
        _zanBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 4);
        _zanBtn.titleEdgeInsets =UIEdgeInsetsMake(0, 4, 0, 0);
        
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setTitle:@"分享" forState:UIControlStateNormal];
        _shareBtn.titleLabel.font = [UIFont fontByName:MFONT fontSize:15];
        [_shareBtn setImage:[UIImage imageNamed:@"share_icon"] forState:UIControlStateNormal];
        [_shareBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(shareBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_shareBtn];
        [_shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self);
            make.left.equalTo(line.mas_right);
        }];
        _shareBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 4);
        _shareBtn.titleEdgeInsets =UIEdgeInsetsMake(0, 4, 0, 0);
    }
    return self;
}

- (void)zanBtnEvent:(UIButton *)sender {
    
    if ([UserInfoClass getUserInfoClass] == nil) {
        [(BaseViewController *)self.viewController gotoLoginViewController];
        return;
    }
    
    if (_coustomBlock) {
        _coustomBlock(sender);
    }
}

- (void)shareBtnEvent {
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine)]];
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMarginLeft =45;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMarginRight =-45;
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        [[MyShareInstance getInstancetype]shareWebPageToPlatformType:platformType  ShareUrl:self.shareUrl byViewController:self.viewController request:^(NSString *message, BOOL success, NSString *errorMsg, BOOL error) {
            
        }];
    }];
}


@end
