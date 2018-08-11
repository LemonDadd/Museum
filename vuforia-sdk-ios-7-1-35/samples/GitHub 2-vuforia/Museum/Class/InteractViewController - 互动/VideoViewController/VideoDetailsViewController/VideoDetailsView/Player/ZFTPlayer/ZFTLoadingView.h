//
//  ZFTLoadingView.h
//  IJKplayerTest
//
//  Created by 张芳涛 on 2017/4/20.
//  Copyright © 2017年 张芳涛. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^backbtnCLickBlock)(void);

@interface ZFTLoadingView : UIView
/*
 提示界面的返回按钮
 */
@property(nonatomic,strong)UIButton *backBtn;
/*
 点击返回按钮的回调方法
 */
@property(nonatomic,copy)backbtnCLickBlock backBlock;
/*
 显示加载框并且显示加载动画
 */
-(void)showAndStartAnimation;
/*
 隐藏加载框并且停止加载动画
 */
-(void)hideAndStopAnimation;

@end
