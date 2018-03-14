//
//  WebViewViewController.m
//  QRCode
//
//  Created by zzg on 2018/3/14.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView * web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURL * url = [NSURL URLWithString:self.webUrl];
    [web loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:web];
}


@end
