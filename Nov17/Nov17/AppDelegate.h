//
//  AppDelegate.h
//  Nov17
//
//  Created by Sukman Har on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class PadView;

@interface AppDelegate : UIResponder <UIApplicationDelegate,AVAudioPlayerDelegate>
{
    PadView *padview;
	UIWindow *_window;
    AVAudioPlayer *player;
    CGFloat volume;
}
@property (strong, nonatomic) UIWindow *window;

@end
