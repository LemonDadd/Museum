//
//  SubscribeViewCellHeaderView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/4.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SubscribeViewCellHeaderView.h"

@implementation SubscribeViewCellHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
             make.edges.equalTo(self.contentView);
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.text = @"【预约提醒】";
        _titleLabel.font = [UIFont fontByName:MFONT fontSize:18];
        _titleLabel.textColor = kColorWithHex(MCOLOR);
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}
@end
