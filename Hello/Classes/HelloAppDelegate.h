//
//  HelloAppDelegate.h
//  Hello
//
//  Created by Rebecca Har on 10/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PadView;

@interface HelloAppDelegate : NSObject <UIApplicationDelegate> {
	PadView *padview;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

