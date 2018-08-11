//
//  ActivityContentView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/14.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "ActivityContentViewModelClass.h"
#import "ActivityModel.h"

@interface ActivityContentView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)ActivityContentViewModelClass *modelClass;
@property (nonatomic, strong)ActivityModel *model;

@end
