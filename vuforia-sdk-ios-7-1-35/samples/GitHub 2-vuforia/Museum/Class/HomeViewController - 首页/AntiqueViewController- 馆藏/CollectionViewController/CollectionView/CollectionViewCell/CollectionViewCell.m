//
//  CollectionViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/3.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius =5.f;
        self.layer.masksToBounds = YES;
        self.layer.borderColor=[UIColor darkGrayColor].CGColor;
        self.layer.borderWidth=0.5;
        
        _idLabel = [UILabel new];
        _idLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _idLabel.numberOfLines = 0;
        _idLabel.textColor = kColorWithHex(BLACKCOLOR);
        [self addSubview:_idLabel];
        [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self).offset(-5);
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont fontByName:MFONT fontSize:18];
        _titleLabel.textColor = kColorWithHex(MCOLOR);
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(_idLabel.mas_top);
        }];
        
        _topimage = [UIImageView new];
        [self addSubview:_topimage];
        [_topimage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self).offset(5);
            make.right.equalTo(self).offset(-5);
            make.bottom.equalTo(_titleLabel.mas_top).offset(-5);
        }];
        
        [_idLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_topimage setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
}

@end
