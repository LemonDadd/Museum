//
//  MyFavoriteViewTableViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/7.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MyFavoriteViewTableViewCell.h"

@implementation MyFavoriteViewTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        UIView *bgV = [UIView new];
        bgV.layer.shadowColor = [UIColor groupTableViewBackgroundColor].CGColor;
        bgV.layer.shadowOffset = CGSizeMake(3, 3);
        bgV.layer.shadowOpacity = 1;
        bgV.layer.shadowRadius = 5.0;
        bgV.layer.cornerRadius = 5.0;
        bgV.layer.borderWidth = 1.f;
        bgV.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        bgV.layer.masksToBounds = YES;
        bgV.layer.cornerRadius = 5.f;
        bgV.clipsToBounds = NO;
        [self.contentView addSubview:bgV];
        [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(8);
            make.height.mas_equalTo(kHeight(110));
            make.width.equalTo(bgV.mas_height).multipliedBy(1.3);
        }];
        
        _leftImageView = [UIImageView new];
        _leftImageView.image = [UIImage imageNamed:@"tq_img04"];
        _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        [bgV  addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(bgV).offset(5);
            make.bottom.right.equalTo(bgV).offset(-5);
        }];
        
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont fontByName:MFONT fontSize:18];
        _nameLabel.numberOfLines = 0;
        _nameLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgV.mas_right).offset(5);
            make.centerY.equalTo(bgV);
            make.right.equalTo(self).offset(-10);
        }];
        
        _detailLabel = [UILabel new];
        _detailLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _detailLabel.textColor = kColorWithHex(0xa0a0a0);
        _detailLabel.numberOfLines =0;
        [self.contentView addSubview:_detailLabel];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLabel);
            make.right.equalTo(self.contentView).offset(-10);
            make.top.equalTo(_nameLabel.mas_bottom).offset(10);
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
