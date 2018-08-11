//
//  ActivityContentView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/14.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ActivityContentView.h"
#import "ExhibitionContentViewTopCell.h"
#import "ActivityContentViewCell.h"
#import "ExhibitionContentViewTextCell.h"
#import "SubscribeViewCellFooterView.h"
#import "SubscribeViewAlertView.h"
#import "BaseViewController.h"
@implementation ActivityContentView

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
        _modelClass = [ActivityContentViewModelClass new];
        
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row ==0) {
        ExhibitionContentViewTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExhibitionContentViewTopCell"];
        if (cell == nil) {
            cell = [[ExhibitionContentViewTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ExhibitionContentViewTopCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell.topImageView sd_setImageWithURL:[NSURL URLWithString:_model.img] placeholderImage:[UIImage imageNamed:BigDefault]];
        cell.zanAndShareView.shareUrl =ShareActivity(_model.Id);
        if (_model.collected) {
             [cell.zanAndShareView.zanBtn setImage:[UIImage imageNamed:@"已收藏"] forState:UIControlStateNormal];
        } else {
             [cell.zanAndShareView.zanBtn setImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
        }
        kWeakSelf(self);
        cell.zanAndShareView.coustomBlock = ^(UIButton *sender) {
            if (weakself.model.collected) {
                [weakself activityFavorCancel];
            } else {
                [weakself activityFavor];
            }
        };
        
        return cell;
    } else if (indexPath.row ==1) {
        ActivityContentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityContentViewCell"];
        if (cell == nil) {
            cell = [[ActivityContentViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ActivityContentViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.titleLabel.text = _model.name;//@"中国军民建筑发展史--王志文";
        cell.dateLabel.text =[NSString stringWithFormat:@"展览时间:%@-%@",_model.beginTime,_model.endTime]; //@"展览时间:2017.09.09-2018.09.09";
        cell.nameLabel.text =[NSString stringWithFormat:@"主持人:%@",_model.host]; //@"主持人:秀秀";
        cell.baomingLabel.text =[NSString stringWithFormat:@"报名人数:%ld",(long)_model.maxNumber];// @"报名人数:100人";
        cell.peopleLabel.text =[NSString stringWithFormat:@"已报名:%ld",(long)_model.number]; //@"已报名:80人";
        return cell;
    }else {
        ExhibitionContentViewTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExhibitionContentViewTextCell"];
        if (cell == nil) {
            cell = [[ExhibitionContentViewTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ExhibitionContentViewTextCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.txtLabel.text =_model.intro;// @"    意大利由亚平宁半岛及西西里岛、萨丁岛组成，北连欧洲大陆，东、西、南三面环海，是欧洲文明的摇篮。这里拥有众多享誉世界的文化遗产。意大利在陶瓷领域也取得了骄人成就，马约里卡陶瓷，造型独特，图案精美，令人称道。意大利北部的法恩扎是马约里卡的重要产地，其制陶传统可追溯至中世纪时期。公元13世纪，伊斯兰文化中的锡釉陶器经西班牙传入意大利，再经过文艺复兴运动的催化，希腊罗马的神话故事、基督教的宗教故事等当时流行的艺术题材成为马约里卡陶艺的主要装饰素材，在自由、开放的文化氛围中，绽放出新奇的艺术之花。以法恩扎为中心的制陶工坊博采众长，不断探索创新，创作了大量传世之作，马约里卡盛名远扬。意大利法恩扎国际陶瓷博物馆是目前世界上最大的专门收藏陶瓷器的博物馆，藏品多达五万余件。此次展出的近150件精品，不仅将意大利锡釉陶近千年的发展历程具体而微地加以展示，更为中意两国文化交流续写了新的篇章。";
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 150.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    SubscribeViewCellFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SubscribeViewCellFooterView"];
    if (footer == nil) {
        footer = [[SubscribeViewCellFooterView alloc]initWithReuseIdentifier:@"SubscribeViewCellFooterView"];
    }
    
    if (_model.state ==2) {
        [footer.yuyueBtn setTitle:@"活动已结束" forState:UIControlStateNormal];
    }else
    [footer.yuyueBtn setTitle:@"报名" forState:UIControlStateNormal];
    [footer.yuyueBtn addTarget:self action:@selector(baoMing) forControlEvents:UIControlEventTouchUpInside];
    return footer;
}


- (void)activityFavor {
    _model.collected = YES;
    [_mainTableView reloadData];
    [_modelClass requestActivityFavorBycategoryId:_model.Id request:^(NSString *errorMsg) {
        if (errorMsg) {
             [CustomView alertMessage:errorMsg view:self];
        }
    }];
}

- (void)activityFavorCancel {
    _model.collected = NO;
    [_mainTableView reloadData];
    [_modelClass requestActivityFavorCancleBycategoryId:_model.Id request:^(NSString *errorMsg) {
        if (errorMsg) {
           [CustomView alertMessage:errorMsg view:self];
        }
    }];
}

- (void)baoMing {
    
    if (_model.state == 2) {
        [CustomView alertMessage:@"活动已结束" view:self];
        return;
    }
    
    if ([UserInfoClass getUserInfoClass] == nil) {
        [(BaseViewController *)self.viewController gotoLoginViewController];
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
            [weakself requestActivityParticipate];
        }
    };
    [alert layoutIfNeeded];
}

- (void)requestActivityParticipate {
    [[CustomView getInstancetype]showWaitView:@"请稍后..." byView:self];
    [_modelClass requestActivityParticipateByActivityId:_model.Id request:^(NSString *errorMsg) {
        [[CustomView getInstancetype]closeHUD];
        if (errorMsg == nil) {
            [CustomView alertMessage:@"报名成功" view:self];
        } else {
            [CustomView alertMessage:errorMsg view:self];
        }
    }];
}

-(void)setModel:(ActivityModel *)model  {
    _model = model;
    [_mainTableView reloadData];
    kWeakSelf(self);
    [_modelClass requestActivityIsFavorByActivityId:_model.Id request:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            weakself.model.collected =weakself.modelClass.isFavor;
            [weakself.mainTableView reloadData];
        }else {
            
        }
    }];
}

@end
