//
//  ExhibitionView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/6.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "ExhibitionModelClass.h"

@interface ExhibitionView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)ExhibitionModelClass *modelClass;
@property (nonatomic, retain)NSMutableArray *allResource;

@end
