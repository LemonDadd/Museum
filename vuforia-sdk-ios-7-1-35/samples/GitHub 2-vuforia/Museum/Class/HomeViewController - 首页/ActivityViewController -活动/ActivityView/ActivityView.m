//
//  ActivityView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/4.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ActivityView.h"
#import "HomeViewActivityCell.h"
#import "ActivityContentViewController.h"
#import "ActivityModel.h"

@implementation ActivityView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTableView.delegate =self;
        _mainTableView.dataSource =self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.rowHeight = UITableViewAutomaticDimension;
        _mainTableView.estimatedRowHeight = 200;
        _mainTableView.estimatedSectionHeaderHeight = 0;
        _mainTableView.estimatedSectionFooterHeight = 0;
        [self addSubview:_mainTableView];
        [self setExtraCellLineHidden:_mainTableView];
        [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _modelClass = [[ActivityViewModelClass alloc]init];
        [self addHistoryData];
        [self upPull];
        
        
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

/**
 *  刷新数据
 */
- (void)addHistoryData{
    
    kWeakSelf(self);
    _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakself.modelClass.skip = 0;
        [weakself reStartRequestData];
    }];
    // 马上进入刷新状态
    [_mainTableView.mj_header beginRefreshing];
}

- (void)upPull {
    kWeakSelf(self);
    _mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakself.modelClass.skip++;
        [weakself reStartRequestData];
    }];
}

- (void)reStartRequestData {
    kWeakSelf(self);
    [_modelClass requestActivityrequest:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            [weakself updateData:weakself.modelClass.activityResource];
        } else {
            [weakself.mainTableView .mj_header endRefreshing];
            [weakself.mainTableView.mj_footer endRefreshing];
            [CustomView alertMessage:errorMsg view:weakself];
        }
    }];
}

- (void)updateData:(NSArray *)resourceData {
    [_mainTableView .mj_header endRefreshing];
    [_mainTableView.mj_footer endRefreshing];
    [_mainTableView.mj_footer setHidden:false];
    if (_modelClass.skip == 0) {
        [_allResource removeAllObjects];
        [_allResource addObjectsFromArray:[resourceData copy]];
        [_mainTableView reloadData];
        if (resourceData.count < _modelClass.size) {
            [_mainTableView.mj_footer setHidden:true];
        }
    } else {
        [_allResource addObjectsFromArray:[resourceData copy]];
        [_mainTableView reloadData];
        if (_allResource.count<(_modelClass.skip+1) *_modelClass.size) {
            [_mainTableView.mj_footer setHidden:true];
        }
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _modelClass.activityResource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeViewActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewActivityCell"];
    if (cell == nil) {
        cell = [[HomeViewActivityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeViewActivityCell"];
    }
    ActivityModel *model = _modelClass.activityResource[indexPath.section];
    [cell.bgImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:BigDefault]];;
    cell.titleLabel.text = model.name;
    cell.nameLabel.text = [NSString stringWithFormat:@"主持人:%@",model.host];
    cell.dateLabel.text =[NSString stringWithFormat:@"活动时间:%@",model.beginTime];
    cell.didianLabel.text = [NSString stringWithFormat:@"主讲地点:%@",model.place];
    cell.baomingLabel.text =[NSString stringWithFormat:@"报名人数:%ld人",(long)model.maxNumber];
    cell.peopleLabel.text = [NSString stringWithFormat:@"已报名:%ld人",(long)model.number];
    [cell setActivityBtnState:model.state];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ActivityModel *model = _modelClass.activityResource[indexPath.section];
    ActivityContentViewController *vc= [ActivityContentViewController new];
    vc.model = model;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

@end
