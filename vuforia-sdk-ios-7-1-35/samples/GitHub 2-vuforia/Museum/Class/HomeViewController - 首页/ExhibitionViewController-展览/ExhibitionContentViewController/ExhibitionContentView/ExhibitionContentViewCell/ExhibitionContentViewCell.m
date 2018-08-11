//
//  ExhibitionContentViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ExhibitionContentViewCell.h"

@implementation ExhibitionContentViewCell

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
        UIImage *date = [UIImage imageNamed:@"zl_date_ico"];
        _dateImage = [UIImageView new];
        _dateImage.image = date;
        [self.contentView addSubview:_dateImage];
        [_dateImage mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(date.size);
            make.top.equalTo(_titleLabel.mas_bottom).offset(10);
            make.left.equalTo(_titleLabel);
        }];
        
        _dateLabel =[UILabel new];
        _dateLabel.numberOfLines = 0;
        _dateLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _dateLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_dateImage);
            make.left.equalTo(_dateImage.mas_right).offset(10);
            make.right.equalTo(_titleLabel);
        }];
        
        UIImage *didian = [UIImage imageNamed:@"zl_didian_ico"];
        _didianImage = [UIImageView new];
        _didianImage.image = didian;
        [self.contentView addSubview:_didianImage];
        [_didianImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(didian.size);
            make.top.equalTo(_dateLabel.mas_bottom).offset(10);
            make.left.equalTo(_titleLabel);
        }];
        
        _didianLabel =[UILabel new];
        _didianLabel.numberOfLines = 0;
        _didianLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _didianLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_didianLabel];
        [_didianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_didianImage);
            make.left.equalTo(_didianImage.mas_right).offset(10);
            make.right.equalTo(_titleLabel);
            make.bottom.equalTo(self.contentView).offset(-10);
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
