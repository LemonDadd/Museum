//
//  AntiqueCollectionViewCell.m
//  Museum
//
//  Created by 关云秀 on 2017/12/2.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "AntiqueCollectionViewCell.h"

@implementation AntiqueCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _image = [UIImageView new];
        [self addSubview:_image];
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _title = [UILabel new];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.font = [UIFont fontByName:MFONT fontSize:22];
        _title.textColor = [UIColor whiteColor];
        //_title.text = @"【铜器】";
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(kHeight(60));
        }];
        
       
        
    }
    return self;
}

@end
