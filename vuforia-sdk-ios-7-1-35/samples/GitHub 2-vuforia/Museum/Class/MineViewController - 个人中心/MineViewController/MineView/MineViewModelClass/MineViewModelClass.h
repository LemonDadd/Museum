//
//  MineViewModelClass.h
//  Museum
//
//  Created by 关云秀 on 2018/1/4.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineViewModelClass : NSObject

@property (nonatomic, copy)NSString *photoStr;

- (void)updatePhotoImagesByImags:(UIImage *)img
                         Request:(void(^)(NSString *errorMsg))request;

@end
