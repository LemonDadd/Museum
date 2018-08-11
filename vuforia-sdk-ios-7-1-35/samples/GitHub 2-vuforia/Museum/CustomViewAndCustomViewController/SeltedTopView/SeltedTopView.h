//
//  SeltedTopView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"

typedef void(^Didselted)(NSInteger indx);

@interface SeltedTopView : BaseView
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)NSArray *seletedArray;
@property (nonatomic, copy)Didselted didselted;
@property (nonatomic, strong)UIView *bottomView;
- (instancetype)initWithFrame:(CGRect)frame andSeletedArray:(NSArray *)array;
@end
