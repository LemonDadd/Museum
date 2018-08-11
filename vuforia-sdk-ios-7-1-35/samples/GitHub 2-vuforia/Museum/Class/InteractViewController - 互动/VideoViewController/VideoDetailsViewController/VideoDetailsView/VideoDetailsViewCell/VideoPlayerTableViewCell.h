//
//  VideoPlayerTableViewCell.h
//  Museum
//
//  Created by 关云秀 on 2018/1/7.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFTNetNotiView.h"
#import "ZFTPlayerView.h"
#import "ZFTPlayerOption.h"

typedef void(^VideoPlayerTableViewCellFull)(void);
typedef void(^VideoPlayerTableViewCellBack)(BOOL back);

@interface VideoPlayerTableViewCell : UITableViewCell<playerfullBtnOrBackBtnClickDelegate,playerPlayStatesDelegate,playerPlayLoadStatesDelegate,playerPlayBackStateDidChangeDelgate>
@property (nonatomic, strong)UIView *bgView;
@property(nonatomic,strong)ZFTPlayerView *playerShowView;
@property(nonatomic,strong)ZFTPlayerOption *playerOptions;//存放视频播放器的一些属性
@property(nonatomic,strong)ZFTNetNotiView *netShowView;//如果进来界面，没网或者4G网，用这个显示
@property(nonatomic, copy)NSString *url;

@property (nonatomic, copy)VideoPlayerTableViewCellFull videoPlayerTableViewCellFull;
@property (nonatomic, copy)VideoPlayerTableViewCellBack videoPlayerTableViewCellBack;

-(void)releasePlayerView;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier url:(NSString *)url;

@end
