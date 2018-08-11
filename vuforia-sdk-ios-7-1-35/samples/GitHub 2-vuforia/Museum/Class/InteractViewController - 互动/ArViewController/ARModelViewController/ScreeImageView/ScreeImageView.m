//
//  ScreeImageView.m
//  Museum
//
//  Created by keneng17 on 2017/12/22.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ScreeImageView.h"

@implementation ScreeImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10.f;
        
        _screeImageView = [UIImageView new];
        [self addSubview:_screeImageView];
        [_screeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
            make.bottom.right.equalTo(@-10);
        }];
    }
    return self;
}
@end
