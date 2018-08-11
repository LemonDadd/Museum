//
//  CollectionPhotoCell.m
//  Museum
//
//  Created by 关云秀 on 2018/1/6.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import "CollectionPhotoCell.h"

@implementation CollectionPhotoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *titleimage = [UIImage imageNamed:@"gc_tp_img01"];
        UIImageView *titleImageView = [UIImageView new];
        titleImageView.image = titleimage;
        [self addSubview:titleImageView];
        [titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.size.mas_equalTo(titleimage.size);
            make.top.equalTo(self).offset(kHeight(40));
        }];
        
        _title = [UILabel new];
        _title.font = [UIFont fontByName:MFONT fontSize:20];
        _title.textColor = kColorWithHex(MCOLOR);
        [titleImageView addSubview:_title];
        [_title  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(titleImageView);
        }];
        
        _mainScr =  [[UIScrollView alloc]init];
        _mainScr.delegate =self;
        _mainScr.minimumZoomScale = 1.0;
        _mainScr.maximumZoomScale = 3.0;
        _mainScr.showsVerticalScrollIndicator = NO;
        _mainScr.showsHorizontalScrollIndicator = NO;
        [self addSubview:_mainScr];
        [_mainScr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.equalTo(self);
        }];
        
        _imageV = [UIImageView new];
        _imageV.contentMode = UIViewContentModeScaleAspectFit;
        [_mainScr addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_mainScr);
            make.left.equalTo(_mainScr).offset(kWidth(10));
            make.right.equalTo(_mainScr).offset(-kWidth(10));
            make.height.equalTo(_imageV.mas_width);
        }];
    }
    return self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageV;
}

//控制缩放是在中心
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    
    self.imageV.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                       
                                       scrollView.contentSize.height * 0.5 + offsetY);
}

@end
