//
//  VieoModel.h
//  Museum
//
//  Created by 关云秀 on 2017/12/31.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseModel.h"

@interface VideoModel : BaseModel

@property (nonatomic, assign)BOOL favored;//是否已赞 ,
@property (nonatomic, copy)NSString *Id;
@property (nonatomic, assign)NSInteger likeNumber;//点赞数 ,
@property (nonatomic, copy)NSString *name;//名称 ,
@property (nonatomic, copy)NSString *url;//视频地址 ,
@property (nonatomic, assign)NSInteger viewNumber;//浏览量
@property (nonatomic, copy)NSString *cover;

@end
