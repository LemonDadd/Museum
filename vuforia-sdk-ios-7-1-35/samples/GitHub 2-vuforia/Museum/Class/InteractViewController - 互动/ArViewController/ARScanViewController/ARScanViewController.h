//
//  ARScanViewController.h
//  Museum
//
//  Created by 关云秀 on 2017/12/14.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ARScanViewController : BaseViewController
//预览视频图层
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
//标记位置的图层
@property (nonatomic, strong) CAShapeLayer *tagLayer;
//当前视频会话
@property (nonatomic, strong) AVCaptureSession *session;

@property (nonatomic, strong)NSTimer *timer;

- (void)setOutput;
- (void)setQroutput;
@end
