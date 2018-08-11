//
//  UserInfoClass.h
//  jinheLV
//
//  Created by 今合网技术部 on 16/7/7.
//  Copyright © 2016年 今合网技术部. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfoClass;
static UserInfoClass *staticUserInfoClass;

@interface UserInfoClass : NSObject

@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *username;

/**
 *  获取用户信息
 *
 *  @return 
 */
+ (UserInfoClass*)getUserInfoClass;

/**
 *  保存用户信息
 */
- (void)saveUserInfoClass;

/**
 *  清除用户信息
 */
- (void)clearUserInfoClass;

/**
 *  切换用户的头像
 *
 *  @param imagePath
 */
+ (void)saveUserHeadImagePath:(NSString*)imagePath;


/**
 设置用户属性值

 @param value
 @param key
 @return
 */
+ (UserInfoClass *)setValue:(id)value forKey:(NSString *)key;


@end












