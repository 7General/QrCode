//
//  RecognizeViewController.m
//  QRCode
//
//  Created by zzg on 2018/3/14.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import "RecognizeViewController.h"
#import "ImagePickerController.h"

@interface RecognizeViewController ()
@property (nonatomic, strong) UIImageView * previewImageView;
@end

@implementation RecognizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"识别图片";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.previewImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.previewImageView];

    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择相册" style:UIBarButtonItemStylePlain target:self action:@selector(selectPhotos)];
}

-(void)selectPhotos {
    [self showPicker:UIImagePickerControllerSourceTypePhotoLibrary];
}


-(void)showPicker:(UIImagePickerControllerSourceType)type{
    //sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
    //sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //图片库
    //sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
    
    ImagePickerController *picker = [[ImagePickerController alloc] init];
    [picker cameraSourceType:type onFinishingBlock:^(UIImagePickerController *picker, NSDictionary *info, UIImage *originalImage, UIImage *editedImage) {
        self.previewImageView.image = originalImage;
        [self recognizeImage: originalImage];
    } onCancelingBlock:^() {
        
    }];
    
    [self presentViewController:picker animated:YES completion:nil];
    
}
- (void)recognizeFinishingBlock:(RecognizeFinishingBlock)recognizeFinishingBlock{
    _recognizeFinishingBlock = [recognizeFinishingBlock copy];
}

-(NSDictionary*)recognizeImage:(UIImage*)image{
    CIContext *content = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:content options:nil];
    CIImage *cimage = [CIImage imageWithCGImage:image.CGImage];
    NSArray *features = [detector featuresInImage:cimage];
    
    CIQRCodeFeature *f = [features firstObject];
    NSLog(@"f.messageString:%@",f.messageString);
    
    if (_recognizeFinishingBlock && f.messageString) {
        _recognizeFinishingBlock(f.messageString);
    }else{
        NSLog(@"妹子没找到");
    }
    return nil;
}


@end
