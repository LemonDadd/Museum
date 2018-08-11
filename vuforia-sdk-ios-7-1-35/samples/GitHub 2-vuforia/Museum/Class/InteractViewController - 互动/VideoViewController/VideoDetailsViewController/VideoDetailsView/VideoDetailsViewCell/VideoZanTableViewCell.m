//
//  VideoZanTableViewCell.m
//  Museum
//
//  Created by 关云秀 on 2018/1/7.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import "VideoZanTableViewCell.h"

@implementation VideoZanTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _zanAndShareToolView = [ZanAndShareView new];
        _zanAndShareToolView.backgroundColor = kColorWithHex(0x3e3e3e);
        [self.contentView addSubview:_zanAndShareToolView];
        [_zanAndShareToolView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.equalTo(self.contentView);
            make.height.mas_equalTo(48);
        }];
    }
    return self;
}

- (void)setShareUrl:(NSString *)shareUrl {
    
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
