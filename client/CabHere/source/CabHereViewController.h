//
//  CabHereViewController.h
//  CabHere
//
//  Created by alex on 15/06/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CabHereViewController : UIViewController<CLLocationManagerDelegate>
{
   IBOutlet UILabel* _ibDevice;
   IBOutlet UILabel* _ibLocation;

   IBOutlet UITextField* _ibPickupName;
   IBOutlet UITextView* _ibPickupAddress;

   IBOutlet UIButton* _ibCabHereButton;

   IBOutlet UILabel* _ibStatus;
   IBOutlet UIActivityIndicatorView* _ibProgress;

   IBOutlet UIButton* _ibCancelCabButton;
   IBOutlet UIButton* _ibCabArrivedButton;
}

- (IBAction)cabHereButtonPressed:(id)sender;

- (IBAction)cancelCabButtonPressed:(id)sender;

- (IBAction)cabArrivedButtonPressed:(id)sender;

@end

