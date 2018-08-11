//
//  SubscribeViewAlertView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/6.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SubscribeViewAlertView.h"


@implementation SubscribeViewAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        
        CGFloat both = 20.f;
        
        UILabel *label = [UILabel new];
        label.font = [UIFont fontByName:MFONT fontSize:20];
        label.textColor = [UIColor whiteColor];
        label.text = @"请填写预约人信息";
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(both);
        }];
        
        _nameField =[UITextField new];
        _nameField.placeholder = @"请输入姓名";
         [_nameField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        _nameField.font =[UIFont fontByName:MFONT fontSize:16];
        _nameField.textColor = [UIColor whiteColor];
        [self addSubview:_nameField];
        [_nameField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(2*both);
            make.right.equalTo(self).offset(-2*both);
            make.top.equalTo(label.mas_bottom).offset(both);
            make.height.mas_equalTo(2*both);
        }];
        
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor whiteColor];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_nameField);
            make.top.equalTo(_nameField.mas_bottom);
            make.height.equalTo(@1);
        }];
        
        _idField =[UITextField new];
        _idField.delegate =self;
        _idField.placeholder = @"请输入身份证号码";
        [_idField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        _idField.font =[UIFont fontByName:MFONT fontSize:16];
        _idField.textColor = [UIColor whiteColor];
        [self addSubview:_idField];
        [_idField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.equalTo(_nameField);
            make.top.equalTo(line.mas_bottom).offset(both);
        }];
        
        UIView *line1 = [UIView new];
        line1.backgroundColor = [UIColor whiteColor];
        [self addSubview:line1];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.equalTo(line);
            make.top.equalTo(_idField.mas_bottom);
        }];
        
        _phoneField =[UITextField new];
        _phoneField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneField.placeholder = @"请输入手机号码";
         [_phoneField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        _phoneField.font =[UIFont fontByName:MFONT fontSize:16];
        _phoneField.textColor = [UIColor whiteColor];
        [self addSubview:_phoneField];
        [_phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.equalTo(_nameField);
            make.top.equalTo(line1.mas_bottom).offset(both);
        }];
        
        UIView *line2 = [UIView new];
        line2.backgroundColor = [UIColor whiteColor];
        [self addSubview:line2];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.equalTo(line);
            make.top.equalTo(_phoneField.mas_bottom);
        }];
        
        UIButton *yuyeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        yuyeBtn.layer.masksToBounds = YES;
        yuyeBtn.layer.cornerRadius = 5;
        yuyeBtn.backgroundColor = kColorWithHex(MCOLOR);
        [yuyeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [yuyeBtn setTitle:@"预约" forState:UIControlStateNormal];
        [yuyeBtn addTarget:self action:@selector(yuyeBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        yuyeBtn.titleLabel.font = [UIFont fontByName:MFONT fontSize:15];
        [self addSubview:yuyeBtn];
        [yuyeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-2*both);
            make.width.mas_equalTo(kWidth(100));
            make.height.mas_equalTo(kHeight(30));
            make.top.equalTo(line2.mas_bottom).offset(2*both);
        }];
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.layer.masksToBounds = YES;
        cancelBtn.layer.cornerRadius = 5;
        cancelBtn.backgroundColor = [UIColor whiteColor];
        [cancelBtn setTitleColor:kColorWithHex(BLACKCOLOR) forState:UIControlStateNormal];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        cancelBtn.titleLabel.font = [UIFont fontByName:MFONT fontSize:15];
        [self addSubview:cancelBtn];
        [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(2*both);
            make.width.mas_equalTo(kWidth(100));
            make.height.mas_equalTo(kHeight(30));
            make.top.equalTo(line2.mas_bottom).offset(2*both);
        }];
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(yuyeBtn).offset(2*both);
            make.width.mas_equalTo([DeviceInfo ScreenSize].width-60);
        }];
    }
    return self;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField == _idField) {
        NSUInteger lengthOfString = string.length;  //lengthOfString的值始终为1
        for (NSInteger loopIndex = 0; loopIndex < lengthOfString; loopIndex++) {
            unichar character = [string characterAtIndex:loopIndex]; //将输入的值转化为ASCII值（即内部索引值），可以参考ASCII表
            // 48-57;{0,9};65-90;{A..Z};97-122:{a..z}
            if (character < 48) return NO; // 48 unichar for 0
            if (character > 57 && character < 65) return NO; //
            if (character > 90 && character < 97) return NO;
            if (character > 122) return NO;
            
        }
        // Check for total length
        NSUInteger proposedNewLength = textField.text.length - range.length + string.length;
        if (proposedNewLength > 18) {
            return NO;//限制长度
        }
        return YES;
        
    }
    return YES;
}

- (void)cancelBtnEvent {
    if (_alertViewCustomBlock){
        _alertViewCustomBlock(true,nil,nil,nil);
    }
}

- (void)yuyeBtnEvent {
    
    if (_nameField.text.length == 0) {
        [CustomView alertMessage:@"请输入姓名" view:self];
        return;
    }
    
    if (![_idField.text simpleVerifyIdentityCardNum]) {
        [CustomView alertMessage:@"请输入正确的身份证号码" view:self];
        return;
    }
    
    if (![_phoneField.text checkPhoneNumInput]) {
        [CustomView alertMessage:@"请输入正确的手机号码" view:self];
        return;
    }
    
    
    if (_alertViewCustomBlock){
        _alertViewCustomBlock(false,_nameField.text,_phoneField.text,_idField.text);
    }
}



#pragma 正则匹配用户身份证号15或18位

//因为各个运营商开头号码不同，这里只匹配11位是比较好的方法
- (BOOL)isValidPhoneNumber:(NSString *)str {
    NSString *regex = @"^[0-9]{11}";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:str];
}

@end
