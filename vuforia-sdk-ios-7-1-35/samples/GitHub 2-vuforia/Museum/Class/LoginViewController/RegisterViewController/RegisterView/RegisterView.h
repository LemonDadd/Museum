//
//  RegisterView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/2.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "LoginTextView.h"
#import "RegisterViewModelClass.h"

@interface RegisterView : BaseView
@property (nonatomic, strong)LoginTextView *phoneView;//手机号
@property (nonatomic, strong)LoginTextView *passWordView;//密码
@property (nonatomic, strong)LoginTextView *msgView;//验证码
@property (nonatomic, strong)LoginTextView *accView;//用户名
@property (nonatomic, strong)UIButton *loginBtn;
@property (nonatomic, strong)UIButton *registerBtn;
@property (nonatomic, strong)UIButton *forgetBtn;
@property (nonatomic, strong)UIImageView *logoImageView;
@property (nonatomic, strong)UILabel *titlelabel;
@property (nonatomic, strong)UIImageView *bgImageView;
@property (nonatomic, strong)RegisterViewModelClass *modelClass;
@end
