//
//  CollectionDetailsView+KnowledgeView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/9.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionDetailsView+KnowledgeView.h"
#import <objc/runtime.h>

static char *KnowledgeViewTag = "KnowledgeViewTag";

@implementation CollectionDetailsView (KnowledgeView)

-(void)setKnowledgeView:(UIView *)knowledgeView{
    objc_setAssociatedObject(self,KnowledgeViewTag, knowledgeView,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(UIView *)knowledgeView {
    return objc_getAssociatedObject(self, KnowledgeViewTag);
}

- (void)showKnowledgeView:(BOOL)isKnowledgeView {
    
    if (self.knowledgeView) {
        return;
    }
    
    self.knowledgeView = [UIView new];
    [self.knowledgeView setBackgroundColor:[UIColor colorWithWhite:0 alpha:.8]];
    [self addSubview:self.knowledgeView];
    [self.knowledgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UILabel *titleLabel = [UILabel new];
    if (isKnowledgeView) {
         titleLabel.text = @"衍生知识";
    }else {
        titleLabel.text = @"解说人简介";
    }
   
    titleLabel.font = [UIFont fontByName:nil fontSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    [self.knowledgeView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@20);
    }];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"close_icon"] forState:UIControlStateNormal];
    [self.knowledgeView addSubview:closeBtn];
    [closeBtn addTarget:self action:@selector(closeKnowledgeView) forControlEvents:UIControlEventTouchUpInside];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.knowledgeView).offset(-20);
        make.centerY.equalTo(titleLabel);
        make.width.height.mas_equalTo(20);
    }];
    
    UILabel *textLbel = [UILabel new];
    textLbel.numberOfLines = 0;
    if (isKnowledgeView) {
        textLbel.text = self.model.knowledge;
    }else {
        textLbel.text = self.model.star;
    }
    
    textLbel.font = [UIFont fontByName:MFONT fontSize:18];
    textLbel.textColor = [UIColor whiteColor];
    [self.knowledgeView addSubview:textLbel];
    [textLbel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel);
        make.right.equalTo(closeBtn);
        make.top.equalTo(titleLabel.mas_bottom).offset(20);
        
    }];
}

- (void)closeKnowledgeView {
    TTVIEW_RELEASE_SAFELY(self.knowledgeView);
}

@end
