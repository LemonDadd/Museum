//
//  PCollectionViewLayout.h
//  UICollectionView
//
//  Created by amoson on 2016/10/25.
//  Copyright © 2016年 amoson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PCollectionViewLayout;

@protocol PCollectionViewLayoutDelegate <NSObject>


/**
 根据每列的宽度获得对应的item 的高度

 @param flow  流水对象
 @param width 列宽
 @param index 索引

 @return height
 */
@required
-(CGFloat)waterFlow:(PCollectionViewLayout*)flow heightForWidth:(CGFloat)width indexPath:(NSIndexPath*)index;

@end

@interface PCollectionViewLayout : UICollectionViewLayout

//列数
@property(nonatomic,assign)NSInteger  columns;

//列间距
@property(nonatomic,assign)NSInteger columMargin;

//行间距
@property(nonatomic,assign)NSInteger rowMargin;

//容器离屏间距
@property(nonatomic,assign)UIEdgeInsets marginInsets;

//delegate
@property(nonatomic,weak)id<PCollectionViewLayoutDelegate>delegate;


@end
