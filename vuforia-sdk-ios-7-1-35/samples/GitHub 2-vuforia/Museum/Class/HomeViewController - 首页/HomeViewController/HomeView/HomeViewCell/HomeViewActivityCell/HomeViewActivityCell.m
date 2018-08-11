//
//  HomeViewActivityCell.m
//  Museum
//
//  Created by 关云秀 on 2017/11/30.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "HomeViewActivityCell.h"

@implementation HomeViewActivityCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _bgImageView = [UIImageView new];
        _bgImageView.image = [UIImage imageNamed:@"home_hd_img01"];
        [self.contentView addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.contentView);
            make.height.mas_equalTo(kHeight(240));
            make.bottom.equalTo(self.contentView).offset(-5);
        }];
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [_bgImageView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_bgImageView);
        }];
        
        
        _titleLabel = [UILabel new];
        _titleLabel.text = @"纸的魅力--传统手工造纸术的体验之旅";
        _titleLabel.font = [UIFont fontWithName:MFONT size:18];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [view addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view).offset(kHeight(45));
            make.left.equalTo(view).offset(kWidth(20));
            make.right.equalTo(view).offset(-kWidth(20));
        }];
        
        
        _nameLabel = [UILabel new];
        _nameLabel.text = @"主持人:杨娜";
        _nameLabel.font = [UIFont fontWithName:MFONT size:14];
        _nameLabel.textColor = [UIColor whiteColor];
        [view addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(kHeight(20));
            make.left.equalTo(self.contentView).offset(16);
        }];
        
        _dateLabel = [UILabel new];
        _dateLabel.text = @"活动时间: 2017-10-11 09:00 -- 2017-10-11 11:00";
        _dateLabel.font = [UIFont fontWithName:MFONT size:14];
        _dateLabel.textColor = [UIColor whiteColor];
        [view addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLabel.mas_bottom).offset(2);
            make.left.equalTo(_nameLabel);
        }];
        
        _didianLabel = [UILabel new];
        _didianLabel.text = @"主讲地点:太原市博物馆";
        _didianLabel.font = [UIFont fontWithName:MFONT size:14];
        _didianLabel.textColor = [UIColor whiteColor];
        [view addSubview:_didianLabel];
        [_didianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_dateLabel.mas_bottom).offset(2);
            make.left.equalTo(_nameLabel);
        }];
        
        _baomingLabel = [UILabel new];
        _baomingLabel.text = @"报名人数:100人";
        _baomingLabel.font = [UIFont fontWithName:MFONT size:14];
        _baomingLabel.textColor = [UIColor whiteColor];
        [view addSubview:_baomingLabel];
        [_baomingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_didianLabel.mas_bottom).offset(2);
            make.left.equalTo(_nameLabel);
        }];
        
        _peopleLabel = [UILabel new];
        _peopleLabel.text = @"已报名:80人";
        _peopleLabel.font = [UIFont fontWithName:MFONT size:14];
        _peopleLabel.textColor = [UIColor whiteColor];
        [view addSubview:_peopleLabel];
        [_peopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_baomingLabel.mas_bottom).offset(2);
            make.left.equalTo(_nameLabel);
        }];
        
        _activityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [view addSubview:_activityBtn];
        [_activityBtn setTitle:@"火热预定中" forState:UIControlStateNormal];
        [_activityBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _activityBtn.titleLabel.font = [UIFont fontWithName:MFONT size:12];
        _activityBtn.layer.masksToBounds = YES;
        _activityBtn.layer.cornerRadius = kHeight(15);
        _activityBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _activityBtn.layer.borderWidth = 1.f;
        [_activityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(view);
            make.bottom.equalTo(view).offset(-kHeight(20));
            make.width.mas_equalTo(kWidth(100));
            make.height.mas_equalTo(kHeight(30));
        }];
    }
    return self;
}


-(void)setActivityBtnState:(NSInteger)state {
    if (state == 0) {
        [self.activityBtn setTitle:@"火热预定中" forState:UIControlStateNormal];
    } else if (state ==1 ) {
        [self.activityBtn setTitle:@"活动进行中" forState:UIControlStateNormal];
    } else if (state == 2) {
        [self.activityBtn setTitle:@"活动已结束" forState:UIControlStateNormal];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
