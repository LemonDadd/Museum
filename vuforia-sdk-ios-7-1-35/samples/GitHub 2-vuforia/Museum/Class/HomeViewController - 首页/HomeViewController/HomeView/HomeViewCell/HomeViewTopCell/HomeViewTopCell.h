//
//  HomeViewTopCell.h
//  Museum
//
//  Created by 关云秀 on 2017/11/29.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface HomeViewTopCell : UITableViewCell<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *sdcycleScrollView;

- (void)setSdcycleImages:(NSArray *)array;

@end
