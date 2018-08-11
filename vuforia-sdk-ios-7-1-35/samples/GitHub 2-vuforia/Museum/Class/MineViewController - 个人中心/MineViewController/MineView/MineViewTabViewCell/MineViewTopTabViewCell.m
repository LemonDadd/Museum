//
//  MineViewTopTabViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/7.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MineViewTopTabViewCell.h"

@implementation MineViewTopTabViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _bgImageView = [UIImageView new];
        _bgImageView.backgroundColor = kColorWithHex(MCOLOR);
        [self.contentView addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
            make.height.mas_equalTo(kHeight(230));
        }];
        
        _headerImageView = [UIImageView new];
        _headerImageView.userInteractionEnabled = YES;
        _headerImageView.image = [UIImage imageNamed:@"my_photo"];
        _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headerImageView.layer.masksToBounds= YES;
        _headerImageView.layer.cornerRadius =kWidth(45);
        [self.contentView addSubview:_headerImageView];
        [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
            make.height.width.mas_equalTo(kWidth(90));
        }];
        
        _nameLabel = [UILabel new];
        _nameLabel.text = @"Xuannalisha";
        _nameLabel.font = [UIFont fontByName:MFONT fontSize:20];
        _nameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_headerImageView.mas_bottom).offset(10);
            make.centerX.equalTo(self.contentView);
        }];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
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
