//
//  ARModelViewController.h
//  Museum
//
//  Created by 关云秀 on 2017/12/15.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseViewController.h"
#import "ArScanModel.h"
@protocol ARModelViewControllerDelegate <NSObject>

-(void)ARModelViewControllerPop;

@end

@interface ARModelViewController : BaseViewController
@property (nonatomic, strong)ArScanModel *arScanModel;
@property (nonatomic,weak) id<ARModelViewControllerDelegate> delegate;
@end
