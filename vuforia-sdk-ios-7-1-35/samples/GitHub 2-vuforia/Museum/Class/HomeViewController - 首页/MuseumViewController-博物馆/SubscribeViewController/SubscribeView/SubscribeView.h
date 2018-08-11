//
//  SubscribeView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/3.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "SubscribeViewModelClass.h"

@interface SubscribeView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTabView;
@property (nonatomic, strong)UIView *navBarView;
@property (nonatomic, strong)MuseumModel *model;
@property (nonatomic, strong)SubscribeViewModelClass *modelClass;
@end
