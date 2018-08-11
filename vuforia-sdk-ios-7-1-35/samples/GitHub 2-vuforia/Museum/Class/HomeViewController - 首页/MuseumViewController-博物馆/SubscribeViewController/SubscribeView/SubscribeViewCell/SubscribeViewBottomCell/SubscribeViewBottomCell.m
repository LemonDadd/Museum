//
//  SubscribeViewBottomCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/3.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SubscribeViewBottomCell.h"

@implementation SubscribeViewBottomCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImage *rightImage = [UIImage imageNamed:@"arr_right"];
        _rightImageView = [UIImageView new];
        _rightImageView.image = rightImage;
        [self.contentView addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(rightImage.size);
            make.right.equalTo(self.contentView).offset(-8);
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont fontByName:MFONT fontSize:16];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView).offset(-10);
            make.height.mas_equalTo(kHeight(25));
            make.top.left.equalTo(self.contentView).offset(10);
        }];
        
        _contentLabel = [UILabel new];
        _contentLabel.font = [UIFont fontByName:MFONT fontSize:14];
        [self.contentView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_titleLabel);
            make.right.equalTo(_rightImageView.mas_left).offset(-10);
        }];
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = kColorWithHex(LINECOLOR);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel);
            make.right.equalTo(_rightImageView);
            make.height.equalTo(@1);
            make.bottom.equalTo(self.contentView);
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
