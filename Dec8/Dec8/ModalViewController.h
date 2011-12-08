//
//  ModalViewController.h
//  Dec8
//
//  Created by Sukman Har on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Restaurant;

@interface ModalViewController : UIViewController
{
    Restaurant *rdata;
}
- (void) dismissModalViewController;
-(id)initWithData: (Restaurant *) r;
@end
