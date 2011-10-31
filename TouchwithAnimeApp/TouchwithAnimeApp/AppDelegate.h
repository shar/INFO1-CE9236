//
//  AppDelegate.h
//  TouchwithAnimeApp
//
//  Created by Sukman Har on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@class PadView;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    PadView *padview;
    AVAudioPlayer *bgplayer;
}

@property (strong, nonatomic) UIWindow *window;

@end
