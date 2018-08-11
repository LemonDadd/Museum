//
//  MuseumView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/2.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "MuseumViewModelClass.h"

@interface MuseumView : BaseView<UIScrollViewDelegate>

@property (nonatomic, strong)UIImageView *bgImageView;
@property (nonatomic, strong)UIScrollView *mainScrView;

@property (nonatomic, strong)UIView *maskView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIButton *subscribeBtn;
@property (nonatomic, strong)UIButton *bottomBtn;

@property (nonatomic, strong)UIView *textView;
@property (nonatomic, strong)UILabel *textLabel;

@property (nonatomic, strong)MuseumViewModelClass *modelClass;

@end
