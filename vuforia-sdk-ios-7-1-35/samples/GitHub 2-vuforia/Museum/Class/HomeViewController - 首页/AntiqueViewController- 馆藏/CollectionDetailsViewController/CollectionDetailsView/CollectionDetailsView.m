//
//  CollectionDetailsView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/5.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionDetailsView.h"
#import "CollectionDetailsView+BottomFunctionView.h"
#import "CollectionDetailsView+RightFunctionView.h"

@implementation CollectionDetailsView
{
    BOOL isTransform;
}
- (instancetype)initWithCollectionModel:(CollectionModel *)model
{
    self = [super init];
    if (self) {
        
        _modelClass = [CollectionDetailsModelClass new];
        
        _model = model;
        _bgImageView = [UIImageView new];
        _bgImageView.image = [UIImage imageNamed:@"gc_xq_bg"];
        [self addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _timeLabel = [UILabel new];
        _timeLabel.text =[NSString stringWithFormat:@"年代:%@",model.period];
        _timeLabel.font = [UIFont fontByName:MFONT fontSize:16];
        [self addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(kHeight(45));
        }];
        
        NSString *designStr = @"";
        for (int i=0; i<_model.collectionAttributeList.count; i++) {
            CollectionAttributeModel *att = _model.collectionAttributeList[i];
            if (i%2 == 0 && i>0) {
                designStr = [designStr stringByAppendingString:[NSString stringWithFormat:@"\n%@:%@",att.name,att.value]];
            }else {
                designStr = [designStr stringByAppendingString:[NSString stringWithFormat:@" %@:%@",att.name,att.value]];
            }
        }
        _designLabel = [UILabel new];
        _designLabel.numberOfLines = 0;
        _designLabel.textAlignment = NSTextAlignmentCenter;
        _designLabel.text = designStr;
        _designLabel.font = [UIFont fontByName:MFONT fontSize:18];
        [self addSubview:_designLabel];
        [_designLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_timeLabel.mas_bottom).offset(kHeight(10));
        }];
        
        _idLbael = [UILabel new];
        _idLbael.text =[NSString stringWithFormat:@"编号:%@",_model.no];
        _idLbael.font = [UIFont fontByName:MFONT fontSize:16];
        _idLbael.textColor = kColorWithHex(MCOLOR);
        [self addSubview:_idLbael];
        [_idLbael mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_designLabel.mas_bottom).offset(kHeight(10));
        }];
        
        [self createRightFunctionView];
        [self createBottomFunctionView];
        
        
//        CGFloat width = [DeviceInfo ScreenSize].width -150;
//        CGFloat hight = [DeviceInfo scalHeightByWidth:width BySize:CGSizeMake(model.width, model.height)];
        
        _collectionImageView = [UIImageView new];
        _collectionImageView.userInteractionEnabled =YES;
        _collectionImageView.contentMode = UIViewContentModeScaleAspectFit;
        [_collectionImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:nil];
        [self addSubview:_collectionImageView];
        [_collectionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
//            make.width.mas_equalTo(width);
//            make.height.mas_equalTo(hight);
            make.left.equalTo(self).offset(50);
            make.right.equalTo(self).offset(-50);
            make.top.equalTo(self.idLbael.mas_bottom).offset(20);
            make.bottom.equalTo(self.bottomFunctionView.mas_top).offset(-80);
        }];
        
        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewTransform)];
        [_collectionImageView addGestureRecognizer:gr];
        
        //设置优先级
        [_timeLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_idLbael setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_designLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    }
    return self;
}

- (void)imageViewTransform {
    isTransform = !isTransform;
    if (isTransform) {
        [UIView animateWithDuration:0.5 animations:^{
            _collectionImageView.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1.0);
        }];
        
    }else {
        [UIView animateWithDuration:0.5 animations:^{
            _collectionImageView.layer.transform = CATransform3DIdentity;
        }];
        
    }
}

@end
