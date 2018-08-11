//
//  HomeViewLampCell.h
//  Museum
//
//  Created by 关云秀 on 2017/11/30.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewLampCell : UITableViewCell

@property (nonatomic, strong)UIView *bgView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *rightImageView;
@property (nonatomic, strong)UIImageView *leftImageView;
@property (nonatomic, strong)NSArray *allResource;
@property (nonatomic, strong)NSTimer *timer;

@end
