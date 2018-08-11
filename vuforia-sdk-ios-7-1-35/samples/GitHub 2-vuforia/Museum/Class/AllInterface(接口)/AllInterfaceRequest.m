
//
//  AllInterfaceRequest.m
//  Museum
//
//  Created by 关云秀 on 2017/12/20.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "AllInterfaceRequest.h"
#import "SlideshowListModel.h"
#import "ActivityModel.h"
#import "AntiqueModel.h"
#import "ExhibitionModel.h"
#import "CollectionModel.h"
#import "AppointmentModel.h"
#import "VideoModel.h"
#import "VideoCommentMdoel.h"
#import "NHFUpLoadImages.h"


#define ErrorMessage @"数据请求失败,请检查您的网络"

@implementation AllInterfaceRequest

/**
 发送验证码
 
 @param mobile 手机号
 @param request 返回
 */
+ (void)requestsendValidCodeByMobile:(NSString *)mobile
                             request:(void(^)(NSString *message,
                                              BOOL success,
                                              NSString *errorMsg,
                                              BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:mobile forKey:@"mobile"];
    [HttpHelper httpDataRequest:SendValidCodeBaseUrl paramDictionary:paramDic TimeOutSeconds:120  request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(dic[@"data"], true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

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
                                        BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:userName forKey:@"mobile"];
    [paramDic setObject:passwd forKey:@"password"];
    [HttpHelper httpDataRequest:LoginBaseUrl paramDictionary:paramDic TimeOutSeconds:120  request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    UserInfoClass *userInfoClass = [UserInfoClass mj_objectWithKeyValues:dic[@"data"]];
                    request(userInfoClass, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

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
                                          BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:userName forKey:@"username"];
    [paramDic setObject:passwd forKey:@"password"];
    [paramDic setObject:mobile forKey:@"mobile"];
    [paramDic setObject:validCode forKey:@"validcode"];
    [paramDic setObject:validid forKey:@"id"];
    [HttpHelper httpDataRequest:UserRegBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish,  NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    UserInfoClass *userInfoClass = [UserInfoClass mj_objectWithKeyValues:dic[@"data"]];
                    request(userInfoClass, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

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
                                              BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:passwd forKey:@"passwd"];
    [paramDic setObject:mobile forKey:@"mobile"];
    [paramDic setObject:validCode forKey:@"validCode"];
    [paramDic setObject:validid forKey:@"id"];
    [HttpHelper httpDataRequest:ResetPasswordBaseUrl paramDictionary:paramDic  TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request([dic[@"data"] boolValue], true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}

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
                                             BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:mobile forKey:@"mobile"];
    [paramDic setObject:validCode forKey:@"validCode"];
    [paramDic setObject:validid forKey:@"id"];
    [HttpHelper httpDataRequest:UpdateMobileBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish,  NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request([dic[@"data"] boolValue], true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}

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
                                                    BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:newPassword forKey:@"newPassword"];
    [paramDic setObject:oldPassword forKey:@"oldPassword"];
    [HttpHelper httpDataRequest:UpdatePasswordBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish,  NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request([dic[@"data"] boolValue], true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}


/**
 修改头像
 
 @param photo url
 @param request 头像地址
 */
+ (void)requestUpdatePhotoByPhoto:(NSString *)photo
                          request:(void(^)(NSString *message,
                                           BOOL success,
                                           NSString *errorMsg,
                                           BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:photo forKey:@"photo"];
    [HttpHelper httpDataRequest:UpdatePhotoBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish,  NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(dic[@"data"], true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

+ (void)uploadImagesByImags:(NSArray *)imgs
                  ImagNames:(NSArray *)imagenames
                    Request:(void(^)(NSString *message,
                                     NSString *errorMsg))request {
    [[NHFUpLoadImages defaultManager]uploadMutableImageByUrlString:UploadBaseUrl params:nil images:imgs imageNames:imagenames process:^(CGFloat process) {
        
    } request:^(NSString *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            NSDictionary* dic =[JsonDeal dealJson:message];
            NSInteger Code = [[dic objectForKey:@"code"] integerValue];
            if (Code == 1) {
                NSArray *arr =dic[@"data"];
                request(arr.firstObject,nil);
            } else {
                request(nil,dic[@"message"]);
            }
        }else {
            request(nil,errorMsg);
        }
    }];
}

/**
 首页信息
 
 */
+ (void)requestHomeByrequest:(void(^)(HomeModel *message,
                                      BOOL success,
                                      NSString *errorMsg,
                                      BOOL error))request {
    [HttpHelper httpDataRequest:CommonIndxBaseUrl paramDictionary:nil TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    HomeModel *model = [HomeModel mj_objectWithKeyValues:dic[@"data"]];
                    request(model, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

/**
 轮播图
 */
+ (void)requestGetSlideshowListByrequest:(void(^)(NSArray *message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request {
    
    [HttpHelper httpDataRequestByGetMethod:SlideshowBaseUrl paramDictionary:nil TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            SlideshowListModel *model = [SlideshowListModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

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
                                              BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)size] forKey:@"size"];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)skip] forKey:@"skip"];
    [HttpHelper httpDataRequest:ActivityBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            ActivityModel *model = [ActivityModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

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
                                                BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)size] forKey:@"size"];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)skip] forKey:@"skip"];
    [HttpHelper httpDataRequest:ExhibitionBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            ExhibitionModel *model = [ExhibitionModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

/**
 博物馆信息
 
 */
+ (void)requestGetMuseumByrequest:(void(^)(MuseumModel *message,
                                           BOOL success,
                                           NSString *errorMsg,
                                           BOOL error))request {
    [HttpHelper httpDataRequestByGetMethod:MuseumBaseUrl paramDictionary:nil TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    MuseumModel *model = [MuseumModel mj_objectWithKeyValues:dic[@"data"]];
                    request(model, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}
/**
 获取馆藏分类
 
 @param request
 */

+ (void)requestGetCollectionCategoryByrequest:(void(^)(NSArray *message,
                                                       BOOL success,
                                                       NSString *errorMsg,
                                                       BOOL error))request {
    [HttpHelper httpDataRequest:CollectionCategoryBaseUrl paramDictionary:nil TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            AntiqueModel *model = [AntiqueModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

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
                                                  BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:categoryId forKey:@"categoryId"];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)size] forKey:@"size"];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)skip] forKey:@"skip"];
    [HttpHelper httpDataRequest:FindByCategoryBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            CollectionModel *model = [CollectionModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

/**
 藏品收藏
 
 @param request
 */

+ (void)requestCollectionFavorBycategoryId:(NSString *)categoryId
                                   request:(void(^)(BOOL message,
                                                    BOOL success,
                                                    NSString *errorMsg,
                                                    BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:categoryId forKey:@"id"];
    [HttpHelper httpDataRequest:CollectionFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}

/**
 藏品取消收藏
 
 @param request
 */
+ (void)requestCollectionFavorCancleBycategoryId:(NSString *)categoryId
                                         request:(void(^)(BOOL message,
                                                          BOOL success,
                                                          NSString *errorMsg,
                                                          BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:categoryId forKey:@"id"];
    [HttpHelper httpDataRequest:CollectionCancleFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}
/**
 我的收藏（藏品）
 
 @param request
 */
+ (void)requestCollectionFavorListBySize:(NSInteger)size
                                    Skip:(NSInteger)skip
                                 request:(void(^)(NSArray *message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)size] forKey:@"size"];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)skip] forKey:@"skip"];
    [HttpHelper httpDataRequest:CollectionMyFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            CollectionModel *model = [CollectionModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

/**
 活动收藏
 
 @param request
 */

+ (void)requestActivityFavorBycategoryId:(NSString *)categoryId
                                 request:(void(^)(BOOL message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:categoryId forKey:@"id"];
    [HttpHelper httpDataRequest:ActivityFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}

/**
 活动取消收藏
 
 @param request
 */
+ (void)requestActivityFavorCancleBycategoryId:(NSString *)categoryId
                                       request:(void(^)(BOOL message,
                                                        BOOL success,
                                                        NSString *errorMsg,
                                                        BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:categoryId forKey:@"id"];
    [HttpHelper httpDataRequest:ActivityCancleFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}
/**
 我的收藏（活动）
 
 @param request
 */
+ (void)requestActivityFavorListBySize:(NSInteger)size
                                  Skip:(NSInteger)skip
                               request:(void(^)(NSArray *message,
                                                BOOL success,
                                                NSString *errorMsg,
                                                BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)size] forKey:@"size"];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)skip] forKey:@"skip"];
    [HttpHelper httpDataRequest:ActivityMyFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            ActivityModel *model = [ActivityModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}


/**
 展览收藏
 
 @param request
 */

+ (void)requestExhibitionFavorBycategoryId:(NSString *)categoryId
                                   request:(void(^)(BOOL message,
                                                    BOOL success,
                                                    NSString *errorMsg,
                                                    BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:categoryId forKey:@"id"];
    [HttpHelper httpDataRequest:ExhibitionFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}

/**
 展览取消收藏
 
 @param request
 */
+ (void)requestExhibitionFavorCancleBycategoryId:(NSString *)categoryId
                                         request:(void(^)(BOOL message,
                                                          BOOL success,
                                                          NSString *errorMsg,
                                                          BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:categoryId forKey:@"id"];
    [HttpHelper httpDataRequest:ExhibitionCancleFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}
/**
 我的收藏（展览）
 
 @param request
 */
+ (void)requestExhibitionFavorListBySize:(NSInteger)size
                                    Skip:(NSInteger)skip
                                 request:(void(^)(NSArray *message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)size] forKey:@"size"];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)skip] forKey:@"skip"];
    [HttpHelper httpDataRequest:ExhibitionMyFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            ActivityModel *model = [ActivityModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}


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
                                                   BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:beginTime forKey:@"beginTime"];
    [paramDic setObject:endTime forKey:@"endTime"];
    [paramDic setObject:idNumber forKey:@"idNumber"];
    [paramDic setObject:mobile forKey:@"mobile"];
    [paramDic setObject:name forKey:@"name"];
    [paramDic setObject:resvDate forKey:@"resvDate"];
    [HttpHelper httpDataRequest:ResvervationAddBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
    
}

/**
 我的预约
 
 @param request
 */
+ (void)requestResvervationMimeByRequest:(void(^)(NSArray *message,
                                                  BOOL success,
                                                  NSString *errorMsg,
                                                  BOOL error))request {
    [HttpHelper httpDataRequestByGetMethod:ResvervationMineBaseUrl paramDictionary:nil TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            AppointmentModel *model = [AppointmentModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

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
                                                        BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:activityId forKey:@"activityId"];
    [paramDic setObject:idNumber forKey:@"idNumber"];
    [paramDic setObject:mobile forKey:@"mobile"];
    [paramDic setObject:name forKey:@"name"];
    [HttpHelper httpDataRequest:ActivityParticipateBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}
/**
 我的报名
 
 @param request
 */
+ (void)requestMyActivityByRequest:(void(^)(NSArray *message,
                                            BOOL success,
                                            NSString *errorMsg,
                                            BOOL error))request {
    [HttpHelper httpDataRequest:MyActivityBaseUrl paramDictionary:nil TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            ActivityModel *model = [ActivityModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

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
                                        BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)size] forKey:@"size"];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)skip] forKey:@"skip"];
    [paramDic setObject:category forKey:@"category"];
    [HttpHelper httpDataRequest:VideoListBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            VideoModel *model = [VideoModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}


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
                                               BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)size] forKey:@"size"];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)skip] forKey:@"skip"];
    [paramDic setObject:videoId forKey:@"id"];
    [HttpHelper httpDataRequest:VideoCommentListBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            VideoCommentMdoel *model = [VideoCommentMdoel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

/**
 视频添加评论
 
 @param request
 */
+ (void)requestVideoAddCommentByContent:(NSString *)content
                                videoId:(NSString *)videoId
                                request:(void(^)(BOOL message,
                                                 BOOL success,
                                                 NSString *errorMsg,
                                                 BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:content forKey:@"content"];
    [paramDic setObject:videoId forKey:@"videoId"];
    [HttpHelper httpDataRequest:VideoAddCommentBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}


/**
 视频点赞
 
 @param request
 */

+ (void)requestVideoFavorBycategoryVideoId:(NSString *)videoId
                                   request:(void(^)(BOOL message,
                                                    BOOL success,
                                                    NSString *errorMsg,
                                                    BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:videoId forKey:@"id"];
    [HttpHelper httpDataRequest:VideoFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}

/**
 视频取消点赞
 
 @param request
 */
+ (void)requestVideoFavorCancleBycategoryVideoId:(NSString *)videoId
                                         request:(void(^)(BOOL message,
                                                          BOOL success,
                                                          NSString *errorMsg,
                                                          BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:videoId forKey:@"id"];
    [HttpHelper httpDataRequest:VideoCancleFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request(true, true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}

/**
 明星说文物
 
 @param request
 */
+ (void)requestCommentaryListBySize:(NSInteger)size
                               Skip:(NSInteger)skip
                            request:(void(^)(NSArray *message,
                                             BOOL success,
                                             NSString *errorMsg,
                                             BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)size] forKey:@"size"];
    [paramDic setObject:[NSString stringWithFormat:@"%ld",(long)skip] forKey:@"skip"];
    [HttpHelper httpDataRequest:CommentaryListBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    NSMutableArray *result = [NSMutableArray new];
                    NSArray *datas = dic[@"data"];
                    for (NSDictionary *theDic in datas) {
                        @autoreleasepool {
                            CollectionModel *model = [CollectionModel mj_objectWithKeyValues:theDic];
                            [result addObject:model];
                        }
                    }
                    request(result, true, nil, false);
                } else {
                    request(nil, false, dic[@"message"], true);
                }
            }
        } else {
            request(nil, false, data, true);
        }
    }];
}

/**
 展览是否收藏
 
 @param request
 */
+ (void)requestExhibitionIsFavorById:(NSString *)Id
                            request:(void(^)(BOOL message,
                                             BOOL success,
                                             NSString *errorMsg,
                                             BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:Id forKey:@"Id"];
    [HttpHelper httpDataRequest:ExhibitionIsFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request([dic[@"data"] boolValue], true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}

/**
 馆藏是否收藏
 
 @param request
 */
+ (void)requestCollectionIsFavorById:(NSString *)Id
                             request:(void(^)(BOOL message,
                                              BOOL success,
                                              NSString *errorMsg,
                                              BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:Id forKey:@"Id"];
    [HttpHelper httpDataRequest:CollectionIsFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request([dic[@"data"] boolValue], true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}

/**
 活动是否收藏
 
 @param request
 */
+ (void)requestActivityIsFavorById:(NSString *)Id
                             request:(void(^)(BOOL message,
                                              BOOL success,
                                              NSString *errorMsg,
                                              BOOL error))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:Id forKey:@"Id"];
    [HttpHelper httpDataRequest:ActivityIsFavorBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, false, ErrorMessage, true);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"code"] integerValue];
                if (Code == 1) {
                    request([dic[@"data"] boolValue], true, nil, false);
                } else {
                    request(false, false, dic[@"message"], true);
                }
            }
        } else {
            request(false, false, data, true);
        }
    }];
}

@end
