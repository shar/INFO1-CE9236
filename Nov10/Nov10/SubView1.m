//
//  SubView1.m
//  Nov10
//
//  Created by Sukman Har on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SubView1.h"
#import <QuartzCore/QuartzCore.h>

@implementation SubView1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        
        UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twotap:)];
        doubletap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubletap];
        
        
        UITapGestureRecognizer *singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onetap:)];
        singletap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singletap];
        [singletap requireGestureRecognizerToFail:doubletap];
        
        

        
    }
    return self;
}


-(void)onetap:(UITapGestureRecognizer *) recognizer
{
    NSLog(@"one tap");
    
    starview = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2, self.bounds.size.height/2, 98,80)];
    
    // load all the frames of our animation
    starview.animationImages = [NSArray arrayWithObjects:    
                                    [UIImage imageNamed:@"star0.png"],
                                    [UIImage imageNamed:@"star1.png"],
                                    [UIImage imageNamed:@"star2.png"],
                                    [UIImage imageNamed:@"star3.png"],
                                    nil];
    
    // all frames will execute in 1.75 seconds
    starview.animationDuration = 0.5;
    // repeat the annimation forever
    starview.animationRepeatCount = 0;
    // start animating
    [starview startAnimating];
    // add the animation view to the main window 
    
    [self addSubview:starview];

    
}

-(void)twotap:(UITapGestureRecognizer *) recognizer
{
    NSLog(@"two tap");    
    starview.frame = [[starview.layer presentationLayer] frame];
    [starview.layer removeAllAnimations];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef c =UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);

    NSString *string = @"Tap to start animation; double tap to stop";
	UIFont *font = [UIFont systemFontOfSize: 20];
    
	[string drawAtPoint: CGPointZero withFont: font];
}


@end
