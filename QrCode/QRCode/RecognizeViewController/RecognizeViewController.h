//
//  RecognizeViewController.h
//  QRCode
//
//  Created by zzg on 2018/3/14.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^RecognizeFinishingBlock)(NSString *string);

@interface RecognizeViewController : UIViewController
{
    RecognizeFinishingBlock _recognizeFinishingBlock;
}

- (void)recognizeFinishingBlock:(RecognizeFinishingBlock)recognizeFinishingBlock;
@end
