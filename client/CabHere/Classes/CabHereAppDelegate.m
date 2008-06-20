//
//  CabHereAppDelegate.m
//  CabHere
//
//  Created by alex on 15/06/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "CabHereAppDelegate.h"
#import "CabHereViewController.h"

@implementation CabHereAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	
	// Override point for customization after app launch	
    [window addSubview:viewController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
	[window release];
	[super dealloc];
}


@end
