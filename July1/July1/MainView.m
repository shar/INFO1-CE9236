//
//  MainView.m
//  July1
//
//  Created by Sukman Har on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "ViewController.h"
#import "AboutView.h"
#import "PhotoView.h"
#import "TitleView.h"
#import "SignupView.h"
@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        views = [NSArray arrayWithObjects:
                 [[TitleView alloc] initWithFrame: self.bounds],
                 [[PhotoView alloc] initWithFrame: self.bounds],
                 [[AboutView alloc] initWithFrame: self.bounds],
                 [[SignupView alloc] initWithFrame: self.bounds],
                 nil
                 ];
        
        // display title page //
		[self addSubview: [views objectAtIndex: 0]];
        
                 
    }
    return self;
}

- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c {
	self = [super initWithFrame: frame];
	
    if (self) 
    {
		// Initialization code
		self.backgroundColor = [UIColor blackColor];
		viewController = c;
        
        [self addSubview:[[MainView alloc] initWithFrame:self.bounds]]; 
        
	}
	return self;
}

-(void)ShowAbout: (id)sender 
{
    int tid = ((UIControl*)sender).tag;
    
    [UIView transitionFromView: [views objectAtIndex: tid]
                        toView: [views objectAtIndex: 2]
                      duration: 2.25
                       options: UIViewAnimationCurveEaseIn
                    completion: NULL
     ];    
    
}

-(void)ShowPhoto: (id)sender
{
    [UIView transitionFromView: [views objectAtIndex: 0]
                        toView: [views objectAtIndex: 1]
                      duration: 2.25
                       options: UIViewAnimationCurveEaseIn
                    completion: NULL
     ];    
    
}

-(void)ShowTitle: (id)sender
{
    int tid = ((UIControl*)sender).tag;
    
    [UIView transitionFromView: [views objectAtIndex: tid]
                        toView: [views objectAtIndex: 0]
                      duration: 2.25
                       options: UIViewAnimationCurveEaseIn
                    completion: NULL
     ];    
}

-(void)ShowSignup: (id)sender
{
    int tid = ((UIControl*)sender).tag;
    
    [UIView transitionFromView: [views objectAtIndex: tid]
                        toView: [views objectAtIndex: 3]
                      duration: 2.25
                       options: UIViewAnimationCurveEaseIn
                    completion: NULL
     ];    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
