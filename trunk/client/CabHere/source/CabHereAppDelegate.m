//
//  CabHereAppDelegate.m
//  CabHere
//
//  Created by alex on 15/06/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "CabHereAppDelegate.h"
#import "CabHereViewController.h"
#import "WalkiesViewController.h"

@implementation CabHereAppDelegate

@synthesize window;
@synthesize cabViewController;
@synthesize walkiesViewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{	
   //[window addSubview:cabViewController.view];
   [window addSubview:walkiesViewController.view];
}

- (void)dealloc
{
   [cabViewController release];
   [walkiesViewController release];
   [window release];

   [super dealloc];
}


@end
