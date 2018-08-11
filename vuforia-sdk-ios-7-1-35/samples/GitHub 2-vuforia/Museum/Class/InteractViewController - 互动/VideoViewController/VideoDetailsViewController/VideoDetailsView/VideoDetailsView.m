//
//  VideoDetailsView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "VideoDetailsView.h"
#import "VideoDetailsViewCell.h"
#import "VideoPlayerTableViewCell.h"
#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "VideoZanTableViewCell.h"


@implementation VideoDetailsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _bottomView = [UIView new];
        [self addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(self);
            make.height.mas_equalTo(50);
        }];
        
        _sendBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_sendBtn setTitle:@"评论" forState:UIControlStateNormal];
        [_sendBtn addTarget:self action:@selector(sendBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [_sendBtn setTitleColor:kColorWithHex(MCOLOR) forState:UIControlStateNormal];
        [_bottomView addSubview:_sendBtn];
        [_sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_bottomView);
            make.height.width.equalTo(_bottomView.mas_height);
            make.right.equalTo(_bottomView).offset(-20);
        }];
        
        
        UIView *msgView = [UIView new];
        msgView.layer.cornerRadius = 15;
        msgView.layer.masksToBounds = YES;
        msgView.layer.borderColor = kColorWithHex(MCOLOR).CGColor;
        msgView.layer.borderWidth = 1.f;
        [_bottomView addSubview:msgView];
        [msgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_bottomView).offset(10);
            make.bottom.equalTo(_bottomView).offset(-10);
            make.left.equalTo(_bottomView).offset(30);
            make.right.equalTo(_sendBtn.mas_left).offset(-10);
        }];
        
        _msgField = [UITextField new];
        _msgField.font = [UIFont fontByName:MFONT fontSize:16];
        _msgField.placeholder = @"说说你的感想";
        [msgView addSubview:_msgField];
        [_msgField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(msgView);
            make.left.equalTo(msgView).offset(10);
            make.right.equalTo(msgView).offset(-10);
            
        }];
        
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTableView.delegate =self;
        _mainTableView.dataSource =self;
        _mainTableView.rowHeight = UITableViewAutomaticDimension;
        _mainTableView.estimatedRowHeight = 200;
        _mainTableView.estimatedSectionHeaderHeight = 0;
        _mainTableView.estimatedSectionFooterHeight = 0;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_mainTableView];
        [self setExtraCellLineHidden:_mainTableView];
        [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.bottom.equalTo(_bottomView.mas_top);
            //make.top.equalTo(_zanAndShareToolView.mas_bottom);
        }];
        
        _allResource = [NSMutableArray array];
        _modelClass = [VideoDetailsModelClass new];
        if (@available(iOS 11.0, *)) {
            _mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
             self.viewController.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

/**
 *  刷新数据
 */
- (void)addHistoryData{
     [self reStartRequestData];
}

- (void)upPull {
    kWeakSelf(self);
    _mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakself.modelClass.skip++;
        [weakself reStartRequestData];
    }];
}

- (void)reStartRequestData {
    kWeakSelf(self);
    [_modelClass requestVideoCommentListByVideoId:_videoModel.Id request:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            [weakself updateData:weakself.modelClass.allResource];
        } else {
            [weakself.mainTableView.mj_footer endRefreshing];
            [CustomView alertMessage:errorMsg view:weakself];
        }
    }];
}

- (void)updateData:(NSArray *)resourceData {
    TTVIEW_RELEASE_SAFELY(_noDataView);
    [_mainTableView.mj_footer endRefreshing];
    [_mainTableView.mj_footer setHidden:false];
    if (_modelClass.skip == 0) {
        [_allResource removeAllObjects];
        [_allResource addObjectsFromArray:[resourceData copy]];
        [_mainTableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationFade];
        if (resourceData.count < _modelClass.size) {
            [_mainTableView.mj_footer setHidden:true];
        }
        if (resourceData.count == 0) {
            [self showNoDataView];
        }
    } else {
        [_allResource addObjectsFromArray:[resourceData copy]];
        [_mainTableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationFade];
        if (_allResource.count<(_modelClass.skip+1) *_modelClass.size) {
            [_mainTableView.mj_footer setHidden:true];
        }
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section ==1) {
        return 1;
    } else {
        return _allResource.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     kWeakSelf(self);
    if (indexPath.section == 0) {
        VideoPlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoPlayerTableViewCell"];
        if (cell == nil) {
            
            cell = [[VideoPlayerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VideoPlayerTableViewCell" url:self.videoModel.url];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        __block VideoPlayerTableViewCell *blockCell =cell;
        cell.videoPlayerTableViewCellFull = ^{
            [UIView animateWithDuration:0.25 animations:^{
                [weakself forceOrientationLandscape];
            }completion:^(BOOL finished) {
                CGRect playerFrame = CGRectMake(0, 0, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height);
                blockCell.playerShowView.frame = playerFrame;
            }];
        };
        
        cell.videoPlayerTableViewCellBack = ^(BOOL back) {
            if (back) {
                [weakself.viewController.navigationController popViewControllerAnimated:YES];
            }else {
                [weakself forceOrientationPortrait];
            }
        };
        
        return cell;
    }else if(indexPath.section ==1) {
        VideoZanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoZanTableViewCell"];
        if (cell == nil) {
            cell = [[VideoZanTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VideoZanTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if (_videoModel.favored) {
            [cell.zanAndShareToolView.zanBtn setImage:[UIImage imageNamed:@"dianzan_ico"] forState:UIControlStateNormal];
        } else {
            [cell.zanAndShareToolView.zanBtn setImage:[UIImage imageNamed:@"zan_icon"] forState:UIControlStateNormal];
        }
        cell.zanAndShareToolView.shareUrl =self.videoModel.url;
        cell.zanAndShareToolView.coustomBlock = ^(UIButton *sender) {
            [weakself requestVideoZan];
        };

        return cell;
    }else {
        VideoDetailsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoDetailsViewCell"];
        if (cell == nil) {
            cell = [[VideoDetailsViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VideoDetailsViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        VideoCommentMdoel *model = _allResource[indexPath.row];
        cell.contentLabel.text = model.content;
        cell.dateLabel.text = model.createDate;
        cell.name.text =model.createBy.username;
        [cell.leftImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",PhotoBase,model.createBy.photo]] placeholderImage:nil];
        return cell;
    }
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

-(void)setVideoModel:(VideoModel *)videoModel {
    _videoModel = videoModel;
    [self addHistoryData];
    [self upPull];
}

- (void)requestVideoZan {
    kWeakSelf(self)
    [[CustomView getInstancetype]showWaitView:@"请稍后..." byView:self];
    if (_videoModel.favored) {
        [_modelClass requestVideoFavorCancleByVideoId:_videoModel.Id request:^(NSString *errorMsg) {
            [[CustomView getInstancetype]closeHUD];
            if (errorMsg == nil) {
                weakself.videoModel.favored = !weakself.videoModel.favored;
                [_mainTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationFade];
            }else {
                [CustomView alertMessage:errorMsg view:self];
            }
        }];
    }else {
        [_modelClass requestVideoFavorByVideoId:_videoModel.Id request:^(NSString *errorMsg) {
            [[CustomView getInstancetype]closeHUD];
            if (errorMsg == nil) {
                weakself.videoModel.favored = !weakself.videoModel.favored;
               [_mainTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationFade];
            }else {
                [CustomView alertMessage:errorMsg view:self];
            }
        }];
    }
}

- (void)sendBtnEvent {
    [_sendBtn setUserInteractionEnabled:NO];
    [self.msgField resignFirstResponder];
    if (_msgField.text.length == 0 ) {
        [CustomView alertMessage:@"请输入您的评论" view:self];
        return;
    }
    kWeakSelf(self);
    [_modelClass requestVideoAddCommentByVideoId:_videoModel.Id Content:_msgField.text request:^(NSString *errorMsg) {
        [weakself.sendBtn setUserInteractionEnabled:YES];
        [weakself.msgField setText:@""];
        if (errorMsg == nil) {
            [self reStartRequestData];
        }else {
            [CustomView alertMessage:errorMsg view:self];
        }
    }];
}
//强制竖屏
- (void)forceOrientationPortrait
{
    _mainTableView.scrollEnabled = YES;
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait=YES;
    appdelegate.isForceLandscape=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.viewController.view.window];
    
    BaseNavigationController *navi = (BaseNavigationController *)self.viewController.navigationController;
    navi.interfaceOrientation = UIInterfaceOrientationPortrait;
    navi.interfaceOrientationMask = UIInterfaceOrientationMaskPortrait;
    //设置屏幕的转向为竖屏
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
    _bottomView.hidden = NO;
    [_bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(50);
    }];
}

#pragma  mark 横屏设置
//强制横屏
- (void)forceOrientationLandscape
{
    _mainTableView.scrollEnabled = NO;
    _bottomView.hidden = YES;
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForceLandscape=YES;
    appdelegate.isForcePortrait=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.viewController.view.window];
    BaseNavigationController *navi = (BaseNavigationController *)self.viewController.navigationController;
    navi.interfaceOrientation =   UIInterfaceOrientationLandscapeRight;
    navi.interfaceOrientationMask = UIInterfaceOrientationMaskLandscapeRight;
    
    //强制翻转屏幕，Home键在右边。
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
    _bottomView.hidden = YES;
    [_bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@0);
    }];
}

- (void)relessVideo {
    NSIndexPath *path=[NSIndexPath indexPathForRow:0 inSection:0];
    VideoPlayerTableViewCell *cell = (VideoPlayerTableViewCell *)[_mainTableView cellForRowAtIndexPath:path];
    [cell releasePlayerView];
}


- (void)showNoDataView {
    TTVIEW_RELEASE_SAFELY(_noDataView);
    if (_noDataView == nil) {
        _noDataView = [NoDataView new];
        _noDataView.noDataImageView.image = [UIImage imageNamed:@"no_comment"];
        [_mainTableView addSubview:_noDataView];
        [_noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(_bottomView.mas_top);
            make.top.equalTo(self.mas_centerY);
        }];
    }
}

@end
