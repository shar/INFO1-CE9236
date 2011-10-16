//
//  HelloAppDelegate.m
//  Hello
//
//  Created by Rebecca Har on 10/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelloAppDelegate.h"
#import "PadView.h"

@implementation HelloAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    UIScreen *s = [UIScreen mainScreen];
	CGRect b = s.bounds;
	CGRect f = s.applicationFrame;
	
	padview = [[PadView alloc] initWithFrame: f];
	window = [[UIWindow alloc] initWithFrame: b];
	
	[window addSubview: padview];
	[window makeKeyAndVisible];

    NSLog(@"application.didFinishLaunchingWithOptions: b.origin == (%g, %g), b.size == %g by %g", 
		  b.origin.x,
		  b.origin.y,
		  b.size.width,
		  b.size.height);
	
	NSLog(@"application.didFinishLaunchingWithOptions: f.origin == (%g, %g), f.size == %g by %g", 
		  f.origin.x,
		  f.origin.y,
		  f.size.width,
		  f.size.height);
	
	NSLog(@"application.didFinishLaunchingWithOptions: view.retainCount = %u", padview.retainCount);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
	NSLog(@"AppDelegate - applicationWillResignActive");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
	NSLog(@"AppDelegate - applicationDidBecomeActive");

}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
	NSLog(@"AppDelegate - applicationWillTerminate");
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
	[padview release];
    [super dealloc];
}


@end
