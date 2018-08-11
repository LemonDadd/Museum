//
//  CollectionDetailsView+RightFunctionView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/5.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionDetailsView+RightFunctionView.h"
#import <objc/runtime.h>
#import "UShareUI.h"
#import "BaseViewController.h"

static char *MasonryrightViewArrayTag = "MasonryrightViewArrayTag";
static char *BtnFrameArrayTag = "BtnFrameArrayTag";
@implementation CollectionDetailsView (RightFunctionView)

-(void)setMasonryrightViewArray:(NSMutableArray *)masonryrightViewArray {
     objc_setAssociatedObject(self, MasonryrightViewArrayTag, masonryrightViewArray,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSArray *)masonryrightViewArray {
     return objc_getAssociatedObject(self, MasonryrightViewArrayTag);
}

-(void)setBtnFrameArray:(NSArray *)btnFrameArray {
    objc_setAssociatedObject(self, BtnFrameArrayTag, btnFrameArray,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray *)btnFrameArray {
    return objc_getAssociatedObject(self, BtnFrameArrayTag);
}


- (void)createRightFunctionView {
    
    self.rightFunctionView = [UIView new];
    [self addSubview:self.rightFunctionView];
    [self.rightFunctionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-kWidth(20));
        make.centerY.equalTo(self.designLabel);
        make.width.mas_equalTo(kWidth(30));
    }];
    
    self.masonryrightViewArray = [NSMutableArray array];
    NSString *shoucang = self.model.collected?@"shoucang_yes":@"gc_xg_03";
    NSArray *imageArray = @[@"gc_xq_01",@"gc_xq_02",shoucang,@"gc_xq_04"];
    for (int i=0; i<imageArray.count; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        btn.tag =i;
        [btn addTarget:self action:@selector(rightFunctionEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightFunctionView addSubview:btn];
        [self.masonryrightViewArray addObject:btn];
    }
    [self.masonryrightViewArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:15 leadSpacing:0 tailSpacing:0];
    
    [self.masonryrightViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.rightFunctionView);
    }];
    
    [self requestIsFavor];
}

- (void)rightFunctionEvent:(UIButton *)sender {
    if (sender.tag == 0) {
        sender.selected = !sender.selected;
        [self didSeletedMoreBtn:sender.selected];
    } else if (sender.tag == 1) {
        [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine)]];
        [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMarginLeft =45;
        [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMarginRight =-45;
        [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
            // 根据获取的platformType确定所选平台进行下一步操作
            [[MyShareInstance getInstancetype]shareWebPageToPlatformType:platformType ShareUrl:ShareCollection(self.model.Id) byViewController:self.viewController request:^(NSString *message, BOOL success, NSString *errorMsg, BOOL error) {
                
            }];
        }];
    } else if (sender.tag == 2) {
        
        if ([UserInfoClass getUserInfoClass] == nil) {
            [(BaseViewController *)self.viewController gotoLoginViewController];
            return;
        }
        [self requestCollectionFavor:sender];
        
       
    } else if (sender.tag == 3) {
       
    }
}

- (void)requestCollectionFavor:(UIButton *)sender {
     kWeakSelf(self);
    if (!self.model.collected) {
        weakself.model.collected =!weakself.model.collected;
        [weakself setFavorBtnImage:sender];
        [self.modelClass requestCollectionFavorBycategoryId:self.model.Id request:^(NSString *errorMsg) {
            [[CustomView getInstancetype]closeHUD];
            if (errorMsg) {
                [CustomView alertMessage:errorMsg view:weakself];
            }
        }];
    } else {
        weakself.model.collected =!weakself.model.collected;
        [weakself setFavorBtnImage:sender];
        [self.modelClass requestCollectionFavorCancleBycategoryId:self.model.Id request:^(NSString *errorMsg) {
            [[CustomView getInstancetype]closeHUD];
            if (errorMsg) {
                [CustomView alertMessage:errorMsg view:weakself];
            }
        }];
    }
    
}

- (void)setFavorBtnImage:(UIButton *)sender {
    if (sender == nil) {
        sender =self.masonryrightViewArray[2];
    }
    if (self.model.collected) {
        [sender setImage:[UIImage imageNamed:@"shoucang_yes"] forState:UIControlStateNormal];
    }else {
        [sender setImage:[UIImage imageNamed:@"gc_xg_03"] forState:UIControlStateNormal];
    }
    
}


- (void)didSeletedMoreBtn:(BOOL)selected{
    UIView *view1 = self.masonryrightViewArray[1];
    UIView *view2 = self.masonryrightViewArray[2];
    UIView *view3 = self.masonryrightViewArray[3];
    if (selected) {
        self.btnFrameArray =@[@(view1.frame.origin.y),@(view2.frame.origin.y),@(view3.frame.origin.y)];
        [UIView animateWithDuration:0.1 animations:^{
            [view1 setY:0];
            [view2 setY:0];
            [view3 setY:0];
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            view1.alpha = 0;
            view2.alpha = 0;
            view3.alpha = 0;
            view1.hidden = 1;
            view2.hidden = 1;
            view3.hidden = 1;
        }];
    }else {
        NSNumber *y = self.btnFrameArray[0];
         NSNumber *y1 = self.btnFrameArray[1];
         NSNumber *y2 = self.btnFrameArray[2];
        self.btnFrameArray = nil;
        [UIView animateWithDuration:0.1 animations:^{
            [view1 setY:[y floatValue]];
            [view2 setY:[y1 floatValue]];
            [view3 setY:[y2 floatValue]];
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            view1.hidden = 0;
            view2.hidden = 0;
            view3.hidden = 0;
            view1.alpha = 1;
            view2.alpha = 1;
            view3.alpha = 1;
        }];
    }
}


- (void)requestIsFavor {
    kWeakSelf(self);
    [self.modelClass requestCollectionIsFavorBycategoryId:self.model.Id request:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            weakself.model.collected = weakself.modelClass.isFavor;
            [weakself setFavorBtnImage:nil];
        }
    }];
}

@end
