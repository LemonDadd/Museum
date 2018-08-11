//
//  CollectionViewModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/3.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionViewModelClass.h"


@implementation CollectionViewModelClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size =10;
    }
    return self;
}

- (void)requestCollectionrRequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestGetCollectionBycategoryId:self.categoryId Size:self.size Skip:self.skip*self.size request:^(NSArray *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            _allResource = message;
            request(nil);
        }else {
            request(errorMsg);
        }
    }];
}

-(CGFloat)getCellHightByCollectionModel:(CollectionModel *)model andCellWidth:(CGFloat)width{
    
    CGFloat imageHight = [DeviceInfo scalHeightByWidth:width-10 BySize:CGSizeMake(model.width, model.height)];
    CGFloat titleHight = [UILabel labelConstrainedHeightByWidth:width content:[NSString stringWithFormat:@"【%@】%@",model.period,model.name] font:[UIFont fontByName:MFONT fontSize:18]].height;
    CGFloat idHight =[UILabel labelConstrainedHeightByWidth:width content:[NSString stringWithFormat:@" 编号: %@",model.no] font:[UIFont fontByName:MFONT fontSize:14]].height;
    return  imageHight +titleHight+idHight+10;
}


@end
