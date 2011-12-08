//
//  MainViewController.h
//  Dec8
//
//  Created by Sukman Har on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Restaurant;

@interface MainViewController : UIViewController
{
    NSArray *Data;
}

-(id) initWithTitle: (NSString *) d data: (NSArray *) data image: (UIImage *) image;
 
- (void) presentModalViewController:(Restaurant *) r;
@end
