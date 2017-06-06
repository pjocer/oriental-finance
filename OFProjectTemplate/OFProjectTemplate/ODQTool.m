//
//  ODQTool.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ODQTool.h"
#import <AVFoundation/AVFoundation.h>
#import "Masonry.h"
#import "ApplicationDetailsViewController.h"

#define SCANVIEW_EdgeTop 100.0
#define SCANVIEW_EdgeLeft 60.0
#define TINTCOLOR_ALPHA 0.2 //浅色透明度
#define DARKCOLOR_ALPHA 0.5 //深色透明度
#define VIEW_WIDTH [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT [UIScreen mainScreen].bounds.size.height



@interface ODQTool ()<AVCaptureMetadataOutputObjectsDelegate>{
    AVCaptureSession * session;//输入输出的中间桥梁
    UIView *AVCapView;//此 view 用来放置扫描框、取消按钮、说明 label
    UIView *_QrCodeline;//上下移动绿色的线条
    NSTimer *_timer;
}


@end

@implementation ODQTool

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *tempView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64)];
    AVCapView = tempView;
    
    
    
    [self.view addSubview:AVCapView];
    
    
    //画上边框
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    [AVCapView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(AVCapView).insets(UIEdgeInsetsMake(100, 60, 0, 60));
        make.height.equalTo(@0.5);
    }];
    
    //画左边框
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor whiteColor];
    [AVCapView addSubview:leftView];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(AVCapView).insets(UIEdgeInsetsMake(100, 60, 0, 60));
        make.width.equalTo(@0.5);
        make.height.equalTo(@(VIEW_WIDTH - 1 * SCANVIEW_EdgeLeft-60));
    }];
    
    //画右边框
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor whiteColor];
    [AVCapView addSubview:rightView];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(AVCapView).insets(UIEdgeInsetsMake(100, 60, 0, 60));
        make.width.equalTo(@0.5);
        make.height.equalTo(@(VIEW_WIDTH - 1 * SCANVIEW_EdgeLeft-60));
    }];
    
    //画下边框
    UIView *downView = [[UIView alloc] init];
    downView.backgroundColor = [UIColor whiteColor];
    [AVCapView addSubview:downView];
    
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(AVCapView).insets(UIEdgeInsetsMake(100, 60, 0, 60));
        make.height.equalTo(@0.5);
        make.top.equalTo(leftView.mas_bottom);
    }];
    
    
    
    //画中间的基准线
    _QrCodeline = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft + 1, SCANVIEW_EdgeTop, VIEW_WIDTH- 2 * SCANVIEW_EdgeLeft - 1, 0.5)];
    _QrCodeline.backgroundColor = [UIColor greenColor];
    [AVCapView addSubview:_QrCodeline];
   
    
    
    // 先让基准线运动一次，避免定时器的时差
    [UIView animateWithDuration:1.2 animations:^{
        
        _QrCodeline.frame = CGRectMake(SCANVIEW_EdgeLeft + 1, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop , VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft - 1, 0.5);
        
    }];
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.6;
    [AVCapView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(topView.mas_top);
    }];
    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor blackColor];
    view2.alpha = 0.6;
    [AVCapView addSubview:view2];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(topView.mas_top);
        make.bottom.equalTo(downView.mas_bottom);
        make.right.equalTo(leftView.mas_left);
    }];
    
    UIView *view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor blackColor];
    view3.alpha = 0.6;
    [AVCapView addSubview:view3];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.top.equalTo(topView.mas_top);
        make.bottom.equalTo(downView.mas_bottom);
        make.left.equalTo(rightView.mas_right);
    }];
    
    UIView *view4 = [[UIView alloc]init];
    view4.backgroundColor = [UIColor blackColor];
    view4.alpha = 0.6;
    [AVCapView addSubview:view4];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(downView.mas_bottom);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"点击机顶盒遥控器的'服务'按键 \n扫一扫电视屏幕上的二维码即可绑定机顶盒";
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIFont systemFontOfSize:13];
    [AVCapView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(downView.mas_bottom).offset(15);
        make.left.right.equalTo(self.view);
    }];
    
    
    
    [self performSelector:@selector(createTimer) withObject:nil afterDelay:0.4];
    
    
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [session addInput:input];
    [session addOutput:output];
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT);
    
    CGSize size = self.view.bounds.size;
    CGRect cropRect = CGRectMake(60, 100, 240, 240);
    output.rectOfInterest = CGRectMake(cropRect.origin.y/size.height,
                                       cropRect.origin.x/size.width,
                                       cropRect.size.height/size.height,
                                       cropRect.size.width/size.width);
    
    //设置代理在主线程里刷新
    //    [output setMetadataObjectsDelegate:selfqueue:dispatch_get_main_queue()];
    [AVCapView.layer insertSublayer:layer atIndex:0];
    //开始捕获
    [session startRunning];
    
    
}

-(void)addSubViews:(CGRect)frame
{
    CGFloat alpha = 0.6;
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = alpha;
    [AVCapView addSubview:view];
}



- (void)createTimer
{
    _timer=[NSTimer scheduledTimerWithTimeInterval:1.1 target:self selector:@selector(moveUpAndDownLine) userInfo:nil repeats:YES];
}

- (void)stopTimer
{
    if ([_timer isValid] == YES) {
        [_timer invalidate];
        _timer = nil;
    }
    
}

// 滚来滚去 :D :D :D
- (void)moveUpAndDownLine
{
    CGFloat YY = _QrCodeline.frame.origin.y;
    
    if (YY != VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop ) {
        [UIView animateWithDuration:1.2 animations:^{
            _QrCodeline.frame = CGRectMake(SCANVIEW_EdgeLeft + 1, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop , VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft - 1,0.5);
        }];
    }else {
        [UIView animateWithDuration:1.2 animations:^{
            _QrCodeline.frame = CGRectMake(SCANVIEW_EdgeLeft + 1, SCANVIEW_EdgeTop, VIEW_WIDTH - 2 * SCANVIEW_EdgeLeft - 1,0.5);
        }];
        
    }
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        //[session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);
        [session stopRunning];
        [self stopTimer];
        [AVCapView removeFromSuperview];
        
        ApplicationDetailsViewController *vc = [[ApplicationDetailsViewController alloc]init];
        vc.weburl = metadataObject.stringValue;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)touchAVCancelBtn{
    [session stopRunning];//摄像也要停止
    [self stopTimer];//定时器要停止
    [AVCapView removeFromSuperview];//刚刚创建的 view 要移除
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
