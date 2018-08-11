//
//  MyFavoriteView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/7.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "MyFavoriteViewModelClass.h"

@interface MyFavoriteView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)MyFavoriteViewModelClass *modelClass;
@property (nonatomic, retain)NSMutableArray *allResource;
@end
