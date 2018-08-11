//
//  CommentaryModel.h
//  Museum
//
//  Created by 关云秀 on 2017/12/24.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentaryModel : BaseModel
@property (nonatomic, copy)NSString *author; //解说人 ,
@property (nonatomic, copy)NSString *Id;
@property (nonatomic, copy)NSString *name;//名称 ,
@property (nonatomic, copy)NSString *resource;// 资源url
@end
