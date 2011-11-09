//
//  PadView.h
//  Nov10
//
//  Created by Sukman Har on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PadView : UIView
{
    //holds the two subviews we transtion between
	NSArray *views;
    
	//index in views of the currently displayed little view: 0 or 1
	NSUInteger index;
}
@end
