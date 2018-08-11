//
//  SubscribeView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/3.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SubscribeView.h"
#import "SubscribeViewTopCell.h"
#import "SubscribeViewBottomCell.h"
#import "SubscribeViewCellHeaderView.h"
#import "SubscribeViewCellFooterView.h"
#import "SubscribeViewAlertView.h"
#import "BaseViewController.h"

@implementation SubscribeView
{
    NSString *dateStr;
    NSString *timeStr;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _mainTabView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTabView.delegate =self;
        _mainTabView.dataSource =self;
        _mainTabView.scrollEnabled = YES;
        _mainTabView.rowHeight = UITableViewAutomaticDimension;
        _mainTabView.estimatedRowHeight = 200;
        _mainTabView.estimatedSectionHeaderHeight = 0;
        _mainTabView.estimatedSectionFooterHeight = 0;
        _mainTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_mainTabView];
        [self setExtraCellLineHidden:_mainTabView];
        [_mainTabView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _modelClass = [SubscribeViewModelClass new];
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        SubscribeViewTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubscribeViewTopCell"];
        if (cell == nil) {
            cell = [[SubscribeViewTopCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"SubscribeViewTopCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.contentLabel.text = _model.resv;
        return cell;
    } else {
        SubscribeViewBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubscribeViewBottomCell"];
        if (cell == nil) {
            cell = [[SubscribeViewBottomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SubscribeViewBottomCell"];
        }
        if (indexPath.row ==1) {
            cell.titleLabel.text = @"参观日期";
            if (dateStr) {
                cell.contentLabel.text = dateStr;
            }else {
                cell.contentLabel.text = @"请选择参观日期";
            }
            
        } else {
            cell.titleLabel.text = @"参观时间";
            if (timeStr) {
                cell.contentLabel.text = timeStr;
            }else {
                cell.contentLabel.text = @"请选择参观时间";
            }
        }
        
        return cell;
    }
   
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SubscribeViewCellHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SubscribeViewCellHeaderView"];
    if (header == nil) {
        header = [[SubscribeViewCellHeaderView alloc]initWithReuseIdentifier:@"SubscribeViewCellHeaderView"];
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 58.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 150.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    SubscribeViewCellFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SubscribeViewCellFooterView"];
    if (footer == nil) {
        footer = [[SubscribeViewCellFooterView alloc]initWithReuseIdentifier:@"SubscribeViewCellFooterView"];
    }
    [footer.yuyueBtn addTarget:self action:@selector(yuyeBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    return footer;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 1) {
        [self showDayAlert:cell];
    }else if(indexPath.row ==2){
        [self showTimeAlert:cell];
    }
}


- (void)yuyeBtnEvent {
    if ([UserInfoClass getUserInfoClass] == nil) {
        [(BaseViewController *)self.viewController gotoLoginViewController];
        return;
    }
    
    if (dateStr.length == 0) {
        [CustomView alertMessage:@"请选择参观日期" view:self];
        return;
    }
    
    if (timeStr.length == 0) {
        [CustomView alertMessage:@"请选择参观时间" view:self];
        return;
    }
    
    
    
    SubscribeViewAlertView *alert = [SubscribeViewAlertView new];
    [[CustomView getInstancetype]windowAlertBy:alert isTouchClose:NO color:nil animated:YES addDelegate:nil];
    [alert mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(alert.superview);
    }];
    kWeakSelf(self);
    alert.alertViewCustomBlock = ^(BOOL close, NSString *name, NSString *phone, NSString *idCord) {
        [[CustomView getInstancetype]closeWindowAlertWithanimated:YES];
        if (close == false) {
            weakself.modelClass.name = name;
            weakself.modelClass.idCord = idCord;
            weakself.modelClass.phone = phone;
            [weakself requestResvervationAdd];
        }
    };
    [alert layoutIfNeeded];
}


- (void)requestResvervationAdd {
    [[CustomView getInstancetype]showWaitView:@"请稍后..." byView:self];
    [self.modelClass requestResvervationAddByrequest:^(NSString *errorMsg) {
        [[CustomView getInstancetype]closeHUD];
        if (errorMsg == nil) {
            [CustomView alertMessage:@"预约成功" view:self];
        } else {
             [CustomView alertMessage:errorMsg view:self];
        }
    }];
}

- (void)showTimeAlert:(UITableViewCell *)cell {
    NSMutableArray *timeArray =[NSMutableArray array];
    for (ResvTimeModel *obj in _model.timeList) {
        NSString *str = [NSString stringWithFormat:@"%@-%@(可预约%ld人)",obj.beginTime,obj.endTime,(long)obj.bookableNum];
        [timeArray addObject:str];
    }
    [JhlvShowAlertController shareInstance].sender =cell;
    [[JhlvShowAlertController shareInstance]showSheet:@"选择时间" message:nil cancelTitle:nil titleArray:timeArray viewController:[self viewController] confirm:^(NSInteger buttonTag) {
        timeStr = timeArray[buttonTag];
        _modelClass.timeModel =_model.timeList[buttonTag];
        [_mainTabView reloadData];
    }];
}

- (void)showDayAlert:(UITableViewCell *)cell {
    NSMutableArray *dateArray =[NSMutableArray array];
    for (ResvDateModel *obj in _model.dateList) {
        NSString *str = [NSString stringWithFormat:@"%@ %@",obj.date,obj.week];
        [dateArray addObject:str];
    }
    [JhlvShowAlertController shareInstance].sender =cell;
    [[JhlvShowAlertController shareInstance]showSheet:@"选择日期" message:nil cancelTitle:nil titleArray:dateArray viewController:[self viewController] confirm:^(NSInteger buttonTag) {
        dateStr = dateArray[buttonTag];
        _modelClass.dateModel =_model.dateList[buttonTag];
        [_mainTabView reloadData];
    }];
}

- (NSArray *)getOneWeek {
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i=0; i<7; i++) {
        NSDate  *date = [NSDate jk_dateAfterDate:[NSDate date] day:i+1];
        NSString * timeStr = [NSString stringWithFormat:@"%@ %@",[NSDate jk_formatYMD:date],[NSDate jk_dayFromWeekday:date]];
        [arr addObject:timeStr];
    }
    return [NSArray arrayWithArray:arr];
}

- (void)leftBtnEvent {
    [self.viewController.navigationController popViewControllerAnimated:YES];
}

-(void)setModel:(MuseumModel *)model {
    _model = model;
    [_mainTabView reloadData];
}

@end
