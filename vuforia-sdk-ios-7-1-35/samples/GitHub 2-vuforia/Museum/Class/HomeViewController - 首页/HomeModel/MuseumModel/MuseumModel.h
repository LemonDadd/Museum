//
//  MuseumModel.h
//  Museum
//
//  Created by 关云秀 on 2017/12/23.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseModel.h"

@interface MuseumModel : BaseModel

@property (nonatomic, assign)NSInteger bookableNum; //当前可预约人数 ,
@property (nonatomic, copy)NSString *Id;
@property (nonatomic, copy)NSString *intro;//介绍 ,
@property (nonatomic, copy)NSString *name;// 博物馆名称 ,
@property (nonatomic, copy)NSString *openTime;//开馆时间说明,
@property (nonatomic, copy)NSString *resv ;// 预约提醒
@property (nonatomic, retain)NSArray *dateList;//预约日期
@property (nonatomic, retain)NSArray *timeList;//预约时间段

@end

@interface ResvTimeModel : BaseModel

@property (nonatomic, copy)NSString *beginTime;//开始时间：HH:mm ,
@property (nonatomic, assign)NSInteger bookableNum;//该时间段可预约人数 ,
@property (nonatomic, copy)NSString *endTime;//结束时间：HH:mm

@end

@interface ResvDateModel : BaseModel

@property (nonatomic, copy)NSString *date;//日期：yyyy-MM-dd ,
@property (nonatomic, copy)NSString *week;//星期：星期x
@end


