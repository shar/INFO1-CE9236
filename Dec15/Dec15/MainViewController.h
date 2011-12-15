//
//  MainViewController.h
//  Dec15
//
//  Created by Sukman Har on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface MainViewController : UIViewController
{
    SystemSoundID sid;
}
- (void) setTimer: (id) sender;
@end
