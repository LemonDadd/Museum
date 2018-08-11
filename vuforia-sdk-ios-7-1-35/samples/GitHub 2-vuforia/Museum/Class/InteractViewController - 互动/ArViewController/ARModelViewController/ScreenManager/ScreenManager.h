//
//  ScreenManager.h
//  GiftBox
//
//  Created by 康健 on 15/11/13.
//  Copyright © 2015年 xinyihezi. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 截屏的管理类,为了不影响主线程，虚化需要放到子线程异步 */
@interface ScreenManager : NSObject
/**
 * 获取指定图片对应的虚化image
 */
+ (void)fuzzyImageForImage:(UIImage *)image
                completion:(void(^)(UIImage * fuzzyImage))completion;
/**
 * 获取当前屏幕的虚化image
 */
+ (void)currentFuzzyImage:(void(^)(UIImage * fuzzyImage))completion;
/**
 * 获取指定view的虚化image
 */
+ (void)fuzzyImageFromView:(UIView *)theView
                completion:(void(^)(UIImage * fuzzyImage))completion;
/**
 * 获取当前屏幕的image
 */
+ (UIImage *)currentImage;
/**
 * 获取指定屏幕的image
 */
+ (UIImage *)imageFromView:(UIView *)theView;
@end
