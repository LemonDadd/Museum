//
//  AllInterfaceRequest.h
//  Museum
//
//  Created by 关云秀 on 2017/12/20.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "JsonDeal.h"
#import "UserInfoClass.h"
#import "MuseumModel.h"
#import "HomeModel.h"
@interface AllInterfaceRequest : JsonDeal

///api/common/sendValidCode

/**
 发送验证码
 
 @param mobile 手机号
 @param request 返回
 */
+ (void)requestsendValidCodeByMobile:(NSString *)mobile
                             request:(void(^)(NSString *message,
                                              BOOL success,
                                              NSString *errorMsg,
                                              BOOL error))request;

/**
 登录
 
 @param userName 用户名
 @param passwd 密码
 @param request 用户信息
 */
+ (void)requestLoginByUserName:(NSString *)userName
                        passwd:(NSString *)passwd
                       request:(void(^)(UserInfoClass *userInfoClass,
                                        BOOL success,
                                        NSString *errorMsg,
                                        BOOL error))request;

/**
 注册
 
 @param userName 用户名
 @param passwd 密码
 @param mobile 手机号
 @param validCode 验证码
 @param validid 验证码Id
 @param request 用户信息
 */
+ (void)requestUserRegByUserName:(NSString *)userName
                          passwd:(NSString *)passwd
                          mobile:(NSString *)mobile
                       validCode:(NSString *)validCode
                         validid:(NSString *)validid
                         request:(void(^)(UserInfoClass *userInfoClass,
                                          BOOL success,
                                          NSString *errorMsg,
                                          BOOL error))request;

/**
 重置密码
 
 @param passwd 密码
 @param mobile 手机号
 @param validCode 验证码
 @param validid 验证码Id
 @param request 返回
 */
+ (void)requestResetPasswordBypasswd:(NSString *)passwd
                              mobile:(NSString *)mobile
                           validCode:(NSString *)validCode
                             validid:(NSString *)validid
                             request:(void(^)(BOOL message,
                                              BOOL success,
                                              NSString *errorMsg,
                                              BOOL error))request;

/**
 重新绑定手机
 
 @param mobile 手机号
 @param validCode 验证码
 @param validid 验证码Id
 @param request 返回
 */
+ (void)requestUpdateMobileByMobile:(NSString *)mobile
                          validCode:(NSString *)validCode
                            validid:(NSString *)validid
                            request:(void(^)(BOOL message,
                                             BOOL success,
                                             NSString *errorMsg,
                                             BOOL error))request;

/**
 修改密码
 
 @param newPassword 新密码
 @param oldPassword 旧密码
 @param request 返回
 */
+ (void)requestUpdatePasswordByNewPassword:(NSString *)newPassword
                               oldPassword:(NSString *)oldPassword
                                   request:(void(^)(BOOL message,
                                                    BOOL success,
                                                    NSString *errorMsg,
                                                    BOOL error))request;


/**
 修改头像
 
 @param photo url
 @param request 头像地址
 */
+ (void)requestUpdatePhotoByPhoto:(NSString *)photo
                          request:(void(^)(NSString *message,
                                           BOOL success,
                                           NSString *errorMsg,
                                           BOOL error))request;
/**
 上传头像
 
 @param photo url
 @param request 头像地址
 */
+ (void)uploadImagesByImags:(NSArray *)imgs
                  ImagNames:(NSArray *)imagenames
                    Request:(void(^)(NSString *message,
                                     NSString *errorMsg))request;
/**
 首页信息
 
 */
+ (void)requestHomeByrequest:(void(^)(HomeModel *message,
                                      BOOL success,
                                      NSString *errorMsg,
                                      BOOL error))request;

/**
 轮播图
 */
+ (void)requestGetSlideshowListByrequest:(void(^)(NSArray *message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request;

/**
 活动列表
 
 @param size size
 @param skip skip
 @param request array
 */
+ (void)requestGetActivityListBySize:(NSInteger)size
                                Skip:(NSInteger)skip
                             request:(void(^)(NSArray *message,
                                              BOOL success,
                                              NSString *errorMsg,
                                              BOOL error))request;

/**
 展览列表
 
 @param size size
 @param skip skip
 @param request array
 */
+ (void)requestGetExhibitionListBySize:(NSInteger)size
                                  Skip:(NSInteger)skip
                               request:(void(^)(NSArray *message,
                                                BOOL success,
                                                NSString *errorMsg,
                                                BOOL error))request;

/**
 博物馆信息
 
 */
+ (void)requestGetMuseumByrequest:(void(^)(MuseumModel *message,
                                           BOOL success,
                                           NSString *errorMsg,
                                           BOOL error))request;


/**
 获取馆藏分类
 
 @param request
 */
+ (void)requestGetCollectionCategoryByrequest:(void(^)(NSArray *message,
                                                       BOOL success,
                                                       NSString *errorMsg,
                                                       BOOL error))request;

/**
 根据分类获取藏品
 
 @param request
 */
+ (void)requestGetCollectionBycategoryId:(NSString *)categoryId
                                    Size:(NSInteger)size
                                    Skip:(NSInteger)skip
                                 request:(void(^)(NSArray *message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request;


/**
 藏品收藏
 
 @param request
 */

+ (void)requestCollectionFavorBycategoryId:(NSString *)categoryId
                                   request:(void(^)(BOOL message,
                                                    BOOL success,
                                                    NSString *errorMsg,
                                                    BOOL error))request;

/**
 藏品取消收藏
 
 @param request
 */
+ (void)requestCollectionFavorCancleBycategoryId:(NSString *)categoryId
                                         request:(void(^)(BOOL message,
                                                          BOOL success,
                                                          NSString *errorMsg,
                                                          BOOL error))request;
/**
 我的收藏（藏品）
 
 @param request
 */
+ (void)requestCollectionFavorListBySize:(NSInteger)size
                                    Skip:(NSInteger)skip
                                 request:(void(^)(NSArray *message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request;

/**
 活动收藏
 
 @param request
 */

+ (void)requestActivityFavorBycategoryId:(NSString *)categoryId
                                 request:(void(^)(BOOL message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request;

/**
 活动取消收藏
 
 @param request
 */
+ (void)requestActivityFavorCancleBycategoryId:(NSString *)categoryId
                                       request:(void(^)(BOOL message,
                                                        BOOL success,
                                                        NSString *errorMsg,
                                                        BOOL error))request;
/**
 我的收藏（活动）
 
 @param request
 */
+ (void)requestActivityFavorListBySize:(NSInteger)size
                                  Skip:(NSInteger)skip
                               request:(void(^)(NSArray *message,
                                                BOOL success,
                                                NSString *errorMsg,
                                                BOOL error))request;


/**
 展览收藏
 
 @param request
 */

+ (void)requestExhibitionFavorBycategoryId:(NSString *)categoryId
                                   request:(void(^)(BOOL message,
                                                    BOOL success,
                                                    NSString *errorMsg,
                                                    BOOL error))request;

/**
 展览取消收藏
 
 @param request
 */
+ (void)requestExhibitionFavorCancleBycategoryId:(NSString *)categoryId
                                         request:(void(^)(BOOL message,
                                                          BOOL success,
                                                          NSString *errorMsg,
                                                          BOOL error))request;
/**
 我的收藏（展览）
 
 @param request
 */
+ (void)requestExhibitionFavorListBySize:(NSInteger)size
                                    Skip:(NSInteger)skip
                                 request:(void(^)(NSArray *message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request;

/**
 博物馆预约
 
 @param request
 */
+ (void)requestResvervationAddByBeginTime:(NSString *)beginTime
                                  EndTime:(NSString *)endTime
                                 IdNumber:(NSString *)idNumber
                                   Mobile:(NSString *)mobile
                                     Name:(NSString *)name
                                 ResvDate:(NSString *)resvDate
                                  request:(void(^)(BOOL message,
                                                   BOOL success,
                                                   NSString *errorMsg,
                                                   BOOL error))request;

/**
 我的预约
 
 @param request
 */
+ (void)requestResvervationMimeByRequest:(void(^)(NSArray *message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request;

/**
 活动报名
 
 @param request
 */
+ (void)requestActivityParticipateByActivityId:(NSString *)activityId
                                      IdNumber:(NSString *)idNumber
                                        Mobile:(NSString *)mobile
                                          Name:(NSString *)name
                                       request:(void(^)(BOOL message,
                                                        BOOL success,
                                                        NSString *errorMsg,
                                                        BOOL error))request;
/**
 我的报名
 
 @param request
 */
+ (void)requestMyActivityByRequest:(void(^)(NSArray *message,
                                            BOOL success,
                                            NSString *errorMsg,
                                            BOOL error))request;
/**
 视频列表
 
 @param request
 */
+ (void)requestVideoListBySize:(NSInteger)size
                          Skip:(NSInteger)skip
                      Category:(NSString *)category
                       request:(void(^)(NSArray *message,
                                        BOOL success,
                                        NSString *errorMsg,
                                        BOOL error))request;

/**
 视频评论列表
 
 @param request
 */
+ (void)requestVideoCommentListBySize:(NSInteger)size
                                 Skip:(NSInteger)skip
                              videoId:(NSString *)videoId
                              request:(void(^)(NSArray *message,
                                               BOOL success,
                                               NSString *errorMsg,
                                               BOOL error))request;

/**
 视频评论列表
 
 @param request
 */
+ (void)requestVideoAddCommentByContent:(NSString *)content
                                videoId:(NSString *)videoId
                                request:(void(^)(BOOL message,
                                                 BOOL success,
                                                 NSString *errorMsg,
                                                 BOOL error))request;


/**
 视频点赞
 
 @param request
 */

+ (void)requestVideoFavorBycategoryVideoId:(NSString *)videoId
                                   request:(void(^)(BOOL message,
                                                    BOOL success,
                                                    NSString *errorMsg,
                                                    BOOL error))request;

/**
 视频取消点赞
 
 @param request
 */
+ (void)requestVideoFavorCancleBycategoryVideoId:(NSString *)videoId
                                         request:(void(^)(BOOL message,
                                                          BOOL success,
                                                          NSString *errorMsg,
                                                          BOOL error))request;
/**
 明星说文物
 
 @param request
 */
+ (void)requestCommentaryListBySize:(NSInteger)size
                               Skip:(NSInteger)skip
                            request:(void(^)(NSArray *message,
                                             BOOL success,
                                             NSString *errorMsg,
                                             BOOL error))request;
/**
 展览是否收藏
 
 @param request
 */
+ (void)requestExhibitionIsFavorById:(NSString *)Id
                             request:(void(^)(BOOL message,
                                              BOOL success,
                                              NSString *errorMsg,
                                              BOOL error))request;
/**
 馆藏是否收藏
 
 @param request
 */
+ (void)requestCollectionIsFavorById:(NSString *)Id
                             request:(void(^)(BOOL message,
                                              BOOL success,
                                              NSString *errorMsg,
                                              BOOL error))request;
/**
 活动是否收藏
 
 @param request
 */
+ (void)requestActivityIsFavorById:(NSString *)Id
                           request:(void(^)(BOOL message,
                                            BOOL success,
                                            NSString *errorMsg,
                                            BOOL error))request;
@end
