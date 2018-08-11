//
//  VideoDetailsView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "ZanAndShareView.h"
#import "VideoModel.h"
#import "VideoDetailsModelClass.h"
#import "VideoCommentMdoel.h"


@interface VideoDetailsView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UIView *bottomView;
@property (nonatomic, strong)UIButton *sendBtn;
@property (nonatomic, strong)UITextField *msgField;
@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)VideoModel *videoModel;
@property (nonatomic, strong)VideoDetailsModelClass *modelClass;
@property (nonatomic, retain)NSMutableArray *allResource;
@property (nonatomic, strong)NoDataView *noDataView;


- (void)relessVideo;


@end
