//
//  VideoListView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "VideoListView.h"
#import "VideoListViewCell.h"
#import "VideoDetailsViewController.h"
#import "VideoModel.h"


@implementation VideoListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView.delegate =self;
        _mainTableView.dataSource =self;
        _mainTableView.rowHeight = UITableViewAutomaticDimension;
        _mainTableView.estimatedRowHeight = 200;
        _mainTableView.estimatedSectionHeaderHeight = 0;
        _mainTableView.estimatedSectionFooterHeight = 0;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_mainTableView];
        [self setExtraCellLineHidden:_mainTableView];
        [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _allResource = [NSMutableArray array];
        _modelClass = [[VideoListModelClass alloc]init];
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [tableView setTableFooterView:view];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _allResource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoListViewCell"];
    if (cell == nil) {
        cell = [[VideoListViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VideoListViewCell"];
    }
    VideoModel *model = _allResource[indexPath.section];
    [cell.topBgImageView sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:BigDefault]];
    cell.nameLabel.text = model.name;
    cell.watchLabel.text= [NSString stringWithFormat:@"%ld",(long)model.viewNumber];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    VideoModel *model = _allResource[indexPath.section];
    VideoDetailsViewController *vc= [VideoDetailsViewController new];
    vc.model = model;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

-(void)setType:(NSInteger)type {
    _type = type;
    [self addHistoryData];
    [self upPull];
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
    [_modelClass requestVideoListByCategory:[NSString stringWithFormat:@"%ld",(long)_type] request:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            [weakself updateData:weakself.modelClass.allResource];
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

@end

