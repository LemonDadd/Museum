//
//  SubscribeViewModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/30.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SubscribeViewModelClass.h"

@implementation SubscribeViewModelClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dateModel = nil;
        _timeModel = nil;
    }
    return self;
}


- (void)requestResvervationAddByrequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestResvervationAddByBeginTime:self.timeModel.beginTime EndTime:self.timeModel.endTime IdNumber:self.idCord Mobile:self.phone Name:self.name ResvDate:self.dateModel.date request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        } else {
            request(errorMsg);
        }
    }];
}

@end
