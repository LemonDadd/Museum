//
//  VideoDetailsViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "VideoDetailsViewCell.h"

@implementation VideoDetailsViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _leftImageView = [UIImageView new];
        _leftImageView.layer.masksToBounds = YES;
        _leftImageView.layer.cornerRadius = 25.f;
        _leftImageView.backgroundColor = kColorWithHex(0xa7a6a6);
        [self.contentView addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(10);
            make.width.height.equalTo(@50);
        }];
        
        _name = [UILabel new];
        _name.font = [UIFont fontByName:MFONT fontSize:14];
        _name.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_leftImageView).offset(10);
            make.left.equalTo(_leftImageView.mas_right).offset(10);
        }];
        
        _dateLabel = [UILabel new];
        _dateLabel.font =[UIFont fontByName:MFONT fontSize:14];
        _dateLabel.textColor = kColorWithHex(0x8a8a8a);
        [self.contentView addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_name);
            make.right.equalTo(self.contentView).offset(-10);
            
        }];
        
        _contentLabel = [UILabel new];
        _contentLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _contentLabel.textColor = kColorWithHex(BLACKCOLOR);
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_name.mas_bottom).offset(5);
            make.left.equalTo(_leftImageView.mas_right).offset(10);
            make.right.equalTo(self.contentView).offset(-20);
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
