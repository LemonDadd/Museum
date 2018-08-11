//
//  SubscribeViewAlertView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/6.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"

typedef void(^AlertViewCustomBlock)(BOOL close,NSString *name,NSString *phone,NSString *idCord);
@interface SubscribeViewAlertView : BaseView<UITextFieldDelegate>

@property (nonatomic, strong)UITextField *nameField;
@property (nonatomic, strong)UITextField *idField;
@property (nonatomic, strong)UITextField *phoneField;
@property (nonatomic, strong)UIButton *okBtn;

@property (nonatomic, copy)AlertViewCustomBlock alertViewCustomBlock;
@end
