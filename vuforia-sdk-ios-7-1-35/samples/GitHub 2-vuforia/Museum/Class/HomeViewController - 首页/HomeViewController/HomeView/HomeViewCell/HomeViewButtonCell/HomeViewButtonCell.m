//
//  HomeViewButtonCell.m
//  Museum
//
//  Created by 关云秀 on 2017/11/30.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "HomeViewButtonCell.h"
#import "VerticalButton.h"

@implementation HomeViewButtonCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _bgView = [UIView new];
        _bgView.backgroundColor = kColorWithHex(0Xf9f9f9);
        [self.contentView addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.contentView);
            make.height.mas_equalTo(kHeight(108));
            make.bottom.equalTo(self.contentView);
        }];
        
        UIButton *lastBtn = nil;
        CGFloat btnWidth = [DeviceInfo ScreenSize].width/4;
        NSArray *imageArray = @[@"home_bwg_icon",@"home_gc_icon",@"home_zl_icon",@"home_hd_icon"];
        NSArray *titleArray = @[@"博物馆",@"馆藏",@"展览",@"活动"];

        for(NSString *fontfamilyname in [UIFont familyNames])
        {
            NSLog(@"family:'%@'",fontfamilyname);
            for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
            {
                NSLog(@"\tfont:'%@'",fontName);
            }
            NSLog(@"-------------");
        }
        for (int i=0; i<4; i++) {
            VerticalButton *btn = [VerticalButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
            [btn setTitle:titleArray[i] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont fontWithName:MFONT size:18];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnEvent:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i;
            [_bgView addSubview:btn];
            if (lastBtn == nil) {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.top.bottom.equalTo(_bgView);
                    make.width.mas_equalTo(btnWidth);
                }];
            } else {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.bottom.width.equalTo(lastBtn);
                    make.left.equalTo(lastBtn.mas_right);
                }];
            }
            
            lastBtn = btn;
            [btn layoutIfNeeded];
        }
    }
    return self;
}

- (void)btnEvent:(UIButton *)sender {
    if (_btnEvent) {
        _btnEvent(sender.tag);
    }
}

@end
