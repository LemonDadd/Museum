//
//  HomeView.m
//  Museum
//
//  Created by 关云秀 on 2017/11/29.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "HomeView.h"
#import "HomeViewTopCell.h"
#import "HomeViewButtonCell.h"
#import "HomeViewLampCell.h"
#import "HomeViewActivityCell.h"
#import "HomeViewCellHeaderView.h"
#import "LoginViewController.h"
#import "MuseumViewController.h"
#import "AntiqueViewController.h"
#import "BaseNavigationController.h"
#import "ActivityViewController.h"
#import "ExhibitionViewController.h"
#import "LampViewController.h"
#import "ActivityContentViewController.h"


@implementation HomeView


- (instancetype)init
{
    self = [super init];
    if (self) {
        _mainTableView = [[BaseTableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTableView.backgroundColor = kColorWithHex(0xf9f9f9);
        _mainTableView.delegate =self;
        _mainTableView.dataSource =self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:_mainTableView];
        [self setExtraCellLineHidden:_mainTableView];
        [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.equalTo(self);
            make.bottom.equalTo(self).offset(-[DeviceInfo ScreenNavgationBarHeight]);
        }];
        
        _modelClass = [[HomeViewModelClass alloc]init];
        if (@available(iOS 11.0, *)) {
            _mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
           
        }
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
        [weakself reStartRequestData];
    }];
    // 马上进入刷新状态
    [_mainTableView.mj_header beginRefreshing];
}

- (void)reStartRequestData {
    kWeakSelf(self);
    [_modelClass requestHomerequest:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            [weakself updateData];
        }else {
            [weakself.mainTableView .mj_header endRefreshing];
            [CustomView alertMessage:errorMsg view:weakself];
        }
    }];
}


- (void)updateData {
    [_mainTableView .mj_header endRefreshing];
    [_mainTableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section ==3) {
        return _modelClass.activityResource.count;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    if (indexPath.section == 0) {
        HomeViewTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewTopCell"];
        if (cell == nil) {
            cell = [[HomeViewTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeViewTopCell"];
        }
        [cell setSdcycleImages:_modelClass.SlideshowList];
        return cell;
    } else if (indexPath.section == 1) {
        HomeViewButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewButtonCell"];
        if (cell == nil) {
            cell = [[HomeViewButtonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeViewButtonCell"];
        }
        cell.btnEvent = ^(NSInteger indx) {
            [weakself homeViewButtonCellDidSelectByIndx:indx];
        };
        
        return cell;
    } else if (indexPath.section == 2) {
        HomeViewLampCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewLampCell"];
        if (cell == nil) {
            cell = [[HomeViewLampCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeViewLampCell"];
        }
        cell.allResource = self.modelClass.mingxingRes;
        
        return cell;
    } else {
        HomeViewActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewActivityCell"];
        if (cell == nil) {
            cell = [[HomeViewActivityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeViewActivityCell"];
        }
        ActivityModel *model = _modelClass.activityResource[indexPath.row];
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
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section ==2 || section ==3) {
        HomeViewCellHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HomeViewCellHeaderView"];
        if (header == nil) {
            header = [[HomeViewCellHeaderView alloc]initWithReuseIdentifier:@"HomeViewCellHeaderView"];
        }
        if (section == 2) {
            header.titleLabel.text = @"文物大家说";
        } else {
            header.titleLabel.text = @"最新活动";
        }
        return header;
    } else {
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2 ) {
        return 10.f;
    }
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2 || section == 3) {
        return 58.f;
    }
    return CGFLOAT_MIN;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    if (indexPath.section == 2) {
        LampViewController *vc = [LampViewController new];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.section == 3) {
        ActivityModel *model = _modelClass.activityResource[indexPath.row];
        ActivityContentViewController *vc = [ActivityContentViewController new];
        vc.model = model;
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
    
}


- (void)homeViewButtonCellDidSelectByIndx:(NSInteger)indx {
    switch (indx) {
        case 0:{
            MuseumViewController *vc = [MuseumViewController new];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            AntiqueViewController *vc = [AntiqueViewController new];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            ExhibitionViewController *vc = [ExhibitionViewController new];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            ActivityViewController *vc = [ActivityViewController new];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
