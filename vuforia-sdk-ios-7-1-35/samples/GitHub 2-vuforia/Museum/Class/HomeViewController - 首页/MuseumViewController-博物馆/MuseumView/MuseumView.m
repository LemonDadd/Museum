//
//  MuseumView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/2.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MuseumView.h"
#import "SubscribeViewController.h"


@implementation MuseumView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _bgImageView = [[UIImageView alloc]initWithFrame:frame];
        _bgImageView.image = [UIImage imageNamed:@"bwg-js"];
        [self addSubview:_bgImageView];
        
        _mainScrView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height)];
        _mainScrView.pagingEnabled = YES;
        _mainScrView.showsHorizontalScrollIndicator=NO;
        _mainScrView.showsVerticalScrollIndicator =NO;
        _mainScrView.bounces=NO;
        _mainScrView.delegate =self;
        [self addSubview:_mainScrView];
        
        if (@available(iOS 11.0, *)) {
            _mainScrView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.viewController.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        [self createMaskView];
        [self createTextView];
        
        _mainScrView.contentSize = CGSizeMake([DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height *2);
        
        [self requestMuseum];
        
    }
    return self;
}

- (void)createMaskView {
    _maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height)];
    _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [_mainScrView addSubview:_maskView];
    
    _subscribeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _subscribeBtn.backgroundColor = [UIColor clearColor];
    _subscribeBtn.layer.cornerRadius = kHeight(15);
    _subscribeBtn.layer.masksToBounds =YES;
    _subscribeBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _subscribeBtn.layer.borderWidth = 1.f;
    [_subscribeBtn setTitle:@"参观预约" forState:UIControlStateNormal];
    [_subscribeBtn addTarget:self action:@selector(subscribeBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [_subscribeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _subscribeBtn.titleLabel.font = [UIFont fontByName:MFONT fontSize:14];
    _subscribeBtn.hidden = YES;
    [_maskView addSubview:_subscribeBtn];
    [_subscribeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_maskView);
        make.height.mas_equalTo(kHeight(30));
        make.width.mas_equalTo(kWidth(100));
    }];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont fontByName:MFONT fontSize:30];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_maskView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_maskView);
        make.top.equalTo(_maskView).offset(kHeight(120));
        //make.height.mas_offset(height);
    }];
    
    _timeLabel = [UILabel new];
    _timeLabel.font = [UIFont fontByName:MFONT fontSize:14];
    _timeLabel.textColor = [UIColor whiteColor];
    _timeLabel.numberOfLines = 0;
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.contentMode = UIViewContentModeTop;
    [_maskView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(kHeight(40));
        make.left.right.equalTo(_maskView);
    }];
    
    
    UIImage *bottomImage = [UIImage imageNamed:@"bwg_arr"];
    _bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bottomBtn setImage:bottomImage forState:UIControlStateNormal];
    [_bottomBtn addTarget:self action:@selector(didScrll) forControlEvents:UIControlEventTouchUpInside];
    [_maskView addSubview:_bottomBtn];
    [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_maskView);
        make.size.mas_equalTo(bottomImage.size);
        make.bottom.equalTo(_maskView).offset(-kHeight(120));
    }];
}

- (void)createTextView {
    _textView = [[UIView alloc]initWithFrame:CGRectMake(0, [DeviceInfo ScreenSize].height, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height)];
    _textView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [_mainScrView addSubview:_textView];
    
    _textLabel  =[UILabel new];
    _textLabel.font = [UIFont fontByName:MFONT fontSize:16];
    _textLabel.numberOfLines = 0;
    _textLabel.textColor = [UIColor whiteColor];
   
    [_textView addSubview:_textLabel];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_textView);
        make.width.mas_equalTo([DeviceInfo ScreenSize].width-30);
        
    }];
}

- (void)subscribeBtnEvent {
    SubscribeViewController *vc= [SubscribeViewController new];
    vc.model =_modelClass.model;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

- (void)didScrll {
    [_mainScrView scrollRectToVisible:_textView.frame animated:YES];
}

-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 3; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}

- (void)requestMuseum {
    
    _modelClass = [MuseumViewModelClass new];
    kWeakSelf(self);
    [_modelClass requestGetMuseumByrequest:^(NSString *errorMsg) {
        if (errorMsg == nil) {
            [weakself setMuseumViewData];
        }else {
            [CustomView alertMessage:errorMsg view:weakself];
        }
    }];
}

- (void)setMuseumViewData {
    if (_modelClass.model) {
        _titleLabel.text = _modelClass.model.name;
        _timeLabel.text = _modelClass.model.openTime;
        [self setLabelSpace:_textLabel withValue:_modelClass.model.intro withFont:[UIFont fontByName:MFONT fontSize:16]];
        _subscribeBtn.hidden = NO;
    }
}


@end






