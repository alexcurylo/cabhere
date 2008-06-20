//
//  CabHereAppDelegate.m
//  CabHere
//
//  Created by alex on 15/06/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "CabHereViewController.h"

@implementation CabHereViewController

/*
 Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
}
 */

// Implement viewDidLoad if you need to do additional setup after loading the view.
- (void)viewDidLoad
{
	[super viewDidLoad];

   NSString* deviceID = [[UIDevice currentDevice] uniqueIdentifier];
   NSLog(@"device ID: %@", deviceID);
   // DeepThought simulator: 73AE1872-0B66-5D4A-AE8F-DB9853F06801
   // TrollPod: da7f8a03b93bfff5d532a56fa71a61ed9da8cbc8
   [_ibDevice setText:deviceID];


   CLLocationManager* locater = [[CLLocationManager alloc] init];
   locater.delegate = self;
   // check locationServicesEnabled?
   [locater startUpdatingLocation];
   _ibLocation.text = @"Looking around...";

//ABAddressBook* book = [ABAddressBook sharedAddressBook];
//ABPerson* person = [book me];
   // only works in simulator!
   //NSString* userName = (NSString*)CSCopyUserName(NO);
   NSLog(@"NSUserName: %@", NSUserName());
   NSLog(@"NSFullUserName: %@", NSFullUserName());
   _ibPickupName.text = NSUserName();
   //[userName release];


   _ibPickupAddress.text = @"Where'll they be?";

   _ibStatus.text = @"Starting up...";
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}


- (IBAction)cabHereButtonPressed:(id)sender
{
   _ibStatus.text = @"Calling cab...";
   [_ibProgress startAnimating];
}

- (IBAction)cancelCabButtonPressed:(id)sender
{
   _ibStatus.text = @"Cab cancelled!";
   [_ibProgress stopAnimating];
}

- (IBAction)cabArrivedButtonPressed:(id)sender
{
   _ibStatus.text = @"Have a nice trip!";
   [_ibProgress stopAnimating];
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
	fromLocation:(CLLocation *)oldLocation
{
   NSLog(@"location update: %@", [newLocation description]);
   // location update: <+49.27802273, -123.12648783> +/- 161.12m @ 2008-06-16 04:59:35 -0700
   // location update: <+49.27766418, -123.12731171> +/- 323.24m @ 2008-06-16 08:34:41 -0700
   _ibLocation.text = [newLocation description];

// http://mlbs.net/nacgeoservicesv4.5/xmllocationinfo.aspx?UserID=1368084706&Longitude=-123.12731171&Latitude=49.27766418
}

- (void)locationManager:(CLLocationManager *)manager
	didFailWithError:(NSError *)error

{
   NSLog(@"location FAIL: %@", error);
   _ibLocation.text = @"FAIL!";
   // [manager release];
}


@end
