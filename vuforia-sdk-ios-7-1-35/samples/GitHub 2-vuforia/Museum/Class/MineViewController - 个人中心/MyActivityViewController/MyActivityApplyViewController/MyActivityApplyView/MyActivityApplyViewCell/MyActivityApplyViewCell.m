//
//  MyActivityApplyViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyActivityApplyViewCell.h"

@implementation MyActivityApplyViewCell

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
        
        _name = [UILabel new];
        _name.font = [UIFont fontByName:MFONT fontSize:14];
        _name.textColor = [UIColor whiteColor];
        [_leftView addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_leftView);
        }];
        
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont fontByName:MFONT fontSize:16];
        _nameLabel.textColor =kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(10);
            make.left.equalTo(_leftView.mas_right).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
        }];
        
        _phoneLabel = [UILabel new];
        _phoneLabel.font = [UIFont fontByName:MFONT fontSize:15];
        _phoneLabel.textColor =kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_phoneLabel];
        [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLabel.mas_bottom).offset(10);
            make.left.right.equalTo(_nameLabel);
        }];
        
        _idLabel = [UILabel new];
        _idLabel.font = [UIFont fontByName:MFONT fontSize:15];
        _idLabel.textColor =kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_idLabel];
        [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_phoneLabel.mas_bottom).offset(5);
            make.left.right.equalTo(_phoneLabel);
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
