//
//  AppDelegate.h
//  LaunchApp
//
//  Created by Sukman Har on 10/23/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PadView;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    PadView *padview;
}

@property (strong, nonatomic) UIWindow *window;

@end
