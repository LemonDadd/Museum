//
//  CollectionModel.m
//  Museum
//
//  Created by 关云秀 on 2017/12/25.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionModel.h"

@implementation CollectionModel
+(void)load {
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"collectionAttributeList" : [CollectionAttributeModel class],
                 @"collectionMicroList" : [CollectionMicroModel class],
                 @"commentaryList" :[CommentaryModel class]
                 };
    }];
}
@end

@implementation CollectionAttributeModel
@end

@implementation CollectionMicroModel
@end
