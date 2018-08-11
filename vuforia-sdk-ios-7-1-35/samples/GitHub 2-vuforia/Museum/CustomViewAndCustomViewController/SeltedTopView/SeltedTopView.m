//
//  SeltedTopView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SeltedTopView.h"

@implementation SeltedTopView
{
    NSMutableArray *btnArray;
}
- (instancetype)initWithFrame:(CGRect)frame andSeletedArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _seletedArray =array;
        CGFloat width = [DeviceInfo ScreenSize].width/array.count;
        btnArray = [NSMutableArray array];
        
        UIButton *lastBtn = nil;
        for (int i=0; i<array.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i;
            [btn setTitle:array[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnEvent:) forControlEvents:UIControlEventTouchUpInside];
            btn.titleLabel.font = [UIFont fontByName:MFONT fontSize:18];
            [self addSubview:btn];
            if (lastBtn == nil) {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.left.bottom.equalTo(self);
                    make.width.mas_equalTo(width);
                }];
            } else {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.width.bottom.equalTo(lastBtn);
                    make.left.equalTo(lastBtn.mas_right);
                }];
            }
            [btnArray addObject:btn];
            lastBtn = btn;
        }
        _lineView = [UIView new];
        _lineView.backgroundColor = kColorWithHex(MCOLOR);
        [self addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-5);
            make.height.mas_equalTo(1);
            make.width.mas_equalTo(width).multipliedBy(.5);
            make.centerX.equalTo(lastBtn);
        }];
        [self btnEvent:btnArray[0]];
        
        
        _bottomView = [UIView new];
        _bottomView.backgroundColor = kColorWithHex(GRAYCOLOR);
        [self addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(.5f);
        }];
    }
    return self;
}

- (void)btnEvent:(UIButton *)sender {
    for (UIButton *btn in btnArray) {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [sender setTitleColor:kColorWithHex(MCOLOR) forState:UIControlStateNormal];
    [_lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-5);
        make.height.equalTo(@1);
        make.width.equalTo(sender).multipliedBy(.5);
        make.centerX.equalTo(sender);
    }];
    [self layoutIfNeeded];
    if (_didselted) {
        _didselted(sender.tag);
    }
}

@end
