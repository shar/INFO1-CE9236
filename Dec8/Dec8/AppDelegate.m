//
//  AppDelegate.m
//  Dec8
//
//  Created by Sukman Har on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#include "MainViewController.h"
#include "Restaurant.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
    
    // create controllers //
    //self.window.rootViewController = [[UITabBarController alloc] init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    NSArray *d0 = [NSArray arrayWithObjects:
        [[Restaurant alloc] initWithName:@"Sfuzzi" Type:@"Italian" Address:@"58 W. 65th Street, New York 10023\n(Btwn Central Park West & Columbus Ave.)" Phone:@"(212) 873-3700"],           
        [[Restaurant alloc] initWithName:@"Shun Lee West" Type:@"Chinese" Address:@"43 W. 65th Street, New York 10023" Phone:@"(212) 595-8895"]           
                   
        , nil];
        
    MainViewController *mvc0 = [[MainViewController alloc] initWithTitle:@"Uptown West" data:d0 image: [UIImage imageNamed: @"forkandknife.png"]];
    UINavigationController *nav0 = [[UINavigationController alloc] initWithRootViewController:mvc0];
    
    NSArray *d1 = [NSArray arrayWithObjects:
                   [[Restaurant alloc] initWithName:@"JoJo" Type:@"French" Address:@"160 E. 64th Street, New York 10021\n(Btwn Lex & Third Ave)" Phone:@"(212) 223-5656"],           
                   [[Restaurant alloc] initWithName:@"Primavera" Type:@"Italian" Address:@"1578 First Ave\n (at 82nd Street), New York 10028" Phone:@"(212) 861-8608"]           
                   
                   , nil];
    
    MainViewController *mvc1 = [[MainViewController alloc] initWithTitle:@"Uptown East" data:d1 image: [UIImage imageNamed: @"forkandknife.png"]];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:mvc1];
    
    NSArray *d2 = [NSArray arrayWithObjects:
                   [[Restaurant alloc] initWithName:@"Basara" Type:@"Indian" Address:@"745 9th Ave, New York 10019\n(Btwn 50th & 51st St)" Phone:@"(212) 757-9787"],           
                   [[Restaurant alloc] initWithName:@"Topaz" Type:@"Thai" Address:@"127 W 56th Street\n(Btwn 6th Ave & Boardway), New York 10019" Phone:@"(212) 957-8020"],           
                   [[Restaurant alloc] initWithName:@"Tina's Restaurant" Type:@"Cuban" Address:@"23 W 56th Street, New York 10019\n (Btwn 5th & 6th Ave)" Phone:@"(212) 957-8020"]
                   , nil];
    
    MainViewController *mvc2 = [[MainViewController alloc] initWithTitle:@"Midtown West" data:d2 image: [UIImage imageNamed: @"forkandknife.png"]];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:mvc2];
    
    
    NSArray *d3 = [NSArray arrayWithObjects:
                   [[Restaurant alloc] initWithName:@"Umi Sushi" Type:@"Japanese" Address:@"303 E. 56th Street New York 10022\n(Btwn 1st & 2nd Ave)" Phone:@"(212) 888-8101"],           
                   [[Restaurant alloc] initWithName:@"Le Cirque" Type:@"French" Address:@"151 E. 58th Street, New York 10022" Phone:@"(212) 644-0202"]           
                   
                   , nil];
    MainViewController *mvc3 = [[MainViewController alloc] initWithTitle:@"Midtown East" data:d3 image: [UIImage imageNamed: @"forkandknife.png"]];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:mvc3];
    
    
    NSArray *d4 = [NSArray arrayWithObjects:
                   [[Restaurant alloc] initWithName:@"Petite Abeille" Type:@"Belgian" Address:@"466 Hudson Street, New York 10014\n(Btwn Grove & Barrow St)" Phone:@"(212) 741-6479"],           
                   [[Restaurant alloc] initWithName:@"Sevilla" Type:@"Spanish" Address:@"62 Charles Street, New York 10014" Phone:@"(212) 929-3189"]           
                   
                   , nil];
    MainViewController *mvc4 = [[MainViewController alloc] initWithTitle:@"West Village" data:d4 image: [UIImage imageNamed: @"forkandknife.png"]];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:mvc4];
    
    
    NSArray *d5 = [NSArray arrayWithObjects:
                   [[Restaurant alloc] initWithName:@"Momofuku Ko" Type:@"Asian Fusion" Address:@"163 First Avenue, New York 10003\n(at 10th Street)" Phone:@"(212) 500-0831"],           
                   [[Restaurant alloc] initWithName:@"Yakitori Taisho" Type:@"Japanese" Address:@"5 St Mark's Place, New York 10003\n (Btwn 2nd & 3rd Ave)" Phone:@"(212) 228-5086"]           
                   
                   , nil];
    MainViewController *mvc5 = [[MainViewController alloc] initWithTitle:@"East Village" data:d5 image: [UIImage imageNamed: @"forkandknife.png"]];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:mvc5];
    
    
    NSArray *d6 = [NSArray arrayWithObjects:
                   [[Restaurant alloc] initWithName:@"Stone Street Tavern" Type:@"Bar Food" Address:@"52 Stone Street, New York 10004\n(Btwn William & Pearl St)" Phone:@"(212) 785-5658"],           
                   [[Restaurant alloc] initWithName:@"Aquagrill" Type:@"Seafood" Address:@"210 Spring Street, New York 10012" Phone:@"(212) 274-0505"]           
                   
                   , nil];
    MainViewController *mvc6 = [[MainViewController alloc] initWithTitle:@"Downtown" data:d6 image: [UIImage imageNamed: @"forkandknife.png"]];
    UINavigationController *nav6 = [[UINavigationController alloc] initWithRootViewController:mvc6];
    
    NSArray *controllers = [NSArray arrayWithObjects:
            nav0, nav1, nav2, nav3, nav4, nav5, nav6,
            nil];

    tabBarController.viewControllers = controllers;
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
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
