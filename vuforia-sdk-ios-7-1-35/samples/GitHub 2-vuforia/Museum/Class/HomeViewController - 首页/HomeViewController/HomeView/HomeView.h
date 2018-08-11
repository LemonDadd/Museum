//
//  HomeView.h
//  Museum
//
//  Created by 关云秀 on 2017/11/29.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "HomeViewModelClass.h"

@interface HomeView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)BaseTableView *mainTableView;
@property (nonatomic, strong)HomeViewModelClass *modelClass;
@end
