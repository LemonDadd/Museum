//
//  MyActivityApplyView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"

@interface MyActivityApplyView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)NSArray *allResource;

@end
