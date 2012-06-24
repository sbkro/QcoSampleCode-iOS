//
//  QSQRcodeViewController.h
//  QcoSample
//
//  Created by sbkro on 12/06/24.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSQRcodeViewController : UIViewController
{
    @private
    // IBOutlet
    IBOutlet UIImageView * qrcodeView;

    NSString * hoge;

}

// Method
- (void) setQrCode: (UIImage *) qrcode;

// IBAction
- (IBAction) close:(id)sender;

@end
