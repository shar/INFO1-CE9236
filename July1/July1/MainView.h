//
//  MainView.h
//  July1
//
//  Created by Sukman Har on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface MainView : UIView 
{
    ViewController *viewController;
    NSArray *views;
    
	//index in views of the currently displayed little view: 0 or 1
	NSUInteger index;
}
- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c;
@end
