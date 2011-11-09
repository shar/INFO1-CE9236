//
//  AppDelegate.h
//  Nov10
//
//  Created by Sukman Har on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PadView;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    PadView *padview;
	UIWindow *_window;
}
@property (strong, nonatomic) UIWindow *window;

@end
