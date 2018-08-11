//
//  MuseumViewModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/25.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MuseumModel.h"

@interface MuseumViewModelClass : NSObject

@property (nonatomic, strong)MuseumModel *model;

- (void)requestGetMuseumByrequest:(void(^)(NSString *errorMsg))request;

@end
