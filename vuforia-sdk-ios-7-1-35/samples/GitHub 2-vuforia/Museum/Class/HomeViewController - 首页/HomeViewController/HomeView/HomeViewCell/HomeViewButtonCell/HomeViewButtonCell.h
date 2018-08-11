//
//  HomeViewButtonCell.h
//  Museum
//
//  Created by 关云秀 on 2017/11/30.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HomeViewButtonCellBtnEvent)(NSInteger indx);

@interface HomeViewButtonCell : UITableViewCell

@property (nonatomic, strong)UIView *bgView;
@property (nonatomic, copy)HomeViewButtonCellBtnEvent btnEvent;

@end
