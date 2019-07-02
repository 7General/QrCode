//
//  ViewController.m
//  QRCode
//
//  Created by zzg on 2018/1/9.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import "ViewController.h"
#import "QRScannerViewController.h"
#import "UIImage+CreateQRCode.h"
#import "RecognizeViewController.h"

@interface ViewController ()<QRScannerCodeDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"-----");
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 100);
    [btn setTitle:@"系统扫描二维码" forState:0];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(qrcode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *ScannBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ScannBtn.frame = CGRectMake(100, 300, 200, 100);
    [ScannBtn setTitle:@"系统识别二维码" forState:0];
    ScannBtn.backgroundColor = [UIColor redColor];
    [ScannBtn addTarget:self action:@selector(ScannCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ScannBtn];

//
//    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, self.view.bounds.size.width, 400)];
//    [self.view addSubview:imageView];
//    imageView.image = [UIImage qrImageForString:@"wirte qrcode file" imageSize:self.view.bounds.size.width logoImageSize:100 withLogoName:@"1.jpg"];
    self.view.backgroundColor = [UIColor redColor];
    //
    //
    // 
    self.view.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor redColor];

}

/**
 * 开始到结束的时间差
 */
- (BOOL)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime{
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    [date setDateFormat:@"yyyy-MM-dd"];
    NSDate *startD =[date dateFromString:startTime];
    NSDate *endD = [date dateFromString:endTime];
    NSTimeInterval start = [startD timeIntervalSince1970]*1;
    NSTimeInterval end = [endD timeIntervalSince1970]*1;
    NSTimeInterval value = end - start;
//    int second = (int)value %60;//秒
//    int minute = (int)value /60%60;
//    int house = (int)value / (24 *3600)%3600;
    int day = (int)value / (24 *3600);
    if (abs(day) >= 7) {
        return  YES;
    }else {
        return NO;
    }
//    NSString *str;
//    if (day != 0) {
//        str = [NSString stringWithFormat:@"耗时%d天%d小时%d分%d秒",day,house,minute,second];
//    }else if (day==0 && house !=0) {
//        str = [NSString stringWithFormat:@"耗时%d小时%d分%d秒",house,minute,second];
//    }else if (day==0 && house==0 && minute!=0) {
//        str = [NSString stringWithFormat:@"耗时%d分%d秒",minute,second];
//    }else{
//        str = [NSString stringWithFormat:@"耗时%d秒",second];
//    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    BOOL resStr = [self dateTimeDifferenceWithStartTime:@"2018-01-1" endTime:@"2018-01-8"];
//    if (resStr) {
//        NSLog(@"-------------------------");
//    }else {
//        NSLog(@"========================");
//    }
    
}



-(void)qrcode {
    NSLog(@"---");
    QRScannerViewController *scanner = [[QRScannerViewController alloc] init];
    scanner.scannerDelegate = self;
    [self presentViewController:scanner animated:YES completion:nil];
//    scanner.resultBlock = ^(NSString *value) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:value message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alertView show];
//    };
}

-(void)QRScannCode:(QRScannerViewController *)QRSannerVC withResoult:(NSString *)value{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:value message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}


-(void)ScannCode {
    RecognizeViewController * recognize = [[RecognizeViewController alloc] init];
    [self.navigationController pushViewController:recognize animated:YES];
}


@end
