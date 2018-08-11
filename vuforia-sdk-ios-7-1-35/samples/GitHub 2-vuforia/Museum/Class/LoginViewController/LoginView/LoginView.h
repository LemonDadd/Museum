//
//  LoginView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/1.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "LoginTextView.h"
#import "LoginViewModelClass.h"

@interface LoginView : BaseView

@property (nonatomic, strong)LoginViewModelClass *loginViewModelClass;
@property (nonatomic, strong)LoginTextView *accView;
@property (nonatomic, strong)LoginTextView *passWordView;
@property (nonatomic, strong)UIButton *loginBtn;
@property (nonatomic, strong)UIButton *registerBtn;
@property (nonatomic, strong)UIButton *forgetBtn;
@property (nonatomic, strong)UIImageView *logoImageView;
@property (nonatomic, strong)UILabel *titlelabel;
@property (nonatomic, strong)UIImageView *bgImageView;
@property (nonatomic, strong)UIButton *youkeLogin;


@end
