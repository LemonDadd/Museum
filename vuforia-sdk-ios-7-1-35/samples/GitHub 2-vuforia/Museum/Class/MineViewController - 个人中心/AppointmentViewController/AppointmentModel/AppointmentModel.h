//
//  AppointmentModel.h
//  Museum
//
//  Created by 关云秀 on 2017/12/30.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppointmentModel : BaseModel
@property (nonatomic, copy)NSString *beginTime;//开始时间：ResvTime.beginTime ,
@property (nonatomic, copy)NSString *endTime;//结束时间：ResvTime.endTime ,
@property (nonatomic, copy)NSString *Id;//
@property (nonatomic, copy)NSString *idNumber;// 证件号码 ,
@property (nonatomic, copy)NSString *mobile;// 联系方式 ,
@property (nonatomic, copy)NSString *name;// 姓名 ,
@property (nonatomic, copy)NSString *no;//预约号 ,
@property (nonatomic, copy)NSString *resvDate;//预约日期：ResvDate.date
@end
