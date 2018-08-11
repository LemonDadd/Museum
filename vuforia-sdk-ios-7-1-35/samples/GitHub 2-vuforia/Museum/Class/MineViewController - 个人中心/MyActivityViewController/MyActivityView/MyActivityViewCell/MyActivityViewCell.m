//
//  MyActivityViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyActivityViewCell.h"

@implementation MyActivityViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _leftView = [UIImageView new];
        _leftView.contentMode = UIViewContentModeScaleAspectFill;
        _leftView.layer.masksToBounds =YES;
        [self.contentView addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentView).offset(10);
            make.left.equalTo(self.contentView).offset(8);
            make.height.equalTo(@110);
            make.width.equalTo(_leftView.mas_height).multipliedBy(1.3);
            make.bottom.equalTo(self).offset(-10);
        }];
        
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont fontByName:MFONT fontSize:18];
        _nameLabel.textColor =kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(10);
            make.left.equalTo(_leftView.mas_right).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
        }];
        
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont fontByName:MFONT fontSize:12];
        _timeLabel.textColor =kColorWithHex(0xa0a0a0);
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLabel.mas_bottom).offset(10);
            make.left.right.equalTo(_nameLabel);
        }];
        
        _xianzhiNum = [UILabel new];
        _xianzhiNum.font = [UIFont fontByName:MFONT fontSize:12];
        _xianzhiNum.textColor =kColorWithHex(0xa0a0a0);
        [self.contentView addSubview:_xianzhiNum];
        [_xianzhiNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_timeLabel.mas_bottom).offset(5);
            make.left.right.equalTo(_timeLabel);
        }];
        
        _baomingNum = [UILabel new];
        _baomingNum.font = [UIFont fontByName:MFONT fontSize:12];
        _baomingNum.textColor =kColorWithHex(0xa0a0a0);
        [self.contentView addSubview:_baomingNum];
        [_baomingNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_xianzhiNum.mas_bottom).offset(5);
            make.left.equalTo(_xianzhiNum);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
        UILabel *btnlabel = [UILabel new];
        btnlabel.text = @"查看详情>";
        btnlabel.font = [UIFont fontByName:MFONT fontSize:12];
        btnlabel.textColor =kColorWithHex(MCOLOR);
        [self.contentView addSubview:btnlabel];
        [btnlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_baomingNum);
            make.right.equalTo(_nameLabel);
        }];
        
        _chakanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chakanBtn addTarget:self action:@selector(chakanBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_chakanBtn];
        [_chakanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.bottom.equalTo(btnlabel);
        }];
    }
    return self;
}

- (void)chakanBtnEvent {
    
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
