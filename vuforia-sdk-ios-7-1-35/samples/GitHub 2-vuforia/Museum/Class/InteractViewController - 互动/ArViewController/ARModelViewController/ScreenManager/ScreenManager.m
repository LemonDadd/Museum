//
//  ScreenManager.m
//  GiftBox
//
//  Created by 康健 on 15/11/13.
//  Copyright © 2015年 xinyihezi. All rights reserved.
//

#import "ScreenManager.h"

@implementation ScreenManager
+ (void)fuzzyImageForImage:(UIImage *)image
                completion:(void (^)(UIImage *))completion {
    __block UIImage * returnImage;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // create our blurred image
        CIContext *context = [CIContext contextWithOptions:nil];
        CIImage *inputImage = [[CIImage alloc] initWithCGImage:image.CGImage options:nil];
        
        CIFilter *affineClampFilter = [CIFilter filterWithName:@"CIAffineClamp"];
        CGAffineTransform xform = CGAffineTransformMakeScale(1.0, 1.0);
        [affineClampFilter setValue:inputImage forKey:kCIInputImageKey];
        [affineClampFilter setValue:[NSValue valueWithBytes:&xform
                                                   objCType:@encode(CGAffineTransform)]
                             forKey:@"inputTransform"];
        CIImage *extendedImage = [affineClampFilter valueForKey:kCIOutputImageKey];
        CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
        [blurFilter setValue:extendedImage forKey:kCIInputImageKey];
        [blurFilter setValue:[NSNumber numberWithFloat:10.0f] forKey:@"inputRadius"];
        CIImage *result = [blurFilter valueForKey:kCIOutputImageKey];
        CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
        returnImage = [UIImage imageWithCGImage:cgImage];
        CGImageRelease(cgImage);
        if (returnImage == nil) {
            returnImage = image;//如果失败  则返回原图片
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            //回调主线程
            if (completion) {
                completion(image);
            }
        });
    });
}
+ (void)currentFuzzyImage:(void (^)(UIImage *))completion {
    [self fuzzyImageForImage:[self currentImage] completion:completion];
}
+ (void)fuzzyImageFromView:(UIView *)theView
                completion:(void (^)(UIImage *))completion {
    [self fuzzyImageForImage:[self imageFromView:theView] completion:completion];
}

+ (UIImage *)currentImage {
    return [self imageFromView:[[[UIApplication sharedApplication] delegate] window]];
}
/**截屏的image*/
+ (UIImage *)imageFromView:(UIView *)theView
{
//    if ([DeviceManager currentVersion].integerValue == 7) {
//        return nil;
//    }
////    UIGraphicsBeginImageContextWithOptions(theView.bounds.size, NO, 0);
////    [theView drawViewHierarchyInRect:theView.bounds afterScreenUpdates:NO];
////    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
////    UIGraphicsEndImageContext();
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
