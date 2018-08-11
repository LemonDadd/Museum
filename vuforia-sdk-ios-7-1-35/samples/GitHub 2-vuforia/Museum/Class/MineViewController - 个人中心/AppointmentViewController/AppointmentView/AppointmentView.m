//
//  AppointmentView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "AppointmentView.h"
#import "AppointmentViewCell.h"
#import "AppointmentModel.h"

@implementation AppointmentView

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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allResource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppointmentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppointmentViewCell"];
    if (cell == nil) {
        cell = [[AppointmentViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AppointmentViewCell"];
    }
    if (_allResource.count>indexPath.row) {
        AppointmentModel *model = _allResource[indexPath.row];
        cell.titleLabel.text = @"太原博物馆";
        //cell.leftlabel.text =model.name;
        cell.nameLabel.text = [NSString stringWithFormat:@"姓名:%@",model.name];
        cell.phoneLabel.text =[NSString stringWithFormat:@"手机号:%@",model.mobile] ;
        cell.dateLabel.text = [NSString stringWithFormat:@"预约日期:%@",model.resvDate];
        cell.timeLabel.text = [NSString stringWithFormat:@"预约时间: %@-%@",model.beginTime,model.endTime];
        if ([model.mobile isEqualToString:[UserInfoClass getUserInfoClass].mobile]) {
            [cell.leftView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",PhotoBase,[UserInfoClass getUserInfoClass].photo]] placeholderImage:[UIImage imageNamed:@"icon_logo"]];
        }else {
            cell.leftView.image =[UIImage imageNamed:@"icon_logo"];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)requestResvervationMime {
    [AllInterfaceRequest requestResvervationMimeByRequest:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        [[CustomView getInstancetype]closeHUD];
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
