//
//  AppointmentView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "AppointmentViewCell.h"

@implementation AppointmentViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _leftView = [UIImageView new];
        _leftView.layer.masksToBounds = YES;
        _leftView.layer.cornerRadius = 25.f;
        _leftView.backgroundColor = kColorWithHex(0xa7a6a6);
        [self.contentView addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(10);
            make.width.height.equalTo(@50);
        }];
        
        _leftlabel = [UILabel new];
        _leftlabel.font = [UIFont fontByName:MFONT fontSize:14];
        _leftlabel.textColor = [UIColor whiteColor];
        [_leftView addSubview:_leftlabel];
        [_leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_leftView);
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont fontByName:MFONT fontSize:18];
        _titleLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leftView.mas_right).offset(20);
            make.top.equalTo(_leftView);
            make.right.equalTo(self.contentView).offset(-20);
        }];
        
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _nameLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_titleLabel);
            make.top.equalTo(_titleLabel.mas_bottom).offset(5);
        }];
        
        _phoneLabel = [UILabel new];
        _phoneLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _phoneLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_phoneLabel];
        [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_titleLabel);
            make.top.equalTo(_nameLabel.mas_bottom);
        }];
        
        _dateLabel = [UILabel new];
        _dateLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _dateLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_titleLabel);
            make.top.equalTo(_phoneLabel.mas_bottom);
        }];
        
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _timeLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_titleLabel);
            make.top.equalTo(_dateLabel.mas_bottom);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
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
