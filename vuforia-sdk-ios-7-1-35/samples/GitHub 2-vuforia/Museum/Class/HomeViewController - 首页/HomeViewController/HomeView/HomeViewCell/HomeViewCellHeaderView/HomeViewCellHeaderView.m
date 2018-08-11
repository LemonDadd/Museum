//
//  HomeViewCellHeaderView.m
//  Museum
//
//  Created by 关云秀 on 2017/11/30.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "HomeViewCellHeaderView.h"

@implementation HomeViewCellHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(@46);
            make.top.equalTo(self.contentView);
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont fontWithName:MFONT size:18];
        _titleLabel.textColor = kColorWithHex(BLACKCOLOR);
        [view addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(view);
        }];
        UIImage *image = [UIImage imageNamed:@"home_left_title"];
        CGFloat hight = image.size.height;
        CGFloat wight = image.size.width;
        _leftImageView = [UIImageView  new];
        _leftImageView.image = image;
        [view addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view);
            make.right.equalTo(_titleLabel.mas_left).offset(-10);
            make.width.mas_equalTo(wight);
            make.height.mas_equalTo(hight);
        }];
        
        _rightImageView = [UIImageView  new];
        _rightImageView.image = [UIImage imageNamed:@"home_right_title"];
        [view addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.width.height.equalTo(_leftImageView);
            make.left.equalTo(_titleLabel.mas_right).offset(10);
        }];
        
    }
    return self;
}




@end
