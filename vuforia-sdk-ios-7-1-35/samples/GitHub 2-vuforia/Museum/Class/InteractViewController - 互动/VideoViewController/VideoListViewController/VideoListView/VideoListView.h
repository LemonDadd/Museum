//
//  VideoListView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "VideoListModelClass.h"


@interface VideoListView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, assign)NSInteger type;
@property (nonatomic, strong)VideoListModelClass *modelClass;
@property (nonatomic, retain)NSMutableArray *allResource;

@end
