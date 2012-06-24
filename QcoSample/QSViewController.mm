//
//  QSViewController.mm
//  QcoSample
//
//  Created by sbkro on 12/06/24.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//

// ------------------------------------------------------------------------
//  Header files.
// ------------------------------------------------------------------------
#import "QSViewController.h"
#import "QCQRCode.h"
#import "QSQRcodeViewController.h"

// ------------------------------------------------------------------------
//  Category ... Local
// ------------------------------------------------------------------------
#pragma mark - Category Local
@interface QSViewController (Local)
- (void) releaseOutlets;
- (void) changeSlideValue:(id) sender;
- (UIColor *) getFgColor;
- (UIColor *) getBgColor;
- (QCErrorCorrectLevel) getErrorCorrectLevel;
@end

#pragma mark
@implementation QSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // set-up view
    [symbolVersionSlider addTarget:self action:@selector(changeSlideValue:) forControlEvents:UIControlEventValueChanged];
    [editCancelButton setHidden:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    [self releaseOutlets];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) dealloc
{
    [self releaseOutlets];
    [super dealloc];
}

#pragma mark IBAction
// ---------------------------------
// Create QR Code using view values.
- (IBAction) encode:(id)sender
{
    NSLog(@"---------------------------");
    NSLog(@"* Encode start.");
    NSLog(@"  Text              : %@", [textField text]);
    NSLog(@"  ModuleSize        : %@", [moduleSizeField text]);
    NSLog(@"  ErrorCorrectLevel : %d", [errorCorrectLevelSegment selectedSegmentIndex]);
    NSLog(@"  SymbolVersion     : %d", [[[NSNumber alloc] initWithDouble:[symbolVersionSlider value]] intValue]);
    NSLog(@"  fgColor           : %d", [fgColorSegment selectedSegmentIndex]);
    NSLog(@"  bgColor           : %d", [bgColorSegment selectedSegmentIndex]);
    NSLog(@"---------------------------");
    
    // -----------------------------
    //  Using sample of Qco.
    // -----------------------------
    QCQRCode * encoder = [[QCQRCode alloc] init];
    encoder.symbolVersion = [[[NSNumber alloc] initWithDouble:[symbolVersionSlider value]] intValue];
    encoder.correctLevel = [self getErrorCorrectLevel];
    encoder.moduleSize = [[moduleSizeField text] intValue];
    encoder.fgColor = [self getFgColor];
    encoder.bgColor = [self getBgColor];
    UIImage * qrcode = [encoder encodeWithText:[textField text]];

    if (qrcode != nil) {
        QSQRcodeViewController * view = [[QSQRcodeViewController alloc] initWithNibName:@"QSQRcodeViewController" bundle:[NSBundle mainBundle]];
        [self presentModalViewController:view animated:YES];
        [view setQrCode:qrcode];
        [view release];
    } else {
        NSLog(@"Text is long too.");
    }
}

- (IBAction) moduleSizeEditStart:(id)sender 
{
    [editCancelButton setHidden:NO];
}

- (IBAction) moduleSizeEditEnd:(id)sender
{
    [moduleSizeField resignFirstResponder];
    [textField resignFirstResponder];
    [editCancelButton setHidden:YES];
}

#pragma mark Category Local
- (void) releaseOutlets
{
    [moduleSizeField release], moduleSizeField = nil;
    [errorCorrectLevelSegment release], errorCorrectLevelSegment = nil;
    [symbolVersionSlider release], symbolVersionSlider = nil;
    [currentSymbolVersionLabel release], currentSymbolVersionLabel = nil;
    [textField release], textField = nil;
    [editCancelButton release], editCancelButton = nil;
    [fgColorSegment release], fgColorSegment = nil;
    [bgColorSegment release], bgColorSegment = nil;
}

- (void) changeSlideValue:(id)sender
{
    // for debug
    NSLog(@"--------------------------------------------------------------------------");
    NSLog(@"Catch Event ");
    NSLog(@"SlideValue : %f", [symbolVersionSlider value]);
    NSInteger slideValue = [[[NSNumber alloc] initWithDouble:[symbolVersionSlider value]] intValue];
    NSLog(@"CurrentSymbolVersion : %d", slideValue);
    if (slideValue == 0) {
        currentSymbolVersionLabel.text = @"Auto";
    } else {
        currentSymbolVersionLabel.text = [[NSString alloc] initWithFormat:@"%d", slideValue];        
    }
    NSLog(@"--------------------------------------------------------------------------");
    

}

- (UIColor *) getBgColor
{
    switch ([bgColorSegment selectedSegmentIndex]) {
        case 0:
            return [UIColor whiteColor];
        case 1:
            return [UIColor redColor];
        case 2:
            return [UIColor greenColor];
        case 3:
            return [UIColor blueColor];
        default:
            return [UIColor whiteColor];
    }
}

- (UIColor *) getFgColor
{
    switch ([fgColorSegment selectedSegmentIndex]) {
        case 0:
            return [UIColor blackColor];
        case 1:
            return [UIColor redColor];
        case 2:
            return [UIColor greenColor];
        case 3:
            return [UIColor blueColor];
        default:
            return [UIColor whiteColor];
    }   
}

- (QCErrorCorrectLevel) getErrorCorrectLevel
{
    switch ([errorCorrectLevelSegment selectedSegmentIndex]) {
        case 0:
            return QCErrorCorrectLevelLow;
        case 1:
            return QCErrorCorrectLevelMid;
        case 2:
            return QCErrorCorrectLevelQuarter;
        case 3:
            return QCErrorCorrectLevelHigh;
        default:
            return QCErrorCorrectLevelLow;
    }
}

@end
