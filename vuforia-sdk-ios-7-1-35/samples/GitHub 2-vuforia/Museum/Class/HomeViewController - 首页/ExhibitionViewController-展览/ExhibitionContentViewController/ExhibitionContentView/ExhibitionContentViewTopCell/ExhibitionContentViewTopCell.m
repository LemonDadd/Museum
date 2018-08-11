//
//  ExhibitionContentViewTopCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ExhibitionContentViewTopCell.h"

@implementation ExhibitionContentViewTopCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _topImageView = [UIImageView new];
        _topImageView.image = [UIImage imageNamed:@"zl_del_img"];
        [self.contentView addSubview:_topImageView];
        [_topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.contentView);
            make.height.equalTo(_topImageView.mas_width).multipliedBy(.75);
        }];
        
        _zanAndShareView = [ZanAndShareView new];
        _zanAndShareView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        [self addSubview:_zanAndShareView];
        [_zanAndShareView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_topImageView.mas_bottom);
            make.left.right.equalTo(self);
            make.height.mas_equalTo(50);
        }];
        [_zanAndShareView.zanBtn setTitle:@"收藏" forState:UIControlStateNormal];
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
