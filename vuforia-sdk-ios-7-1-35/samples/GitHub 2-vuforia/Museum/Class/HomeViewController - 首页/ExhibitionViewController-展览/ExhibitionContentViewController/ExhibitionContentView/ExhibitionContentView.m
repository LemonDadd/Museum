//
//  ExhibitionContentView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ExhibitionContentView.h"
#import "ExhibitionContentViewTopCell.h"
#import "ExhibitionContentViewCell.h"
#import "ExhibitionContentViewTextCell.h"

@implementation ExhibitionContentView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
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
        _modelClass = [ExhibitionContentViewModelClass new];
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
        cell.zanAndShareView.shareUrl = ShareExhibition(_model.Id);
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
        ExhibitionContentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExhibitionContentViewCell"];
        if (cell == nil) {
            cell = [[ExhibitionContentViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ExhibitionContentViewCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.text = _model.name;//@"中国军民建筑发展史--王志文";
        cell.dateLabel.text =[NSString stringWithFormat:@"展览时间:%@-%@",_model.beginTime,_model.endTime]; //@"展览时间:2017.09.09-2018.09.09";
        cell.didianLabel.text =[NSString stringWithFormat:@"展览地点:%@",_model.place];// @"展览地点:山西博物院一层临展厅";
        return cell;
    }else {
        ExhibitionContentViewTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExhibitionContentViewTextCell"];
        if (cell == nil) {
            cell = [[ExhibitionContentViewTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ExhibitionContentViewTextCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.txtLabel.text = _model.intro;//@"    意大利由亚平宁半岛及西西里岛、萨丁岛组成，北连欧洲大陆，东、西、南三面环海，是欧洲文明的摇篮。这里拥有众多享誉世界的文化遗产。意大利在陶瓷领域也取得了骄人成就，马约里卡陶瓷，造型独特，图案精美，令人称道。意大利北部的法恩扎是马约里卡的重要产地，其制陶传统可追溯至中世纪时期。公元13世纪，伊斯兰文化中的锡釉陶器经西班牙传入意大利，再经过文艺复兴运动的催化，希腊罗马的神话故事、基督教的宗教故事等当时流行的艺术题材成为马约里卡陶艺的主要装饰素材，在自由、开放的文化氛围中，绽放出新奇的艺术之花。以法恩扎为中心的制陶工坊博采众长，不断探索创新，创作了大量传世之作，马约里卡盛名远扬。意大利法恩扎国际陶瓷博物馆是目前世界上最大的专门收藏陶瓷器的博物馆，藏品多达五万余件。此次展出的近150件精品，不仅将意大利锡釉陶近千年的发展历程具体而微地加以展示，更为中意两国文化交流续写了新的篇章。";
        
        return cell;
    }
}

- (void)activityFavor {
    _model.collected = YES;
    [_mainTableView reloadData];
    [_modelClass requestExhibitionFavorBycategoryId:_model.Id request:^(NSString *errorMsg) {
        if (errorMsg) {
           [CustomView alertMessage:errorMsg view:self];
        }
    }];
}

- (void)activityFavorCancel {
    _model.collected = NO;
    [_mainTableView reloadData];

    [_modelClass requestExhibitionFavorCancleBycategoryId:_model.Id request:^(NSString *errorMsg) {
        if (errorMsg) {
            [CustomView alertMessage:errorMsg view:self];
        }
    }];
}


-(void)setModel:(ExhibitionModel *)model  {
    _model = model;
    [_mainTableView reloadData];
    kWeakSelf(self);
    [_modelClass requestExhibitionIsFavorByActivityId:_model.Id request:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            weakself.model.collected = weakself.modelClass.isFavor;
            [weakself.mainTableView reloadData];
        }
    }];
}

@end
