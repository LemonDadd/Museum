//
//  CollectionPhotoCell.h
//  Museum
//
//  Created by 关云秀 on 2018/1/6.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionPhotoCell : UICollectionViewCell<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *mainScr;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UIImageView *imageV;

@end
