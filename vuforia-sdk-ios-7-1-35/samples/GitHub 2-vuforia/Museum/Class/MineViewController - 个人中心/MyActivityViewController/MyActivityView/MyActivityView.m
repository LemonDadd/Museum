//
//  MyActivityView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyActivityView.h"
#import "MyActivityViewCell.h"
#import "ActivityContentViewController.h"

@implementation MyActivityView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView.delegate =self;
        _mainTableView.dataSource =self;
        _mainTableView.rowHeight = UITableViewAutomaticDimension;
        _mainTableView.estimatedRowHeight = 200;
        _mainTableView.estimatedSectionHeaderHeight = 0;
        _mainTableView.estimatedSectionFooterHeight = 0;
        [self addSubview:_mainTableView];
        [self setExtraCellLineHidden:_mainTableView];
        [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [self addHistoryData];
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [tableView setTableFooterView:view];
}

/**
 *  刷新数据
 */
- (void)addHistoryData{
    
    kWeakSelf(self);
    _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself requestResvervationMime];
    }];
    // 马上进入刷新状态
    [_mainTableView.mj_header beginRefreshing];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _allResource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyActivityViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyActivityViewCell"];
    if (cell == nil) {
        cell = [[MyActivityViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyActivityViewCell"];
    }
    ActivityModel *model = _allResource[indexPath.section];
    [cell.leftView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:BigDefault]];;
    cell.nameLabel.text = model.name;
    cell.timeLabel.text =[NSString stringWithFormat:@"活动时间:%@",model.beginTime];
    cell.xianzhiNum.text =[NSString stringWithFormat:@"报名人数:%ld人",(long)model.maxNumber];
    cell.baomingNum.text = [NSString stringWithFormat:@"已报名:%ld人",(long)model.number];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ActivityModel *model = _allResource[indexPath.section];
    ActivityContentViewController *vc= [ActivityContentViewController new];
    vc.model = model;
    vc.isMy = YES;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section   {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (void)requestResvervationMime {
    [AllInterfaceRequest requestMyActivityByRequest:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            [_mainTableView.mj_header endRefreshing];
            _allResource = message;
            [_mainTableView reloadData];
        } else {
            [CustomView alertMessage:errorMsg view:self];
        }
    }];
}



@end
