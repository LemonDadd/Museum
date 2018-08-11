//
//  ActivityView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/4.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "ActivityViewModelClass.h"

@interface ActivityView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)ActivityViewModelClass *modelClass;
@property (nonatomic, retain)NSMutableArray *allResource;

@end
