//
//  ImagePickerController.m
//  QRCode
//
//  Created by zzg on 2018/3/14.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import "ImagePickerController.h"

@interface ImagePickerController ()

@end

@implementation ImagePickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)cameraSourceType:(UIImagePickerControllerSourceType)source
        onFinishingBlock:(FinishingBlock)finishingBlock
        onCancelingBlock:(CancelingBlock)cancelingBlock;
{
    self.delegate = self;
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        source = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    self.sourceType = source;
    _cancelingBlock = [cancelingBlock copy];
    _finishingBlock = [finishingBlock copy];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        if (_finishingBlock) {
            _finishingBlock(picker, info, ((UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage]), ((UIImage *)[info objectForKey:UIImagePickerControllerEditedImage]));
            
        }
    }];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:^{
        if (_cancelingBlock) {
            _cancelingBlock();
            
        }
    }];
}

@end
