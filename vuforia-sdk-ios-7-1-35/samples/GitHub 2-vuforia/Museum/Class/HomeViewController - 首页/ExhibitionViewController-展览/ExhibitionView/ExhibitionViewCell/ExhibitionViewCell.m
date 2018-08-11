//
//  ExhibitionViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/6.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ExhibitionViewCell.h"

@implementation ExhibitionViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _bgImageView = [UIImageView new];
        _bgImageView.image = [UIImage imageNamed:@"zl_del_img"];
        [self.contentView addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.contentView);
            make.height.mas_equalTo(kHeight(245));
            make.bottom.equalTo(self.contentView).offset(-5);
        }];
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [_bgImageView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_bgImageView);
        }];
        
        
        _dateLabel = [UILabel new];
        _dateLabel.text = @"活动时间: 2017-10-11 09:00 -- 2017-10-11 11:00";
        _dateLabel.font = [UIFont fontWithName:MFONT size:14];
        _dateLabel.textColor = [UIColor whiteColor];
        _dateLabel.textAlignment = NSTextAlignmentCenter;
        [view addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kWidth(20));
            make.right.equalTo(self).offset(-kWidth(20));
            make.centerY.equalTo(view);
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.text = @"纸的魅力--传统手工造纸术的体验之旅";
        _titleLabel.font = [UIFont fontWithName:MFONT size:20];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [view addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_dateLabel.mas_top).offset(-10);
            make.left.right.equalTo(_dateLabel);
        }];
        
        
        
        _describeLabel = [UILabel new];
        _describeLabel.text = @"展览地点:太原市博物馆";
        _describeLabel.font = [UIFont fontWithName:MFONT size:14];
        _describeLabel.textColor = [UIColor whiteColor];
        _describeLabel.textAlignment = NSTextAlignmentCenter;
        [view addSubview:_describeLabel];
        [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_dateLabel.mas_bottom).offset(10);
            make.left.right.equalTo(_dateLabel);
        }];
    }
    return self;
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
