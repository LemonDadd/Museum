//
//  HomeViewActivityCell.h
//  Museum
//
//  Created by 关云秀 on 2017/11/30.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewActivityCell : UITableViewCell

@property (nonatomic, strong)UIImageView *bgImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *dateLabel;
@property (nonatomic, strong)UIButton *activityBtn;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *didianLabel;
@property (nonatomic, strong)UILabel *baomingLabel;//报名人数
@property (nonatomic, strong)UILabel *peopleLabel;//已报人数

- (void)setActivityBtnState:(NSInteger)state;

@end
