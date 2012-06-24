//
//  QSQRcodeViewController.m
//  QcoSample
//
//  Created by sbkro on 12/06/24.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//

// ------------------------------------------------------------------------
//  Header files.
// ------------------------------------------------------------------------
#import "QSQRcodeViewController.h"


// ------------------------------------------------------------------------
//  Category ... Local
// ------------------------------------------------------------------------
#pragma mark - Category Local
@interface QSQRcodeViewController (Local)
- (void) releaseOutlets;
@end

@implementation QSQRcodeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        qrcodeView = [[UIImageView alloc] init];
    }
    return self;
}

- (void) dealloc
{
    [self releaseOutlets];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    [self releaseOutlets];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) setQrCode:(UIImage *)qrcode
{
    [qrcodeView.image release], qrcodeView.image = nil;
    qrcodeView.image = qrcode;
}

#pragma mark Category Local
- (void) releaseOutlets
{
    [qrcodeView release], qrcodeView = nil;
}

#pragma mark IBAction

- (IBAction) close:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
