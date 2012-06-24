//
//  QSViewController.h
//  QcoSample
//
//  Created by sbkro on 12/06/24.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSViewController : UIViewController
{
    @private
    // IBOutlet
    IBOutlet UITextField * textField;
    IBOutlet UITextField * moduleSizeField;
    IBOutlet UISegmentedControl * errorCorrectLevelSegment;
    IBOutlet UISlider * symbolVersionSlider;
    IBOutlet UILabel * currentSymbolVersionLabel;
    IBOutlet UISegmentedControl * fgColorSegment;
    IBOutlet UISegmentedControl * bgColorSegment;    
    IBOutlet UIButton * editCancelButton;
}

// IBAction
- (IBAction) encode:(id)sender;
- (IBAction) moduleSizeEditStart:(id)sender;
- (IBAction) moduleSizeEditEnd:(id)sender;

@end
