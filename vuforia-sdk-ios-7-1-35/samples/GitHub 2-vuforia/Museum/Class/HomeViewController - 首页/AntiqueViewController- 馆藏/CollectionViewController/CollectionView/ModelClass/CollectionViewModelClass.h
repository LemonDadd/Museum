//
//  CollectionViewModelClass.h
//  Museum
//
//  Created by 关云秀 on 2017/12/3.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectionModel.h"

@interface CollectionViewModelClass : NSObject

@property (nonatomic, copy)NSString *categoryId;
@property (nonatomic, assign)NSInteger size;
@property (nonatomic, assign)NSInteger skip;
@property (nonatomic, strong)NSArray *allResource;

- (void)requestCollectionrRequest:(void(^)(NSString *errorMsg))request;

-(CGFloat)getCellHightByCollectionModel:(CollectionModel *)model andCellWidth:(CGFloat)width;

@end
