//
//  ActivityModel.h
//  Museum
//
//  Created by 关云秀 on 2017/12/23.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityModel : BaseModel
@property (nonatomic, copy)NSString *beginTime;// 开始时间 ,
@property (nonatomic, copy)NSString *endTime;//结束时间 ,
@property (nonatomic, copy)NSString *gatheringPlace;// 集合地点 ,
@property (nonatomic, copy)NSString *host;//主讲人 ,
@property (nonatomic, copy)NSString *Id;
@property (nonatomic, copy)NSString *img;//图片 ,
@property (nonatomic, copy)NSString *intro;//介绍 ,
@property (nonatomic, assign)NSInteger maxNumber ;//最大人数 ,
@property (nonatomic, copy)NSString *name; //名称 ,
@property (nonatomic, assign)NSInteger number;//已报名人数 ,
@property (nonatomic, retain)NSArray *participantList;//报名信息 ,
@property (nonatomic, copy)NSString *place;//主讲地点 ,
@property (nonatomic, assign)NSInteger state; //NOT_STARTED(0, "火热预订中"), STARTED(1, "活动进行中"), ENDED(2, "活动已结束")
@property (nonatomic, assign)BOOL collected;
@end

@interface ActivityParticipantModel : BaseModel
@property (nonatomic, copy)NSString *Id;
@property (nonatomic, copy)NSString *idNumber ;//身份证号 ,
@property (nonatomic, copy)NSString *mobile;// 手机号 ,
@property (nonatomic, copy)NSString *name ;// 姓名
@end
