//
//  MyActivityApplyView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyActivityApplyView.h"
#import "MyActivityApplyViewCell.h"
#import "ActivityModel.h"

@implementation MyActivityApplyView

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
    
    MyActivityApplyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyActivityApplyViewCell"];
    if (cell == nil) {
        cell = [[MyActivityApplyViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyActivityApplyViewCell"];
    }
    ActivityParticipantModel *model = _allResource[indexPath.section];
    cell.nameLabel.text = model.name;
    //cell.name.text = model.name;
    cell.phoneLabel.text =[NSString stringWithFormat:@"手机号:%@",model.mobile];
    cell.idLabel.text =[NSString stringWithFormat:@"身份证:%@",model.idNumber];
    if ([model.mobile isEqualToString:[UserInfoClass getUserInfoClass].mobile]) {
         [cell.leftView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",PhotoBase,[UserInfoClass getUserInfoClass].photo]] placeholderImage:[UIImage imageNamed:@"icon_logo"]];
    }else {
        cell.leftView.image =[UIImage imageNamed:@"icon_logo"];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)setAllResource:(NSArray *)allResource {
    _allResource = allResource;
    [_mainTableView reloadData];
}

@end
