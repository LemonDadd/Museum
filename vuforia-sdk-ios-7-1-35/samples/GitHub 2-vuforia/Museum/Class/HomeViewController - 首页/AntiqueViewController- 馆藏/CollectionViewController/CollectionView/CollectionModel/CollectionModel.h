//
//  CollectionModel.h
//  Museum
//
//  Created by 关云秀 on 2017/12/25.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentaryModel.h"

@interface CollectionModel : BaseModel

@property (nonatomic, assign)BOOL collected;// 是否收藏 ,
@property (nonatomic, retain)NSArray *collectionAttributeList;//属性列表 ,
@property (nonatomic, retain)NSArray *collectionMicroList;//细节列表 ,
@property (nonatomic, retain)NSArray *commentaryList;// 解说列表 ,
@property (nonatomic, copy)NSString *Id;
@property (nonatomic, copy)NSString *img; //整体图片 ,
@property (nonatomic, copy)NSString *knowledge;// 知识 ,
@property (nonatomic, copy)NSString *location;//定位 ,
@property (nonatomic, copy)NSString *name;//名称 ,
@property (nonatomic, copy)NSString *no; //编号 ,
@property (nonatomic, copy)NSString *period; //年代
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, copy)NSString *star;

@end

@interface CollectionAttributeModel : BaseModel
@property (nonatomic, copy)NSString *Id;
@property (nonatomic, copy)NSString *name;//属性名称 ,
@property (nonatomic, copy)NSString *value; //属性值

@end

@interface CollectionMicroModel : BaseModel

@property (nonatomic, copy)NSString *Id;
@property (nonatomic, copy)NSString *img; //细节图片 ,
@property (nonatomic, copy)NSString *name; //细节名称

@end


