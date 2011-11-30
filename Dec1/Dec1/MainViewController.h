//
//  MainViewController.h
//  Dec1
//
//  Created by Sukman Har on 11/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <AudioToolbox/AudioToolbox.h>	

@interface MainViewController : UIViewController
{
    CADisplayLink *displayLink;
    AVAudioPlayer *backgroundplayer;
    SystemSoundID sid;
    
    AVAudioPlayer *bounceplayer;
    //SystemSoundID bid;
}

// public function to be used by the view
-(void)playcrunchsound;
-(void)playbouncesound;

@end
