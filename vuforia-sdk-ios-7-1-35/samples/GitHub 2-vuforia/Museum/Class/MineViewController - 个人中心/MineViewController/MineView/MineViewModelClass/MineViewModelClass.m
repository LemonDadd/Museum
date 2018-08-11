//
//  MineViewModelClass.m
//  Museum
//
//  Created by 关云秀 on 2018/1/4.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import "MineViewModelClass.h"
#import "NHFUpLoadImages.h"

@implementation MineViewModelClass


- (void)updatePhotoImagesByImags:(UIImage *)img
                         Request:(void(^)(NSString *errorMsg))request {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *imageName = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg",imageName];
    
    [AllInterfaceRequest uploadImagesByImags:@[img] ImagNames:@[fileName] Request:^(NSString *message, NSString *errorMsg) {
        if (message) {
            self.photoStr = message;
            [AllInterfaceRequest requestUpdatePhotoByPhoto:message request:^(NSString *message, BOOL success, NSString *errorMsg, BOOL error) {
                if (success && !error) {
                    request(nil);
                }else {
                    request(errorMsg);
                }
            }];
        }else {
            request(errorMsg);
        }
    }];
}
@end
