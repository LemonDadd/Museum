//
//  SubscribeViewTopCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/3.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SubscribeViewTopCell.h"

@implementation SubscribeViewTopCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _contentLabel = [UILabel new];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor =kColorWithHex(BLACKCOLOR);
        _contentLabel.font = [UIFont fontByName:MFONT fontSize:14];
        [self.contentView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
            make.bottom.equalTo(self.contentView).offset(-30);
        }];
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = kColorWithHex(LINECOLOR);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_contentLabel);
            make.height.equalTo(@1);
            make.bottom.equalTo(self.contentView);
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
