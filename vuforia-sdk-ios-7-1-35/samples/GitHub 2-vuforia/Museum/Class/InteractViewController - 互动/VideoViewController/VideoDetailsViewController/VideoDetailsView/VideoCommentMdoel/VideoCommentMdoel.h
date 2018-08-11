//
//  VideoCommentMdoel.h
//  Museum
//
//  Created by 关云秀 on 2017/12/31.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseModel.h"

@interface VideoCommentMdoel : BaseModel
@property (nonatomic, copy)NSString * content;//内容 ,
@property (nonatomic, strong)UserInfoClass *createBy;//评论人 ,
@property (nonatomic, copy)NSString * createDate;//评论日期 ,
@property (nonatomic, copy)NSString * Id;
@end
