//
//  SubscribeViewCellFooterView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/4.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SubscribeViewCellFooterView.h"

@implementation SubscribeViewCellFooterView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        _yuyueBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        _yuyueBtn.layer.masksToBounds = YES;
        _yuyueBtn.layer.cornerRadius = 5.f;
        _yuyueBtn.backgroundColor = kColorWithHex(MCOLOR);
        [_yuyueBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_yuyueBtn setTitle:@"预约" forState:UIControlStateNormal];
        _yuyueBtn.titleLabel.font = [UIFont fontByName:MFONT fontSize:20];
        [self.contentView addSubview:_yuyueBtn];
        [_yuyueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(45);
            make.right.equalTo(self.contentView).offset(-45);
            make.height.mas_equalTo(kHeight(40));
        }];
    }
    
    return self;
  
}






@end
