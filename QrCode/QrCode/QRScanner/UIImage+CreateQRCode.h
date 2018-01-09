//
//  UIImage+CreateQRCode.h
//  QRCode
//
//  Created by zzg on 2018/1/9.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CreateQRCode)

/**
 设置二维码

 @param string 扫描二维码内容
 @param Imagesize 二维码图片宽度
 @param waterImagesize 中间logo宽度
 @return 二维码加图片image
 */
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize;
@end
