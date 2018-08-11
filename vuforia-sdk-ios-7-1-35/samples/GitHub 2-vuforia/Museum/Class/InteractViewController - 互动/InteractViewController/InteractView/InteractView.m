//
//  InteractView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/9.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "InteractView.h"
#import "VideoListViewController.h"
#import "ArViewController.h"

#define kGCCardRatio 0.8
#define kGCCardWidth kScreenWidth*kGCCardRatio
#define kGCCardHeight kGCCardWidth/kGCCardRatio

@implementation InteractView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *bg = [UIImageView new];
        bg.image = [UIImage imageNamed:@"gc_xq_bg"];
        [self addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _cardScrollView = [[CardScrollView alloc]initWithFrame:frame];
        _cardScrollView.cardDelegate =self;
        _cardScrollView.cardDataSource =self;
        [self addSubview:_cardScrollView];
        //_imageArray = @[@"tyhd_ar_img",@"tyhd_vr_img",@"tyhd_video_img",@"tyhd_wcgs_img"];
        _imageArray = @[@"tyhd_ar_img",@"tyhd_video_img"];
//        _pageControl = [[LWDPageControl alloc] initWithFrame:CGRectMake(0, [DeviceInfo ScreenSize].height-80, [DeviceInfo ScreenSize].width, 40) indicatorMargin:3.f indicatorWidth:20.f currentIndicatorWidth:20.f indicatorHeight:5.f];
//        _pageControl.numberOfPages = _imageArray.count;
//        [self addSubview:_pageControl];
        
    }
    return self;
}

#pragma mark - CardScrollViewDelegate
- (void)updateCard:(UIView *)card withProgress:(CGFloat)progress direction:(CardMoveDirection)direction {
    if (direction == CardMoveDirectionNone) {
        if (card.tag != [self.cardScrollView currentCard]) {
            CGFloat scale = 1 - 0.1 * progress;
            card.layer.transform = CATransform3DMakeScale(scale, scale, 1.0);
            card.layer.opacity = 1 - 0.2*progress;
        } else {
            card.layer.transform = CATransform3DIdentity;
            card.layer.opacity = 1;
        }
    } else {
        NSInteger transCardTag = direction == CardMoveDirectionLeft ? [self.cardScrollView currentCard] + 1 : [self.cardScrollView currentCard] - 1;
        if (card.tag != [self.cardScrollView currentCard] && card.tag == transCardTag) {
            card.layer.transform = CATransform3DMakeScale(0.9 + 0.1*progress, 0.9 + 0.1*progress, 1.0);
            card.layer.opacity = 0.8 + 0.2*progress;
        } else if (card.tag == [self.cardScrollView currentCard]) {
            card.layer.transform = CATransform3DMakeScale(1 - 0.1 * progress, 1 - 0.1 * progress, 1.0);
            card.layer.opacity = 1 - 0.2*progress;
        }
    }
    _pageControl.currentPage = [self.cardScrollView currentCard];
    
}

#pragma mark - CardScrollViewDataSource
- (NSInteger)numberOfCards {
    return _imageArray.count;
}

- (UIView *)cardReuseView:(UIView *)reuseView atIndex:(NSInteger)index {
    if (reuseView) {
        return reuseView;
    }
    UIImage *image =[UIImage imageNamed: _imageArray[index]];
//    CGFloat width = [DeviceInfo ScreenSize].width -150;
//    CGFloat hight = [DeviceInfo scalHeightByWidth:width BySize:image.size];
    
    UIImageView *card = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,image.size.width/1.5,image.size.height/1.5)];
    card.image = image;
    card.layer.masksToBounds =YES;
    card.layer.cornerRadius =15.f;
    card.layer.backgroundColor = [UIColor clearColor].CGColor;
    return card;
}

-(void)didSeletadCardViewWithIndx:(NSInteger)indx{
//    if (indx == 0) {
//        ArViewController *vc =[ArViewController new];
//        [self.viewController.navigationController pushViewController:vc animated:YES];
//    } else if (indx ==1) {
//
//    } else if (indx ==2) {
//        VideoListViewController *vc= [VideoListViewController new];
//        [self.viewController.navigationController pushViewController:vc animated:YES];
//    } else if (indx ==3) {
//
//    }
    
        if (indx == 0) {
            ArViewController *vc =[ArViewController new];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        } else if (indx ==1) {
            VideoListViewController *vc= [VideoListViewController new];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        } else if (indx ==2) {
          
        } else if (indx ==3) {
    
        }
}

-(void)layoutSubviews  {
    [super layoutSubviews];
    [_cardScrollView loadCard];
}

@end
