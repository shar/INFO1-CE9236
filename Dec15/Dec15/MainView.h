//
//  MainView.h
//  Dec15
//
//  Created by Sukman Har on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>
@class MainViewController;

@interface MainView : UIView
{
    MainViewController *mainViewController;
    UIImageView *iv;
    UIActivityIndicatorView *indicator;
}

-(id)initWithFrame:(CGRect)frame controller:(MainViewController *) mvc;
- (void) display;
- (void) undisplay;
- (void) startAnimating;
- (void) stopAnimating;
@end
