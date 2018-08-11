//
//  VideoListViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/12.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "VideoListViewCell.h"

@implementation VideoListViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _topBgImageView = [UIImageView new];
        [self.contentView addSubview:_topBgImageView];
        _topBgImageView.image = [UIImage imageNamed:@"video_img"];
        [_topBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.contentView);
            make.height.equalTo(_topBgImageView.mas_width).multipliedBy(.6);
        }];
        
        _mbView = [UIView new];
        _mbView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.35];
        [_topBgImageView addSubview:_mbView];
        [_mbView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
        
        _playImageView = [UIImageView new];
        _playImageView.image = [UIImage imageNamed:@"videoplay_icon"];
        [_mbView addSubview:_playImageView];
        [_playImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_mbView);
            make.width.height.equalTo(@50);
        }];
        
        UIView *bottomView = [UIView new];
        bottomView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:bottomView];
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topBgImageView.mas_bottom);
            make.left.right.bottom.equalTo(self.contentView);
            make.height.equalTo(@60);
        }];
        
        _watchLabel =[UILabel new];
        _watchLabel.textColor = kColorWithHex(BLACKCOLOR);
        _watchLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _watchLabel.text = @"浏览量：888";
        [bottomView addSubview:_watchLabel];
        [_watchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(bottomView);
            make.right.equalTo(bottomView).offset(-10);
        }];
        
        UIImage *image = [UIImage imageNamed:@"Video_liulan_icon"];
        _watchImageView = [UIImageView new];
        _watchImageView.image = image;
        [bottomView addSubview:_watchImageView];
        [_watchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_watchLabel);
            make.right.equalTo(_watchLabel.mas_left).offset(-5);
            make.size.mas_equalTo(image.size);
        }];
        
        _nameLabel = [UILabel new];
        _nameLabel.textColor = kColorWithHex(BLACKCOLOR);
        _nameLabel.font = [UIFont fontByName:MFONT fontSize:18];
        [bottomView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_watchLabel);
            make.left.equalTo(bottomView).offset(10);
        }];
    }
    return self;
}

@end
