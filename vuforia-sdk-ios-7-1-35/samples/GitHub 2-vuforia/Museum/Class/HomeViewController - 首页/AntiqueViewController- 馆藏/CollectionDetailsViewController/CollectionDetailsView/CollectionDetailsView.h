//
//  CollectionDetailsView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/5.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"
#import "CollectionModel.h"
#import "CollectionDetailsModelClass.h"
#import "ZFTPlayerView.h"
#import "ZFTPlayerOption.h"

@interface CollectionDetailsView : BaseView

//顶部文字
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *designLabel;
@property (nonatomic, strong)UILabel *idLbael;

//
@property (nonatomic, strong)UIImageView *bgImageView;
@property (nonatomic, strong)UIImageView *collectionImageView;

//
@property (nonatomic, strong)UIView *rightFunctionView;
@property (nonatomic, strong)UIView *bottomFunctionView;

@property (nonatomic, strong)CollectionModel *model;
@property (nonatomic, strong)CollectionDetailsModelClass *modelClass;

@property(nonatomic,strong)ZFTPlayerView *playerShowView;
@property(nonatomic,strong)ZFTPlayerOption *playerOptions;//存放视频播放器的一些属性

- (instancetype)initWithCollectionModel:(CollectionModel *)model;

@end
