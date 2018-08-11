//
//  MyFavoriteView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/7.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyFavoriteView.h"
#import "MyFavoriteViewTableViewCell.h"
#import "CollectionDetailsViewController.h"

@implementation MyFavoriteView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView.backgroundColor = [UIColor whiteColor];
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
        _modelClass = [MyFavoriteViewModelClass new];
        [self addHistoryData];
        [self upPull];
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
    [_modelClass requestCollectionMyFavoriteViewRequest:^(NSString *errorMsg) {
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


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _allResource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyFavoriteViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyFavoriteViewTableViewCell"];
    if (cell == nil) {
        cell = [[MyFavoriteViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyFavoriteViewTableViewCell"];
    }
    CollectionModel *m = _allResource[indexPath.section];
    [cell.leftImageView sd_setImageWithURL:[NSURL URLWithString:m.img] placeholderImage:[UIImage imageNamed:BigDefault]];
    cell.nameLabel.text =m.name;
    cell.detailLabel.text = [NSString stringWithFormat:@"年代:%@",m.period];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kWeakSelf(self);
    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                         title:@"取消\n收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                                                             [weakself deleteFavoriteByindx:indexPath];
                                                                         }];
    rowAction.backgroundColor =kColorWithHex(MCOLOR);
    
    NSArray *arr = @[rowAction];
    return arr;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView setEditing:NO animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section   {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CollectionModel *m = _allResource[indexPath.section];
    CollectionDetailsViewController *vc =[CollectionDetailsViewController new];
    vc.model = m;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}



- (void)deleteFavoriteByindx:(NSIndexPath *)indexPath {
    
    kWeakSelf(self);
    
     CollectionModel *m = _allResource[indexPath.section];
    [_modelClass requestCollectionFavorCancleBycategoryId:m.Id Request:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            [_allResource removeObjectAtIndex:indexPath.section];
            [weakself.mainTableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
            [CustomView alertMessage:@"取消收藏成功" view:weakself];
        }else {
            [CustomView alertMessage:errorMsg view:weakself];
        }
    }];
}

@end
