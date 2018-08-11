//
//  SubscribeViewModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/30.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubscribeViewModelClass : NSObject

@property (nonatomic, strong)ResvDateModel *dateModel;
@property (nonatomic, strong)ResvTimeModel *timeModel;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *idCord;
@property (nonatomic, copy)NSString *phone;

- (void)requestResvervationAddByrequest:(void(^)(NSString *errorMsg))request;

@end
