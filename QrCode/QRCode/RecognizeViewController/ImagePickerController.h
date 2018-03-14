//
//  ImagePickerController.h
//  QRCode
//
//  Created by zzg on 2018/3/14.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FinishingBlock)(UIImagePickerController *picker, NSDictionary *info, UIImage *originalImage, UIImage *editedImage);
typedef void (^CancelingBlock)(void);


@interface ImagePickerController : UIImagePickerController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    FinishingBlock _finishingBlock;
    CancelingBlock _cancelingBlock;
}
- (void)cameraSourceType:(UIImagePickerControllerSourceType)source
        onFinishingBlock:(FinishingBlock)finishingBlock
        onCancelingBlock:(CancelingBlock)cancelingBlock;


@end
