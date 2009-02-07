//
//  CabHereAppDelegate.h
//  CabHere
//
//  Created by alex on 15/06/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CabHereViewController;
@class WalkiesViewController;

@interface CabHereAppDelegate : NSObject <UIApplicationDelegate>
{
	IBOutlet UIWindow *window;
	IBOutlet CabHereViewController *cabViewController;
	IBOutlet WalkiesViewController *walkiesViewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) CabHereViewController *cabViewController;
@property (nonatomic, retain) WalkiesViewController *walkiesViewController;

@end

