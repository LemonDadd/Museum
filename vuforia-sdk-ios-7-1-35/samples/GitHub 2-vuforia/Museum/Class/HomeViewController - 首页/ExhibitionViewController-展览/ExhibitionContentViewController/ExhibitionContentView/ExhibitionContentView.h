//
//  ExhibitionContentView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "ExhibitionModel.h"
#import "ExhibitionContentViewModelClass.h"

@interface ExhibitionContentView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)ExhibitionModel *model;
@property (nonatomic, strong)ExhibitionContentViewModelClass *modelClass;

@end
