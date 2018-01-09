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
    
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, self.view.bounds.size.width, 400)];
    [self.view addSubview:imageView];
    imageView.image = [UIImage qrImageForString:@"wirte qrcode file" imageSize:self.view.bounds.size.width logoImageSize:0];
    
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



@end
