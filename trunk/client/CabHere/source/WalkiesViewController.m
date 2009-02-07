//
//  WalkiesViewController.m
//  CabHere
//
//  Created by alex on 06/02/09.
//  Copyright 2009 Trollwerks Inc. All rights reserved.
//

#import "WalkiesViewController.h"

@implementation WalkiesViewController

@synthesize markedLocation;
@synthesize lastLocation;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
   [super viewDidLoad];
   
   // check locationServicesEnabled?

   CLLocationManager* locater = [[CLLocationManager alloc] init];
   locater.delegate = self;
   locater.distanceFilter = kCLDistanceFilterNone;
   locater.desiredAccuracy = kCLLocationAccuracyBest;
   [locater startUpdatingLocation];
   (void)locater; // this can be retrieved in callback

   lastLocationDescription.text = @"Starting up...";

   NSTimer *updater = [NSTimer
      scheduledTimerWithTimeInterval:1
      target:self
      selector:@selector(timerFireMethod:)
      userInfo:nil
      repeats:YES
   ];
   (void)updater; // this can be retrieved in callback
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc
{
    [super dealloc];
}

- (IBAction)markButtonPressed:(id)sender
{
   //NSLog(@"mark!");
   self.markedLocation = self.lastLocation;
   [self updateMarkDistances];
}

- (void)updateMarkDistances
{
   if (!self.lastLocation)
      return;

   lastTime.text = [NSString stringWithFormat:@"%@", self.lastLocation.timestamp];
   lastLatitude.text = [NSString stringWithFormat:@"%f", (float)self.lastLocation.coordinate.latitude];
   lastLongitude.text = [NSString stringWithFormat:@"%f", (float)self.lastLocation.coordinate.longitude];
   lastAltitude.text = [NSString stringWithFormat:@"%f", (float)self.lastLocation.altitude];
   lastHorizonalAccuracy.text = [NSString stringWithFormat:@"%f", (float)self.lastLocation.horizontalAccuracy];
   lastVerticalAccuracy.text = [NSString stringWithFormat:@"%f", (float)self.lastLocation.verticalAccuracy];
   lastCourse.text = [NSString stringWithFormat:@"%f", (float)self.lastLocation.course];
   lastSpeed.text = [NSString stringWithFormat:@"%f", (float)self.lastLocation.speed];

   if (!self.markedLocation)
      return;

   CLLocationDistance distance = 0;

   CLLocationDegrees latitude = self.markedLocation.coordinate.latitude;
   CLLocationDegrees longitude = self.lastLocation.coordinate.longitude;
   CLLocation* fromMarkOnX = [[[CLLocation alloc] initWithLatitude:latitude longitude:longitude] autorelease];
   distance = [fromMarkOnX getDistanceFrom:self.markedLocation];
   markedXDistance.text = [NSString stringWithFormat:@"%f", (float)distance];

   latitude = self.lastLocation.coordinate.latitude;
   longitude = self.markedLocation.coordinate.longitude;
   CLLocation* fromMarkOnY = [[[CLLocation alloc] initWithLatitude:latitude longitude:longitude] autorelease];
   distance = [fromMarkOnY getDistanceFrom:self.markedLocation];
   markedYDistance.text = [NSString stringWithFormat:@"%f", (float)distance];

   distance = self.lastLocation.altitude - self.markedLocation.altitude;
   markedZDistance.text = [NSString stringWithFormat:@"%f", (float)distance];
}

- (void)timerFireMethod:(NSTimer*)theTimer
{
   if (!self.lastLocation)
      return;

   NSTimeInterval sinceLast = -1 * [self.lastLocation.timestamp timeIntervalSinceNow];
   elapsedTime.text = [NSString stringWithFormat:@"(%.02f ago)", (float)sinceLast];
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
	fromLocation:(CLLocation *)oldLocation
{
   (void)manager;
   (void)oldLocation;
   //NSLog(@"location update: %@", [newLocation description]);
   lastLocationDescription.text = [newLocation description];
   self.lastLocation = newLocation;
   [self updateMarkDistances];
}

// location update: <+49.27586365, -123.12681580> +/- 680.00m (speed -1.00 mps / course -1.00) @ 2009-02-07 09:59:22 -0800
// http://mlbs.net/nacgeoservicesv4.5/xmllocationinfo.aspx?UserID=1368084706&Longitude=-123.12731171&Latitude=49.27766418

- (void)locationManager:(CLLocationManager *)manager
	didFailWithError:(NSError *)error
{
   (void)manager;
   (void)error;
   //NSLog(@"location FAIL: %@", error);
   lastLocationDescription.text = @"FAIL!";
}

@end
