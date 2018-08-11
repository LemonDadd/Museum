//
//  ActivityContentViewController.h
//  Museum
//
//  Created by 关云秀 on 2017/12/14.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseViewController.h"
#import "ActivityModel.h"

@interface ActivityContentViewController : BaseViewController

@property (nonatomic, strong)ActivityModel *model;
@property (nonatomic, assign)BOOL isMy;

@end
