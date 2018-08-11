//
//  ActivityContentViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/14.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ActivityContentViewCell.h"

@implementation ActivityContentViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel =[UILabel new];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont fontByName:MFONT fontSize:18];
        _titleLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
            make.right.equalTo(self.contentView).offset(-10);
        }];
       
        
        _nameLabel =[UILabel new];
        _nameLabel.numberOfLines = 0;
        _nameLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _nameLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(10);
            make.left.equalTo(_titleLabel);
            make.right.equalTo(_titleLabel);
        }];
        
        _baomingLabel =[UILabel new];
        _baomingLabel.numberOfLines = 0;
        _baomingLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _baomingLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_baomingLabel];
        [_baomingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLabel.mas_bottom).offset(5);
            make.left.equalTo(_titleLabel);
            make.right.equalTo(_titleLabel);
        }];
        
        _peopleLabel =[UILabel new];
        _peopleLabel.numberOfLines = 0;
        _peopleLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _peopleLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_peopleLabel];
        [_peopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_baomingLabel.mas_bottom).offset(5);
            make.left.equalTo(_titleLabel);
            make.right.equalTo(_titleLabel);
        }];
        
        _dateLabel =[UILabel new];
        _dateLabel.numberOfLines = 0;
        _dateLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _dateLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_peopleLabel.mas_bottom).offset(10);
            make.left.equalTo(_titleLabel);
            make.right.equalTo(_titleLabel);
            make.bottom.equalTo(self.contentView).offset(-20);
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
