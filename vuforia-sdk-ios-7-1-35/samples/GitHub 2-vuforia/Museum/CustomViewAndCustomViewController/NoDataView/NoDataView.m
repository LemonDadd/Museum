//
//  NoDataView.m
//  Museum
//
//  Created by 关云秀 on 2018/1/18.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import "NoDataView.h"

@implementation NoDataView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _noDataImageView = [UIImageView new];
        [self addSubview:_noDataImageView];
        [_noDataImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        
        _noDataLabel = [UILabel new];
        _noDataLabel.font = [UIFont fontByName:MFONT fontSize:14];
        _noDataLabel.textColor = kColorWithHex(GRAYCOLOR);
        [self addSubview:_noDataLabel];
        [_noDataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_noDataLabel);
            make.top.equalTo(_noDataImageView.mas_bottom);
        }];
    }
    return self;
}

@end
