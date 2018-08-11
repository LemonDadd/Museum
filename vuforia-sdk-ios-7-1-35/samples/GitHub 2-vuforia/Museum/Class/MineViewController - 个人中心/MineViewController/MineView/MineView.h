//
//  MineView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/7.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "MineViewModelClass.h"

@interface MineView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)BaseTableView *mainTableView;
@property (nonatomic, strong)NSArray *imageArray;
@property (nonatomic, strong)NSArray *titleArray;
@property (nonatomic, strong)MineViewModelClass *modelClass;

@end
