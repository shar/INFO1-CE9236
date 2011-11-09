//
//  PadView.m
//  Nov10
//
//  Created by Sukman Har on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PadView.h"
#import "SubView0.h"
#import "SubView1.h"
#import "SubView2.h"

@implementation PadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        views = [NSArray arrayWithObjects:
                 [[SubView0 alloc] initWithFrame: self.bounds],
                 [[SubView1 alloc] initWithFrame: self.bounds],
                 [[SubView2 alloc] initWithFrame: self.bounds],
                 nil
                 ];
        
		index = 0;	
        
        // first page display
		[self addSubview: [views objectAtIndex: index]];
        
        // add gesture
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipe:)
                                                ];

		recognizer.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionDown;
		[self addGestureRecognizer: recognizer];
        
        recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];

        recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];

    }
    return self;
}

- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
    NSUInteger newIndex;
//	CGPoint p = [recognizer locationInView: self];
    
	if (recognizer.direction == UISwipeGestureRecognizerDirectionUp ||
        recognizer.direction == UISwipeGestureRecognizerDirectionLeft) 
    {
        if ( index == views.count -1 )
        {
            // last view...no action needed
        } 
        else if ( index < views.count - 1 ) 
        {
            newIndex = index + 1;
            
            [UIView transitionFromView: [views objectAtIndex: index]
                                toView: [views objectAtIndex: newIndex]
                              duration: 2.25
                               options: UIViewAnimationOptionTransitionCurlUp
                            completion: NULL
             ];
            
            index = newIndex;
        }
	} 
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown ||
             recognizer.direction == UISwipeGestureRecognizerDirectionRight) 
    {
        if ( index == 0 )
        {
            // first view...no action needed
        } 
        else  
        {
            newIndex = index - 1;
            
            [UIView transitionFromView: [views objectAtIndex: index]
                                toView: [views objectAtIndex: newIndex]
                              duration: 2.25
                               options: UIViewAnimationOptionTransitionCurlDown
                            completion: NULL
             ];
            
            index = newIndex;
        }

	}
}

/*
- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	
	    
	NSUInteger newIndex = 1 - index;	//toggle the index
    
	[UIView transitionFromView: [views objectAtIndex: index]
                        toView: [views objectAtIndex: newIndex]
                      duration: 2.25
                       options: UIViewAnimationOptionTransitionCurlDown//UIViewAnimationOptionTransitionCurlUp
                    completion: NULL
     ];
    
	index = newIndex;
}
*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
