//
//  AppDelegate.m
//  Nov17
//
//  Created by Sukman Har on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "PadView.h"
#import <AVFoundation/AVFoundation.h>

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIScreen *screen = [UIScreen mainScreen];
	padview = [[PadView alloc] initWithFrame: screen.applicationFrame];
	self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
	//self.window.backgroundColor = [UIColor whiteColor];
    
	[self.window addSubview: padview];
	[self.window makeKeyAndVisible];
	return YES;
}

-(void) stopMusic: (id) sender
{
    if ([player isPlaying] )
    {
        [player stop];
    }
}

-(void) replayMusic: (id) sender
{
    [player prepareToPlay];
    [player play];
}

-(void) volumeChanged:(id)sender
{
    UISlider *s = sender;
    player.volume = s.value;
    volume = s.value;
}

-(void) playMusic: (id) sender 
{
    UISegmentedControl *control = sender;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path;
    
	switch (control.selectedSegmentIndex) 
    {
        case 0:
            path =
            [bundle pathForResource: @"bach" ofType: @"mp3"];
            break;
        case 1:
            path =
            [bundle pathForResource: @"beethoven" ofType: @"mp3"];
            break;
        case 2:
            path =
            [bundle pathForResource: @"chopin" ofType: @"mp3"];
            break;
        case 3:
            path =
            [bundle pathForResource: @"mozart" ofType: @"mp3"];
            break;
        default:
            break;
    }        
    
    NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
    
    NSError *error = nil;
    
    player = [[AVAudioPlayer alloc]
              initWithContentsOfURL: url error: &error];

    player.volume =     [padview.volumnslider value];
;		 
    player.numberOfLoops = 0;
    
    [player setDelegate:self];
    [player prepareToPlay];
    [player play];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"music play finish");
    [padview.volumnslider setValue:1.0];
    //[padview.control setSelectedSegmentIndex:-1];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


@end
