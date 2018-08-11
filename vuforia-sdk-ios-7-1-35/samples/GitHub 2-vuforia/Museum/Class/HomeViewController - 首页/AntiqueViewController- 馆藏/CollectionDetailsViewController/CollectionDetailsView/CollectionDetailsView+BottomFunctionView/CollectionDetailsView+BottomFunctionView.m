//
//  CollectionDetailsView+BottomFunctionView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/5.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionDetailsView+BottomFunctionView.h"
#import <objc/runtime.h>
#import "CollectionPhotoViewController.h"
#import "CollectionDetailsView+KnowledgeView.h"

static char *MasonryViewArrayTag = "MasonryViewArrayTag";

@implementation CollectionDetailsView (BottomFunctionView)

-(void)setMasonryViewArray:(NSMutableArray *)masonryViewArray {
     objc_setAssociatedObject(self, MasonryViewArrayTag, masonryViewArray,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray *)masonryViewArray {
    return objc_getAssociatedObject(self, MasonryViewArrayTag);
}

- (void)createBottomFunctionView {
    
    self.bottomFunctionView = [UIView new];
    [self addSubview:self.bottomFunctionView];
    [self.bottomFunctionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-kHeight(40));
        make.left.right.equalTo(self);
    }];
    
    self.masonryViewArray = [NSMutableArray array];
    NSArray *imageArray = @[@"gc_xg_zhishi",@"gc_xq_xijie",@"gc_xq_diwei",@"gc_xq_jieshuo"];
    for (int i=0; i<imageArray.count; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(bottomFunctionEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomFunctionView addSubview:btn];
        [self.masonryViewArray addObject:btn];
    }
    [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
    
    [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.bottomFunctionView);
    }];
    
}

- (void)bottomFunctionEvent:(UIButton *)sender {
    if (sender.tag == 0) {
        [self showKnowledgeView:YES];
    } else if (sender.tag == 1) {
        CollectionPhotoViewController *vc =[[CollectionPhotoViewController alloc]init];
        vc.photoList = self.model.collectionMicroList;
        [self.viewController.navigationController pushViewController:vc animated:YES];
    } else if (sender.tag == 2) {
        
    } else if (sender.tag == 3) {
        if (self.playerShowView == nil) {
            [self playMusic];
            if (self.model.star.length) {
                [self showKnowledgeView:NO];
            }
        } else {
            if (self.playerShowView.playerOption.isPlaying == 0) {
                self.playerShowView.playerOption.isPlaying = 1;
                [self.playerShowView.player play];
                [sender setImage:[UIImage imageNamed:@"gc_play_ico"] forState:UIControlStateNormal];
            }else {
                self.playerShowView.playerOption.isPlaying = 0;
                [self.playerShowView pause];
                [sender setImage:[UIImage imageNamed:@"gc_puss_ico"] forState:UIControlStateNormal];
            }
        }
    }
}


- (void)playMusic {
    if (self.model.commentaryList.count == 0) {
        [CustomView alertMessage:@"暂无解说" view:self];
        return;
    }
    CommentaryModel *musicModel =self.model.commentaryList[0];
    self.playerShowView = [[ZFTPlayerView alloc]initWithFrame:CGRectZero delegate:self url:musicModel.resource placeHolderImg:@"" playerOption:nil];
    
    self.playerShowView.playerOption.isPlaying = 1;
     [self.playerShowView.player prepareToPlay];
    //配置播放器类的相关代理方法
    self.playerShowView.playLoadStatesDelegate = self;
    self.playerShowView.playBackStateDidChangeDelgate = self;
    UIButton *btn = self.masonryViewArray.lastObject;
    [btn setImage:[UIImage imageNamed:@"gc_play_ico"] forState:UIControlStateNormal];
}


- (void)playerMPMovieFinishReasonPlaybackEnded {
    UIButton *btn = self.masonryViewArray.lastObject;
    [btn setImage:[UIImage imageNamed:@"gc_xq_jieshuo"] forState:UIControlStateNormal];
    [self releasePlayerView];
}

/*
 播放器当前的播放状态是播放状态
 */
-(void)playerMPMoviePlaybackStatePlaying {
    
}
/*
 播放器当前的播放状态是暂停状态
 */
-(void)playerMPMoviePlaybackStatePaused {
    
}



-(void)releasePlayerView{
    [self.playerShowView releasePlayer];
    self.playerShowView = nil;
}



- (void)dealloc {
    [self releasePlayerView];
}
@end
