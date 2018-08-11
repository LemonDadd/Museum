//
//  MyFavoriteActityView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "MyFavoriteViewModelClass.h"

@interface MyFavoriteActityView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, assign)NSInteger type;
@property (nonatomic, strong)MyFavoriteViewModelClass *modelClass;
@property (nonatomic, retain)NSMutableArray *allResource;
@end
