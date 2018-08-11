//
//  LampCollectionViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/6.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "LampCollectionViewCell.h"

@implementation LampCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kColorWithHex(MCOLOR);
        _bgImageView = [UIImageView new];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFit;
        _bgImageView.layer.masksToBounds = YES;
        [self addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self).offset(10);
            make.bottom.right.equalTo(self).offset(-10);
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        _titleLabel.font = [UIFont fontByName:MFONT fontSize:16];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.numberOfLines = 0;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
    }
    return self;
}

@end
