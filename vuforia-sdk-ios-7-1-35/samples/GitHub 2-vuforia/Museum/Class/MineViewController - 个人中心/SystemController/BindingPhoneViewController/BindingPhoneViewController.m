//
//  BindingPhoneViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/9.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BindingPhoneViewController.h"

@interface BindingPhoneViewController ()


@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *msgTF;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UIButton *bindBtn;
@end

@implementation BindingPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kColorWithHex(0xf9f9f9);
    self.title = @"绑定手机";
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.phoneTF.font = [UIFont fontByName:MFONT fontSize:18];
    self.msgTF.font = [UIFont fontByName:MFONT fontSize:18];
    
    self.sendBtn.layer.cornerRadius =CGRectGetHeight(self.sendBtn.frame)/2;
    self.sendBtn.layer.borderWidth = 0.5;
    self.sendBtn.layer.borderColor =kColorWithHex(MCOLOR).CGColor;
    self.sendBtn.layer.masksToBounds =YES;
    [self.sendBtn setTitleColor:kColorWithHex(MCOLOR) forState:UIControlStateNormal];
    self.sendBtn.titleLabel.font = [UIFont fontByName:MFONT fontSize:18];
    [self.sendBtn addTarget:self action:@selector(sendBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    self.bindBtn.layer.cornerRadius =5;
    self.bindBtn.layer.masksToBounds =YES;
    [self.bindBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.bindBtn.backgroundColor = kColorWithHex(MCOLOR);
    self.bindBtn.titleLabel.font = [UIFont fontByName:MFONT fontSize:18];
    [self.bindBtn addTarget:self action:@selector(bindBtnEvent) forControlEvents:UIControlEventTouchUpInside];
   
}

- (void)sendBtnEvent:(UIButton *)sender {
    __block int timeout= 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.sendBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                sender.userInteractionEnabled = YES;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self.sendBtn setTitle:[NSString stringWithFormat:@"%zds",timeout] forState:UIControlStateNormal];
                [UIView commitAnimations];
                sender.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void)bindBtnEvent {
    if (self.phoneTF.text.length == 0) {
        [CustomView alertMessage:@"请输入手机号码" view:self.view];
        return;
    }
    if (self.msgTF.text.length == 0) {
        [CustomView alertMessage:@"请输入短信验证码" view:self.view];
        return;
    }
    [[CustomView getInstancetype]showWaitView:@"请稍后..." byView:self.view];
    [AllInterfaceRequest requestUpdateMobileByMobile:self.phoneTF.text validCode:self.msgTF.text validid:@"" request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        [[CustomView getInstancetype]closeHUD];
        if (success && !error) {
            [CustomView alertMessage:@"绑定成功" view:self.view];
            [self.navigationController popViewControllerAnimated:YES];
        }else {
            [CustomView alertMessage:errorMsg view:self.view];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
