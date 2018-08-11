//
//  LoginView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/1.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "LoginView.h"
#import "RegisterViewController.h"
#import "ForGetViewController.h"
#import "BaseTabBarController.h"
#import "AppDelegate.h"

@implementation LoginView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        CGFloat both = 10;
        
        _bgImageView = [UIImageView new];
        _bgImageView.image = [UIImage imageNamed:@"login_bg"];
        [self addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _logoImageView = [UIImageView new];
        _logoImageView.image = [UIImage imageNamed:@"icon_logo"];
        _logoImageView.backgroundColor = [UIColor whiteColor];
        _logoImageView.layer.masksToBounds = YES;
        _logoImageView.layer.cornerRadius = kWidth(47.f) ;
        [self addSubview:_logoImageView];
        [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(kHeight(7*both));
            make.width.height.mas_equalTo(kWidth(94));
        }];
        
        _titlelabel =[UILabel new];
        _titlelabel.font = [UIFont fontWithName:MFONT size:18];
        _titlelabel.textColor = kColorWithHex(BLACKCOLOR);
        _titlelabel.text = @"太原市博物馆";
        [self addSubview:_titlelabel];
        [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_logoImageView.mas_bottom).offset(15);
        }];
        
        _accView = [LoginTextView new];
        _accView.titleView.text = @"账  号";
        _accView.textField.placeholder =@"请输入用户名或手机号";
        [self addSubview:_accView];
        [_accView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titlelabel.mas_bottom).offset(kHeight(5*both));
            make.centerX.equalTo(self);
            make.left.equalTo(self).offset(kWidth(5*both));
            make.right.equalTo(self).offset(kWidth(-5*both));
            make.height.mas_equalTo(kHeight(4*both));
        }];
        
        _passWordView = [LoginTextView new];
        _passWordView.titleView.text = @"密  码";
        _passWordView.textField.placeholder =@"请输入密码";
        _passWordView.textField.secureTextEntry = YES;
        [self addSubview:_passWordView];
        [_passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.equalTo(_accView);
            make.top.equalTo(_accView.mas_bottom).offset(both);
        }];
        
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont fontWithName:MFONT size:20];
        [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginBtn.backgroundColor = kColorWithHex(MCOLOR);
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius =5.f;
        [self addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_passWordView);
            make.top.equalTo(_passWordView.mas_bottom).offset(kHeight(6*both));
            make.height.mas_equalTo(kHeight(45));
        }];
        
        UILabel *youke = [UILabel new];
        youke.font = [UIFont fontWithName:MFONT size:14];
        youke.textColor = kColorWithHex(0xa8a8a8);
        youke.text = @"游客登录";
        [self addSubview:youke];
        [youke mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_loginBtn);
            make.top.equalTo(_loginBtn.mas_bottom);
        }];
        
        _youkeLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        _youkeLogin.backgroundColor = [UIColor clearColor];
        [_youkeLogin addTarget:self action:@selector(youkeLoginEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_youkeLogin];
        [_youkeLogin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(youke);
        }];
        
        UILabel *zhuce = [UILabel new];
        zhuce.font = [UIFont fontWithName:MFONT size:14];
        zhuce.textColor = kColorWithHex(0xa8a8a8);
        zhuce.text = @"注册";
        [self addSubview:zhuce];
        [zhuce mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_loginBtn);
            make.top.equalTo(_loginBtn.mas_bottom);
        }];
        
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerBtn.backgroundColor = [UIColor clearColor];
        [_registerBtn addTarget:self action:@selector(registerBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(zhuce);
        }];
        
        UILabel *wangji = [UILabel new];
        wangji.font = [UIFont fontWithName:MFONT size:14];
        wangji.textColor = kColorWithHex(0xa8a8a8);
        wangji.text = @"忘记密码?";
        [self addSubview:wangji];
        [wangji mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_loginBtn);
            make.top.equalTo(_loginBtn.mas_bottom);
        }];
        
        _forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetBtn.backgroundColor = [UIColor clearColor];
        [_forgetBtn addTarget:self action:@selector(forgetBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_forgetBtn];
        [_forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(wangji);
        }];
        
        
        _loginViewModelClass = [LoginViewModelClass new];
    }
    return self;
}

- (void)login {
    
    if (!_accView.textField.text.length ) {
        [CustomView alertMessage:@"请输入手机号" view:self];
        return;
    }
    
    if ( !_passWordView.textField.text.length) {
        [CustomView alertMessage:@"请输入密码" view:self];
        return;
    }
    kWeakSelf(self);
    [[CustomView getInstancetype]showWaitView:@"请稍后" byView:self];
    [_loginViewModelClass requestLoginByUserName:_accView.textField.text passwd:_passWordView.textField.text request:^(NSString *errorMsg) {
        [[CustomView getInstancetype]closeHUD];
        if (errorMsg == nil) {
            [self.viewController dismissViewControllerAnimated:YES completion:nil];
//            BaseTabBarController *tabbar = [BaseTabBarController new];
//            [[UIApplication sharedApplication].delegate.window setRootViewController:tabbar];
        } else {
            [CustomView alertMessage:errorMsg view:weakself];
        }
    }];
   
   
}

- (void)youkeLoginEvent {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.youkLogin = YES;
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)registerBtnEvent {
    RegisterViewController *vc = [RegisterViewController new];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}
- (void)forgetBtnEvent {
    ForGetViewController *vc = [ForGetViewController new];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}


@end