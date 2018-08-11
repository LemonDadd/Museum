//
//  ExhibitionContentViewTextCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ExhibitionContentViewTextCell.h"

@implementation ExhibitionContentViewTextCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _txtLabel = [UILabel new];
        _txtLabel.numberOfLines = 0;
        _txtLabel.textColor = kColorWithHex(0x8a8a8a);
        _txtLabel.font = [UIFont fontByName:MFONT fontSize:14];
        [self.contentView addSubview:_txtLabel];
        [_txtLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(10);
            make.right.bottom.equalTo(self.contentView).offset(-10);
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
