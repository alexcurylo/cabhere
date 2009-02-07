//
//  WalkiesViewController.h
//  CabHere
//
//  Created by alex on 06/02/09.
//  Copyright 2009 Trollwerks Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WalkiesViewController : UIViewController <CLLocationManagerDelegate>
{
   IBOutlet UILabel* lastLocationDescription;

   IBOutlet UILabel* elapsedTime;

   IBOutlet UILabel* lastTime;
   IBOutlet UILabel* lastLatitude;
   IBOutlet UILabel* lastLongitude;
   IBOutlet UILabel* lastAltitude;
   IBOutlet UILabel* lastHorizonalAccuracy;
   IBOutlet UILabel* lastVerticalAccuracy;
   IBOutlet UILabel* lastCourse;
   IBOutlet UILabel* lastSpeed;

   IBOutlet UILabel* markedXDistance;
   IBOutlet UILabel* markedYDistance;
   IBOutlet UILabel* markedZDistance;

   IBOutlet UIButton* markButton;


   CLLocation *markedLocation;
   CLLocation *lastLocation;
}

@property (nonatomic, retain) CLLocation *markedLocation;
@property (nonatomic, retain) CLLocation *lastLocation;


- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)dealloc;

- (IBAction)markButtonPressed:(id)sender;

- (void)updateMarkDistances;

- (void)timerFireMethod:(NSTimer*)theTimer;

// CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
	fromLocation:(CLLocation *)oldLocation;
- (void)locationManager:(CLLocationManager *)manager
	didFailWithError:(NSError *)error;

@end
