//
//  ExhibitionModel.h
//  Museum
//
//  Created by 关云秀 on 2017/12/17.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExhibitionModel : BaseModel

@property (nonatomic, copy)NSString *beginTime; //开始日期 ,
@property (nonatomic, assign)BOOL collected; //是否收藏 ,
@property (nonatomic, copy)NSString *endTime;//结束日期 ,
@property (nonatomic, copy)NSString *Id;
@property (nonatomic, copy)NSString *img; //图片 ,
@property (nonatomic, copy)NSString *intro;//介绍 ,
@property (nonatomic, copy)NSString *name;//名称 ,
@property (nonatomic, copy)NSString *place;//地点

@end
