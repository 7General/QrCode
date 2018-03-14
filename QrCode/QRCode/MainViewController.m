//
//  MainViewController.m
//  QRCode
//
//  Created by zzg on 2018/3/14.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import "MainViewController.h"
#import "QRScannerViewController.h"
#import "UIImage+CreateQRCode.h"
#import "RecognizeViewController.h"
#import "WebViewViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
}
-(void)qrcode {
    NSLog(@"---");
    QRScannerViewController *scanner = [[QRScannerViewController alloc] init];
    [self presentViewController:scanner animated:YES completion:nil];
}
-(void)ScannCode {
    RecognizeViewController * recognize = [[RecognizeViewController alloc] init];
    [self.navigationController pushViewController:recognize animated:YES];
    [recognize recognizeFinishingBlock:^(NSString *string) {
        NSLog(@"----扫描结果:%@",string);
        WebViewViewController * web = [[WebViewViewController alloc] init];
        web.webUrl = string;
        [self.navigationController pushViewController:web animated:YES];
    }];
}


@end
