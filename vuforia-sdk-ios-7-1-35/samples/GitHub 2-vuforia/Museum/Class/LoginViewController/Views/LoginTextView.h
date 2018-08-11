//
//  LoginTextView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/1.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"

typedef void(^MsgEvent)(void);

@interface LoginTextView : BaseView

@property (nonatomic, strong)UILabel *titleView;
@property (nonatomic, strong)UITextField *textField;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UILabel *msgLabel;
@property (nonatomic, strong)UIButton *msgBtn;
@property (nonatomic, assign)BOOL showMsgBtn;

@property (nonatomic, copy)MsgEvent msgEvent;

@end
