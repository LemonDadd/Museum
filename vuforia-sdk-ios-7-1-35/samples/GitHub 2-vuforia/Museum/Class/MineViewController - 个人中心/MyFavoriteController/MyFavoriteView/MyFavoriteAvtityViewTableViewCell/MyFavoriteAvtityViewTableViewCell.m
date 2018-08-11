//
//  MyFavoriteAvtityViewTableViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyFavoriteAvtityViewTableViewCell.h"

@implementation MyFavoriteAvtityViewTableViewCell

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
        _nameLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _nameLabel.textColor =kColorWithHex(BLACKCOLOR);
        _nameLabel.numberOfLines = 0;
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(10);
            make.left.equalTo(_leftView.mas_right).offset(10);
            make.right.equalTo(self.contentView).offset(-8);
        }];
        
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont fontByName:MFONT fontSize:12];
        _timeLabel.textColor =kColorWithHex(0xa0a0a0);
        _timeLabel.numberOfLines = 0;
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLabel.mas_bottom).offset(10);
            make.left.right.equalTo(_nameLabel);
        }];
        
        _didianLabel = [UILabel new];
        _didianLabel.numberOfLines = 0;
        _didianLabel.font = [UIFont fontByName:MFONT fontSize:12];
        _didianLabel.textColor =kColorWithHex(0xa0a0a0);
        [self.contentView addSubview:_didianLabel];
        [_didianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_timeLabel.mas_bottom).offset(5);
            make.left.right.equalTo(_timeLabel);
        }];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *subView in self.subviews) {
        if ([NSStringFromClass([subView class]) isEqualToString:@"UITableViewCellDeleteConfirmationView"]) {
            ((UIView *)[subView.subviews firstObject]).backgroundColor = kColorWithHex(MCOLOR);
        }
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
