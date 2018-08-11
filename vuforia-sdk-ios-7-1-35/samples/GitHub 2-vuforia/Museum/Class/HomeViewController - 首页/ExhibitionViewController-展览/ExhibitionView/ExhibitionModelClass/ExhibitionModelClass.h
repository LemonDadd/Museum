//
//  ExhibitionModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/17.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExhibitionModel.h"

@interface ExhibitionModelClass : NSObject

@property (nonatomic, assign)NSInteger size;
@property (nonatomic, assign)NSInteger skip;
@property (nonatomic, strong)NSArray *allResource;

- (void)requestExhibitionrequest:(void(^)(NSString *errorMsg))request;
@end
