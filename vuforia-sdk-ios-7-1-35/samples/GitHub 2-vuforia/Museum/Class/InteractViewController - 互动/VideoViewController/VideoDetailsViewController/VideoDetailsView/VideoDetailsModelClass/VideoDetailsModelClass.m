//
//  VideoDetailsModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/31.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "VideoDetailsModelClass.h"

@implementation VideoDetailsModelClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size =10;
    }
    return self;
}

- (void)requestVideoCommentListByVideoId:(NSString *)VideoId
                                 request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestVideoCommentListBySize:self.size Skip:self.skip*self.size videoId:VideoId request:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _allResource = message;
            request(nil);
        } else {
            request(errorMsg);
        }
    }];
}

- (void)requestVideoAddCommentByVideoId:(NSString *)VideoId
                                Content:(NSString *)content
                                request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestVideoAddCommentByContent:content videoId:VideoId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

- (void)requestVideoFavorByVideoId:(NSString *)VideoId
                           request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestVideoFavorBycategoryVideoId:VideoId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

- (void)requestVideoFavorCancleByVideoId:(NSString *)VideoId
                                 request:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestVideoFavorCancleBycategoryVideoId:VideoId request:^(BOOL message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

@end
