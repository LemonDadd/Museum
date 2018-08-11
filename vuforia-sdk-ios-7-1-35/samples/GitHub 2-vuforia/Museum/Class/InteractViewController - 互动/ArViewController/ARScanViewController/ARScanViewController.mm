//
//  ARScanViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/14.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "ARScanViewController.h"
@interface ARScanViewController ()<AVCaptureVideoDataOutputSampleBufferDelegate,AVCaptureMetadataOutputObjectsDelegate>


//摄像头前面输入
@property (nonatomic, strong) AVCaptureDeviceInput *frontCameraInput;
//摄像头前面输入
@property (nonatomic, strong) AVCaptureDeviceInput *backCameraInput;
@property (nonatomic, strong) AVCaptureVideoDataOutput *output;
@property (nonatomic, strong) AVCaptureMetadataOutput *qroutput;

//是否是前置摄像头,默认是no
@property (nonatomic, assign) BOOL isDevicePositionFront;
@property (nonatomic, strong) UIImageView *lineImageView;

@end

@implementation ARScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置视频格式
    [self initVideoSet];
    
}

//设置导航右侧按钮
-(void)createNavBtn{
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 切换前后摄像头
-(void)navBtnToChangeCammer{
    if ( self.isDevicePositionFront ){
        [self.session stopRunning];
        [self.session removeInput:self.frontCameraInput];
        if ([self.session canAddInput:self.backCameraInput]) {
            [self.session addInput:self.backCameraInput];
            [self.session startRunning];
        }
    }else{
        [self.session stopRunning];
        [self.session removeInput:self.backCameraInput];
        if ([self.session canAddInput:self.frontCameraInput]) {
            [self.session addInput:self.frontCameraInput];
            [self.session startRunning];
        }
    }
}

#pragma mark - 视频初始化设置
-(void)initVideoSet{
    //创建一个Session会话，控制输入输出流
    AVCaptureSession *session = [[AVCaptureSession alloc]init];
    //设置视频质量
    session.sessionPreset = AVCaptureSessionPresetHigh;
    self.session = session;
    
    //选择输入设备,默认是后置摄像头
    AVCaptureDeviceInput *input = self.backCameraInput;
    
    
//    //设置输出的代理
//
//
//    //将输入输出添加到会话，连接
    if ([session canAddInput:input]) {
        [session addInput:input];
    }
//    if ([session canAddOutput:self.qroutput]) {
//        [session addOutput:self.qroutput];
//    }
//    //    if ([session canAddOutput:output]) {
//    //        [session addOutput:output];
//    //    }
    
    
    
    //创建预览图层
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:session];
    //设置layer大小
    previewLayer.frame = self.view.bounds;
    //视频大小根据frame大小自动调整
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:previewLayer];
    self.previewLayer = previewLayer;
    
    //创建一个处理后的预览图层,用来标记
    CAShapeLayer *targetLayer = [CAShapeLayer layer];
    targetLayer.frame = previewLayer.frame;
    [self.view.layer addSublayer:targetLayer];
    targetLayer.backgroundColor = [UIColor clearColor].CGColor;
    self.tagLayer = targetLayer;
    
    [self setQroutput];
//    if ([self.session canAddOutput:self.qroutput]) {
//        [self.session addOutput:self.qroutput];
//    }
//    self.qroutput.metadataObjectTypes = [NSArray arrayWithObject:AVMetadataObjectTypeQRCode];
//    //启动session
//    [self.session startRunning];
    
    
    _lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [DeviceInfo ScreenSize].width, 1)];
    _lineImageView.backgroundColor = kColorWithHex(0x9AF45B);
    [self.view addSubview:_lineImageView];
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake([DeviceInfo ScreenSize].width/2,0)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake([DeviceInfo ScreenSize].width/2, [DeviceInfo ScreenSize].height)];
    anima.duration = 1.5f;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    anima.repeatCount =CGFLOAT_MAX;
    [_lineImageView.layer addAnimation:anima forKey:@"position"];
    
}


- (void)setOutput {
    //[self.session stopRunning];
    if (self.session.outputs.count) {
        [self.session removeOutput:self.qroutput];
    }
    if ([self.session canAddOutput:self.output]) {
        [self.session addOutput:self.output];
    }
    //启动session
    //[self.session startRunning];
}

- (void)setQroutput {
    [self.session stopRunning];
    if (self.session.outputs.count) {
        [self.session removeOutput:self.output];
    }
    if ([self.session canAddOutput:self.qroutput]) {
        [self.session addOutput:self.qroutput];
    }
    self.qroutput.metadataObjectTypes = [NSArray arrayWithObject:AVMetadataObjectTypeQRCode];
    //启动session
    [self.session startRunning];
    
    //_timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(setOutput) userInfo:nil repeats:NO];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setOutput];
    });
    
}

#pragma mark - 摄像头输入
- (AVCaptureDeviceInput *)backCameraInput {
    if (_backCameraInput == nil) {
        NSError *error;
        AVCaptureDevice *device = [self cameraWithPosition:AVCaptureDevicePositionBack];
        _backCameraInput = [[AVCaptureDeviceInput  alloc] initWithDevice:device error:&error];
        if (error) {
            NSLog(@"后置摄像头获取失败");
        }
    }
    self.isDevicePositionFront = NO;
    return _backCameraInput;
}

- (AVCaptureDeviceInput *)frontCameraInput {
    if (_frontCameraInput == nil) {
        NSError *error;
        AVCaptureDevice *device = [self cameraWithPosition:AVCaptureDevicePositionFront];
        _frontCameraInput = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&error];
        if (error) {
            NSLog(@"前置摄像头获取失败");
        }
    }
    self.isDevicePositionFront = YES;
    return _frontCameraInput;
}

- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position{
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for ( AVCaptureDevice *device in devices )
        if ( device.position == position ){
            return device;
        }
    return nil;
}

-(AVCaptureVideoDataOutput *)output {
    if (!_output) {
        //设置视频输出流
        _output = [[AVCaptureVideoDataOutput alloc]init];
        
        //设置输出格式
        NSDictionary *settings = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA],                                   kCVPixelBufferPixelFormatTypeKey,nil];
        _output.videoSettings = settings;
        dispatch_queue_t videoQueue = dispatch_queue_create("VideoQueue", DISPATCH_QUEUE_SERIAL);
        [_output setSampleBufferDelegate:self queue:videoQueue];
    }
    return _output;
}


-(AVCaptureMetadataOutput *)qroutput {
    if (!_qroutput) {
       _qroutput = [[AVCaptureMetadataOutput alloc]init];
        dispatch_queue_t videoQueue = dispatch_queue_create("VideoQueue", DISPATCH_QUEUE_SERIAL);
        [_qroutput setMetadataObjectsDelegate:self queue:videoQueue];
    }
    return _qroutput;
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}


@end
