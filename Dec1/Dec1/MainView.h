//
//  MainView.h
//  Dec1
//
//  Created by Sukman Har on 11/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;

@interface MainView : UIView
{
    NSMutableArray *carrots;
    
	UIImageView *moogleiv;
    //UIImageView *fireballiv;
    UIImageView *iceballiv;
    
	CGFloat mx, my; // velocity for moogle	
    //CGFloat fx, fy; // velocity for fireball
    CGFloat ix, iy; // velocity for iceball
    
    // the parent controller
    MainViewController *mvc;
    
    int NumBlock;
    int carrotcount;
    NSInteger lapsed;
    bool gamefinish;
}

-(void)play: (CADisplayLink *)displayLink;

//  pass the controller to the view 
- (id) initWithFrame: (CGRect) frame controller: (MainViewController *) c;
@end
